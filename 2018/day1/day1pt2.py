import io
import os

deltas = []
frequencies = {0}
total = 0

with io.open("2018/day1/day1input.txt", 'r', encoding='utf-8') as f:
    for line in f:
        delta = int(line.rstrip())
        deltas.append(delta)

dupe_found = False
i = 0
while not dupe_found:
    frequency = deltas[i]
    total += frequency
    if total in frequencies:
        print("duplicate found: {0}".format(total))
        dupe_found = True
    else:
        frequencies.add(total)
    i += 1
    if i == len(deltas):
        i = 0

print(total)
print(frequencies)
print(len(frequencies))
