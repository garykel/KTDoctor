//
//  NSString+TimeConvert.m
//  CoolPlaySport
//
//  Created by duwei on 2018/6/1.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import "NSString+TimeConvert.h"

@implementation NSString (TimeConvert)
+ (NSString *)obtainCurrentDateUTCTimeString
{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

+ (NSTimeInterval)dateTimeDifferenceWithStartTime:(NSString*)startTime endTime:(NSString*)endTime {
    NSTimeInterval interval = 0;
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setLocale: [NSLocale currentLocale]];
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate * date1 = [df dateFromString:startTime];
    NSDate * date2 = [df dateFromString:endTime];
    interval = [date2 timeIntervalSinceDate:date1]; //date1是前一个时间(早)，date2是后一个时间(晚)
    return interval;
}
@end
