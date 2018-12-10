import io

class Claim():
    def __init__(self, id, x1, y1, x2, y2):
        self.id = id
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
        # print("{0} {1},{2} {3},{4}".format(self.id, self.x1, self.y1, self.x2, self.y2))

    def layout(self, matrix):
        for x in range(x1, x2):
            for y in range(y1, y2):
                if matrix[x][y]:
                    matrix[x][y] = matrix[x][y]+1
                else:
                    matrix[x][y] = 1


width, height = 1000, 1000;
matrix = [[0 for x in range(width)] for y in range(height)]
claims = []

for x in range(width):
    for y in range(height):
        matrix[x][y] = 0


with io.open('day3.input.txt', 'r', encoding='utf-8') as f:
    for line in f:
        tokens = line.split()
        # print(tokens)
        id = tokens[0][1:]
        coords = tokens[2].split(",")
        x1 = int(coords[0])
        y1 = int(coords[1][:-1])
        ranges = tokens[3].split("x")
        x2 = x1 + int(ranges[0])
        y2 = y1 + int(ranges[1])
        claim = Claim(id=id, x1=x1, y1=y1, x2=x2, y2=y2)
        claim.layout(matrix)
        claims.append(claim)

overlap_count = 0
for x in range(width):
    for y in range(height):
        if matrix[x][y]:
           if matrix[x][y] > 1:
               overlap_count += 1

print(overlap_count)


