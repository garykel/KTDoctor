//
//  NSObject+DictConvert.m
//  CoolPlaySport
//
//  Created by duwei on 2018/6/7.
//  Copyright © 2018年 cdz. All rights reserved.
//

///refrence https://blog.csdn.net/hahahakonghee/article/details/52096844
#import "NSObject+DictConvert.h"

@implementation NSObject (DictConvert)

+(instancetype)cp_objWithDict:(NSDictionary*)dict {
    id obj = [self new];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}

//字典的key在属性里面没有的时候，程序崩溃，所以我们可以通过重写下面方法来避免崩溃 
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSDictionary *exchangeDict = [self cp_exchangeDict];
    if (exchangeDict) {
        //当匹配字典存在的时候，通过字典key得到属性名
        NSString*  newKey = exchangeDict[key];
        //kvc赋值
        [self setValue:value forKey:newKey];
    }
}

- (NSDictionary *)cp_exchangeDict {
    return nil;
}

@end
