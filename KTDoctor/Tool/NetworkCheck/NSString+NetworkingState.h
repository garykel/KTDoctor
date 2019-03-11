//
//  NSString+NetworkingState.h
//  CoolPlaySport
//
//  Created by duwei on 2018/6/1.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NetworkingState)
//根据状态栏获取当前网络状态
+ (NSString*)networkingStatesFromStatebar;
@end
