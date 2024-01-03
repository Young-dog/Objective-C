#import <Foundation/Foundation.h>

@interface Figure : NSObject

- (float)area;
- (float)perimeter;
- (void)printInfo;

@end

@implementation Figure

- (float)area {
    return 0;
}

- (float)perimeter {
    return 0;
}

- (void)printInfo {
    NSLog(@"Figure");
}

@end

@interface Rectangle : Figure

@property (nonatomic, assign) float width;
@property (nonatomic, assign) float height;

- (instancetype)initWithWidth:(float)width height:(float)height;

@end

@implementation Rectangle

- (instancetype)initWithWidth:(float)width height:(float)height {
    self = [super init];
    if (self) {
        self.width = width;
        self.height = height;
    }
    return self;
}

- (float)area {
    return self.width * self.height;
}

- (float)perimeter {
    return 2 * (self.width + self.height);
}

- (void)printInfo {
    NSLog(@"Rectangle: width=%.2f, height=%.2f, area=%.2f, perimeter=%.2f", self.width, self.height, [self area], [self perimeter]);
}

@end

@interface Circle : Figure

@property (nonatomic, assign) float radius;

- (instancetype)initWithRadius:(float)radius;

@end

@implementation Circle

- (instancetype)initWithRadius:(float)radius {
    self = [super init];
    if (self) {
        self.radius = radius;
    }
    return self;
}

- (float)area {
    return M_PI * pow(self.radius, 2);
}

- (float)perimeter {
    return 2 * M_PI * self.radius;
}

- (void)printInfo {
    NSLog(@"Circle: radius=%.2f, area=%.2f, perimeter=%.2f", self.radius, [self area], [self perimeter]);
}

@end

@interface Triangle : Figure

@property (nonatomic, assign) float side1;
@property (nonatomic, assign) float side2;
@property (nonatomic, assign) float side3;

- (instancetype)initWithSide1:(float)side1 side2:(float)side2 side3:(float)side3;

@end

@implementation Triangle

- (instancetype)initWithSide1:(float)side1 side2:(float)side2 side3:(float)side3 {
    self = [super init];
    if (self) {
        self.side1 = side1;
        self.side2 = side2;
        self.side3 = side3;
    }
    return self;
}

- (float)area {
    float p = ([self perimeter] / 2);
    return sqrt(p * (p - self.side1) * (p - self.side2) * (p - self.side3));
}

- (float)perimeter {
    return self.side1 + self.side2 + self.side3;
}

- (void)printInfo {
    NSLog(@"Triangle: side1=%.2f, side2=%.2f, side3=%.2f, area=%.2f, perimeter=%.2f", self.side1, self.side2, self.side3, [self area], [self perimeter]);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *figures = @[[[Rectangle alloc] initWithWidth:5 height:10],
                             [[Circle alloc] initWithRadius:3],
                             [[Triangle alloc] initWithSide1:3 side2:4 side3:5]];
        
        for (Figure *figure in figures) {
            [figure printInfo];
        }
    }
    return 0;
}
