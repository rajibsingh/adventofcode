#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:filePath
                            encoding:NSUTF8StringEncoding error:nil];
    NSUInteger length = [fileContent length];
    int counter = 0;
    for (NSInteger i = 0; i < fileContent.length ; i++) {
        unichar x = [fileContent characterAtIndex:i];
        if (x == '(')
            counter++;
        else if (x == ')')
            counter--;
        if (counter == -1) {
            NSLog(@"%ld", i+1);
            break;
        }
    }
    [pool drain];
    return 0;
}