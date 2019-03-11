//
//  UIColor+Equal.m
//  CoolPlaySport
//
//  Created by duwei on 2018/6/11.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import "UIColor+Equal.h"

@implementation UIColor (Equal)
+ (BOOL) isTheSameColor:(UIColor*)color1 anotherColor:(UIColor*)color2 {
    return CGColorEqualToColor(color1.CGColor, color2.CGColor);
}
@end
