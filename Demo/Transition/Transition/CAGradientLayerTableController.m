//
//  CAGradientLayerTableController.m
//  Transition
//
//  Created by adobe on 2017/5/7.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CAGradientLayerTableController.h"
#import "CAGrdientLayerController.h"
#import "CAGradientLayerColorDifferenceController.h"
#import "CAGradientLayerColorController.h"
@interface CAGradientLayerTableController ()

@end

@implementation CAGradientLayerTableController

- (void)viewDidLoad {
    [super viewDidLoad];
//    @"CAGradientLayer简介",
    self.dataArray = @[@"CAGradientLayer坐标系统",@"色差动画的实现",@"用CAGradientLayer封装带色差动画的View"];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            CAGrdientLayerController *vc = [[CAGrdientLayerController alloc]init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            CAGradientLayerColorDifferenceController *vc = [[CAGradientLayerColorDifferenceController alloc]init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            CAGradientLayerColorController *vc = [[CAGradientLayerColorController alloc]init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
 
        default:
            break;
    }
}

@end
