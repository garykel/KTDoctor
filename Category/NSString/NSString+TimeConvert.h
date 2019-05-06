//
//  NSString+TimeConvert.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TimeConvert)
+ (NSString *)obtainCurrentDateUTCTimeString;

+ (NSString *)getDateDisplayString:(NSString *) timeString;

/**
 传入时间戳，返回今天、昨天、星期几。。。。。
 注：时间戳需要10位及以上，包括10位，否则返回“未知时间”
 */
+ (NSString *)achieveDayFormatByTimeString:(NSString *)timeString;

//转换时间戳 为 x月x号
+ (NSString *)transformDateToMonthDayTime:(NSString *)timeString;

//转换时间戳 为 12:30
+ (NSString *)transformDateToHourMinuteTime:(NSString *)timeString;

//使用时间戳转换时间格式：2018.11.26
+ (NSString *)transformTimeWithString:(NSString *)time;

//转换时间戳字符串为 月日时分秒
+ (NSString *)transformTimeToMMDDHHmmSSWithString:(NSString *)time;

//传入时间格式和时间戳 返回对应时间格式 的时间
+ (NSString *)getTimeWithDateFormat:(NSString *)format time:(NSString *)time date:(NSDate *)date;


@end
