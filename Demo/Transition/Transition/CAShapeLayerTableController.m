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
#import "CAShapeLayerCircularController.h"
#import "CAShapeLayerLineController.h"
@interface CAShapeLayerTableController ()

@end

@implementation CAShapeLayerTableController

/*
 CAShpeLayer继承自CALayer,可使用CALayer的所有属性
 CAShapeLayer需要和贝塞尔曲线配合使用才有意义,贝塞尔曲线可为其提供形状,单独使用是没有意义的
 使用CAShapeLayer和贝塞尔曲线可以实现不在view的DrawRect方法中绘制一些想要的图形
 
 
 关于CAShpeLayer和DrawRect的比较
     DrawRect:DraeRect属于UICoreGraphic框架,占用CPU,消耗性能大
     CAShpaeLayer:CAShapeLayer属于CoreAnimation框架,能过GPU来渲染,节省性能,动画渲染直接提交给手机GPU,不消耗内存
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =  @"iOS中CAShapeLayer的使用";
    self.dataArray =  @[@"CAShapeLayer简介",@"贝塞尔内曲线与CAShapeLayer的关系",@"StrokeStart与StrokeEnd动画",@"用CAShapeLayer实现圆形进度条效果",@"CAShapeLayer画线"];
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
        case 3:
        {
            CAShapeLayerCircularController *vc = [[CAShapeLayerCircularController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            CAShapeLayerLineController *vc = [[CAShapeLayerLineController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}

@end
