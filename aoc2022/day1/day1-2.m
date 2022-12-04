#import <Foundation/Foundation.h>

NSInteger intSort(id num1, id num2, void *context)
{
    int v1 = [num1 intValue];
    int v2 = [num2 intValue];
    if (v1 > v2)
        return NSOrderedAscending;
    else if (v1 < v2)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:@"../input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    NSMutableArray* scores = [[NSMutableArray alloc] init];
    int runningTotal = 0;
    for (NSString* line in lines) {
        if ([line length] > 0) {
            int currentNum = [line intValue];
            runningTotal = runningTotal + currentNum; 
            NSLog(@"runningTotal: %d", runningTotal); 
        } else {
            NSLog(@"*** new elf");
            [scores addObject:[NSNumber numberWithInteger:runningTotal]];
            runningTotal = 0;
        }
    }
    NSLog(@"scores: %@", scores);
    // NSArray* topScores = [scores sortedArrayUsingSelector:@selector(integerValue)];
    NSArray* topScores; 
    topScores = [scores sortedArrayUsingFunction:intSort context:NULL];

    NSLog(@"topScores: %@", topScores);
    int total = [topScores[0] intValue] + [topScores[1] intValue] + [topScores[2] intValue];
    NSLog(@"total: %d", total);

    [pool drain];
    return 0;
}