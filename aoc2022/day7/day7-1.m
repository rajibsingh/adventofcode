#import <Foundation/Foundation.h>

@interface Tree:NSObject
    @property (retain, nonatomic)NSString* name;
    +(void)sampleMethod:(NSString*)greetname greeting:(NSString*)greeting;
    -(Tree*)init:(NSString*)name;
    -(void)pokeObject;
@end

@implementation Tree
    +(void)sampleMethod:(NSString*)greetname greeting:(NSString*)greeting {
       NSLog(@"%@ %@\n", greetname, greeting);
       NSLog(@"%@n", greeting);
    }

    -(Tree*)init:(NSString* ) name {
        if (self = [super init]) {
            self.name = name;
        }
        return self;
    }

    -(void)pokeObject {
        NSLog(@"poking object %@", self.name);
    }
@end

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                                                      encoding:NSUTF8StringEncoding error:nil];
    NSArray *lines = [fileContent componentsSeparatedByString:(NSString *) @"\n"];
    Tree* rootNode = [[Tree alloc] init:@"/"];
    [Tree sampleMethod:@"raj" greeting:@"merry x-mas"];
    [rootNode pokeObject];
    Tree* currentLocation = nil;
    //parse input
    for (NSString *line in lines) {
        NSLog(@"\n*** line: %@", line);
        NSArray* commandLineTokens = [line componentsSeparatedByString:@" "];
        NSLog(@"%@", commandLineTokens);
        NSString* command = commandLineTokens[0];
        if ([command isEqual:@"cd"]) {
            NSLog(@"cd command received");
            NSString* location = commandLineTokens[1];
            if ([location isEqual:@"/"]) {
                currentLocation = rootNode;
            }
        }
    }

    [pool drain];
    return 0;

}