//
//  HypnosisView.m
//  Chapter4
//
//  Created by Suparn Gupta on 2/11/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView()
@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation HypnosisView

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void) drawRect:(CGRect)rect{
    CGRect bounds = self.bounds;
    CGPoint center ;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float radius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    UIBezierPath *path = [[UIBezierPath alloc] init];
    for(int i = 0; i <= radius; i += 20){
        [path moveToPoint:CGPointMake(center.x + i, center.y)];
        [path addArcWithCenter:center radius:i startAngle:0.0 endAngle:2 * M_PI clockwise:YES];
    }
    
    path.lineWidth = 10.0;
    [self.circleColor setStroke];
    [path stroke];
    
    
    
    
    
    
    CGRect logoContainer = CGRectMake(50, 50, bounds.size.width - 100, bounds.size.height - 100);
    UIView *logoView = [[UIView alloc] initWithFrame:logoContainer];
    [self addSubview:logoView];
    
    CGRect logoSubContainer = CGRectMake(0, 0, logoContainer.size.width, logoContainer.size.height);
    UIView *logoSubView = [[UIView alloc] initWithFrame:logoSubContainer];
    [logoView addSubview:logoSubView];
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:logoImage];
    imageView.frame = logoSubView.bounds;
    [logoSubView addSubview:imageView];
//    [logoImage drawInRect:logoContainer];
}

- (void) touchesBegan:(NSSet *)touches
            withEvent: (UIEvent *)event{
    NSLog(@"View Touched");
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor * randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:0.4];
    self.circleColor = randomColor;
    [self setNeedsDisplay];
}

@end
