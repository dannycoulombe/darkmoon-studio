use crate::cps::{self, word};
use anyhow::{Context, Result, bail, ensure};
use serde::{Deserialize, Serialize};
use serde_json::{Value, json};
use sha2::{Digest, Sha256};
use std::{
    collections::BTreeMap,
    fs,
    io::BufWriter,
    path::{Path, PathBuf},
};

#[derive(Serialize, Deserialize)]
pub struct Entry {
    pub name: String,
    pub size: usize,
    pub sha256: String,
    pub kind: String,
    pub editable: BTreeMap<String, String>,
}
#[derive(Serialize, Deserialize)]
pub struct Manifest {
    pub format: u32,
    pub source: String,
    pub files: Vec<Entry>,
}
pub fn hash(b: &[u8]) -> String {
    Sha256::digest(b)
        .iter()
        .map(|b| format!("{b:02x}"))
        .collect()
}
pub fn save_json(p: &Path, v: &impl Serialize) -> Result<()> {
    if let Some(parent) = p.parent() {
        fs::create_dir_all(parent)?;
    }
    fs::write(p, serde_json::to_string_pretty(v)? + "\n")?;
    Ok(())
}
pub fn read_json(p: &Path) -> Result<Value> {
    Ok(serde_json::from_slice(
        &fs::read(p).with_context(|| p.display().to_string())?,
    )?)
}
pub fn numbers(v: &Value) -> Result<Vec<u8>> {
    v.as_array()
        .context("expected a byte array")?
        .iter()
        .map(|x| {
            let n = x.as_u64().context("expected unsigned byte")?;
            ensure!(n <= 255, "value {n} exceeds byte range");
            Ok(n as u8)
        })
        .collect()
}
pub fn u(v: &Value, key: &str) -> Result<usize> {
    Ok(v[key]
        .as_u64()
        .with_context(|| format!("missing unsigned field {key}"))? as usize)
}

pub fn write_png(path: &Path, width: u32, height: u32, pixels: &[u8], pal: &[u8]) -> Result<()> {
    ensure!(
        pixels.len() == width as usize * height as usize,
        "PNG dimensions do not match pixels"
    );
    fs::create_dir_all(path.parent().context("PNG parent")?)?;
    let mut enc = png::Encoder::new(BufWriter::new(fs::File::create(path)?), width, height);
    enc.set_color(png::ColorType::Indexed);
    enc.set_depth(png::BitDepth::Eight);
    enc.set_palette(pal.to_vec());
    enc.write_header()?.write_image_data(pixels)?;
    Ok(())
}
pub fn read_png(path: &Path, pal: &[u8]) -> Result<(u32, u32, Vec<u8>)> {
    let mut d = png::Decoder::new(std::io::BufReader::new(fs::File::open(path)?));
    d.set_transformations(png::Transformations::IDENTITY);
    let mut r = d.read_info()?;
    let mut b = vec![0; r.output_buffer_size().context("PNG output too large")?];
    let f = r.next_frame(&mut b)?;
    b.truncate(f.buffer_size());
    ensure!(
        f.bit_depth == png::BitDepth::Eight,
        "use an 8-bit indexed or RGB PNG: {}",
        path.display()
    );
    let pixels = match f.color_type {
        png::ColorType::Indexed => b,
        png::ColorType::Rgb | png::ColorType::Rgba => {
            let stride = if f.color_type == png::ColorType::Rgb {
                3
            } else {
                4
            };
            b.chunks_exact(stride)
                .map(|c| {
                    pal.chunks_exact(3)
                        .enumerate()
                        .min_by_key(|(_, p)| {
                            (0..3)
                                .map(|i| (c[i] as i32 - p[i] as i32).pow(2))
                                .sum::<i32>()
                        })
                        .map_or(0, |(i, _)| i as u8)
                })
                .collect()
        }
        _ => bail!("unsupported PNG color type"),
    };
    Ok((f.width, f.height, pixels))
}
pub fn rgb(pal: &[u8]) -> Vec<u8> {
    pal.iter()
        .map(|x| ((*x as u16 * 255 + 31) / 63).min(255) as u8)
        .collect()
}
fn cp437(b: &[u8]) -> String {
    const HIGH: &str = "ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜ¢£¥₧ƒáíóúñÑªº¿⌐¬½¼¡«»░▒▓│┤╡╢╖╕╣║╗╝╜╛┐└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀αßΓπΣσµτΦΘΩδ∞φε∩≡±≥≤⌠⌡÷≈°∙·√ⁿ²■ ";
    b.iter()
        .map(|&c| {
            if c < 128 {
                c as char
            } else {
                HIGH.chars().nth(c as usize - 128).unwrap()
            }
        })
        .collect()
}
fn encode_cp437(s: &str) -> Result<Vec<u8>> {
    s.chars()
        .map(|c| {
            if (c as u32) < 128 {
                return Ok(c as u8);
            }
            for b in 128..=255 {
                if cp437(&[b]).starts_with(c) {
                    return Ok(b);
                }
            }
            bail!("character {c:?} is not representable in DOS CP437")
        })
        .collect()
}
fn row_bytes(b: &[u8]) -> Vec<Vec<u8>> {
    b.chunks(16).map(|c| c.to_vec()).collect()
}
fn flatten_rows(v: &Value) -> Result<Vec<u8>> {
    let mut b = Vec::new();
    for row in v.as_array().context("expected rows")? {
        b.extend(numbers(row)?);
    }
    Ok(b)
}

