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
@interface CALayerTableController ()
@property (strong,nonatomic)NSArray *dataArray;
@end

static NSString *const CELLID = @"CELLID";
@implementation CALayerTableController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"用CALayer定制下载进度条的控件",@"用CALayer定制UIImageView淡入淡出切换图片效果",@"用CALayer实现复杂遮罩效果"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLID];

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    cell.textLabel.text =  self.dataArray[indexPath.row];
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[CALayerDowndController new] animated:YES];
            break;
            
            
            
        default:
            break;
    }
    
    
}

@end
