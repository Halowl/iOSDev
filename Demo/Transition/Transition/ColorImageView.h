//
//  ColorImageView.h
//  Transition
//
//  Created by Adobe on 17/5/8.
//  Copyright © 2017年 龚. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    UP,
    DOWN,
    LEFT,
    RIGHT
} Direction;

@interface ColorImageView : UIImageView

@property (assign,nonatomic)Direction direction;
@property (assign,nonatomic)CGPoint endPoint;
@property (assign,nonatomic)CGPoint startPoint;
@property (strong,nonatomic)UIColor *color;
@property (strong,nonatomic)NSArray *location;
@end


/**
 确定几个属性值
 方向
 颜色
 颜色分割点
 确定可以做动画的参数
 重写setter方法实现做动画的效果
 */
