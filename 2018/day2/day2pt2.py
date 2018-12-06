import io
from operator import itemgetter


def search(boxes, box_number):
    for box in boxes:
        # print("{0}".format(box_number))
        # print("{0}".format(box))
        i = 0
        misses = 0
        for char in box:
            if char != box_number[i]:
                misses += 1
            i += 1
        # print("\tmisses: {0}".format(misses))
        if misses == 1:
            print("*** {0} {1}".format(box, box_number))

boxes = []
with io.open("day2input.txt", 'r', encoding='utf-8') as f:
    for line in f:
        box_number = line.rstrip()
        boxes.append(box_number)

for box in boxes:
    search(boxes, box)


