//
//  NSString+Size.h
//  XiuXiuTuanGou
//
//  Created by 王克博 on 2018/8/17.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

//根据 字体，最大宽高 计算 字符串最大宽度
- (CGSize)getTextSizeWith:(UIFont *)font maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight;

//根据 字号，富文本设置，最大宽度，最大高度  计算text高度
- (CGSize)getTextSizeWith:(UIFont *)font attributes:(NSDictionary *)attributes maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight;

@end
