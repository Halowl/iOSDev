//
//  App.h
//  Transition
//
//  Created by Adobe on 17/5/5.
//  Copyright © 2017年 龚. All rights reserved.
//

#ifndef App_h
#define App_h

#define IS_iPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960),[[UIScreen mainScreen] currentMode].size): NO)
#define IS_iPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size): NO)
#define IS_iPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334),[[UIScreen mainScreen] currentMode].size)): NO)
#define IS_iPHONE6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1242, 2208),[[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1125, 2001),[[UIScreen mainScreen] currentMode].size)): NO)

/*
 //.h
 extern NSString *const SureShouldShowGuide;
 //.m
 NSString *const SureShouldShowGuide = @"SureShouldShowGuide";
*/

#endif /* App_h */
