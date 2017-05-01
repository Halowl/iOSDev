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
@property (nonatomic,strong)UIView *mask;

@end

@implementation FadeStringView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame: frame]) {
        [self createLabel:self.bounds];
        [self createMask:self.bounds];
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
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = frame;
    layer.colors =  @[
                      (id)[UIColor clearColor].CGColor,
                      (id)[UIColor blackColor].CGColor,
                      (id)[UIColor blackColor].CGColor,
                      (id)[UIColor clearColor].CGColor,
                      ];
    layer.locations = @[@0.01,@0.1,@0.9,@0.99];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 0);
    self.mask = [[UIView alloc]initWithFrame:frame];
    [self.mask.layer addSublayer:layer];
    self.maskView = self.mask;

}

- (void)fadeRight{
    [UIView animateWithDuration:2.f animations:^{
        CGRect frame =  self.mask.frame;
        frame.origin.x  += frame.size.width;
        self.mask.frame = frame;
        
    }];
    
}
@synthesize text = _text;
- (void)setText:(NSString *)text{
    _text = text;
    self.label.text =  text;
}

- (NSString *)text{
    
    return _text;
}
@end
