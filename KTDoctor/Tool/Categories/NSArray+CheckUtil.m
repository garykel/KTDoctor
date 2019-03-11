//
//  NSArray+CheckUtil.m
//  CoolPlaySport
//
//  Created by duwei on 2018/11/2.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import "NSArray+CheckUtil.h"

@implementation NSArray (CheckUtil)
- (id)objectAtIndexCheck:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}
@end
