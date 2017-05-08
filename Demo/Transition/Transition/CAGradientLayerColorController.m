//
//  CAGradientLayerColorController.m
//  Transition
//
//  Created by Adobe on 17/5/8.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAGradientLayerColorController.h"
#import "ColorImageView.h"
@interface CAGradientLayerColorController ()
@property (strong,nonatomic)NSTimer *timer;
@property (strong,nonatomic)ColorImageView *imageView;
@end

@implementation CAGradientLayerColorController


- (void)viewDidLoad {
    [super viewDidLoad];

    ColorImageView *imageView = [[ColorImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.center = self.view.center;
    imageView.image = [UIImage imageNamed:@"mask"];
    self.imageView = imageView;
    

    [self.view addSubview:imageView];
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(animationSEL) userInfo:nil repeats:YES];
    
}

- (void)animationSEL{
    _imageView.startPoint = CGPointMake(0, 0);
    _imageView.endPoint = CGPointMake(0,1);
    _imageView.color = [UIColor colorWithRed:arc4random() % 255 / 255.f
                                       green:arc4random() % 255 / 255.f
                                        blue:arc4random() % 255 / 255.f
                                       alpha:1];
    _imageView.location = @[@(arc4random() % 10 / 10.f),@1];
    
}

@end
