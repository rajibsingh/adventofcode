#import <Foundation/Foundation.h>
#include <math.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    int totalRibbon = 0;
    for (id line in lines) {
        NSArray* components = [line componentsSeparatedByString:(NSString *)@"x"];
        int length = [components[0] intValue];
        int width = [components[1] intValue];
        int height = [components[2] intValue];
        int smallest = 2 * length + 2 * width; 
        if (2 * width + 2 * height < smallest)
            smallest = 2 * width + 2 * height;
        if (2 * length + 2 * height < smallest)
            smallest = 2 * length + 2 * height;
        // NSLog(@"line: %@", line);
        NSLog(@"smallest: %d", smallest);
        int ribbon = smallest + length * width * height;
        totalRibbon = totalRibbon + ribbon;
    }
    NSLog(@"totalRibbon: %d", totalRibbon);


    [pool drain];
    return 0;
}