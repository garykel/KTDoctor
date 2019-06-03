//
//  SymbolsValueFormatter.m
//  KTDoctor
//
//  Created by duwei on 2019/6/3.
//  Copyright © 2019 dz. All rights reserved.
//

#import "SymbolsValueFormatter.h"

@implementation SymbolsValueFormatter

-(id)init{
    if (self = [super init]) {
        
    }
    return self;}
-(NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis
{
    return [NSString stringWithFormat:@"%ld",(NSInteger)value];
}//IChartAxisValueFormatter的代理方法

@end
