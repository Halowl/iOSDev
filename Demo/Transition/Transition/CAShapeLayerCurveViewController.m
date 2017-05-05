//
//  CurveViewController.m
//  Transition
//
//  Created by Adobe on 17/5/5.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAShapeLayerCurveViewController.h"

@interface CAShapeLayerCurveViewController ()

@end

@implementation CAShapeLayerCurveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


- (void)setupUI{
    
    CGPoint startPoint =  CGPointMake(50, 300);
    CGPoint endPoint = CGPointMake(300, 300);
    CGPoint controlPoint = CGPointMake(170, 200);
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5);
    shapeLayer.backgroundColor = [UIColor orangeColor].CGColor;
    
    CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5);
    shapeLayer1.backgroundColor = [UIColor orangeColor].CGColor;
    
    CAShapeLayer *shapeLayer2 = [CAShapeLayer layer];
    shapeLayer2.frame = CGRectMake(controlPoint.x, controlPoint.y, 5, 5);
    shapeLayer2.backgroundColor = [UIColor orangeColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    [path  moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    [self.view.layer addSublayer:shapeLayer];
    [self.view.layer addSublayer:shapeLayer1];
    [self.view.layer addSublayer:shapeLayer2];
    
}

@end
