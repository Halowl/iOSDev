//
//  JJTableController.m
//  Patch
//
//  Created by adobe on 2016/12/7.
//  Copyright © 2016年 啊啦大大. All rights reserved.
//

#import "JJTabBarController.h"
#import "DCPathButton.h"
#import "DCPathItemButton.h"
#import "ViewController.h"
@interface JJTabBarController ()<DCPathButtonDelegate>

@end

@implementation JJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewDidAppear:(BOOL)animated{
    DCPathButton *btn = [[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]highlightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    btn.dcButtonCenter = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height - 49);
    btn.delegate = self;
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_5 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    [btn addPathItems:@[itemButton_1,itemButton_2,itemButton_3,itemButton_4,itemButton_5]];
    btn.basicDuration = 0.5;
    btn.allowSounds = YES;
    btn.bloomAngel = 150;
    btn.bloomRadius = 120.0f;
    btn.allowCenterButtonRotation = YES;
    btn.bottomViewColor = [UIColor blackColor];
//    btn.bloomDirection = kDCPathButtonBloomDirectionTopRight;
    [self.view addSubview:btn];
}


- (void)addChildViewControllers{
    [self addChildViewController:[[UIViewController alloc]init] title:@"首页" imageName:@"home_normal" selImageName:@"home_highlight"];
    [self addChildViewController:[[UIViewController alloc]init] title:@"鱼塘" imageName:@"fish_normal" selImageName:@"fish_highlight"];
    [self addChildViewController:[[UIViewController alloc]init] title:@"弹出" imageName:nil selImageName:nil];
    [self addChildViewController:[[UIViewController alloc]init] title:@"消息" imageName:@"message_normal" selImageName:@"message_highlight"];
    [self addChildViewController:[[UIViewController alloc]init] title:@"我的" imageName:@"account_normal"  selImageName:@"account_highlight"];
    
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString*)title imageName:(NSString*)imageName selImageName:(NSString*)selImageName{
    
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selImageName];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childController];
    childController.view.backgroundColor = [self randomColor];
    childController.title = title;
   [self addChildViewController:nav];
    
}

- (UIColor*)randomColor{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithDisplayP3Red:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}
- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex{
    UINavigationController *Vc = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    Vc.view.backgroundColor = [self randomColor];
    [self presentViewController:Vc animated:YES completion:nil];
}



@end
