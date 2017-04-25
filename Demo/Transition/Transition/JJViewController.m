//
//  JJViewController.m
//  Transition
//
//  Created by Adobe on 17/4/25.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "JJViewController.h"

@interface JJViewController ()

@property (strong,nonatomic)UIImageView *imageView;
@end

@implementation JJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.imageView = ({
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.center.x - 25, 100,50, 50)];
        imageView.backgroundColor = [UIColor redColor];
        [self.view addSubview:imageView];
        imageView;
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self change];
}

- (void)change{
    
    self.imageView.transform = CGAffineTransformMakeScale(2.0, 2.0);
}

@end
