#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    NSDictionary* resultTable = @{
        @"AX" : @3,
        @"AY" : @4,
        @"AZ" : @8,
        @"BX" : @1,
        @"BY" : @5,
        @"BZ" : @9,
        @"CX" : @2,
        @"CY" : @6,
        @"CZ" : @7,
    };
    NSInteger totalScore = 0;
    for (NSString* line in lines) {
        NSLog(@"%@", line);
        unichar codeArray[2] = {[line characterAtIndex:0], [line characterAtIndex:2]};
        NSString* code = [[NSString alloc] initWithCharacters:codeArray length:2];
        NSLog(@"leftHand: %lc", [line characterAtIndex:0]);
        NSLog(@"rightHand: %lc", [line characterAtIndex:2]);
        NSInteger sessionScore = [[resultTable objectForKey:code] integerValue];
        NSLog(@"sessionScore: %ld", sessionScore);
        totalScore = totalScore + sessionScore;
    }

    NSLog(@"totalScore: %ld", totalScore);

    [pool drain];
    return 0;
}