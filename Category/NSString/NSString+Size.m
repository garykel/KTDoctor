//
//  NSString+Size.m
//  XiuXiuTuanGou
//
//  Created by 王克博 on 2018/8/17.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)getTextSizeWith:(UIFont *)font maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight
{
    CGRect textRect = [self boundingRectWithSize:CGSizeMake(maxWidth, maxHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return textRect.size;
}

- (CGSize)getTextSizeWith:(UIFont *)font attributes:(NSDictionary *)attributes maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight
{
    NSMutableDictionary * attributesDict = [NSMutableDictionary dictionary];
    if (attributes.count > 0) {
        [attributesDict setValuesForKeysWithDictionary:attributes];
    }
    [attributesDict setObject:font forKey:NSFontAttributeName];
    CGRect textRect = [self boundingRectWithSize:CGSizeMake(maxWidth, maxHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDict context:nil];
    return textRect.size;
}

@end
