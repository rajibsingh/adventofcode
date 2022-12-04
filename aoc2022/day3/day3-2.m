#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    int linesLength = [lines count];
    NSInteger totalPriority = 0;
    for (int lineIndex = 0; lineIndex < linesLength-2; lineIndex = lineIndex + 3) {
        NSString* line1 = lines[lineIndex];
        NSString* line2 = lines[lineIndex+1];
        NSString* line3 = lines[lineIndex+2];
        NSLog(@"line1: %@", line1);
        NSLog(@"line2: %@", line2);
        NSLog(@"line3: %@", line3);
        int commonElementPriority = 0;
        for (int i = 0; i < line1.length; i++) {
            unichar searchChar = [line1 characterAtIndex:i];
            NSString* searchStr = [[NSString alloc] initWithCharacters:&searchChar length:1];
            if ([line2 containsString:searchStr] && [line3 containsString:searchStr]) {
                NSLog(@"common: %@", searchStr);
                if ([searchStr.uppercaseString isEqualToString:searchStr]) {
                    commonElementPriority = (int)searchChar - 38;
                } else {
                    commonElementPriority = (int)searchChar - 96;
                }
                totalPriority = totalPriority + commonElementPriority;
                break;
            }
       }
    }
    NSLog(@"totalPriority: %ld", totalPriority);
    [pool drain];
    return 0;
}