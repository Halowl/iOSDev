//
//  CAGradientLayerColorDifferenceController.m
//  Transition
//
//  Created by Adobe on 17/5/8.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAGradientLayerColorDifferenceController.h"

@interface CAGradientLayerColorDifferenceController ()

@property (strong,nonatomic)NSTimer *timer;
@property (strong,nonatomic)CAGradientLayer *gradientLayer;
@end

@implementation CAGradientLayerColorDifferenceController


/**
确定渐变色渐变方向
设定两种颜色,其中一种是透明色,另外一种是自定义颜色
设定好locaton颜色分割点值
CAGradientLayer的颜色分割点是以0到1的比例来计算的
*/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self layer];
}

- (void)layer{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.center = self.view.center;
    imageView.image = [UIImage imageNamed:@"mask"];
    [self.view addSubview:imageView];

    self.gradientLayer = [CAGradientLayer  layer];
    self.gradientLayer.frame = imageView.bounds;
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    self.gradientLayer.colors = @[
                                  (__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)[UIColor redColor].CGColor
                                  ];
    self.gradientLayer.locations = @[@.5,@1];
    [imageView.layer addSublayer:self.gradientLayer];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(animationSEL) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

- (void)animationSEL{
    
    self.gradientLayer.colors = @[
                                  (__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)[UIColor colorWithRed:arc4random() % 255 /255.f
                                             green:arc4random() % 255 /255.f
                                              blue:arc4random() % 255 /255.f
                                             alpha:1].CGColor
                                  ];
    
    self.gradientLayer.locations = @[
                                     @(arc4random() % 10 / 10.f),@1
                                     ];
    
    
}
@end
