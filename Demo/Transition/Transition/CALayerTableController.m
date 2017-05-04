//
//  CALayerTableController.m
//  Transition
//
//  Created by Adobe on 17/5/3.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "CALayerTableController.h"
#import "CALayerDowndController.h"
#import "CALayerImageController.h"
#import "CALayerMaskController.h"
@interface CALayerTableController ()

@end

@implementation CALayerTableController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"用CALayer定制下载进度条的控件",@"用CALayer定制UIImageView淡入淡出切换图片效果",@"用CALayer实现复杂遮罩效果"];


}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[CALayerDowndController new] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[CALayerImageController new] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[CALayerMaskController new] animated:YES];
            break;
        default:
            break;
    }
    
    
}

@end
