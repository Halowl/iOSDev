//
//  CircleView.m
//  Transition
//
//  Created by Adobe on 17/5/4.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CircleView.h"

@interface CircleView ()
@property (strong,nonatomic)CAShapeLayer *shapeLayer;
@end

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.shapeLayer = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:frame];
        self.shapeLayer.path = path.CGPath;
        self.shapeLayer.lineWidth = self.lineWidth;
        self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
        self.shapeLayer.strokeColor = self.strokeColor.CGColor;
        self.shapeLayer.strokeEnd =  0;
        [self.layer addSublayer:self.shapeLayer];
        
    }
    return self;
}

@synthesize lineWidth = _lineWidth;
- (void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    self.shapeLayer.lineWidth = self.lineWidth;
}

- (CGFloat)lineWidth{
    return _lineWidth;
}


@synthesize strokeColor = _strokeColor;
- (void)setStrokeColor:(UIColor *)strokeColor{
    _strokeColor = strokeColor;
    self.shapeLayer.strokeColor = strokeColor.CGColor;
}
- (UIColor *)strokeColor{
    return _strokeColor;
}

@synthesize startValue = _startValue;
- (void)setStartValue:(CGFloat)startValue{
    _startValue =  startValue;
    self.shapeLayer.strokeEnd = startValue;
}

- (CGFloat)startValue{
    
    return _startValue;
}

@end
