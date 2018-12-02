import io
total = 0

with io.open("day1input.txt", 'r', encoding='utf-8') as f:
    for line in f:
        operator = line[0]
        number = int(line[1:].rstrip())
        if operator == "+":
            total += number
        if operator == "-":
            total -= number
print(total)

