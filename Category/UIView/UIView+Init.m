//
//  UIView+Init.m
//  SummaryUsefulCode
//
//  Created by 王克博 on 2019/1/9.
//  Copyright © 2019 XiuXiu. All rights reserved.
//

#import "UIView+Init.h"

@implementation UIView (Init)


+ (UIView *)makeViewWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius shadowColor:(UIColor *)shadowColor
{
    UIView * view = [[UIView alloc]initWithFrame:frame];
    if (bgColor) {
        view.backgroundColor = bgColor;
    }
    if (cornerRadius > 0) {
        view.layer.cornerRadius = cornerRadius;
    }
    if (shadowColor && shadowColor != [UIColor clearColor]) {
        view.layer.shadowOffset = CGSizeMake(0, 0); //(0,0)时是四周都有阴影
        view.layer.shadowRadius = 3.0;
        view.layer.shadowColor = shadowColor.CGColor;
        view.layer.shadowOpacity = 6;
    }
    return view;
}

@end
