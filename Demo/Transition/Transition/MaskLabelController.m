//
//  MaskLabelController.m
//  Transition
//
//  Created by adobe on 2017/4/30.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "MaskLabelController.h"
#import "FadeStringView.h"
@interface MaskLabelController ()

@end

@implementation MaskLabelController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    FadeStringView *fadeString = [[FadeStringView alloc]initWithFrame:self.view.bounds];
    fadeString.text = @"你知不知道";
    [self.view addSubview:fadeString];
    
    [fadeString fadeRight];
    
}



@end
