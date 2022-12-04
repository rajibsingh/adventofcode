#import <Foundation/Foundation.h>

@interface Sub:NSObject {
    NSInteger x;
    NSInteger y;
    NSMutableArray *valArray;
}
-(int)calc;
-(void)move:(NSString*) direction :(NSInteger) distance;
@property(nonatomic, readwrite) NSInteger x;
@property(nonatomic, readwrite) NSInteger y;
@end

@implementation Sub 
@synthesize x, y;
-(id)init {
    self = [super init];
    valArray = [[NSMutableArray alloc] init];
    return self;
}

-(int)calc {
    return x * y;
}
-(void)move:(NSString*) direction :(NSInteger) distance {
    if ([direction isEqualToString:@"forward"]) {
        x = x + distance;
    } else if ([direction isEqualToString:@"up"]) {
        y = y - distance;
    } else if ([direction isEqualToString:@"down"]) {
        y = y + distance;
    }
    return;
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