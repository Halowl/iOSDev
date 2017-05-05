//
//  CAShapeLayerDottedlineController.m
//  Transition
//
//  Created by Adobe on 17/5/5.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAShapeLayerDottedlineController.h"

@interface CAShapeLayerDottedlineController ()

@end

@implementation CAShapeLayerDottedlineController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 100)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 1;
    shapeLayer.lineCap = @"square";
    shapeLayer.lineDashPattern = @[@5,@5];
    [self.view.layer addSublayer:shapeLayer];
}



@end
