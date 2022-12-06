#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                                                      encoding:NSUTF8StringEncoding error:nil];
    NSArray *lines = [fileContent componentsSeparatedByString:(NSString *) @"\n"];
    int overlappingRanges = 0;
    int r1Lower = 0;
    int r1Upper = 0;
    int r2Lower = 0;
    int r2Upper = 0;
    for (NSString *line in lines) {
        NSLog(@"** line %@", line);
        NSMutableArray *endRanges = [[NSMutableArray alloc] init];
        NSArray *ranges = [line componentsSeparatedByString:@","];
        for (NSString *rangeLineStr in ranges) {
            NSArray *rangeStrs = [rangeLineStr componentsSeparatedByString:@"-"];
            NSNumber *lowerBound = [NSNumber numberWithInt:[(NSString *) rangeStrs[0] intValue]];
            NSNumber *upperBound = [NSNumber numberWithInt:[(NSString *) rangeStrs[1] intValue]];
            NSArray *range = @[lowerBound, upperBound];
            [endRanges addObject:range];
        }
        NSArray *range1 = endRanges[0];
        NSArray *range2 = endRanges[1];
        r1Lower = [(NSNumber *) range1[0] intValue];
        r1Upper = [(NSNumber *) range1[1] intValue];
        r2Lower = [(NSNumber *) range2[0] intValue];
        r2Upper = [(NSNumber *) range2[1] intValue];

        if ((r1Lower <= r2Lower && r1Upper >= r2Upper)
            || r1Lower >= r2Lower && r1Upper <= r2Upper) {
            overlappingRanges++;
            NSLog(@"r1Lower: %d", r1Lower);
            NSLog(@"r1Upper: %d", r1Upper);
            NSLog(@"r2Lower: %d", r2Lower);
            NSLog(@"r2Upper: %d", r1Upper);
        }
    }

    NSLog(@"%d overlapping ranges", overlappingRanges);

    [pool drain];
    return 0;
}