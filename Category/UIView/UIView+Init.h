//
//  UIView+Init.h
//  SummaryUsefulCode
//
//  Created by 王克博 on 2019/1/9.
//  Copyright © 2019 XiuXiu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Init)


/**
 创建一个View对象，文字内容
 
 @param frame       坐标
 @param bgColor     背景颜色
 @param cornerRadius  圆角
 @param shadowColor   阴影颜色
 
 @return 返回一个View对象
 */
+ (UIView *)makeViewWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius shadowColor:(UIColor *)shadowColor;


@end

NS_ASSUME_NONNULL_END
