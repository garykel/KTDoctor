//
//  NSString+md5.h
//  XiuXiuTuanGou
//
//  Created by 王克博 on 2018/7/13.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (md5)

#pragma mark - 32位 小写
+(NSString *)MD5ForLower32Bate:(NSString *)str;

#pragma mark - 32位 大写
+(NSString *)MD5ForUpper32Bate:(NSString *)str;

#pragma mark - 16位 大写
+(NSString *)MD5ForUpper16Bate:(NSString *)str;

#pragma mark - 16位 小写
+(NSString *)MD5ForLower16Bate:(NSString *)str;

@end
