import io

class Claim():
    def __init__(self, id, x1, y1, x2, y2):
        self.id = id
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
        print("{0} {1},{2} {3},{4}".format(self.id, self.x1, self.y1, self.x2, self.y2))

    def does_overlap(self, claim2):
        if self.x2 < claim.x1:
            return True

claims = []
with io.open('day3.input.txt', 'r', encoding='utf-8') as f:
    for line in f:
        tokens = line.split()
        print(tokens)
        id = tokens[0][1:]
        coords = tokens[2].split(",")
        x1 = int(coords[0])
        y1str = coords[1][:-1]
        y1 = int(y1str)
        ranges = tokens[3].split("x")
        x2 = x1 + int(ranges[0])
        y2 = y1 + int(ranges[1])
        claim = Claim(id=id, x1=x1, y1=y1, x2=x2, y2=y2)
        claims.append(claim)


