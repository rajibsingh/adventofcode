#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                                                      encoding:NSUTF8StringEncoding error:nil];
    NSArray *lines = [fileContent componentsSeparatedByString:(NSString *) @"\n"];
    int overlappingRanges = 0;
    int fl = 0; //first lower
    int fu = 0; //first upper
    int sl = 0; //second lower
    int su = 0; //second upper
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
        fl = [(NSNumber *) range1[0] intValue];
        fu = [(NSNumber *) range1[1] intValue];
        sl = [(NSNumber *) range2[0] intValue];
        su = [(NSNumber *) range2[1] intValue];


        if (fu >= sl && su >= fl) {
            overlappingRanges++;
            NSLog(@"intersects!");
            NSLog(@"fl: %d", fl);
            NSLog(@"fu: %d", fu);
            NSLog(@"sl: %d", sl);
            NSLog(@"su: %d", su);
        }
    }

    NSLog(@"%d overlapping ranges", overlappingRanges);

    [pool drain];
    return 0;
}