
//
//  BlurryTableController.m
//  Transition
//
//  Created by Adobe on 17/5/11.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "BlurryTableController.h"

@interface BlurryTableController ()

@end

@implementation BlurryTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"CoreImage中的模糊滤镜",@"UIImage+ImageEffects的category 模糊效果",@"iOS8中UIVisualEffectView 模糊效果的使用",@"设计下载图片后自动模糊的控件"];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            
            break;
            
        default:
            break;
    }
    
}
@end
