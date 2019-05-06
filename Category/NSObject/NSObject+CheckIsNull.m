//
//  NSObject+CheckIsNull.m
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/8/6.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import "NSObject+CheckIsNull.h"

@implementation NSObject (CheckIsNull)

/**
 判断字符串是否为空
 @param  aStr 字符串
 @return YES  空 NO
 */

- (BOOL)isBlankString:(NSString *)aStr {
    
    if ( !aStr ) {
        
        return YES;
    }
    
    if ([aStr isKindOfClass:[NSNull class]]) {
        
        return YES;
    }
    
    if (!aStr.length) {

        return YES;
    }
    
    if (aStr == nil) {
        
        return YES;
    }
    
    if (aStr == NULL) {
        return YES;
    }
    
    if ([aStr isEqualToString:@"NULL"]) {

        return YES;
    }
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
    
    if (!trimmedStr.length) {
        
        return YES;
    }
    
    return NO;
    
}




/**
 
 判断数组为空
 @param arr 数组
 @return YES 空 NO
 */

- (BOOL)isBlankArr:(NSArray *)arr {
    
    if (!arr) {
        return YES;
    }
    
    if ([arr isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if (!arr.count) {
        return YES;
    }
    
    if (arr == nil) {
        return YES;
    }
    
    if (arr == NULL) {
        return YES;
    }
    
    if (![arr isKindOfClass:[NSArray class]]) {
        return YES;
    }
    return NO;
}


/**
 判断字典为空
 @param  dic 数组
 @return YES 空 NO
 */

- (BOOL)isBlankDictionary:(NSDictionary *)dic {
    
    if (!dic) {
        return YES;
    }
    
    if ([dic isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if (!dic.count) {
        return YES;
    }
    
    if (dic == nil) {
        return YES;
    }
    
    if (dic == NULL) {
        return YES;
    }
    
    if (![dic isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)isPureFloat:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}


@end
