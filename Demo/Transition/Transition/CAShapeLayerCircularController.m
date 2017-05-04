//
//  CAShapeLayerCircularController.m
//  Transition
//
//  Created by Adobe on 17/5/4.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAShapeLayerCircularController.h"
#import "CircleView.h"  
@interface CAShapeLayerCircularController ()

@property (strong,nonatomic)CircleView *circleView;
@end

@implementation CAShapeLayerCircularController

- (void)viewDidLoad {
    [super viewDidLoad];

    CircleView *circleView = [[CircleView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    circleView.center = self.view.center;
    circleView.startValue = 0.2f;
    circleView.lineWidth = 2;
    circleView.strokeColor = [UIColor orangeColor];
    self.circleView = circleView;
    [self.view addSubview:circleView];
    
    
    [self performSelector:@selector(circleAnimation) withObject:nil afterDelay:3.f];
}

- (void)circleAnimation{
    
    self.circleView.startValue = 1.f;
    
}

@end
