//
//  CAShapeLayerTableController.m
//  Transition
//
//  Created by Adobe on 17/5/4.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAShapeLayerTableController.h"
#import "CAShapeLayerController.h"
#import "CAShpeLayerBezierController.h"
#import "CAShapeLayerStrokeController.h"
@interface CAShapeLayerTableController ()

@end

@implementation CAShapeLayerTableController

///drawRect CoreGf 框架 CPU  CAShapeLayer  GPU
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =  @"iOS中CAShapeLayer的使用";
    self.dataArray =  @[@"CAShapeLayer简介",@"贝塞尔内曲线与CAShapeLayer的关系",@"StrokeStart与StrokeEnd动画",@"用CAShapeLayer实现圆形进度条效果"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            CAShapeLayerController *vc = [[CAShapeLayerController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            CAShpeLayerBezierController *vc = [[CAShpeLayerBezierController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            CAShapeLayerStrokeController *vc = [[CAShapeLayerStrokeController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}

@end
