//
//  ProgressView.m
//  Transition
//
//  Created by Adobe on 17/5/3.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "ProgressView.h"


@interface ProgressView ()
@property (strong,nonatomic)CALayer *progroessLayer;
@property (assign,nonatomic)CGFloat currentWidth;
@end

@implementation ProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.progroessLayer = [CALayer layer];
        self.progroessLayer.frame = CGRectMake(0, 0, 0, self.frame.size.height);
        [self.layer addSublayer:self.progroessLayer];
        
        self.currentWidth = frame.size.width;
        
    }
    return self;
}

@synthesize progress = _progress;
- (void)setProgress:(CGFloat)progress{
    _progress =  progress;
    if (progress <= 0 ) {
        self.progroessLayer.frame =  CGRectMake(0, 0, 0, self.frame.size.height);
    }else if (progress >= 1){
        self.progroessLayer.frame =  CGRectMake(0, 0, self.currentWidth, self.frame.size.height);
    }else{
        self.progroessLayer.frame = CGRectMake(0, 0, self.currentWidth * progress, self.frame.size.height);
    }
    
}

- (CGFloat)progress{
    return _progress;
}


@synthesize layerColor = _layerColor;
- (void)setLayerColor:(UIColor *)layerColor{
    _layerColor = layerColor;
    self.progroessLayer.backgroundColor = layerColor.CGColor;
    
}

- (UIColor *)layerColor{
    return _layerColor;
}
@end
