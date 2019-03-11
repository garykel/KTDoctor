//
//  NSObject+DictConvert.h
//  CoolPlaySport
//
//  Created by duwei on 2018/6/7.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DictConvert)

//通过字典转换成对象
+(instancetype)cp_objWithDict:(NSDictionary*)dict;

//当字典的key与属性不匹配的时候，进行匹配
- (NSDictionary*)cp_exchangeDict;
@end
