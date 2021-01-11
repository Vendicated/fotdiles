import json
from shutil import copy2, copytree, rmtree
from pathlib import Path


outdir = Path("dotfiles")
outdir.mkdir(exist_ok=True)
data = {}

with open("files.txt") as f:
    for file in f.readlines(): 
        file = file.strip()
        from_file = Path(file).expanduser()
        if from_file.is_dir():
            final_outdir = outdir / from_file.name
            if final_outdir.exists():
                rmtree(final_outdir)
            copytree(from_file, final_outdir)
        else:
            copy2(from_file, outdir)
        print(f"Backed up {from_file}")
        data[from_file.name] = file

with open("filemap.json", "w") as f:
    json.dump(data, f, sort_keys=True, indent=4)
