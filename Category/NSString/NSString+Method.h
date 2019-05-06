//
//  NSString+Method.h
//  XiuXiuTuanGou
//
//  Created by 王克博 on 2019/1/15.
//  Copyright © 2019 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//NSString常用快捷方法集合
@interface NSString (Method)

/**
 获取当前版本号
 
 @return 返回当前版本号
 */
+ (NSString *)getCurrentVersion;


/**
 获取当前手机型号
 
 @return 返回当前手机型号
 */
+ (NSString *)getPhoneModel;


@end

NS_ASSUME_NONNULL_END