pub fn extract(source: &Path, output: &Path) -> Result<()> {
    ensure!(
        !output.exists(),
        "{} already exists; choose a new output to protect edits",
        output.display()
    );
    let temporary = output.with_file_name(format!(
        "{}.extracting-{}",
        output
            .file_name()
            .context("output directory name")?
            .to_string_lossy(),
        std::process::id()
    ));
    ensure!(
        !temporary.exists(),
        "temporary extraction directory already exists"
    );
    match extract_into(source, &temporary) {
        Ok(()) => {
            fs::rename(&temporary, output)?;
            println!("Assets ready in {}", output.display());
            Ok(())
        }
        Err(e) => {
            let _ = fs::remove_dir_all(&temporary);
            Err(e)
        }
    }
}
fn extract_into(source: &Path, output: &Path) -> Result<()> {
    ensure!(
        source.join("start.exe").exists(),
        "source must contain start.exe"
    );
    ensure!(
        !output.exists(),
        "{} already exists; choose a new output to protect edits",
        output.display()
    );
    fs::create_dir_all(output.join("raw"))?;
    let monster_groups = crate::sprites::monster_groups(source)?;
    let mut files = fs::read_dir(source)?.collect::<std::io::Result<Vec<_>>>()?;
    files.sort_by_key(|x| x.file_name());
    let mut entries = Vec::new();
    for f in files {
        if !f.file_type()?.is_file() {
            continue;
        }
        let name = f.file_name().to_string_lossy().to_string();
        let b = fs::read(f.path())?;
        fs::write(output.join("raw").join(&name), &b)?;
        let stem = f
            .path()
            .file_stem()
            .unwrap()
            .to_string_lossy()
            .to_lowercase();
        let ext = f
            .path()
            .extension()
            .unwrap_or_default()
            .to_string_lossy()
            .to_lowercase();
        let mut e = Entry {
            name: name.clone(),
            size: b.len(),
            sha256: hash(&b),
            kind: ext.clone(),
            editable: BTreeMap::new(),
        };
        let mut edit = |path: String, v: Value| -> Result<()> {
            save_json(&output.join(&path), &v)?;
            e.editable
                .insert(path.clone(), hash(&fs::read(output.join(path))?));
            Ok(())
        };
        match ext.as_str() {
            "cps" => {
                let d = cps::decode(&b).with_context(|| name.clone())?;
                ensure!(d.data.len() == 64000, "{name}: unexpected image dimensions");
                let palette_file = choose_palette(&stem);
                let p = if !d.palette.is_empty() {
                    d.palette.clone()
                } else {
                    fs::read(source.join(&palette_file))?
                };
                edit(
                    format!("images/{stem}.json"),
                    json!({"width":320,"height":200,"palette_file":palette_file,"embedded_palette":!d.palette.is_empty(),"palette_vga":p}),
                )?;
                let path = format!("images/{stem}.png");
                write_png(&output.join(&path), 320, 200, &d.data, &rgb(&p))?;
                e.editable
                    .insert(path.clone(), hash(&fs::read(output.join(path))?));
                crate::sprites::export(
                    source,
                    output,
                    &stem,
                    &d.data,
                    &rgb(&p),
                    &monster_groups,
                    &mut e,
                )?;
            }
            "pal" | "ega" | "col" => {
                edit(
                    format!("palettes/{name}.json"),
                    json!({"format":"VGA 6-bit RGB","colors":b.chunks(3).collect::<Vec<_>>()}),
                )?;
            }
            "maz" => {
                let (w, h, n) = (word(&b, 0)?, word(&b, 2)?, word(&b, 4)?);
                ensure!(
                    n == 4 && b.len() == 6 + w as usize * h as usize * 4,
                    "invalid maze {name}"
                );
                let cells: Vec<Value> = b[6..]
                    .chunks_exact(4)
                    .enumerate()
                    .map(|(i, c)| json!({"x":i%w as usize,"y":i/w as usize,"walls":c}))
                    .collect();
                edit(
                    format!("maps/{stem}.json"),
                    json!({"width":w,"height":h,"directions":["north","east","south","west"],"cells":cells}),
                )?;
            }
            "inf" => {
                let d = cps::decode(&b).with_context(|| name.clone())?;
                edit(format!("scripts/{stem}.json"), crate::inf::decode(&d.data))?;
                let path = format!("scripts/{stem}.inf.bin");
                fs::create_dir_all(output.join("scripts"))?;
                fs::write(output.join(&path), &d.data)?;
            }
            "vcn" => {
                let d = cps::decode(&b)?;
                let n = word(&d.data, 0)? as usize;
                ensure!(d.data.len() >= 34 + n * 32, "VCN tiles truncated");
                let pal = fs::read(source.join(format!("{stem}.pal")))?;
                let w = 256;
                let h = n.div_ceil(32) * 8;
                let mut px = vec![0; w * h];
                for t in 0..n {
                    for y in 0..8 {
                        for x in 0..8 {
                            let c = d.data[34 + t * 32 + y * 4 + x / 2];
                            let c = if x % 2 == 0 { c >> 4 } else { c & 15 };
                            px[((t / 32) * 8 + y) * w + (t % 32) * 8 + x] = c;
                        }
                    }
                }
                edit(
                    format!("tiles/{stem}.json"),
                    json!({"tile_count":n,"columns":32,"color_map":&d.data[2..34],"tail":&d.data[34+n*32..]}),
                )?;
                let path = format!("tiles/{stem}.png");
                let mut colors = rgb(&pal);
                for i in 0..16 {
                    colors[i * 3..i * 3 + 3].copy_from_slice(
                        &rgb(&pal)[d.data[2 + i] as usize * 3..d.data[2 + i] as usize * 3 + 3],
                    );
                }
                write_png(&output.join(&path), w as u32, h as u32, &px, &colors)?;
                e.editable
                    .insert(path.clone(), hash(&fs::read(output.join(path))?));
            }
            "vmp" => {
                edit(
                    format!("tiles/{stem}.vmp.json"),
                    json!({"count":word(&b,0)?,"entries":b[2..].chunks_exact(2).map(|c|u16::from_le_bytes([c[0],c[1]])).collect::<Vec<_>>()}),
                )?;
            }
            "fnt" => {
                let h = if stem == "font6" { 6 } else { 8 };
                let mut px = vec![0; 128 * h * 8];
                for ch in 0..128 {
                    let off = word(&b, 2 + ch * 2)? as usize;
                    for y in 0..h {
                        for x in 0..8 {
                            px[((ch / 16) * h + y) * 128 + (ch % 16) * 8 + x] =
                                if b[off + y] & (0x80 >> x) != 0 { 1 } else { 0 };
                        }
                    }
                }
                edit(
                    format!("fonts/{stem}.json"),
                    json!({"height":h,"glyphs":128,"header":&b[..4],"offsets":(0..128).map(|c|word(&b,2+c*2).unwrap()).collect::<Vec<_>>()}),
                )?;
                let path = format!("fonts/{stem}.png");
                write_png(
                    &output.join(&path),
                    128,
                    (h * 8) as u32,
                    &px,
                    &[0, 0, 0, 255, 255, 255],
                )?;
                e.editable
                    .insert(path.clone(), hash(&fs::read(output.join(path))?));
            }
            "dec" => {
                let n = word(&b, 0)? as usize;
                ensure!(b.len() >= 4 + n * 52, "DEC truncated");
                let mut decorations = Vec::new();
                for c in b[2..2 + n * 52].chunks_exact(52) {
                    decorations.push(json!({"shape_indices":&c[..10],"next":c[10],"flags":c[11],"x":c[12..32].chunks_exact(2).map(|a|i16::from_le_bytes([a[0],a[1]])).collect::<Vec<_>>(),"y":c[32..52].chunks_exact(2).map(|a|i16::from_le_bytes([a[0],a[1]])).collect::<Vec<_>>()}));
                }
                let off = 2 + n * 52;
                let rects = word(&b, off)? as usize;
                ensure!(
                    b.len() == off + 2 + rects * 8,
                    "DEC rectangle count mismatch"
                );
                let rectangles:Vec<_>=b[off+2..].chunks_exact(8).map(|c|json!({"x_tiles":word(c,0).unwrap(),"y":word(c,2).unwrap(),"width_tiles":word(c,4).unwrap(),"height":word(c,6).unwrap()})).collect();
                edit(
                    format!("sprites/{stem}.dec.json"),
                    json!({"decorations":decorations,"rectangles":rectangles}),
                )?;
            }
            "dcr" => {
                edit(
                    format!("sprites/{stem}.dcr.json"),
                    json!({"groups":word(&b,0)?,"frames":b[2..].chunks_exact(6).map(|c|json!({"x_tiles":c[0],"y":c[1],"width_tiles":c[2],"height":c[3],"offset_x":c[4],"offset_y":c[5]})).collect::<Vec<_>>()}),
                )?;
            }
            "adl" => {
                edit(
                    format!("audio/{stem}.adl.json"),
                    crate::soundbank::decode(&b)?,
                )?;
            }
            "snd" => {
                edit(
                    format!("audio/{stem}.{ext}.json"),
                    crate::soundbank::decode_speaker(&b)?,
                )?;
            }
            "dat" if stem == "text" => {
                let count = word(&b, 0)? as usize / 2;
                let mut groups = Vec::new();
                for i in 0..count {
                    let start = word(&b, i * 2)? as usize;
                    let end = if i + 1 < count {
                        word(&b, (i + 1) * 2)? as usize
                    } else {
                        b.len()
                    };
                    ensure!(start <= end && end <= b.len(), "invalid text offset");
                    groups.push(cp437(&b[start..end]));
                }
                edit(
                    "texts/dialogue.json".into(),
                    json!({"encoding":"CP437; retain null separators and control codes","groups":groups}),
                )?;
            }
            "dat" if stem == "item" => {
                edit("items/items.json".into(), decode_items(&b)?)?;
            }
            "dat" if stem == "itemtype" => {
                edit("items/types.json".into(), decode_types(&b)?)?;
            }
            "exe" if stem == "start" => {
                let mut strings = Vec::new();
                let mut p = 0;
                while p < b.len() {
                    let start = p;
                    while p < b.len()
                        && (b[p].is_ascii_graphic() || b[p] == b' ' || [9, 10, 13].contains(&b[p]))
                    {
                        p += 1;
                    }
                    if p - start >= 5 && p < b.len() && b[p] == 0 {
                        strings.push(
                            json!({"offset":start,"max_bytes":p-start,"text":cp437(&b[start..p])}),
                        );
                    }
                    p += 1;
                }
                edit(
                    "texts/executable.json".into(),
                    json!({"notes":"Recovered null-terminated ASCII strings in START.EXE. Some candidates may be data. Edit text only; fixed storage prevents moving far pointers. Shorter translations are null padded. Keep offsets/max_bytes unchanged.","strings":strings}),
                )?;
            }
            "txt" | "me" | "dox" => {
                let path = format!("texts/{name}.txt");
                fs::create_dir_all(output.join("texts"))?;
                fs::write(output.join(&path), cp437(&b))?;
                e.editable
                    .insert(path.clone(), hash(&fs::read(output.join(path))?));
            }
            _ => {
                if !["exe", "ovl", "com", "sav", "tmp"].contains(&ext.as_str()) {
                    edit(format!("data/{name}.json"), json!({"bytes":row_bytes(&b)}))?;
                }
            }
        }
        entries.push(e);
    }
    let m = Manifest {
        format: 1,
        source: source.canonicalize()?.display().to_string(),
        files: entries,
    };
    save_json(&output.join("manifest.json"), &m)?;
    println!(
        "Extracted {} files into {}",
        m.files.len(),
        output.display()
    );
    Ok(())
}

