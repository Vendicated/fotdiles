#!/usr/bin/env python3

import os
import shutil
import json
from pathlib import Path

if os.geteuid() != 0:
    print("Please run this script as root.")
    import sys
    sys.exit(0)

filedir = Path("dotfiles")

def restore_file(file: Path, outfile: Path, data):
    if not outfile.parent.exists(): 
        outfile.parent.mkdir(parents=True)
        shutil.chown(outfile.parent, data["parentOwner"], data["parentGroup"])
        outfile.parent.chmod(int(data["parentPerms"], 8))
    if file.is_dir():
        outfile.mkdir(exist_ok=True, parents=True)
        print(f"iterating dir {file} with outdir {outfile}")
        for child in file.iterdir():
            if child.is_dir():
                restore_file(child, outfile / child.name, data)
            else:
                print(f"Found child file {child} with outdir {outfile}")
                restore_file(child, outfile, data)
    else:
        shutil.copy2(file, outfile)
    shutil.chown(outfile, data["owner"], data["group"])
    outfile.chmod(int(data["perms"], 8))

if not filedir.exists():
    print("directory files does not exist, so there is nothing to install.")
else:
    with open('filemap.json') as f:
        data = json.loads(f.read())
    
        for file in filedir.iterdir():
            try:
                file_data = data[file.name]
                outfile = Path(file_data["path"])
                restore_file(file, outfile, file_data)
                print(f"Copied {file} to {outfile}")
            except KeyError:
                print(f"File {file} does not have its target location mapped in filemap.json. Please move it manually via mv {file} <output file>")
                pass
