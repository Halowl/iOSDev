//
//  CALayerImageController.m
//  Transition
//
//  Created by Adobe on 17/5/3.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CALayerImageController.h"

@interface CALayerImageController ()

@property (strong,nonatomic)CALayer *imageLayer1;
@property (strong,nonatomic)CALayer *imageLayer2;
@property (strong,nonatomic)CALayer *imageLayer3;
@end

@implementation CALayerImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"用CALayer定制UIImageView淡入淡出切换图片效果";
    
    UIImage *image = [UIImage imageNamed:@"1"];
    self.imageLayer1 = [CALayer layer];
    self.imageLayer1.frame =  CGRectMake(20, 100, 150, 150);
    [self.view.layer addSublayer:self.imageLayer1];
    self.imageLayer1.contents =  (__bridge id _Nullable)(image.CGImage);
    
    
    self.imageLayer2 = [CALayer layer];
    self.imageLayer2.frame =  CGRectMake(20 + 150 + 20, 100, 150, 150);
    [self.view.layer addSublayer:self.imageLayer2];
    self.imageLayer2.contents =  (__bridge id _Nullable)(image.CGImage);
    
    
    self.imageLayer3 = [CALayer layer];
    self.imageLayer3.frame =  CGRectMake(20 , 100 + 150 + 20, 300, 300);
    [self.view.layer addSublayer:self.imageLayer3];
    self.imageLayer3.contents =  (__bridge id _Nullable)(image.CGImage);

    [UIView animateWithDuration:3.f animations:^{
        [self layerAnimation];
        [self baseAnimation];
        [self groupAnimation];
    }];
}

// 隐式动画
- (void)layerAnimation{
    UIImage *image = [UIImage imageNamed:@"2"];
    self.imageLayer1.contents =  (__bridge id _Nullable)(image.CGImage);
}

// 显示动画
- (void)baseAnimation{
    UIImage *image = [UIImage imageNamed:@"2"];
    CABasicAnimation *baseAnimation = [[CABasicAnimation alloc]init];
    
    baseAnimation.fromValue = self.view.layer.contents;
    baseAnimation.toValue = (__bridge id _Nullable)(image.CGImage);
    baseAnimation.duration = 3.f;
    self.imageLayer2.contents = (__bridge id _Nullable)(image.CGImage);
    [self.imageLayer2 addAnimation:baseAnimation forKey:nil];
}


// 组合动画
- (void)groupAnimation{
    UIImage *image = [UIImage imageNamed:@"2"];
    CABasicAnimation *contentsAnimation =  [CABasicAnimation animationWithKeyPath:@"contents"];
    
    contentsAnimation.fromValue = self.imageLayer3.contents;
    contentsAnimation.toValue = (__bridge id _Nullable)(image.CGImage);
    contentsAnimation.duration = 3.f;
    
    CABasicAnimation *boundsAnimation =  [CABasicAnimation animationWithKeyPath:@"bounds"];
    
    boundsAnimation.fromValue = [NSValue valueWithCGRect:self.imageLayer3.bounds]
    ;
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(20, 100 + 150 + 20, 150, 150)];
    boundsAnimation.duration = 3.f;
    

    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 3.f;
    group.animations =  @[contentsAnimation,boundsAnimation];
    
    self.imageLayer3.bounds = CGRectMake(20, 100 + 150 + 20, 150, 150);
    self.imageLayer3.contents = (__bridge id _Nullable)(image.CGImage);
    [self.imageLayer3 addAnimation:group forKey:nil];
  
}
@end
