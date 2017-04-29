//
//  MaskViewAnimationController.m
//  Transition
//
//  Created by adobe on 2017/4/29.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "MaskViewAnimationController.h"

@interface MaskViewAnimationController ()

@end

@implementation MaskViewAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    CGFloat margin = 100;
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    background.center = self.view.center;
    [self.view addSubview:background];
    
    UIImageView *upGround = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    upGround.frame = background.frame;
    [self.view addSubview:upGround];
    
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top"]];
    
    [self.view addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bottom"]];
    
    [self.view addSubview:imageView2];
    
}


@end
