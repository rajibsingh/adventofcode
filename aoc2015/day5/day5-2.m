#import <Foundation/Foundation.h>

bool hasQualifyingBigram(NSString* input) {
    for (int i = 0; i < input.length - 3; i += 1) {
        NSRange srcBigramRange = NSMakeRange(i, 2);
        NSString* srcBigram = [input substringWithRange:srcBigramRange];
        // NSLog(@"\t srcBigram: %@", srcBigram);
        for (int j = i + 2; j < input.length - 1; j++) {
            NSRange targetBigramRange = NSMakeRange(j, 2);
            NSString* targetBigram = [input substringWithRange:targetBigramRange];
            // NSLog(@"\t\t targetBigram: %@", targetBigram);
            if ([srcBigram characterAtIndex:0] == [targetBigram characterAtIndex:0] 
                    && [srcBigram characterAtIndex:1] == [targetBigram characterAtIndex:1]) {
                // NSLog(@"target bigram match!");
                return YES;
            }
        }
    }
    // NSLog(@"target bigram false");
    return NO;
}

bool hasQualifyingTrigram(NSString* input) {
    bool retVal = NO;
    for (int i = 0; i < input.length - 2; i++) {
        NSRange trigramRange = NSMakeRange(i, 3);
        NSString* trigram = [input substringWithRange:trigramRange];
        unichar char1 = [trigram characterAtIndex:0];
        unichar char2 = [trigram characterAtIndex:1];
        unichar char3 = [trigram characterAtIndex:2];
        if (char1 == char3) {
            // NSLog(@"trigram %@ True", trigram);
            return YES;
        }
    }
    // NSLog(@"trigram false");
    return NO;
}

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    int count = 0;
    for (NSString* line in lines) {
        // NSLog(@"*** line: %@", line);
        if (hasQualifyingTrigram(line) && hasQualifyingBigram(line)) {
            count += 1;
        }
    }
    NSLog(@"count: %d", count);
    [pool drain];
    return 0;
}