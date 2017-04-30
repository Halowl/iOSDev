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
    {
    
        // 前景图
        UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        background.image        = [UIImage imageNamed:@"base"];
        background.center       = self.view.center;
        [self.view addSubview:background];
        
        
        // 背景图
        UIImageView *upGround = [[UIImageView alloc] initWithFrame:background.frame];
        upGround.image        = [UIImage imageNamed:@"bg"];
        [self.view addSubview:upGround];
        
        
        // maskView
        UIView *mask      = [[UIView alloc] initWithFrame:upGround.bounds];
        upGround.maskView = mask;
        
        
        // 图片1
        UIImageView *picOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 400)];
        picOne.image        = [UIImage imageNamed:@"bottom"];
        [mask addSubview:picOne];
        
        
        // 图片2
        UIImageView *picTwo = [[UIImageView alloc] initWithFrame:CGRectMake(100, -200, 100, 400)];
        picTwo.image        = [UIImage imageNamed:@"top"];
        [mask addSubview:picTwo];


        // 动画
        [UIView animateWithDuration:2.f delay:0.f options:0 animations:^{
            CGRect frame =  picOne.frame;
            frame.origin.y -= 400;
            picOne.frame = frame;
            
            CGRect rect =  picTwo.frame;
            rect.origin.y += 400;
            picTwo.frame = rect;
    
        } completion:^(BOOL finished) {
            
        }];
    }
    
}




@end
