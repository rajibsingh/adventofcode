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
            [stack addObject:retString];
            if ([stack count] > 14) {
                [stack removeObjectAtIndex:0];
            }
            NSSet *set = [NSSet setWithArray:stack];
            if ([stack count] == 14 && [set count] > 13) {
                NSLog(@"start of packet marker found at index %d", i+1);
                break;
            }
        }
    }

    [pool drain];
    return 0;

}