//
//  NSString+CPSignature.m
//  CoolPlaySport
//
//  Created by duwei on 2018/6/1.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import "NSString+CPSignature.h"
#import "NSString+HMAC.h"
#import "NSString+TimeConvert.h"

@implementation NSString (CPSignature)
+ (NSString*)signtureWithDict:(NSDictionary*)parameter token:(NSString*)token {
    NSString *signatureStr = @"";
    NSString *jsonStr = [NSString jsonStringWithDict:parameter];
    NSString *body = jsonStr;
    NSLog(@"body :%@",body);
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //AppKey
    [dict setValue:kAPPKEY forKey:@"appkey"];
    //body
    [dict setValue:body forKey:@"body"];
    //当前时间戳
    NSString *utcStr = [NSString obtainCurrentDateUTCTimeString];
//    utcStr = @"2018-03-23T011:38:13Z";
    [dict setObject:utcStr forKey:@"timestamp"];
    //token
//    if (![token isEqualToString:@""] && token != nil) {
//        [dict setValue:token forKey:@"token"];
//    }
//    [dict setValue:@"aabbccee333224rrrwrzre8" forKey:@"token"];
    //将组合的字符串进行排序
    NSString *sortedStr = [NSString sort:dict isASC:YES];
    NSLog(@"sortedStr:%@",sortedStr);
    
    //HMAC SHA256计算
    signatureStr = [NSString hmac:sortedStr withKey:kSECRET];
    signatureStr = [signatureStr lowercaseString];
    return signatureStr;
}

+ (NSString*)signtureWithJsonStr:(NSString*)jsonStr token:(NSString*)token {
    NSString *signatureStr = @"";
    return signatureStr;
}

+ (NSString*)signatureWithAppkey:(NSString*)appkey secret:(NSString*)secret parameter:(NSDictionary*)parameter token:(NSString*)token{
    NSString *signatureStr = @"";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:parameter];
    [dict setObject:token forKey:@"token"];
    [dict setObject:appkey forKey:@"appkey"];
    NSString *utcStr = [NSString obtainCurrentDateUTCTimeString];
    [dict setObject:utcStr forKey:@"timestamp"];
    NSString *sortedStr = [NSString sort:dict isASC:YES];
    signatureStr = [NSString hmac:sortedStr withKey:secret];
    return signatureStr;
}

//对字典进行排序
+ (NSString*)sort:(NSDictionary*)parameter isASC:(BOOL)isASC {
    if (parameter) {
        NSArray *allKeyArr = [parameter allKeys];
        NSArray *afterSortKeyArr;
        if (isASC) {
            afterSortKeyArr = [allKeyArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                NSComparisonResult result = [obj1 compare:obj2];
                return result;
            }];
        }else {
            afterSortKeyArr = [allKeyArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                NSComparisonResult result = [obj2 compare:obj1];
                return result;
            }];
        }
        NSString *resultStr = [NSString string];
        
        for (NSString *key in afterSortKeyArr) {
            NSString *valueString = [parameter objectForKey:key];
            NSString *temp = [NSString stringWithFormat:@"%@%@",key,valueString];
            resultStr = [resultStr stringByAppendingString:temp];
        }
        //        NSString *sortedStr = [resultStr lowercaseString];
        return resultStr;
    }
    return @"";
}
@end
