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

@interface Santa:NSObject {
    NSUInteger x;
    NSUInteger y;
}
@property(nonatomic, readwrite) NSUInteger x;
@property(nonatomic, readwrite) NSUInteger y;
-(void) move:(unichar) command;
-(GridAddress*) getLocation;
@end

@implementation Santa 
@synthesize x, y;
-(id)init {
    self = [super init];
    x = 0.0;
    y = 0.0;
    return self;
}

-(void) move:(unichar)command {
    switch(command) {
        case '^':
            self.y += 1;
            break;
        case 'v':
            self.y -= 1;
            break;
        case '<':
            self.x -= 1;
            break;
        case '>':
            self.x += 1;
            break;
    }
}
-(GridAddress*) getLocation {
    GridAddress *address = [[GridAddress alloc] init];
    address.x = self.x;
    address.y = self.y;
    return address;
}
@end


int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSMutableSet<GridAddress *> *addresses = [NSMutableSet setWithCapacity:10];
    Santa *santa = [[Santa alloc] init];
    Santa *roboSanta = [[Santa alloc] init];
    Santa *currSanta;
    for (NSInteger i = 0; i < fileContent.length ; i++) {
        if (i % 2 == 0)
            currSanta = santa;
        else
            currSanta = roboSanta;
            
        unichar direction = [fileContent characterAtIndex:i];
        [currSanta move: direction];
        GridAddress *address = [currSanta getLocation];
        [addresses addObject:address];
     }
    printf("number of addresses: %lu", [addresses count]);
    [pool drain];
    return 0;
}