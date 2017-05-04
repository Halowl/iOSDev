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
    
    [self path:CGRectMake(0, 50, 100, 100)];
    
    [self rectPath:CGRectMake(0, 0, 200, 100)];

    
    
}

// 矩形
- (void)rectPath:(CGRect)frame{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:frame];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor orangeColor].CGColor;
    shapeLayer.frame = frame;
        shapeLayer.position = self.view.center;
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
