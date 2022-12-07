#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                                                      encoding:NSUTF8StringEncoding error:nil];
    NSArray *lines = [fileContent componentsSeparatedByString:(NSString *) @"\n"];
    NSError* error = nil;
    for (NSString *line in lines) {
        NSLog(@"line: %@", line);
//        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"(?:www\\.)?((?!-)[a-zA-Z0-9-]{2,63}(?<!-))\\.?((?:[a-zA-Z0-9]{2,})?(?:\\.[a-zA-Z0-9]{2,})?)" options:0 error:&error];
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"\\[.\\]" options:0 error:&error];
        NSArray* matches = [regex matchesInString:line options:0 range:NSMakeRange(0, [line length])];
        for ( NSTextCheckingResult* match in matches )
        {
            NSString* matchText = [line substringWithRange:[match range]];
            NSLog(@"*** match: %@", matchText);
        }
//
//        if ([line characterAtIndex:0] == L'm') {
//            NSLog(@"** line %@", line);
//        }
    }

    [pool drain];
    return 0;
}