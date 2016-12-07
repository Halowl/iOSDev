//
//  ViewController.m
//  Patch
//
//  Created by adobe on 2016/12/7.
//  Copyright © 2016年 啊啦大大. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
