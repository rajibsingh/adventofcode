#import <Foundation/Foundation.h>

@interface Window:NSObject {
    NSMutableArray *valArray;
}
-(int)sum;
-(void)add:(NSNumber*) intVal;
@end

@implementation Window

-(id)init {
    self = [super init];
    valArray = [[NSMutableArray alloc] init];
    return self;
}

-(int)sum {
    int sum = 0;
    if ([valArray count] < 3) {
        return 0;
    }
    for (int i = 0; i < [valArray count]; i++) {
        NSNumber* number = [valArray objectAtIndex:i];
        sum = sum + [number intValue];
    }
    return sum;
}
-(void)add:(NSNumber*)intVal {
    // NSLog(@"*** %@", intVal);
    [valArray addObject:intVal];
    if ([valArray count] > 3) {
        [valArray removeObjectAtIndex:0];
    }
    // NSLog(@"(%@) %d", [valArray componentsJoinedByString:@","], [self sum]); 
}
@end

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:filePath
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    int counter = 0;
    int prevSum = 0;
    Window *window = [[Window alloc] init];
    for (NSString* line in lines) {
        NSNumber* intVal = [NSNumber numberWithInt:[line intValue]];
        [window add:intVal];
        int sum = [window sum];
        NSLog(@"sum:%d, prevSum:%d", sum, prevSum);
        if (prevSum != 0 && sum > prevSum) {
            counter++;
            NSLog(@"increased! counter: %d", counter);
        } else {
            NSLog(@"%d", counter);
        }
        prevSum = sum;
    }
    NSLog(@"counter: %d", counter);
    [pool drain];
    return 0;
}