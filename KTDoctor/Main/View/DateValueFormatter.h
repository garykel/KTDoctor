//
//  DateValueFormatter.h
//  CoolPlaySport
//
//  Created by duwei on 2018/8/8.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateValueFormatter : NSObject<IChartAxisValueFormatter>
@property (nonatomic,strong)NSArray *arr;
-(id)initWithArr:(NSArray *)arr;
@end
