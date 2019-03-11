//
//  NSString+CPSignature.h
//  CoolPlaySport
//
//  Created by duwei on 2018/6/1.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CPSignature)
//1）将请求中所有参数按字母先后顺序排序（去掉数组类型字段，如上传运动数据中的datas字段）；
//2）把所有参数名和参数值串在一起；
//3）调用HMAC SHA256算法，根据提供的密钥（secret）和密文（message）输出密文摘要，并把结果转换为小写形式的十六进制字符串。

+ (NSString*)signatureWithAppkey:(NSString*)appkey secret:(NSString*)secret parameter:(NSDictionary*)parameter token:(NSString*)token;

+ (NSString*)signtureWithDict:(NSDictionary*)parameter token:(NSString*)token;

+ (NSString*)signtureWithJsonStr:(NSString*)jsonStr token:(NSString*)token;
@end
