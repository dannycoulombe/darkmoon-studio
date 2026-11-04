#!/usr/bin/env python3
"""Install pinned, local upstream runtime tools without changing system packages."""
import argparse
import hashlib
import pathlib
import platform
import tarfile
import urllib.request
import zipfile

parser=argparse.ArgumentParser()
parser.add_argument('--ghidra',action='store_true',help='also download Ghidra 11.3.2 (requires JDK 21)')
args=parser.parse_args()
root=pathlib.Path(__file__).resolve().parent
assert platform.system()=='Linux' and platform.machine()=='x86_64', 'Pinned runtime is Linux x86_64; set EYE2_DOSBOX on other platforms'

def download(url,name,sha):
    path=root/name
    if not path.exists():
        print('Downloading',url,flush=True)
        urllib.request.urlretrieve(url,path)
    assert hashlib.sha256(path.read_bytes()).hexdigest()==sha, f'Checksum mismatch: {path}'
    return path

if not (root/'dosbox-staging/dosbox').exists():
    archive=download('https://github.com/dosbox-staging/dosbox-staging/releases/download/v0.83.0/dosbox-staging-linux-x86_64-v0.83.0.tar.xz','dosbox-staging.tar.xz','d3a94f7f1c3e68a47ec88d61145506c7904452adb0c9c5928cb8cfe2331d6c5c')
    with tarfile.open(archive) as t:
        base=t.getnames()[0].split('/')[0]
        t.extractall(root,filter='data')
    (root/base).rename(root/'dosbox-staging')
print('DOSBox Staging ready:',root/'dosbox-staging/dosbox')

if args.ghidra:
    directory=root/'ghidra_11.3.2_PUBLIC'
    if not directory.exists():
        archive=download('https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.3.2_build/ghidra_11.3.2_PUBLIC_20250415.zip','ghidra.zip','99d45035bdcc3d6627e7b1232b7b379905a9fad76c772c920602e2b5d8b2dac2')
        with zipfile.ZipFile(archive) as z:z.extractall(root)
    for p in directory.rglob('*'):
        if p.is_file() and (p.suffix=='.sh' or p.name in ['analyzeHeadless','decompile','sleigh']):p.chmod(0o755)
    print('Ghidra ready:',directory)
