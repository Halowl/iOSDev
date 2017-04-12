//
//  User.m
//  姓名排序
//
//  Created by Adobe on 17/1/13.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictonary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)initWithDictonary:(NSDictionary *)dict{
    return [[self alloc]initWithDictonary:dict];
}
@end
