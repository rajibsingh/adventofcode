#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                                                      encoding:NSUTF8StringEncoding error:nil];
    NSArray *lines = [fileContent componentsSeparatedByString:(NSString *) @"\n"];

    //parse input
    for (NSString *line in lines) {
        NSLog(@"\n*** line: %@", line);
        // create data structure to hold parsed data
        NSMutableArray *stack = [[NSMutableArray alloc] initWithCapacity:4];
        for (int i = 0; i < line.length; i++) {
            NSRange searchRange = NSMakeRange(i, 1);
            NSString *retString = [line substringWithRange:searchRange];
//            NSLog(@"searchRange: %@ : char: %@", NSStringFromRange(searchRange), retString);
            [stack addObject:retString];
            if ([stack count] > 4) {
                [stack removeObjectAtIndex:0];
            }
            NSSet *set = [NSSet setWithArray:stack];
            if ([stack count] == 4 && [set count] > 3) {
                NSLog(@"start of packet marker found at index %d", i+1);
                NSLog(@"set: %@", set);
                break;
            }
        }
    }

    [pool drain];
    return 0;

}