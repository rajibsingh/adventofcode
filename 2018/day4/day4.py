import io
import re

with io.open("day4input.txt", "r", encoding='utf-8') as f:
    lines = f.readlines()

lines.sort()
activeGuard = 0
sleepDB = {}
counter = 0

while counter < len(lines):
    line = lines[counter]
    m = re.search(r'#([0-9]*)', line)
    activeGuard = int(m.group(1))
    if m:
        print(m.group(1) + "===" + line)
    counter += 1