//
//  NSObject+ShadowAndCircleCorner.m
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/10/3.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import "NSObject+ShadowAndCircleCorner.h"

@implementation NSObject (ShadowAndCircleCorner)
- (void)addShadowAndCircleCorner:(CALayer *)layer corner:(float)corner{
    
    layer.shadowOffset = CGSizeMake(0, 0); //(0,0)时是四周都有阴影
    layer.shadowRadius = 3.0;
    layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.05].CGColor;
    layer.shadowOpacity = 6;
    layer.masksToBounds = YES;
    layer.cornerRadius = corner;
}

/**
 设置圆角和阴影
 
 @param layer layer
 @param color 阴影颜色
 @param corner 圆角角度
 */
- (void)addShadowAndCircleCorner:(CALayer *)layer color:(UIColor *)color corner:(float)corner
{
    layer.shadowOffset = CGSizeMake(0, 0); //(0,0)时是四周都有阴影
    layer.shadowRadius = 3.0;
    layer.shadowColor = color.CGColor;
    layer.shadowOpacity = 6;
    layer.cornerRadius = corner;
}



@end
