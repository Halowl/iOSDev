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
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic)NSArray *dataArray;
@property (strong,nonatomic)UITableView *tableView;
@end

static NSString *const CELLID = @"CELLID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Transition";
    self.dataArray =  @[@"maskView设计动画",@"iOS中CALayer的使用",@"iOS中CAShapeLayer的使用"];
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLID];
        tableView.bounces = NO;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [UIView new];
        [self.view addSubview:tableView];
       tableView;
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    cell.textLabel.text =  self.dataArray[indexPath.row];
    return  cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[MaskTableController new] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[CALayerTableController new] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[CAShapeLayerTableController new] animated:YES];
            break;
        default:
            break;
    }
}
@end
