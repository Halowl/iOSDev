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


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"maskView设计动画";
    self.dataArray =  @[@"maskView基本原理",@"maskView配合alpha通道图片的使用",@"maskView配合CAGradientLayer的使用",@"设计文本横向渐变消失的控件"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            
            [self.navigationController pushViewController:[MaskViewController new] animated:YES];
            break;
        case 1:
            
            [self.navigationController pushViewController:[MaskViewAnimationController new] animated:YES];
            break;
        case 2:
            
            [self.navigationController pushViewController:[CAGradientLayerController new] animated:YES];
            break;
        case 3:
            
            [self.navigationController pushViewController:[MaskLabelController new] animated:YES];
            break;
        default:
            break;
    }
}


@end
