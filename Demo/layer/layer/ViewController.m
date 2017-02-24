//
//  ViewController.m
//  layer
//
//  Created by adobe on 2016/12/12.
//  Copyright © 2016年 啊啦大大. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) CAShapeLayer *shapeLayer;

@property(nonatomic,strong) UIImageView *imageV_IDCard;
@property(nonatomic,strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:self.textField];
    
    [self.textField.layer addSublayer:self.shapeLayer];
    
//    [self.view addSubview:self.imageV_IDCard];
//    
//    [self.imageV_IDCard.layer addSublayer:self.shapeLayer];
    
}

- (UITextField*)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 50, 100, 50)];
        _textField.layer.cornerRadius = 25;
        _textField.backgroundColor = [UIColor orangeColor];

    }
    return _textField;
}

-(UIImageView *)imageV_IDCard{
    
    if (!_imageV_IDCard) {
        
        _imageV_IDCard = [[UIImageView alloc] initWithFrame:CGRectMake(22, 66, self.view.bounds.size.width / 2.0 , self.view.bounds.size.height / 2.0)];
        
        _imageV_IDCard.layer.cornerRadius = 25;
        
        _imageV_IDCard.backgroundColor = [UIColor lightGrayColor];
        
    }
    
    return _imageV_IDCard;
    
}
-(CAShapeLayer *)shapeLayer{
    
    if (!_shapeLayer) {
        
        _shapeLayer = [CAShapeLayer layer];
        
        _shapeLayer.strokeColor = [UIColor redColor].CGColor;
        
        _shapeLayer.fillColor = [UIColor greenColor].CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.textField.bounds cornerRadius:25];
        
        _shapeLayer.path = path.CGPath;
        
        _shapeLayer.frame = self.textField.bounds;
        
        _shapeLayer.lineWidth = 2;
        
        _shapeLayer.lineCap = @"square";
        
        _shapeLayer.lineDashPattern = @[@5, @5];
        
    }
    
    return _shapeLayer;
    
}


@end
