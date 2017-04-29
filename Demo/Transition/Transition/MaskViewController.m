//
//  MaskViewController.m
//  Transition
//
//  Created by adobe on 2017/4/29.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "MaskViewController.h"

@interface MaskViewController ()
@property (strong,nonatomic)UIImageView *imageView;
@property (strong,nonatomic)UIImageView *maskView;
@property (strong,nonatomic)UIImageView *addImageView;
@end

@implementation MaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self mask];
}

- (void)mask{
    CGFloat margin = 100;
    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mask"]];
    self.imageView.frame = CGRectMake(margin, margin * 0.5, margin, margin);
    [self.view addSubview:self.imageView];
    
    self.maskView = [[UIImageView alloc]initWithFrame:CGRectMake(margin, CGRectGetMaxY(self.imageView.frame) + 20, margin, margin)];
    self.maskView.image = [UIImage imageNamed:@"top"];
    [self.view addSubview:self.maskView];
    
    self.addImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mask"]];
    self.addImageView.frame = CGRectMake(margin, CGRectGetMaxY(self.maskView.frame) + 20, margin, margin);
    [self.view addSubview:self.addImageView];
    
    UIImageView *mas = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, margin, margin)];
    mas.image = [UIImage imageNamed:@"top"];
    self.addImageView.maskView = mas;
}


@end
