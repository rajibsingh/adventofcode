#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    NSInteger totalPriority = 0;
    for (NSString* line in lines) {
        NSLog(@"%@", line);
        int length = [line length];
        NSString* firstHalf = [line substringToIndex:length/2];
        NSString* secondHalf = [line substringFromIndex:length/2];
        // NSLog(@"firstHalf: %@", firstHalf);
        // NSLog(@"secondHalf: %@", secondHalf);
        for (int i =0; i < [firstHalf length]; i++) {
            int commonElementPriority = 0;
            unichar character = [firstHalf characterAtIndex:i];
            NSString* charStr = [NSString stringWithCharacters:&character length:1];
            bool wasFound = [secondHalf rangeOfString:charStr].location != NSNotFound;
            if (wasFound) {
                if ([charStr.uppercaseString isEqualToString:charStr]) {
                    commonElementPriority = (int)character - 38;
                } else {
                    commonElementPriority = (int)character - 96;
                }
                NSLog(@"%@ found, code: %d, priority: %d", charStr, (int)character, commonElementPriority);
                totalPriority = totalPriority + commonElementPriority;
                break;
            }
        }
    }
    NSLog(@"totalPriority: %ld", totalPriority);
    [pool drain];
    return 0;
}