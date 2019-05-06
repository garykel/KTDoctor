//
//  NSObject+CheckIsLegal.h
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/10/4.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CheckIsLegal)

//剔除卡号里的非法字符
-(NSString *)getDigitsOnly:(NSString*)s;

//检查银行卡是否合法
-(BOOL)isValidCardNumber:(NSString *)cardNumber;

//验证手机号码
-(NSString *)numberSuitScanf:(NSString*)number;

/**
 验证是否是手机号

 @param number 手机号
 @return 回参
 */
- (BOOL) IsPhoneNumber:(NSString *)number;


/**
 验证是否是邮箱

 @param Email 邮箱号
 @return 回参
 */
- (BOOL) IsEmailAdress:(NSString *)Email;


/**
 验证是否是身份证号

 @param IDCardNumber 身份证号
 @return 回参
 */
- (BOOL) IsIdentityCard:(NSString *)IDCardNumber;



/**
 中文姓名校验

 @param name 姓名
 @return 回参
 */
- (BOOL) isChineseName:(NSString *)name;



/**
 英文姓名校验

 @param name 姓名
 @return 回参
 */
- (BOOL) isEnglishName:(NSString *)name;


/**
 校验是否是数字

 @param aims 数字
 @return 回参
 */
- (BOOL)isNumber:(NSString *)aims;



@end

NS_ASSUME_NONNULL_END
