//
//  UILabel+Init.m
//  SummaryUsefulCode
//
//  Created by 王克博 on 2019/1/9.
//  Copyright © 2019 XiuXiu. All rights reserved.
//

#import "UILabel+Init.h"

@implementation UILabel (Init)

+ (UILabel *)makeLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAliment:(NSTextAlignment)textAliment bgColor:(UIColor *)bgColor
{
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    if (text) {
        label.text = text;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    if (font) {
        label.font = font;
    }
    if (textAliment) {
        label.textAlignment = textAliment;
    }
    if (bgColor) {
        label.backgroundColor = bgColor;
    }
    return label;
}

+ (UILabel *)makeLabelWithSize:(CGSize)size text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAliment:(NSTextAlignment)textAliment bgColor:(UIColor *)bgColor
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    if (text) {
        label.text = text;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    if (font) {
        label.font = font;
    }
    if (textAliment) {
        label.textAlignment = textAliment;
    }
    if (bgColor) {
        label.backgroundColor = bgColor;
    }
    [label sizeToFit];
    return label;
}

@end
