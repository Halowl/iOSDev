//
//  CAGrdientLayerController.m
//  Transition
//
//  Created by Adobe on 17/5/8.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAGrdientLayerController.h"

@interface CAGrdientLayerController ()

@property (strong,nonatomic)CAGradientLayer *gradientLayer;
@end

@implementation CAGrdientLayerController

/*
CAGradientLayer是用于处理渐变色的层结构
CAGradientLayer的渐变色可以做隐式动画
大部分情况下,CAGradientLayer都是与CAShapeLayer配合使用
CAGraientLayer可以用作png遮罩效果
*/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLayer];
}


- (void)addLayer{
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = CGRectMake(0, 0, 200, 200);
    self.gradientLayer.position =  self.view.center;
    self.gradientLayer.borderWidth = 1;
    [self.view.layer addSublayer:self.gradientLayer];
    
    
    self.gradientLayer.colors = @[
                                  (__bridge id)[UIColor redColor].CGColor,
                                  (__bridge id)[UIColor greenColor].CGColor,
                                  (__bridge id)[UIColor blueColor].CGColor
                                  ];
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1,0);
    
    self.gradientLayer.locations =  @[
                                      @.25,@.5,@.75
                                      ];
    
    [self performSelector:@selector(animationSel) withObject:nil afterDelay:3.f];
    
}

- (void)animationSel{
    
    self.gradientLayer.locations =  @[
                                      @.01,@.5,@.99
                                      ];
}

@end
