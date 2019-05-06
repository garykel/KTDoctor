//
//  NSObject+CheckIsNull.h
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/8/6.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CheckIsNull)

- (BOOL)isBlankString:(NSString *)aStr;

- (BOOL)isBlankArr:(NSArray *)arr;

- (BOOL)isBlankDictionary:(NSDictionary *)dic;

- (BOOL)isPureInt:(NSString *)string;

- (BOOL)isPureFloat:(NSString *)string;



@end