fn choose_palette(stem: &str) -> String {
    let name = if [
        "street1", "street2", "doorway1", "doorway2", "westwood", "winding", "khelban1",
        "khelban2", "khelban3", "khelban4", "khelban5", "khelban6", "coin", "intro",
    ]
    .contains(&stem)
    {
        "palette1.pal"
    } else if stem.starts_with("azure") {
        "azure.pal"
    } else if stem.starts_with("crimson") {
        "crimson.pal"
    } else if stem.starts_with("silver") {
        "silver.pal"
    } else if stem.starts_with("mezz") {
        "mezz.pal"
    } else if stem == "forest" {
        "forest.pal"
    } else {
        "palette.col"
    };
    name.into()
}

const ITEM_FIELDS: [&str; 6] = [
    "name_unidentified",
    "name_identified",
    "flags",
    "icon",
    "type",
    "position",
];
fn decode_items(b: &[u8]) -> Result<Value> {
    let n = word(b, 0)? as usize;
    let mut items = Vec::new();
    ensure!(b.len() >= 2 + n * 14 + 2, "truncated item table");
    for c in b[2..2 + n * 14].chunks_exact(14) {
        let mut v = json!({});
        for (i, key) in ITEM_FIELDS.iter().enumerate() {
            v[key] = json!(if i >= 3 {
                c[i] as i8 as i64
            } else {
                c[i] as i64
            });
        }
        for (i, key) in ["block", "next", "previous"].iter().enumerate() {
            v[key] = json!(i16::from_le_bytes([c[6 + i * 2], c[7 + i * 2]]));
        }
        v["level"] = json!(c[12]);
        v["value"] = json!(c[13] as i8);
        items.push(v);
    }
    let off = 2 + n * 14;
    let names = word(b, off)? as usize;
    ensure!(b.len() >= off + 2 + names * 35, "truncated item names");
    let names: Vec<_> = b[off + 2..off + 2 + names * 35]
        .chunks_exact(35)
        .map(|c| cp437(&c[..c.iter().position(|x| *x == 0).unwrap_or(35)]))
        .collect();
    Ok(json!({"items":items,"names":names,"tail":&b[off+2+names.len()*35..]}))
}
const TYPE_FIELDS: [&str; 10] = [
    "armor_class",
    "allowed_classes",
    "required_hands",
    "small_dice",
    "small_sides",
    "small_bonus",
    "large_dice",
    "large_sides",
    "large_bonus",
    "unknown",
];
fn decode_types(b: &[u8]) -> Result<Value> {
    let n = word(b, 0)? as usize;
    ensure!(b.len() >= 2 + n * 16, "truncated item types");
    let mut records = Vec::new();
    for c in b[2..2 + n * 16].chunks_exact(16) {
        let mut v = json!({"inventory_flags":word(c,0)?,"hand_flags":word(c,2)?,"extra_properties":word(c,14)?});
        for (i, key) in TYPE_FIELDS.iter().enumerate() {
            v[key] = json!(c[4 + i] as i8);
        }
        records.push(v);
    }
    Ok(json!({"types":records,"tail":&b[2+n*16..]}))
}
fn byte_field(v: &Value, key: &str) -> Result<u8> {
    let n = v[key]
        .as_i64()
        .with_context(|| format!("missing integer {key}"))?;
    ensure!((-128..=255).contains(&n), "{key} outside byte range");
    Ok(n as u8)
}
fn word_field(v: &Value, key: &str) -> Result<[u8; 2]> {
    let n = v[key]
        .as_i64()
        .with_context(|| format!("missing integer {key}"))?;
    ensure!((-32768..=65535).contains(&n), "{key} outside word range");
    Ok((n as u16).to_le_bytes())
}

