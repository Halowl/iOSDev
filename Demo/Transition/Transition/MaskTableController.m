//
//  MaskTableController.m
//  Transition
//
//  Created by adobe on 2017/4/30.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "MaskTableController.h"
#import "MaskViewController.h"
#import "MaskViewAnimationController.h"
#import "CAGradientLayerController.h"
#import "MaskLabelController.h"

@interface MaskTableController ()

@end

@implementation MaskTableController

/* 当title足够长 左上角返回那里不会显示 back 也不会显示上个页面title    <
   当title够短时,会显示上个页面的title                              < maskView设计动画
   当title中间长度时,会显示                                        < back
 
 **/
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray =  @[@"maskView基本原理",@"maskView配合alpha通道图片的使用",@"maskView配合CAGradientLayer的使用",@"设计文本横向渐变消失的控件"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            MaskViewController *vc = [[MaskViewController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            MaskViewAnimationController *vc = [[MaskViewAnimationController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            CAGradientLayerController *vc = [[CAGradientLayerController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            MaskLabelController *vc = [[MaskLabelController alloc]init];
            vc.title =  self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}


@end
