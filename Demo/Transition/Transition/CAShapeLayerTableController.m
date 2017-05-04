//
//  CAShapeLayerTableController.m
//  Transition
//
//  Created by Adobe on 17/5/4.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAShapeLayerTableController.h"

@interface CAShapeLayerTableController ()

@end

@implementation CAShapeLayerTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =  @"iOS中CAShapeLayer的使用";
    self.dataArray =  @[@"CAShapeLayer简介",@"贝塞尔内曲线与CAShapeLayer的关系",@"StrokeStart与StrokeEnd动画",@"用CAShapeLayer实现圆形进度条效果"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

@end
