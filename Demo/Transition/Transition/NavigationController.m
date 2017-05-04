//
//  NavigationController.m
//  Transition
//
//  Created by Adobe on 17/5/4.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 如果滑动移除控制器的功能失效，清空代理(让导航控制器重新设置这个功能)
    self.interactivePopGestureRecognizer.delegate = nil;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
 
    // 默认为UIRectEdgeAll,navigationBar 顶部开始
    viewController.edgesForExtendedLayout = UIRectEdgeNone;
    
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        // 隐藏tabbar
        
        viewController.view.backgroundColor = [UIColor colorWithRed:242/256.0 green:242/256.0 blue:242/256.0 alpha:1.0];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    
}

- (BOOL)hidesBottomBarWhenPushed{
    return  YES;
}


@end
