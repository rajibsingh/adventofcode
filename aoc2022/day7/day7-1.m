#import <Foundation/Foundation.h>

@interface Tree:NSObject
    @property (retain, nonatomic)NSString* name;
    @property (retain, nonatomic)Tree* parent;
    @property (retain, nonatomic)NSMutableDictionary* files;
    @property (retain, nonatomic)NSArray* children;

    +(void)sampleMethod:(NSString*)greetname greeting:(NSString*)greeting;
    -(Tree*)init:(NSString*)name;
    -(void)pokeObject;
    -(void)setParent:(Tree*)parent;

@end

@implementation Tree
    +(void)sampleMethod:(NSString*)greetname greeting:(NSString*)greeting {
       NSLog(@"%@ %@\n", greetname, greeting);
       NSLog(@"%@n", greeting);
    }

    -(Tree*)init:(NSString* ) name {
        if (self = [super init]) {
            self.name = name;
            self.files = [[NSMutableDictionary alloc]initWithCapacity:1];
            self.children = [[NSMutableArray alloc]initWithCapacity:1];
        }
        return self;
    }

    -(void)pokeObject {
        NSLog(@"poking object %@", self.name);
    }

    -(void)setParent:(Tree*)parent {
        self.parent = parent;
    }
@end

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                                                      encoding:NSUTF8StringEncoding error:nil];
    NSArray *commandAndOutputLines = [fileContent componentsSeparatedByString:(NSString *) @"$"];
    Tree* rootNode = [[Tree alloc] init:@"/"];
//    [Tree sampleMethod:@"raj" greeting:@"merry x-mas"];
//    [rootNode pokeObject];
    Tree* currentLocation = nil;
    //parse input
    for (NSString *line in commandAndOutputLines) {
        NSLog(@"*** line: %@", line);
        NSArray* commandAndOutputNewLines = [line componentsSeparatedByString:@"\n"];
        for (NSString* commandAndOutput in commandAndOutputNewLines) {
            NSArray *commandLineAndOutputTokens = [commandAndOutput componentsSeparatedByString:@" "];
            for (NSString* commandLineOutputToken in commandLineAndOutputTokens) {
                if ([commandLineOutputToken length] == 0) {
                    continue;
                }
                NSLog(@"commandLineOutputToken: %@", commandLineOutputToken);
            }
//            NSString *command = commandLineAndOutputTokens[1];
//            if ([command isEqual:@"cd"]) {
//                NSLog(@"cd command received");
//                NSString *location = commandLineAndOutputTokens[1];
//                if ([location isEqual:@"/"]) {
//                    currentLocation = rootNode;
//                }
//            }
        }
    }

    [pool drain];
    return 0;

}