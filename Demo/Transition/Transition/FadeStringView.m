//
//  FadeStringView.m
//  Transition
//
//  Created by adobe on 2017/4/30.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "FadeStringView.h"

@interface FadeStringView ()

@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)UIView *maskView;

@end

@implementation FadeStringView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame: frame]) {
        [self createLabel:frame];
    }
    return self;
}

- (void)createLabel:(CGRect)frame{
    self.label = [[UILabel alloc]initWithFrame:frame];
    self.label.font = [UIFont systemFontOfSize:30.f];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor redColor];
    [self addSubview:self.label];
    
}

- (void)createMask:(CGRect)frame{
    self.maskView = [[UIView alloc]initWithFrame:self.label.bounds];
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 0);
    layer.colors =  @[
                      (id)[UIColor clearColor].CGColor,
                      (id)[UIColor blackColor].CGColor,
                      (id)[UIColor blackColor].CGColor,
                      (id)[UIColor clearColor].CGColor,
                      ];
    layer.locations = @[@0.01,@1,@0.9,@0.99];
    [self.maskView.layer addSublayer:layer];
}
@synthesize text = _text;
- (void)setText:(NSString *)text{
   _text = text;
}

- (NSString *)text{
    
    return _text;
}
@end
