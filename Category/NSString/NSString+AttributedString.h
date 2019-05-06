//
//  NSString+AttributedString.h
//  XiuXiuTuanGou
//
//  Created by 王克博 on 2018/8/24.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AttributedString)

- (NSMutableAttributedString *)getAttributedStringWith:(NSDictionary *)attributesDict range:(NSRange)range;

//NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc]initWithString:returnMoneyText];
//[attributedString addAttributes:@{NSForegroundColorAttributeName:RGB(255, 74, 85),NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)} range:NSMakeRange(returnMoneyText.length-4, 4)];
//[_textContent setAttributedText:attributedString];


/**
 字符串转换为带行间距的富文本
 
 @param lineSpacing       行间距
 
 @return 返回 富文本
 */
- (NSMutableAttributedString *)getParagraphAttributedStringWithLineSpacing:(NSInteger)lineSpacing;

/**
 字符串转换为带特殊颜色的富文本
 
 @param attColor    特殊颜色
 @param range       标记的范围
 
 @return 返回 富文本
 */
- (NSMutableAttributedString *)getTextColorAttributedWithColor:(UIColor *)attColor range:(NSRange)range;

@end
