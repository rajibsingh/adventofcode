#import <Foundation/Foundation.h>

@interface Report:NSObject {
    NSMutableArray *valArray;
}
-(int)calc;
-(void)move:(NSString*) direction :(NSInteger) distance;
@end

@implementation Sub 
-(id)init {
    self = [super init];
    valArray = [[NSMutableArray alloc] init];
    return self;
}

@end

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:filePath
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    Sub *sub= [[Sub alloc] init];
    for (NSString* line in lines) {
        // NSLog(@"%@", line);
        NSArray* commandComponents = [line componentsSeparatedByString:@" "];
        NSString* direction = commandComponents[0];
        NSInteger distance = [commandComponents[1] integerValue];
        [sub move:direction:distance];
        // NSNumber* intVal = [NSNumber numberWithInt:[line intValue]];
        // NSLog(@"sum:%d, prevSum:%d", sum, prevSum);
    }
    NSLog(@"calc: %d", [sub calc]);
    [pool drain];
    return 0;
}