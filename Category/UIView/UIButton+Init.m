//
//  UIButton+Init.m
//  SummaryUsefulCode
//
//  Created by 王克博 on 2019/1/9.
//  Copyright © 2019 XiuXiu. All rights reserved.
//

#import "UIButton+Init.h"

@implementation UIButton (Init)


+ (UIButton *)makeButtonWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor selectTextColor:(UIColor *)selectTextColor font:(UIFont *)font textAliment:(NSTextAlignment)textAliment bgColor:(UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (text) {
        [button setTitle:text forState:UIControlStateNormal];
    }
    if (textColor) {
        [button setTitleColor:textColor forState:UIControlStateNormal];
    }
    if (selectTextColor) {
        [button setTitleColor:selectTextColor forState:UIControlStateSelected];
    }
    if (font) {
        button.titleLabel.font = font;
    }
    if (textAliment) {
        button.titleLabel.textAlignment = textAliment;
    }
    if (bgColor) {
        [button setBackgroundColor:bgColor];
    }
    if (cornerRadius && cornerRadius > 0) {
        button.layer.cornerRadius = cornerRadius;
    }
    return button;
}


+ (UIButton *)makeButtonWithFrame:(CGRect)frame normalImageName:(NSString *)normalImageName selectImageName:(NSString *)selectImageName bgColor:(UIColor *)bgColor isSelected:(BOOL)isSelected
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (normalImageName) {
        [button setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    }
    if (selectImageName) {
        [button setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    }
    if (bgColor) {
        [button setBackgroundColor:bgColor];
    }
    if (isSelected) {
        button.selected = isSelected;
    }
    return button;
}


@end
