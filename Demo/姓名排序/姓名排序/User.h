//
//  User.h
//  姓名排序
//
//  Created by Adobe on 17/1/13.
//  Copyright © 2017年 龚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (copy,nonatomic)NSString *name;
@property (assign,nonatomic)NSInteger phone;
@property (assign,nonatomic)NSInteger uid;
@property (assign,nonatomic)NSInteger age;

- (instancetype)initWithDictonary:(NSDictionary*)dict;
+ (instancetype)initWithDictonary:(NSDictionary*)dict;
@end
