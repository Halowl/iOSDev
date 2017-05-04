//
//  CAShapeLayerStrokeController.m
//  Transition
//
//  Created by Adobe on 17/5/4.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAShapeLayerStrokeController.h"

@interface CAShapeLayerStrokeController ()
@property (strong,nonatomic)CAShapeLayer *shapeLayer;
@property (strong,nonatomic)NSTimer *timer;
@end

@implementation CAShapeLayerStrokeController


/*
 StrokeStart与StrokeEnd动画
 1.将ShapeLayer的fillColor设置成透明背景
 2.设置线条的宽度(lineWidth)的值
 3.设置线条的颜色
 4.将StrokeStart值设定为0,然后让StrokeEnd的值变化触发隐式动画
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd = 0;
    shapeLayer.lineWidth = 2;
    self.shapeLayer = shapeLayer;
    [self.view.layer addSublayer:shapeLayer];
    
    self.timer  = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];

}

- (void)timerAction{
    CGFloat start = arc4random() % 100 / 100.f ;
    CGFloat end = arc4random() % 100 / 100.f ;
 
    self.shapeLayer.strokeStart = start < end ? start :end;
    self.shapeLayer.strokeEnd = start > end ? start :end;

}


@end
