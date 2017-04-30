//
//  CAGradientLayerController.m
//  Transition
//
//  Created by adobe on 2017/4/30.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAGradientLayerController.h"

@interface CAGradientLayerController ()

@end

@implementation CAGradientLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor whiteColor];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    imageView.image =    [UIImage imageNamed:@"mask"];
    [self.view addSubview:imageView];
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = imageView.bounds;
    layer.colors= @[
                   (id) [UIColor clearColor].CGColor,
                    (id) [UIColor orangeColor].CGColor,
                   (id)  [UIColor clearColor].CGColor
                    ];
    layer.startPoint = CGPointMake(0,0);
    layer.endPoint  = CGPointMake(1, 0);
    layer.locations = @[@0.25,@0.5,@0.75];

    UIView *contentView = [[UIView alloc]initWithFrame:imageView.bounds];
    [contentView.layer  addSublayer:layer];
    imageView.maskView = contentView;
    
    [self animation];
}

- (void)animation{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(-100, 400, 200, 200)];
    imageView.image =    [UIImage imageNamed:@"mask"];
    [self.view addSubview:imageView];
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = imageView.bounds;
    layer.colors= @[
                    (id) [UIColor clearColor].CGColor,
                    (id) [UIColor orangeColor].CGColor,
                    (id)  [UIColor clearColor].CGColor
                    ];
    layer.startPoint = CGPointMake(0,0);
    layer.endPoint  = CGPointMake(1, 1);
    layer.locations = @[@0.25,@0.5,@0.75,@1];
    
    UIView *contentView = [[UIView alloc]initWithFrame:imageView.bounds];
    [contentView.layer  addSublayer:layer];
    imageView.maskView = contentView;
    
    
    [UIView animateWithDuration:2.f animations:^{
        CGRect frame = imageView.frame;
        frame.origin.x += 300;
        imageView.frame = frame;
        
        
    }];
}

@end
