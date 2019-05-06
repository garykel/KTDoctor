//
//  NSString+TimeConvert.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
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


//判断时间是否是今天 昨天 星期几 几月几日
+ (NSString *)achieveDayFormatByTimeString:(NSString *)timeString;
{
    if (timeString == nil || timeString.length < 10) {
        return @"时间未知";
    }
    //将时间戳转为NSDate类
    NSTimeInterval time = [[timeString substringToIndex:10] doubleValue];
    NSDate *inputDate=[NSDate dateWithTimeIntervalSince1970:time];
    //
    NSString *lastTime = [self compareDate:inputDate];
    return lastTime;
}

+ (NSString *)compareDate:(NSDate *)inputDate{
    
    //修正8小时的差时
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger goalInterval = [zone secondsFromGMTForDate: inputDate];
    NSDate *date = [inputDate  dateByAddingTimeInterval: goalInterval];
    
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSInteger localInterval = [zone secondsFromGMTForDate: currentDate];
    NSDate *localeDate = [currentDate  dateByAddingTimeInterval: localInterval];
    
    //今天／昨天／前天
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    
    NSDate *today = localeDate;
    NSDate *yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    NSDate *beforeOfYesterday = [yesterday dateByAddingTimeInterval: -secondsPerDay];
    
    NSString *todayString = [[today description] substringToIndex:10];
    NSString *yesterdayString = [[yesterday description] substringToIndex:10];
    NSString *beforeOfYesterdayString = [[beforeOfYesterday description] substringToIndex:10];
    
    //今年
    NSString *toYears = [[today description] substringToIndex:4];
    
    //目标时间拆分为 年／月
    NSString *dateString = [[date description] substringToIndex:10];
    NSString *dateYears = [[date description] substringToIndex:4];
    
    NSString *dateContent;
    if ([dateYears isEqualToString:toYears]) {//同一年
        //今 昨 前天的时间
        NSString *time = [[date description] substringWithRange:(NSRange){11,5}];
        //其他时间
        NSString *time2 = [[date description] substringWithRange:(NSRange){5,11}];
        if ([dateString isEqualToString:todayString]){
            //今天
//            dateContent = [NSString stringWithFormat:@"%@",time];
            dateContent = [NSString stringWithFormat:@"今天"];
            return dateContent;
        } else if ([dateString isEqualToString:yesterdayString]){
            //昨天
            dateContent = [NSString stringWithFormat:@"昨天"];
            return dateContent;
        }else if ([dateString isEqualToString:beforeOfYesterdayString]){
            //前天
            dateContent = [NSString stringWithFormat:@"前天"];
            return dateContent;
        }else{
            if ([self compareDateFromeWorkTimeToNow:time2]) {
                //一周之内，显示星期几
                return [[self class]weekdayStringFromDate:inputDate];
                
            }else{
                //一周之外，显示“月-日 时：分” ，如：05-23 06:22
                return time2;
            }
        }
    }else{
        //不同年，显示具体日期：如，2008-11-11
        return dateString;
    }
}
//比较在一周之内还是之外
+ (BOOL)compareDateFromeWorkTimeToNow:(NSString *)timeStr
{
    //获得当前时间并转为字符串 2017-07-16 07:54:36 +0000(NSDate类)
    NSDate *currentDate = [NSDate date];
    NSDateFormatter*df = [[NSDateFormatter alloc]init];//实例化时间格式类
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//格式化
    NSString *timeString = [df stringFromDate:currentDate];
    timeString = [timeString substringFromIndex:5];
    
    int today = [timeString substringWithRange:(NSRange){3,2}].intValue;
    int workTime = [timeStr substringWithRange:(NSRange){3,2}].intValue;
    if ([[timeStr substringToIndex:2] isEqualToString:[timeString substringToIndex:2]]) {
        if (today - workTime <= 6) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}
//返回星期几
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekdays objectAtIndex:theComponents.weekday];
}

