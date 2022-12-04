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
        int commonElementPriority = 0;
        for (int i = 0; i < line1.length - 2; i++) {
            NSRange range = NSMakeRange(i, i+1);
            NSLog(@"i: %d", i);
            NSString* searchStr = [line1 substringWithRange:range];
            NSLog(@"searchStr: %@", searchStr);
       }
    }
    NSLog(@"totalPriority: %ld", totalPriority);
    [pool drain];
    return 0;
}