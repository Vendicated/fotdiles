import json
import os
import shutil
from pathlib import Path

data = {}

def backup_file(file: Path, outdir: Path):
    if file.is_dir():
        outdir /= file.name
        outdir.mkdir(exist_ok=True, parents=True)
        for child in file.iterdir():
            backup_file(child, outdir)
    else:
            shutil.copy2(file, outdir)

def get_perms_oct(path):
    return os.stat(path).st_mode

with open("files.txt") as f:
    outdir = Path("dotfiles")
    outdir.mkdir(exist_ok=True)

    for file in f.readlines():
        file = file.strip()
        from_file = Path(file)
        backup_file(from_file, outdir)
        print(f"Backed up {from_file}")

        data[from_file.name] = { 
            "path": file,
            "owner": from_file.owner(), 
            "group": from_file.group(),
            "perms": oct(get_perms_oct(from_file)), 
            "parentOwner": from_file.parent.owner(),
            "parentGroup": from_file.parent.group(),
            "parentPerms": oct(get_perms_oct(from_file.parent))
        }

with open("filemap.json", "w") as f:
    json.dump(data, f, sort_keys=True, indent=4)
