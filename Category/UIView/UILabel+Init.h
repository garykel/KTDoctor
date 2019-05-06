//
//  UILabel+Init.h
//  SummaryUsefulCode
//
//  Created by 王克博 on 2019/1/9.
//  Copyright © 2019 XiuXiu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Init)

/**
 创建一个Label对象
 
 @param frame       坐标
 @param text        内容
 @param textColor   字体颜色
 @param font        字体字号
 @param bgColor     背景颜色
 @param textAliment 对齐方式
 
 @return 返回一个Label对象
 */

+ (UILabel *)makeLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAliment:(NSTextAlignment)textAliment bgColor:(UIColor *)bgColor;


/**
 创建一个Label对象，根据size和text适应高度
 
 @param size       根据宽度适应高度
 @param text        内容
 @param textColor   字体颜色
 @param font        字体字号
 @param bgColor     背景颜色
 @param textAliment 对齐方式
 
 @return 返回一个Label对象
 */
+ (UILabel *)makeLabelWithSize:(CGSize)size text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAliment:(NSTextAlignment)textAliment bgColor:(UIColor *)bgColor;

@end

NS_ASSUME_NONNULL_END
