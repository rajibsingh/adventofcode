#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:filePath
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    int prevIntVal = 0;
    int counter = 0;
    for (NSString* line in lines) {
        int intVal = [line intValue];
        if (prevIntVal != 0) {
            if (intVal > prevIntVal) {
                counter++;
            }
        }
        prevIntVal = intVal;
    }
    NSLog(@"counter: %d", counter);
    [pool drain];
    return 0;
}