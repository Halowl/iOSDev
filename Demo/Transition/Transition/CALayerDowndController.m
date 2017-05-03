//
//  CALayerDowndController.m
//  Transition
//
//  Created by Adobe on 17/5/3.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CALayerDowndController.h"
#import "ProgressView.h"
@interface CALayerDowndController ()

@property (strong,nonatomic)NSTimer *timer;
@property (strong,nonatomic)ProgressView *progressView;
@end

@implementation CALayerDowndController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"用CALayer定制下载进度条的控件";
    self.progressView = [[ProgressView alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 5)];
    self.progressView.layer.borderWidth = 1;
    [self.view addSubview:self.progressView];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];

    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];

}


- (void)timerAction{
    self.progressView.progress = arc4random() % 100 / 100.f;
    self.progressView.layerColor = [UIColor orangeColor];
}


@end
