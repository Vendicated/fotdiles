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

if not filedir.exists():
    print("directory files does not exist, so there is nothing to install.")
else:
    with open('filemap.json') as f:
        data = json.loads(f.read())
    
        for file in os.listdir(filedir):
            try:
                outfile = Path(data[file]).expanduser()
                if outfile.is_dir():
                     if outfile.exists():
                        shutil.rmtree(outfile)
                     shutil.copytree(filedir / file, outfile)
                else:
                     shutil.copy2(filedir / file, outfile)
                print(f"Copied {file} to {outfile}")
            except KeyError:
                print(f"File {file} does not have its target location mapped in filemap.json. Please move it manually via mv {file} <output file>")
                pass
