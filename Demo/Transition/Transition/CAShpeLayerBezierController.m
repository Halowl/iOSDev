//
//  CAShpeLayerBezierController.m
//  Transition
//
//  Created by Adobe on 17/5/4.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAShpeLayerBezierController.h"

@interface CAShpeLayerBezierController ()

@end

@implementation CAShpeLayerBezierController

/*
 CAShapeLayer需要一个形状才能生效
 贝塞尔曲线可以创建基于矢量的路径
 贝塞尔曲线给CAShapeLayer提供路径,CAShapeLayer在提供的路径中进行渲染,路径会闭环,所以路径绘制出了Shape
 用于CAShapeLayer的贝塞尔曲线作为Path,其中Path是一个首尾直接的闭环曲线,即使该贝塞尔曲线不是一个闭环的曲线
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self path:CGRectMake(0, 0, 200, 100)];
    
    [self path:CGRectMake(120, 0, 100, 100)];
    
    [self rectPath:CGRectMake(50, 100, 200, 100)];

    CGSize finalSize = CGSizeMake(CGRectGetWidth(self.view.frame), 600);
    CGFloat layerHeight = finalSize.height * 0.2;
    CAShapeLayer *bottomCurveLayer = [[CAShapeLayer alloc]init];
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(0, finalSize.height - layerHeight)];
    [path addLineToPoint:CGPointMake(0, finalSize.height - 1)];
    [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - 1)];
    [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - layerHeight)];
    [path addQuadCurveToPoint:CGPointMake(0, finalSize.height - layerHeight) controlPoint:CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight) - 40)];
    
    
    bottomCurveLayer.path = path.CGPath;
    bottomCurveLayer.fillColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:bottomCurveLayer];
    
}

// 矩形
- (void)rectPath:(CGRect)frame{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:frame];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.frame = frame;
    shapeLayer.lineWidth = 1;
    shapeLayer.lineCap = @"square";
    shapeLayer.lineDashPattern = @[@5,@5];
    [self.view.layer addSublayer:shapeLayer];
}

// 圆
- (void)path:(CGRect)frame{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:frame];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor orangeColor].CGColor;
    shapeLayer.frame = frame;
//    shapeLayer.position = self.view.center;
    [self.view.layer addSublayer:shapeLayer];

}

@end
