#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    NSInteger totalPriority = 0;
    for (NSString* line in lines) {
        NSLog(@"** line %@",line);
        NSMutableArray* endRanges = [[NSMutableArray alloc] init];
        NSArray* ranges = [line componentsSeparatedByString:@","];
        for (NSString* rangeLineStr in ranges) {
            NSLog(@"rangeLineStr: %@", rangeLineStr);
            NSArray* rangeStrs = [rangeLineStr componentsSeparatedByString:@"-"];
            NSNumber* lowerBound= [NSNumber numberWithInt:[(NSString*)rangeStrs[0] intValue]];
            NSNumber* upperBound = [NSNumber numberWithInt:[(NSString*)rangeStrs[1] intValue]];
            NSArray* range = @[lowerBound, upperBound];
            [endRanges addObject:range];
            NSLog(@"lowerBound: %d", lowerBound);
            NSLog(@"upperBound: %d", upperBound);
        }
        NSLog(@"endRanges: %@", endRanges);
    }
    [pool drain];
    return 0;
}