#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    int linesLength = [lines count];
    NSLog(@"linesLength: %d", linesLength);
    NSInteger totalPriority = 0;
    for (int lineIndex = 0; lineIndex < linesLength-2; lineIndex = lineIndex + 3) {
        NSString* line1 = lines[lineIndex];
        NSString* line2 = lines[lineIndex+1];
        NSString* line3 = lines[lineIndex+2];
        NSLog(@"line1: %@", line1);
        NSLog(@"line2: %@", line2);
        NSLog(@"line3: %@", line3);
        // for (int i =0; i < [firstHalf length]; i++) {
            // int commonElementPriority = 0;
            // unichar character = [firstHalf characterAtIndex:i];
            // NSString* charStr = [NSString stringWithCharacters:&character length:1];
            // bool wasFound = [secondHalf rangeOfString:charStr].location != NSNotFound;
            // if (wasFound) {
                // if ([charStr.uppercaseString isEqualToString:charStr]) {
                    // commonElementPriority = (int)character - 38;
                // } else {
                    // commonElementPriority = (int)character - 96;
                // }
                // NSLog(@"%@ found, code: %d, priority: %d", charStr, (int)character, commonElementPriority);
                // totalPriority = totalPriority + commonElementPriority;
                // break;
            // }
        // }
    }
    NSLog(@"totalPriority: %ld", totalPriority);
    [pool drain];
    return 0;
}