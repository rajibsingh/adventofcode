#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

//blindly cut and pasted the MD5 hasher from https://stackoverflow.com/a/2018626/1922101
@interface NSString (MD5)
- (NSString *)MD5String;
@end

@implementation NSString (MD5)
- (NSString *)MD5String {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
        @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
        result[0], result[1], result[2], result[3], 
        result[4], result[5], result[6], result[7],
        result[8], result[9], result[10], result[11],
        result[12], result[13], result[14], result[15]
    ];  
}

@end
int main(int argc, char *argv[]) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *key = @"yzbqklnj";
    for(unsigned long int counter = 0; counter < 10000000; counter++) {
        NSString *counterString = [NSString stringWithFormat:@"%d",counter];
        NSString *hashinput = [key stringByAppendingString:counterString]; 
        NSString *hash = [hashinput MD5String];
        NSString *firstSix = [hash substringToIndex:6];
        // NSLog(@"%@ %@ %@", hashinput, hash, firstSix);
        if ([firstSix isEqualToString: @"000000"]) {
            NSLog(@"%@ %@ %@", hashinput, hash, firstSix);
            break;
        }
    }
    [pool drain];
    return 0;
}