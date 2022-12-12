#import <Foundation/Foundation.h>

void printStack(NSString* stackName, NSArray* stack) {
    NSMutableString* retVal = [[NSMutableString alloc] init];
    [retVal appendString:@"["];
    for (int i = 0; i < stack.count; i++) {
        NSString* itChar = (NSString*)stack[i];
        if (i > 0) {
            [retVal appendString:@", "];
        }
        [retVal appendString:itChar];
    }
    [retVal appendString:@"]"];
    NSLog(@"stack %@ -> %@ ", stackName, retVal);
}

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
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[.\\]" options:0 error:&error];
    for (NSString *line in lines) {
        NSLog(@"\n\n*** line: %@", line);
        //parsing initial configuration
        NSArray *matches = [regex matchesInString:line options:0 range:NSMakeRange(0, [line length])];
        int searchFromCharIndex = 0;
        for (NSTextCheckingResult* match in matches) {
            NSString *matchText = [line substringWithRange:[match range]];
            NSRange range = match.range;
            NSLog(@"range: %@", NSStringFromRange(range));
            NSRange charRange = [line rangeOfString:matchText options:NSCaseInsensitiveSearch range:range];
            int stackId = charRange.location / 4 + 1;
            NSString *stackName = [NSString stringWithFormat:@"%d", stackId];
            unichar crateNameChar = [line characterAtIndex:charRange.location+1];
            NSString* crateStr = [NSString stringWithFormat:@"%C", crateNameChar];
            NSMutableArray* stack = stacks[stackName];
            searchFromCharIndex = charRange.location+4;
            NSLog(@"%@ goes to %@", crateStr, stackName);
            [stack insertObject:crateStr atIndex:0];
            printStack(stackName, stack);
        }

        //handle commands
        if ([line containsString:@"move"]) {
            NSArray* cmdLineArray = [line componentsSeparatedByString:@" "];
            int amount = [(NSString*)cmdLineArray[1] intValue];
            NSString* srcStackName = (NSString*)cmdLineArray[3];
            NSMutableArray* srcStack = stacks[srcStackName];
            NSString* destStackName = (NSString*)cmdLineArray[5];
            NSMutableArray* destStack = stacks[destStackName];
            NSRange tempStackRange = NSMakeRange(srcStack.count - amount, amount);
            NSLog(@"tempStackRange: %@", NSStringFromRange(tempStackRange));;
            NSMutableArray* tempStack = [srcStack subarrayWithRange:tempStackRange];
            printStack(@"tempStack", tempStack);
            [destStack addObjectsFromArray:tempStack];
            printStack(@"destStack", destStack);
            [srcStack removeObjectsInRange:tempStackRange];
            printStack(@"srcStack", srcStack);
        }

        // debug
        NSLog(@"\t*** all stacks");
        for (int i = 1; i < 10; i++) {
            NSString* stackName = [NSString stringWithFormat:@"%d",i];
            NSMutableArray* stack = stacks[stackName];
            if (stack.count > 0) {
                printStack(stackName, stack);
            }
        }

    }



    [pool drain];
    return 0;
}