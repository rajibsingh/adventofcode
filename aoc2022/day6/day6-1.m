#import <Foundation/Foundation.h>

void printSet(NSString* setName, NSSet* stack) {
    NSMutableString* retVal = [[NSMutableString alloc] init];
    [retVal appendString:@"["];
    for (NSString* key in [setName attributeKeys]) {
        [retVal appendString: key];
    }
    [retVal appendString:@"]"];
    NSLog(@"stack %@ -> %@ ", setName, retVal);
}

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
            NSLog(@"searchRange: %@ : char: %@", NSStringFromRange(searchRange), retString);
            [stack addObject:retString];
            if ([stack count] > 4) {
                [stack removeObjectAtIndex:0];
            }
            NSSet *set = [NSSet setWithArray:stack];
            if ([stack count] == 4 && [set attributeKeys].count < 4) {
                NSLog(@"start of packet marker found at index %d", i);
                break;
            }
        }
    }

    [pool drain];
    return 0;

}