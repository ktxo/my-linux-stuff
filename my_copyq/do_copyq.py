#
# Load files to tabs in CopyQ
# From https://github.com/ktxo/my-linux-stuff
# 

import os
import re
from datetime import datetime



# backup folder
os.makedirs("backup", exist_ok=True)


def parse_file(filename) -> dict[str,list[str]]:
    with open(filename, "r", encoding="utf-8") as fd:
        lines = fd.readlines()

    sections = {}
    section_name = None

    for line in lines:
        if g:= re.match(r"^-{5,}\s*(.*)$", line):
            section_name = g.group(1)
            sections[section_name] = [line]
        elif section_name is not None:
            sections[section_name].append(line)
    return sections


files = sorted([f for f in os.listdir() if re.match(r"\d+_[A-Za-z0-9 &]*_data\.txt", f)])

print(f"Loading {len(files)} files to CopyQ")
for f in files:
    tab_name = f.split("_")[1]
    print(f"Tab '{tab_name}' from file '{f}'")
    items = parse_file(f)

    # Backup
    backup_file = os.path.join("backup", f"{tab_name}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.txt").replace("&", "")
    tab_name = "\"" + tab_name.replace("&", "\\&") + "\""

    _ = os.system(f'copyq tab "{tab_name}" exporttab {backup_file}')
    print(f"Backup to {backup_file}")

    _ = os.system(f'copyq removetab "{tab_name}"')
    for name, lines in items.items():
        with open("__tmp.txt", "w", encoding="utf-8") as fd:
            fd.writelines(lines)
        _ = os.system(f'copyq tab "{tab_name}" add - < __tmp.txt')

try:
    os.remove("__tmp.txt")
except:
    pass
