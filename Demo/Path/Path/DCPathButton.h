//
//  DCPathButton.h
//  DCPathButton
//
//  Created by tang dixi on 30/7/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

#import "DCPathItemButton.h"

@import UIKit;
@import QuartzCore;
@import AudioToolbox;

@class DCPathButton;

typedef NS_ENUM(NSUInteger, kDCPathButtonBloomDirection) {
    
    kDCPathButtonBloomDirectionTop = 1,
    kDCPathButtonBloomDirectionTopLeft = 2,
    kDCPathButtonBloomDirectionLeft = 3,
    kDCPathButtonBloomDirectionBottomLeft = 4,
    kDCPathButtonBloomDirectionBottom = 5,
    kDCPathButtonBloomDirectionBottomRight = 6,
    kDCPathButtonBloomDirectionRight = 7,
    kDCPathButtonBloomDirectionTopRight = 8,
    
};

@protocol DCPathButtonDelegate <NSObject>

- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex;

@optional

- (void)willPresentDCPathButtonItems:(DCPathButton *)dcPathButton;
- (void)didPresentDCPathButtonItems:(DCPathButton *)dcPathButton;

- (void)willDismissDCPathButtonItems:(DCPathButton *)dcPathButton;
- (void)didDismissDCPathButtonItems:(DCPathButton *)dcPathButton;

@end

@interface DCPathButton : UIView <UIGestureRecognizerDelegate>

@property (weak, nonatomic) id<DCPathButtonDelegate> delegate;
/** 弹出动画时间*/
@property (assign, nonatomic) NSTimeInterval basicDuration;
/** 设置弹出时是否旋转   */
@property (assign, nonatomic) BOOL allowSubItemRotation;
/**  设置底部弹出的半径，默认是105 */
@property (assign, nonatomic) CGFloat bloomRadius;
/**  设置散开的角度 */
@property (assign, nonatomic) CGFloat bloomAngel;
/**  中间按钮的center */
@property (assign, nonatomic) CGPoint dcButtonCenter;
/**  是否播放音效 */
@property (assign, nonatomic) BOOL allowSounds;
/**  音效路径 */
@property (copy, nonatomic) NSString *bloomSoundPath;
@property (copy, nonatomic) NSString *foldSoundPath;
@property (copy, nonatomic) NSString *itemSoundPath;
/**  设置中间的按钮是否旋转 */
@property (assign, nonatomic) BOOL allowCenterButtonRotation;

@property (strong, nonatomic) UIColor *bottomViewColor;
/**  弹出方式/位置 */
@property (assign, nonatomic) kDCPathButtonBloomDirection bloomDirection;

- (instancetype)initWithCenterImage:(UIImage *)centerImage
                   highlightedImage:(UIImage *)centerHighlightedImage;

- (instancetype)initWithButtonFrame:(CGRect)centerButtonFrame
                        centerImage:(UIImage *)centerImage
                   highlightedImage:(UIImage *)centerHighlightedImage;

/** 添加弹出按钮 */
- (void)addPathItems:(NSArray *)pathItemButtons;

@end
