//
//  DateValueFormatter.m
//  CoolPlaySport
//
//  Created by duwei on 2018/8/8.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import "DateValueFormatter.h"

@implementation DateValueFormatter

-(id)initWithArr:(NSArray *)arr{
    self = [super init];
    if (self)
    {
        _arr = arr;
        
    }
    return self;
}
-(NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis
{
    if (value < _arr.count - 1) {
        if (value == -1) {
            value = 0;
        }
    } else {
        value = 0;
    }    
    return _arr[(NSInteger)value];
}

@end
