//
//  NSString+TimeConvert.h
//  CoolPlaySport
//
//  Created by duwei on 2018/6/1.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TimeConvert)
//获取当前时间的UTC时间
+ (NSString *)obtainCurrentDateUTCTimeString;

//获取两时间之间的时间差
+ (NSTimeInterval)dateTimeDifferenceWithStartTime:(NSString*)startTime endTime:(NSString*)endTime;
@end
