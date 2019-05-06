//
//  UIButton+Init.h
//  SummaryUsefulCode
//
//  Created by 王克博 on 2019/1/9.
//  Copyright © 2019 XiuXiu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Init)

/**
 创建一个Button对象，文字内容
 
 @param frame       坐标
 @param text        内容
 @param textColor   字体颜色
 @param selectTextColor   选中时字体颜色
 @param font        字体字号
 @param textAliment        对齐方式
 @param bgColor     背景颜色
 @param cornerRadius  圆角
 
 @return 返回一个Button对象
 */
+ (UIButton *)makeButtonWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor selectTextColor:(UIColor *)selectTextColor font:(UIFont *)font textAliment:(NSTextAlignment)textAliment bgColor:(UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius;


/**
 创建一个Button对象，图片内容
 
 @param frame       坐标
 @param normalImageName   默认图片名
 @param selectImageName   选中时图片名
 @param bgColor     背景颜色
 @param isSelected  是否选中
 
 @return 返回一个Button对象
 */
+ (UIButton *)makeButtonWithFrame:(CGRect)frame normalImageName:(NSString *)normalImageName selectImageName:(NSString *)selectImageName bgColor:(UIColor *)bgColor isSelected:(BOOL)isSelected;


@end

NS_ASSUME_NONNULL_END
