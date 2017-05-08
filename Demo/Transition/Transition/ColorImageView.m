
//
//  ColorImageView.m
//  Transition
//
//  Created by Adobe on 17/5/8.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "ColorImageView.h"

@interface ColorImageView ()
@property (strong,nonatomic)CAGradientLayer *gradientLayer;
@end
@implementation ColorImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.frame = frame;
        [self.layer addSublayer:self.gradientLayer];
    }
    return self;
}

@synthesize color = _color;
- (void)setColor:(UIColor *)color{
    _color = color;
    self.gradientLayer.colors = @[
                                  (__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)color.CGColor
                                  ];
}

- (UIColor *)color{
    return _color;
}

@synthesize location = _location;

- (void)setLocation:(NSArray*)location{
    _location =  location;
    self.gradientLayer.locations = location;
}

- (NSArray*)location{
    return  _location;
}

@synthesize startPoint = _startPoint;
- (CGPoint)startPoint{
    return _startPoint;
}

- (void)setStartPoint:(CGPoint)startPoint{
    _startPoint = startPoint;
    self.gradientLayer.startPoint = startPoint;
}

@synthesize endPoint = _endPoint;
- (void)setEndPoint:(CGPoint)endPoint{
    _endPoint = endPoint;
    self.gradientLayer.endPoint = endPoint;
}

- (CGPoint)endPoint{
    return _endPoint;
}


@end
