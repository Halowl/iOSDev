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
@property (strong,nonatomic)UIImageView *maskView;
@end

@implementation JJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100,200, 200)];
    self.imageView.image = [UIImage imageNamed:@"mask"];

    [self.view addSubview:self.imageView];
    self.maskView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.maskView.image = [UIImage imageNamed:@"062034343292897"];
    self.imageView.maskView = self.maskView;
    
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 200, 200);
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"062034343292897"].CGImage);
    

//    [self.imageView.layer addSublayer:layer];
    
    /*
     maskView是iOS8才有的,如果要兼容低版本可以使用layer
     */

    
   
}


@end
