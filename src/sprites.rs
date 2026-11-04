//! Editable individual sprite crops, overlaid onto their original CPS sheet.
use crate::{
    assets::{self, Entry, u},
    cps,
};
use anyhow::{Context, Result, ensure};
use serde_json::{Value, json};
use std::{
    collections::{BTreeMap, BTreeSet},
    fs,
    path::Path,
};

pub fn monster_groups(source: &Path) -> Result<BTreeMap<String, BTreeSet<usize>>> {
    let mut found: BTreeMap<String, BTreeSet<usize>> = BTreeMap::new();
    for f in fs::read_dir(source)? {
        let f = f?;
        if f.path().extension().is_none_or(|e| e != "inf") {
            continue;
        }
        let b = cps::decode(&fs::read(f.path())?)?.data;
        for p in 0..b.len().saturating_sub(18) {
            if b[p] != 0xec || b[p + 1] > 2 || b[p + 2] > 1 {
                continue;
            }
            let raw = &b[p + 3..p + 16];
            let end = raw.iter().position(|x| *x == 0).unwrap_or(13);
            if end == 0 {
                continue;
            }
            if raw[..end].iter().all(|c| c.is_ascii_alphanumeric()) {
                let name = String::from_utf8(raw[..end].to_vec())?.to_lowercase();
                if source.join(format!("{name}.cps")).exists() {
                    found.entry(name).or_default().insert(b[p + 1] as usize);
                }
            }
        }
    }
    Ok(found)
}

pub fn export(
    source: &Path,
    out: &Path,
    stem: &str,
    pixels: &[u8],
    pal: &[u8],
    groups: &BTreeMap<String, BTreeSet<usize>>,
    entry: &mut Entry,
) -> Result<()> {
    let mut rects = Vec::new();
    let mut add = |label: String, x: usize, y: usize, w: usize, h: usize| {
        if w > 0 && h > 0 && x + w <= 320 && y + h <= 200 {
            rects.push(json!({"file":format!("sprites/{stem}/{label}.png"),"x":x,"y":y,"width":w,"height":h}));
        }
    };
    match stem {
        "itemicn" => {
            for i in 0..112 {
                add(format!("icon-{i:03}"), (i % 20) * 16, (i / 20) * 16, 16, 16);
            }
        }
        "iteml1" => {
            for i in 0..11 {
                add(format!("large-{i:02}"), (i / 8) * 64, (i % 8) * 24, 64, 24);
            }
        }
        "items1" => {
            for i in 0..26 {
                add(format!("small-{i:02}"), (i / 8) * 32, (i % 8) * 24, 32, 24);
            }
        }
        "thrown" => {
            for i in 0..9 {
                add(format!("thrown-{i:02}"), (i / 8) * 32, (i % 8) * 24, 32, 24);
            }
        }
        _ => {}
    }
    let tables: Value = serde_json::from_str(include_str!("../data/sprite-layouts.json"))?;
    if let Some(indices) = groups.get(stem) {
        for &group in indices {
            for i in 0..6 {
                let r = &tables["monster_rects"][group * 18 + i];
                if let Some(r) = r.as_array() {
                    let a: Vec<usize> = r.iter().map(|x| x.as_u64().unwrap() as usize).collect();
                    add(
                        format!("group-{group}-frame-{i}"),
                        a[0] * 8,
                        a[1],
                        a[2] * 8,
                        a[3],
                    );
                }
            }
        }
    }
    let intro_index = match stem {
        "street1" => Some("00"),
        "street2" => Some("01"),
        "westwood" => Some("04"),
        "khelban1" => Some("07"),
        _ => None,
    };
    if let Some(idx) = intro_index
        && let Some(shapes) = tables["intro"][idx].as_array()
    {
        for r in shapes {
            let a = r.as_array().context("intro sprite")?;
            add(
                format!("intro-{:03}", a[0].as_i64().unwrap().unsigned_abs()),
                a[1].as_u64().unwrap() as usize * 8,
                a[2].as_u64().unwrap() as usize,
                a[3].as_u64().unwrap() as usize * 8,
                a[4].as_u64().unwrap() as usize,
            );
        }
    }
    let dcr = source.join(format!("{stem}.dcr"));
    if dcr.exists() {
        let b = fs::read(dcr)?;
        for (i, r) in b[2..].chunks_exact(6).enumerate() {
            add(
                format!("decoration-{i:02}"),
                r[0] as usize * 8,
                r[1] as usize,
                r[2] as usize * 8,
                r[3] as usize,
            );
        }
    }
    if rects.is_empty() {
        return Ok(());
    }
    for r in &rects {
        let (x, y, w, h) = (u(r, "x")?, u(r, "y")?, u(r, "width")?, u(r, "height")?);
        let mut cropped = Vec::new();
        for row in y..y + h {
            cropped.extend_from_slice(&pixels[row * 320 + x..row * 320 + x + w]);
        }
        let path = r["file"].as_str().unwrap();
        assets::write_png(&out.join(path), w as u32, h as u32, &cropped, pal)?;
        entry
            .editable
            .insert(path.into(), assets::hash(&fs::read(out.join(path))?));
    }
    let path = format!("sprites/{stem}/atlas.json");
    assets::save_json(
        &out.join(&path),
        &json!({"source":format!("{stem}.cps"),"sprites":rects}),
    )?;
    entry
        .editable
        .insert(path.clone(), assets::hash(&fs::read(out.join(path))?));
    Ok(())
}

pub fn overlay(
    root: &Path,
    stem: &str,
    entry: &Entry,
    pixels: &mut [u8],
    pal: &[u8],
) -> Result<()> {
    let atlas = root.join(format!("sprites/{stem}/atlas.json"));
    if !atlas.exists() {
        return Ok(());
    }
    let v = assets::read_json(&atlas)?;
    for r in v["sprites"].as_array().context("atlas sprites")? {
        let file = r["file"].as_str().context("sprite file path")?;
        ensure!(
            !Path::new(file).is_absolute()
                && !Path::new(file)
                    .components()
                    .any(|p| p == std::path::Component::ParentDir),
            "invalid sprite path"
        );
        let b = fs::read(root.join(file))?;
        if entry
            .editable
            .get(file)
            .is_some_and(|h| *h == assets::hash(&b))
        {
            continue;
        }
        let (w, h, px) = assets::read_png(&root.join(file), pal)?;
        let (x, y, ew, eh) = (u(r, "x")?, u(r, "y")?, u(r, "width")?, u(r, "height")?);
        ensure!(
            w as usize == ew && h as usize == eh && x + ew <= 320 && y + eh <= 200,
            "sprite bounds invalid: {file}"
        );
        for row in 0..eh {
            pixels[(y + row) * 320 + x..(y + row) * 320 + x + ew]
                .copy_from_slice(&px[row * ew..row * ew + ew]);
        }
    }
    Ok(())
}
