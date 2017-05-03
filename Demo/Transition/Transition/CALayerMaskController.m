//
//  CALayerMaskController.m
//  Transition
//
//  Created by Adobe on 17/5/3.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CALayerMaskController.h"

@interface CALayerMaskController ()
@property (nonatomic, strong) CALayer *imageLayer;
@property (nonatomic, strong) CALayer *maskLayer;
@property (nonatomic, strong) UIImage *imageContents;
@property (nonatomic, strong) UIImage *maskContents;
@end

@implementation CALayerMaskController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"用CALayer实现复杂遮罩效果";
    self.imageContents = [UIImage imageNamed:@"1"];
    self.maskContents = [UIImage imageNamed:@"maskLayerContents"];
    
    //图片layer
    self.imageLayer = [CALayer layer];
    self.imageLayer.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    self.imageLayer.contents = (__bridge id _Nullable)(self.imageContents.CGImage);
    [self.view.layer addSublayer:self.imageLayer];
    
    //遮罩layer
    self.maskLayer = [CALayer layer];
    self.maskLayer.frame = CGRectMake(0, 64, 200, 200);
    self.maskLayer.contents = (__bridge id _Nullable)(self.maskContents.CGImage);
    //    这个不用图片也可以 用背景颜色 例如下面这段  但是效果没图片那样好看
    //    self.maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    //    self.maskLayer.cornerRadius = 100;
    //    self.maskLayer.masksToBounds = YES;
    
    
    //    An optional layer whose alpha channel is used to mask the layer’s content.
    //    根据alpha通道 来选择遮罩的地方 黑色全通过，白色全不通过
    self.imageLayer.mask = self.maskLayer;
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(maskLayerAnimation:) userInfo:nil repeats:YES];
    
}

- (void)maskLayerAnimation:(NSTimer *)timer{
    CGFloat x = arc4random() % (375-200);
    CGFloat y = arc4random() % (667-200-64);
    self.maskLayer.frame = CGRectMake(x, y, 200, 200);
}

@end
