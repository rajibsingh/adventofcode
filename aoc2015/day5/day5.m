#import <Foundation/Foundation.h>

bool hasThreeVowels(NSString* input) {
    int vowelCount = 0;
    for (int i = 0; i < input.length; i++) {
        unichar ch = [input characterAtIndex:i];
        if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
            vowelCount++;
        }
    }
    NSLog(@"vowelCount: %d", vowelCount);
    return vowelCount > 2;
}

bool hasQualifyingBigram(NSString* input) {
    bool retVal = NO;
    for (int i = 0; i < input.length -1; i++) {
        NSRange bigramRange = NSMakeRange(i, 2);
        NSString* bigram = [input substringWithRange:bigramRange];
        // NSLog(@"bigram: %@", bigram);
        unichar char1 = [bigram characterAtIndex:0];
        unichar char2 = [bigram characterAtIndex:1];
        if (char1 == char2) {
            retVal = YES;
                NSLog(@"%@ is a matching bigram", bigram);
        }
        if ([bigram isEqualToString:@"ab"] || [bigram isEqualToString:@"cd"] || [bigram isEqualToString:@"pq"] || [bigram isEqualToString:@"xy"]) {
            NSLog(@"has a forbidden string");
            return NO;
        } 
    }
    return retVal;
}

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    int count = 0;
    for (NSString* line in lines) {
        NSLog(@"line: %@", line);
        if (hasThreeVowels(line) && hasQualifyingBigram(line)) {
            count += 1;
        } 
    }
    NSLog(@"count: %d", count);
    [pool drain];
    return 0;
}