pub fn manifest(root: &Path) -> Result<Manifest> {
    Ok(serde_json::from_slice(&fs::read(
        root.join("manifest.json"),
    )?)?)
}
pub fn edited(root: &Path, e: &Entry) -> Result<bool> {
    for (p, h) in &e.editable {
        if hash(&fs::read(root.join(p)).with_context(|| p.clone())?) != *h {
            return Ok(true);
        }
    }
    Ok(false)
}
pub fn rebuild(root: &Path, e: &Entry) -> Result<Vec<u8>> {
    rebuild_impl(root, e, false)
}
fn rebuild_impl(root: &Path, e: &Entry, force: bool) -> Result<Vec<u8>> {
    let raw = fs::read(root.join("raw").join(&e.name))?;
    ensure!(
        hash(&raw) == e.sha256,
        "original {} has changed; restore from source",
        e.name
    );
    if e.editable.is_empty() || (!force && !edited(root, e)?) {
        return Ok(raw);
    }
    let stem = Path::new(&e.name)
        .file_stem()
        .unwrap()
        .to_string_lossy()
        .to_lowercase();
    let j = |p: &str| read_json(&root.join(p));
    let out = match e.kind.as_str() {
        "cps" => {
            let meta = j(&format!("images/{stem}.json"))?;
            let pal = numbers(&meta["palette_vga"])?;
            ensure!(
                pal.len() == 768 && pal.iter().all(|c| *c <= 63),
                "palette must have 768 values in 0..63"
            );
            let (w, h, mut pixels) =
                read_png(&root.join(format!("images/{stem}.png")), &rgb(&pal))?;
            ensure!((w, h) == (320, 200), "CPS images must stay 320 x 200");
            crate::sprites::overlay(root, &stem, e, &mut pixels, &rgb(&pal))?;
            cps::encode(
                &pixels,
                if meta["embedded_palette"] == true {
                    &pal
                } else {
                    &[]
                },
            )?
        }
        "pal" | "ega" | "col" => {
            let v = j(&format!("palettes/{}.json", e.name))?;
            let b = flatten_rows(&v["colors"])?;
            ensure!(
                b.len() == 768 && b.iter().all(|x| *x <= 63),
                "VGA palette requires 256 RGB colors in 0..63"
            );
            b
        }
        "maz" => {
            let v = j(&format!("maps/{stem}.json"))?;
            let w = u(&v, "width")?;
            let h = u(&v, "height")?;
            ensure!((w, h) == (32, 32), "original engine requires 32x32 maps");
            let cells = v["cells"].as_array().context("cells")?;
            ensure!(cells.len() == w * h, "map cell count");
            let mut b = vec![32, 0, 32, 0, 4, 0];
            let mut grid = vec![[0u8; 4]; w * h];
            let mut seen = vec![false; w * h];
            for c in cells {
                let x = u(c, "x")?;
                let y = u(c, "y")?;
                ensure!(
                    x < w && y < h && !seen[y * w + x],
                    "invalid or duplicate map position"
                );
                let walls = numbers(&c["walls"])?;
                ensure!(walls.len() == 4, "four walls per cell");
                grid[y * w + x].copy_from_slice(&walls);
                seen[y * w + x] = true;
            }
            for c in grid {
                b.extend(c);
            }
            b
        }
        "inf" => {
            let v = j(&format!("scripts/{stem}.json"))?;
            cps::encode(&crate::inf::encode(&v, &cps::decode(&raw)?.data)?, &[])?
        }
        "vcn" => {
            let v = j(&format!("tiles/{stem}.json"))?;
            let n = u(&v, "tile_count")?;
            let p = fs::read(root.join("raw").join(format!("{stem}.pal")))?;
            let (w, h, px) = read_png(&root.join(format!("tiles/{stem}.png")), &rgb(&p))?;
            ensure!(
                w == 256 && h as usize == n.div_ceil(32) * 8,
                "tile sheet dimensions"
            );
            let colors = numbers(&v["color_map"])?;
            ensure!(colors.len() == 32, "VCN has 32 color map entries");
            let mut b = (n as u16).to_le_bytes().to_vec();
            b.extend(colors);
            for t in 0..n {
                for y in 0..8 {
                    for x in (0..8).step_by(2) {
                        let i = ((t / 32) * 8 + y) * 256 + (t % 32) * 8 + x;
                        ensure!(
                            px[i] < 16 && px[i + 1] < 16,
                            "tile pixels must use indices 0..15"
                        );
                        b.push(px[i] << 4 | px[i + 1]);
                    }
                }
            }
            b.extend(numbers(&v["tail"])?);
            cps::encode(&b, &[])?
        }
        "vmp" => {
            let v = j(&format!("tiles/{stem}.vmp.json"))?;
            let entries = v["entries"].as_array().context("entries")?;
            ensure!(
                entries.len() == u(&v, "count")?,
                "VMP count does not match entries"
            );
            let mut b = (entries.len() as u16).to_le_bytes().to_vec();
            for n in entries {
                let n = n.as_u64().context("VMP word")?;
                ensure!(n <= 65535, "VMP word overflow");
                b.extend((n as u16).to_le_bytes());
            }
            b
        }
        "fnt" => {
            let v = j(&format!("fonts/{stem}.json"))?;
            let h = u(&v, "height")?;
            let (w, ph, px) = read_png(
                &root.join(format!("fonts/{stem}.png")),
                &[0, 0, 0, 255, 255, 255],
            )?;
            ensure!(w == 128 && ph as usize == h * 8, "font sheet dimensions");
            let mut b = raw;
            for ch in 0..128 {
                let off = word(&b, 2 + ch * 2)? as usize;
                for y in 0..h {
                    let mut bits = 0;
                    for x in 0..8 {
                        if px[((ch / 16) * h + y) * 128 + (ch % 16) * 8 + x] != 0 {
                            bits |= 0x80 >> x;
                        }
                    }
                    b[off + y] = bits;
                }
            }
            b
        }
        "dec" => {
            let v = j(&format!("sprites/{stem}.dec.json"))?;
            let dec = v["decorations"].as_array().context("decorations")?;
            let mut b = (dec.len() as u16).to_le_bytes().to_vec();
            for d in dec {
                let shapes = numbers(&d["shape_indices"])?;
                ensure!(shapes.len() == 10, "DEC requires ten shapes");
                b.extend(shapes);
                b.push(byte_field(d, "next")?);
                b.push(byte_field(d, "flags")?);
                for field in ["x", "y"] {
                    let coords = d[field].as_array().context("decoration coordinates")?;
                    ensure!(coords.len() == 10, "DEC requires ten coordinates");
                    for n in coords {
                        let n = n.as_i64().context("signed coordinate")?;
                        ensure!((-32768..=32767).contains(&n), "coordinate range");
                        b.extend((n as i16).to_le_bytes());
                    }
                }
            }
            let rects = v["rectangles"].as_array().context("DEC rectangles")?;
            b.extend((rects.len() as u16).to_le_bytes());
            for r in rects {
                for key in ["x_tiles", "y", "width_tiles", "height"] {
                    b.extend(word_field(r, key)?);
                }
            }
            b
        }
        "dcr" => {
            let v = j(&format!("sprites/{stem}.dcr.json"))?;
            let mut b = (u(&v, "groups")? as u16).to_le_bytes().to_vec();
            for f in v["frames"].as_array().context("DCR frames")? {
                for key in [
                    "x_tiles",
                    "y",
                    "width_tiles",
                    "height",
                    "offset_x",
                    "offset_y",
                ] {
                    b.push(byte_field(f, key)?);
                }
            }
            ensure!(
                b.len() == 2 + u(&v, "groups")? * 36,
                "DCR needs six frames per group"
            );
            b
        }
        "adl" => crate::soundbank::encode(&j(&format!("audio/{stem}.adl.json"))?)?,
        "snd" => {
            let v = j(&format!("audio/{stem}.snd.json"))?;
            crate::soundbank::encode_speaker(&v)?
        }
        "dat" if stem == "text" => {
            let v = j("texts/dialogue.json")?;
            let groups = v["groups"].as_array().context("text groups")?;
            let mut header = Vec::new();
            let mut data = Vec::new();
            for group in groups {
                let offset = groups.len() * 2 + data.len();
                ensure!(offset <= 65535, "text offset exceeds DOS range");
                header.extend((offset as u16).to_le_bytes());
                data.extend(encode_cp437(
                    group.as_str().context("dialogue group must be a string")?,
                )?);
            }
            header.extend(data);
            header
        }
        "dat" if stem == "item" => {
            let v = j("items/items.json")?;
            let items = v["items"].as_array().context("items")?;
            ensure!(items.len() <= 600, "too many items");
            let mut b = (items.len() as u16).to_le_bytes().to_vec();
            for it in items {
                for key in ITEM_FIELDS {
                    b.push(byte_field(it, key)?);
                }
                for key in ["block", "next", "previous"] {
                    b.extend(word_field(it, key)?);
                }
                b.push(byte_field(it, "level")?);
                b.push(byte_field(it, "value")?);
            }
            let names = v["names"].as_array().context("item names")?;
            ensure!(names.len() <= 130, "too many item names");
            b.extend((names.len() as u16).to_le_bytes());
            for name in names {
                let n = encode_cp437(name.as_str().context("item name string")?)?;
                ensure!(n.len() < 35, "item name exceeds 34 bytes");
                let mut field = [0; 35];
                field[..n.len()].copy_from_slice(&n);
                b.extend(field);
            }
            b.extend(numbers(&v["tail"])?);
            b
        }
        "dat" if stem == "itemtype" => {
            let v = j("items/types.json")?;
            let types = v["types"].as_array().context("types")?;
            ensure!(types.len() <= 65, "too many item types");
            let mut b = (types.len() as u16).to_le_bytes().to_vec();
            for t in types {
                b.extend(word_field(t, "inventory_flags")?);
                b.extend(word_field(t, "hand_flags")?);
                for key in TYPE_FIELDS {
                    b.push(byte_field(t, key)?);
                }
                b.extend(word_field(t, "extra_properties")?);
            }
            b.extend(numbers(&v["tail"])?);
            b
        }
        "exe" if stem == "start" => {
            let v = j("texts/executable.json")?;
            let mut b = raw;
            for s in v["strings"].as_array().context("EXE strings")? {
                let p = u(s, "offset")?;
                let n = u(s, "max_bytes")?;
                ensure!(
                    p + n < b.len() && b[p + n] == 0,
                    "EXE string bounds invalid"
                );
                let text = encode_cp437(s["text"].as_str().context("EXE text")?)?;
                ensure!(text.len() <= n, "text at {p:#x} exceeds {n} bytes");
                b[p..p + n].fill(0);
                b[p..p + text.len()].copy_from_slice(&text);
            }
            b
        }
        "txt" | "me" | "dox" => encode_cp437(&fs::read_to_string(
            root.join(format!("texts/{}.txt", e.name)),
        )?)?,
        _ => {
            let v = j(&format!("data/{}.json", e.name))?;
            flatten_rows(&v["bytes"])?
        }
    };
    Ok(out)
}

