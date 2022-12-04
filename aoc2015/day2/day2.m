#import <Foundation/Foundation.h>

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    int totalSqFt = 0;
    for (id line in lines) {
        NSArray* components = [line componentsSeparatedByString:(NSString *)@"x"];
        int length = [components[0] intValue];
        int width = [components[1] intValue];
        int height = [components[2] intValue];
        int smallest = length * width; 
        if (width * height < smallest)
            smallest = width * height;
        if (length * height < smallest)
            smallest = length * height;
        NSLog(@"line: %@", line);
        NSLog(@"smallest: %d", smallest);
        int area = 2 * length * width + 2 * width * height + 2 * length * height + smallest;
        totalSqFt = totalSqFt + area;
    }
    NSLog(@"totalSqFt: %d", totalSqFt);

    [pool drain];
    return 0;
}