//
//  NSString+Chinese.h
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/7/13.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Chinese)

- (BOOL)isChinese;//判断是否是纯汉字

- (BOOL)includeChinese;//判断是否含有汉字

- (BOOL)isMobileNumber;// 正则判断手机号码地址格式
@end
