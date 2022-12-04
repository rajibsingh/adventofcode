#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    // NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:@"../input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    int currentHigh = 0;
    int runningTotal = 0;
    for (NSString* line in lines) {
        // NSLog(@"line: %@", line);
        if ([line length] > 0) {
            int currentNum = [line intValue];
            runningTotal = runningTotal + currentNum; 
            NSLog(@"currentNum: %d", currentNum); 
            NSLog(@"runningTotal: %d", runningTotal); 
        } else {
            if (runningTotal > currentHigh) {
                currentHigh = runningTotal;
                NSLog(@"currentHigh: %d", currentHigh);
            }
            runningTotal = 0;
        }
    }
    NSLog(@"currentHigh: %d", currentHigh);

    [pool drain];
    return 0;
}