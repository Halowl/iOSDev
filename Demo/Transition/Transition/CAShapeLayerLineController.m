//
//  CAShapeLayerLineController.m
//  Transition
//
//  Created by Adobe on 17/5/5.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAShapeLayerLineController.h"

@interface CAShapeLayerLineController ()

@property (strong,nonatomic)CAShapeLayer *shapeLayer;
@end

@implementation CAShapeLayerLineController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupShapeLayer];
    [self setupUI];
}

- (void)setupUI{
    
    CGFloat width = self.view.frame.size.width /3;
    for (int i = 0; i <= 3; i++) {
        UIButton *btn = [UIButton new];
        [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        btn.tag = i;
        btn.backgroundColor = [UIColor orangeColor];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        btn.frame = CGRectMake(i * width, 0, width - 1, 50);
        [self.view addSubview:btn];
        
    }

}


- (void)btnClick:(UIButton*)btn{
    
    switch (btn.tag) {
        case 0:
            [self animation];
            break;
            
        case 1:
            [self animation1];
            break;
            
        case 2:
             [self animation2];
            break;
        default:
            break;
    }
    
}

- (void)setupShapeLayer{
    // 创建 path
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(100, 300)];
    [path addCurveToPoint:CGPointMake(200, 300) controlPoint1:CGPointMake(300, 200) controlPoint2:CGPointMake(100, 200)];
    // 创建 shapeLayer
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc]init];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineCap = @"round";
    self.shapeLayer = shapeLayer;
    [self.view.layer addSublayer:shapeLayer];

}

- (void)animation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 3.f;
    [self.shapeLayer addAnimation:animation forKey:nil];
    
}
- (void)animation1{
    self.shapeLayer.strokeStart = 0.5;
    self.shapeLayer.strokeEnd = 0.5;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.fromValue = @.5;
    animation.toValue = @0;
    animation.duration = 3.f;
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation1.fromValue = @.5;
    animation1.toValue = @1;
    animation1.duration =  3.f;
    
    
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 1;
    [self.shapeLayer addAnimation:animation forKey:nil];
    [self.shapeLayer addAnimation:animation1 forKey:nil];
}
- (void)animation2{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    animation.fromValue = @1;
    animation.toValue = @10;
    animation.duration = 3.f;
    [self.shapeLayer addAnimation:animation forKey:nil];
}


@end
