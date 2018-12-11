import io

class Claim():
    def __init__(self, id, startX, startY, deltaX, deltaY):
        self.id = id
        self.startX = startX
        self.startY = startY
        self.deltaX = deltaX
        self.deltaY = deltaY

    def layout(self, matrix):
        for x in range(self.startX, self.startX + self.deltaX):
            for y in range(self.startY, self.startY + self.deltaY):
                matrix[x][y].append(self.id)

def claim_not_intersected(claim, matrix):
    for x in range(claim.startX, claim.startX + claim.deltaX):
        for y in range(claim.startY, claim.startY + claim.deltaY):
            claims_on_point = matrix[x][y]
            if len(claims_on_point) != 1 or claims_on_point[0] != claim.id:
                return False
    return True


width, height = 1000, 1000;
matrix = [[0 for x in range(width)] for y in range(height)]
claims = []

for x in range(width):
    for y in range(height):
        matrix[x][y] = []

with io.open('day3.input.txt', 'r', encoding='utf-8') as f:
    for line in f:
        tokens = line.split()
        id = tokens[0][1:]
        coords = tokens[2].split(",")
        x1 = int(coords[0])
        y1 = int(coords[1][:-1])
        ranges = tokens[3].split("x")
        x2 = int(ranges[0])
        y2 = int(ranges[1])
        claim = Claim(id=id, startX=x1, startY=y1, deltaX=x2, deltaY=y2)
        claim.layout(matrix)
        claims.append(claim)

for claim in claims:
    if claim_not_intersected(claim, matrix):
        print(claim.id)

