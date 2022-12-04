#import <Foundation/Foundation.h>

@interface GridAddress:NSObject {
    NSUInteger x;
    NSUInteger y;
}

@property(nonatomic, readwrite) NSUInteger x;
@property(nonatomic, readwrite) NSUInteger y;
@end

@implementation GridAddress

@synthesize x, y;

-(id)init {
    self = [super init];
    x = 0.0;
    y = 0.0;
    return self;
}

-(BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    else if (!other || ![other isKindOfClass:[self class]]) {
        return NO;
    }
    if ([other isKindOfClass:[self class]]) {
        GridAddress * otherGA = (GridAddress *)other;
        if (self.x == otherGA.x && self.y == otherGA.y) {
            return YES;
        }
        else 
            return NO;
    }
    return NO;
}

- (NSUInteger)hash {
    NSUInteger prime = 31;
    NSUInteger result = 1;
    result = prime * result + self.x;
    result = prime * result + self.y;
    // NSLog(@"hash: %lu", result);
    return result;
}

@end

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSMutableSet<GridAddress*> *addresses = [NSMutableSet setWithCapacity:10];
    int x = 0;
    int y = 0;
    for (NSInteger i = 0; i < fileContent.length ; i++) {
        unichar idx = [fileContent characterAtIndex:i];
        // NSLog(@"%c",idx);
        switch(idx){
            case '^':
                y += 1;
                break;
            case 'v':
                y -= 1;
                break;
            case '<':
                x -= 1;
                break;
            case '>':
                x += 1;
                break;
        }
        // NSLog(@"%d, %d", x, y);
        GridAddress *address = [[GridAddress alloc] init];
        address.x = x;
        address.y = y;
        [addresses addObject:address];
     }
    printf("number of addresses: %lu", [addresses count]);
    [pool drain];
    return 0;
}