//时间显示内容
+ (NSString *)getDateDisplayString:(NSString *) timeString{

    if (timeString == nil || timeString.length < 10) {
        return @"时间未知";
    }
    //将时间戳转为NSDate类
    NSTimeInterval time = [[timeString substringToIndex:10] doubleValue];
    NSDate *inputDate=[NSDate dateWithTimeIntervalSince1970:time];
    //
    
    NSCalendar *calendar = [ NSCalendar currentCalendar ];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear ;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[ NSDate date ]];
    NSDateComponents *myCmps = [calendar components:unit fromDate:inputDate];
    
    NSDateFormatter *dateFmt = [[NSDateFormatter alloc ] init ];
    
    //2. 指定日历对象,要去取日期对象的那些部分.
    NSDateComponents *comp =  [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:inputDate];
    
    if (nowCmps.year != myCmps.year) {
        dateFmt.dateFormat = @"yyyy-MM-dd hh:mm";
    } else {
        if (nowCmps.day==myCmps.day) {
            dateFmt.AMSymbol = @"上午";
            dateFmt.PMSymbol = @"下午";
            dateFmt.dateFormat = @"aaa hh:mm";
            
        } else if((nowCmps.day-myCmps.day)==1) {
            dateFmt.AMSymbol = @"上午";
            dateFmt.PMSymbol = @"下午";
            dateFmt.dateFormat = @"昨天 aaahh:mm";
            
        } else {
//            if ((nowCmps.day-myCmps.day) <=7) {
            
                dateFmt.AMSymbol = @"上午";
                dateFmt.PMSymbol = @"下午";
                dateFmt.dateFormat = @"MM-dd aaahh:mm";
            
//                switch (comp.weekday) {
//                    case 1:
//                        dateFmt.dateFormat = @"星期日 aaahh:mm";
//                        break;
//                    case 2:
//                        dateFmt.dateFormat = @"星期一 aaahh:mm";
//                        break;
//                    case 3:
//                        dateFmt.dateFormat = @"星期二 aaahh:mm";
//                        break;
//                    case 4:
//                        dateFmt.dateFormat = @"星期三 aaahh:mm";
//                        break;
//                    case 5:
//                        dateFmt.dateFormat = @"星期四 aaahh:mm";
//                        break;
//                    case 6:
//                        dateFmt.dateFormat = @"星期五 aaahh:mm";
//                        break;
//                    case 7:
//                        dateFmt.dateFormat = @"星期六 aaahh:mm";
//                        break;
//                    default:
//                        break;
//                }
//            }else {
            
//            }
        }
    }
    return [dateFmt stringFromDate:inputDate];
}

//转换时间戳 为 x月x号
+ (NSString *)transformDateToMonthDayTime:(NSString *)timeString
{
    if (timeString == nil || timeString.length < 10) {
        return @"时间未知";
    }
    NSTimeInterval time = [[timeString substringToIndex:10] doubleValue];
    NSDate * inputDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter * dateFmt = [[NSDateFormatter alloc ] init ];
    
    dateFmt.dateFormat = @"MM月dd日";
    return [dateFmt stringFromDate:inputDate];
}

//转换时间戳 为 12:30
+ (NSString *)transformDateToHourMinuteTime:(NSString *)timeString
{
    if (timeString == nil || timeString.length < 10) {
        return @"时间未知";
    }
    NSTimeInterval time = [[timeString substringToIndex:10] doubleValue];
    NSDate * inputDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter * dateFmt = [[NSDateFormatter alloc ] init ];
    
    dateFmt.dateFormat = @"HH:mm";
    return [dateFmt stringFromDate:inputDate];
}

//使用时间戳转换时间格式：2018.11.26
+ (NSString *)transformTimeWithString:(NSString *)time
{
    if (time.length == 10) {
        NSTimeInterval timeInterval = [time doubleValue];
        NSDate * currentDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        NSDateFormatter * df = [[NSDateFormatter alloc]init];//实例化时间格式类
        [df setDateFormat:@"yyyy.MM.dd"];//格式化
        NSString * timeString = [df stringFromDate:currentDate];
        return timeString;
    }else if (time.length == 13) {
        NSTimeInterval timeInterval = [[time substringToIndex:10] doubleValue];
        NSDate * currentDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        NSDateFormatter * df = [[NSDateFormatter alloc]init];//实例化时间格式类
        [df setDateFormat:@"yyyy.MM.dd"];//格式化
        NSString * timeString = [df stringFromDate:currentDate];
        return timeString;
    }
    return @"未知时间";
}

//转换时间戳字符串为 月日时分秒
+ (NSString *)transformTimeToMMDDHHmmSSWithString:(NSString *)time
{
    if (time.length == 10) {
        NSTimeInterval timeInterval = [time doubleValue];
        NSDate * currentDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        NSDateFormatter * df = [[NSDateFormatter alloc]init];//实例化时间格式类
        [df setDateFormat:@"MM-dd HH:mm:ss"];//格式化
        NSString * timeString = [df stringFromDate:currentDate];
        return timeString;
    }else if (time.length == 13) {
        NSTimeInterval timeInterval = [[time substringToIndex:10] doubleValue];
        NSDate * currentDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        NSDateFormatter * df = [[NSDateFormatter alloc]init];//实例化时间格式类
        [df setDateFormat:@"MM-dd HH:mm:ss"];//格式化
        NSString * timeString = [df stringFromDate:currentDate];
        return timeString;
    }
    return @"未知时间";
}

//传入时间格式和时间戳 返回对应时间格式 的时间
+ (NSString *)getTimeWithDateFormat:(NSString *)format time:(NSString *)time date:(NSDate *)date
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    //设置时区
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT+8"];
    //设定日期转换格式
    formatter.dateFormat = format;
    
    if (time && time.length >= 10) {
        NSDate * currentDate;
        if (time.length == 10) {
            NSTimeInterval timeInterval = [time doubleValue];
            currentDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        }else if (time.length == 13) {
            NSTimeInterval timeInterval = [[time substringToIndex:10] doubleValue];
            currentDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        }else {
            return @"未知时间";
        }
        NSString * timeString = [formatter stringFromDate:currentDate];
        if (timeString) {
            return timeString;
        }else {
            return @"未知时间";
        }
    }else if (date) {
        NSString * lastTime = [formatter stringFromDate:date];
        return lastTime;
    }
    return @"未知时间";
}



@end
