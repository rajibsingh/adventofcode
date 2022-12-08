#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                                                      encoding:NSUTF8StringEncoding error:nil];
    NSArray *lines = [fileContent componentsSeparatedByString:(NSString *) @"\n"];
    NSError *error = nil;

    // create data structure to hold parsed data
    NSMutableDictionary *stacks = [NSMutableDictionary dictionaryWithCapacity:10];
    for (int i = 1; i < 10; i++) {
        NSString *stackName = [NSString stringWithFormat:@"%d", i];
        NSMutableArray *stack = [[NSMutableArray alloc] init];
        stacks[stackName] = stack;
    }

    //parse input
    for (NSString *line in lines) {
        NSLog(@"*** line: %@", line);
        //parsing initial setup
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[.\\]" options:0 error:&error];
        NSArray *matches = [regex matchesInString:line options:0 range:NSMakeRange(0, [line length])];
        for (NSTextCheckingResult *match in matches) {
            NSString *matchText = [line substringWithRange:[match range]];
            NSLog(@"match: %@", matchText);
            NSRange charRange = [line rangeOfString:matchText];
//            NSLog(@"charAt: %@", NSStringFromRange(charRange));
            int stackId = charRange.location / 4 + 1;
            NSString *stackName = [NSString stringWithFormat:@"%d", stackId];
            NSLog(@"stackName \"%@\"", stackName);
            unichar crateNameChar = [line characterAtIndex:charRange.location+1];
            NSString* crateStr = [NSString stringWithFormat:@"%C", crateNameChar];
            NSLog(@"crateStr: %@", crateStr);
            NSMutableArray* stack = stacks[stackName];
            [stack addObject:crateStr];
            NSLog(@"stackName: %@ holding: %d", stackName, stack.count);
        }

        //handle commands
        if ([line containsString:@"move"]) {
            NSArray* cmdLineArray = [line componentsSeparatedByString:@" "];
            int amount = [(NSString*)cmdLineArray[1] intValue];
            NSString* srcStackName = (NSString*)cmdLineArray[3];
            NSMutableArray* srcStack = stacks[srcStackName];
            NSString* destStackName = (NSString*)cmdLineArray[5];
            NSMutableArray* destStack = stacks[destStackName];
            for (int i = 0; i < amount; i++) {
                NSString* crate = (NSString*)srcStack[srcStack.count-1];
                [srcStack removeLastObject];
                [destStack addObject:crate];
            }
        }
    }

    // debug
    for (int i = 1; i < 10; i++) {
        NSString* stackName = [NSString stringWithFormat:@"%d",i];
        NSMutableArray* stack = stacks[stackName];
        NSLog(@"stack %@: %d: %@", stackName, stack.count, stack);
    }

    [pool drain];
    return 0;
}