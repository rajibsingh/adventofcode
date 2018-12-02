import io
from operator import itemgetter

two_of = 0
three_of = 0
boxes = []

def repeated_x_times(repeat, box_number):
    print("repeated_x_times: {0} {1}".format(repeat, box_number))
    counts = dict()
    for char in box_number:
        if counts.get(char):
            counts[char] += 1
        else:
            counts[char] = 1
    sorted_count = [(k, counts[k]) for k in sorted(counts, key=counts.get, reverse=True)]
    top = sorted_count[0]
    if top[1] >= repeat:
        return True
    else:
        return False


with io.open("day2input.txt", 'r', encoding='utf-8') as f:
    for line in f:
        box_number = line.rstrip()
        boxes.append(box_number)

for box in boxes:
    if repeated_x_times(2, box):
       two_of += 1
    if repeated_x_times(3, box):
        three_of += 1

print("{0} {1} {2}".format(two_of, three_of, two_of * three_of))

