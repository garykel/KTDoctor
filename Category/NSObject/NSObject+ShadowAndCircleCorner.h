//
//  NSObject+ShadowAndCircleCorner.h
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/10/3.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ShadowAndCircleCorner)


/**
 设置圆角和阴影

 @param layer layer
 @param corner 圆角角度
 */
- (void)addShadowAndCircleCorner:(CALayer *)layer corner:(float)corner;


/**
 设置圆角和阴影
 
 @param layer layer
 @param color 阴影颜色
 @param corner 圆角角度
 */
- (void)addShadowAndCircleCorner:(CALayer *)layer color:(UIColor *)color corner:(float)corner;


@end

NS_ASSUME_NONNULL_END