pub fn pack(root: &Path, output: &Path) -> Result<()> {
    let m = manifest(root)?;
    // Never permit output over originals or the editable tree, including symlinks.
    fs::create_dir_all(output)?;
    let target = output.canonicalize()?;
    let original = PathBuf::from(&m.source);
    let assets = root.canonicalize()?;
    ensure!(
        !target.starts_with(&original) && !original.starts_with(&target),
        "refusing to overwrite original game directory"
    );
    ensure!(
        !target.starts_with(&assets) && !assets.starts_with(&target),
        "runtime must be outside assets"
    );
    let mut changed = 0;
    // Validate and rebuild everything before replacing any runtime files.
    let rebuilt = m
        .files
        .iter()
        .map(|e| Ok((e, rebuild(root, e).with_context(|| e.name.clone())?)))
        .collect::<Result<Vec<_>>>()?;
    for (e, b) in rebuilt {
        let ext = e.kind.to_lowercase();
        // Runtime saves and DOSBox-generated state survive repacking.
        if ["sav", "tmp"].contains(&ext.as_str()) && output.join(&e.name).exists() {
            continue;
        }
        if hash(&b) != e.sha256 {
            changed += 1;
        }
        fs::write(output.join(&e.name), b)?;
    }
    println!(
        "Repacked {} files ({} modified) into {}",
        m.files.len(),
        changed,
        output.display()
    );
    Ok(())
}
pub fn verify(root: &Path) -> Result<()> {
    let m = manifest(root)?;
    let mut changed = 0;
    for e in &m.files {
        let b = rebuild_impl(root, e, true).with_context(|| e.name.clone())?;
        if edited(root, e)? {
            changed += 1;
            continue;
        }
        let raw = fs::read(root.join("raw").join(&e.name))?;
        if ["cps", "inf", "vcn"].contains(&e.kind.as_str()) {
            let a = cps::decode(&b)?;
            let original = cps::decode(&raw)?;
            ensure!(
                a.data == original.data && a.palette == original.palette,
                "{} decoded roundtrip mismatch",
                e.name
            );
        } else {
            ensure!(b == raw, "{} byte-for-byte roundtrip mismatch", e.name);
        }
    }
    println!(
        "Verified {} original hashes and forced export/rebuild roundtrips; {} intentional modifications",
        m.files.len(),
        changed
    );
    Ok(())
}
