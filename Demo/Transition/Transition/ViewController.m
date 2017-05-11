//
//  ViewController.m
//  Transition
//
//  Created by Adobe on 17/4/25.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "ViewController.h"
#import "MaskTableController.h"
#import "CALayerTableController.h"
#import "CAShapeLayerTableController.h"
#import "CAGradientLayerTableController.h"
#import "BlurryTableController.h"
@interface ViewController ()
@end


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AnimationDemo";
    self.dataArray =  @[@"maskView设计动画",@"iOS中CALayer的使用",@"iOS中CAShapeLayer的使用",@"iOS中CAGradientLayer的使用",@"iOS模糊效果的使用"];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            MaskTableController *vc = [[MaskTableController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            CALayerTableController *vc = [[CALayerTableController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            CAShapeLayerTableController *vc = [[CAShapeLayerTableController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            CAGradientLayerTableController *vc = [[CAGradientLayerTableController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            BlurryTableController *vc = [[BlurryTableController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
