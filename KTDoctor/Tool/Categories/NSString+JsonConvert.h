//
//  NSString+JsonConvert.h
//  CoolPlaySport
//
//  Created by duwei on 2018/6/1.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JsonConvert)
+ (NSString *)jsonStringWithDict:(NSDictionary *)dict;
@end
