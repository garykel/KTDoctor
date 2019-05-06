//
//  NSObject+AutoFitSize.m
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/7/20.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import "NSObject+AutoFitSize.h"

@implementation NSObject (AutoFitSize)

- (float)fitSize: (float)width
{
    float w = [UIScreen mainScreen].bounds.size.width;
    float h = [UIScreen mainScreen].bounds.size.height;
    
    float min = h < w? h: w ;
    
    if XXTG_ISIpad return 1.2 *width;
    
    return min / 375.0 * width;
}


@end
