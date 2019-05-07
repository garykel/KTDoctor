//
//  KTOpenAerobicriptionModel.m
//  KTDoctor
//
//  Created by 张敬 on 2019/5/7.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "KTOpenAerobicriptionModel.h"

@implementation KTOpenAerobicriptionModel

- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.percentStrength_PSL = @"";
        self.percentStrength_PSR = @"";
        self.trainingTime_TTL = @"";
        self.trainingTime_TTR = @"";
        self.strength_ST = @"";
        self.RPE_RPEL = @"";
        self.RPE_RPER = @"";
        self.restTime_RTL = @"";
        self.restTime_RTR = @"";
        
    }
    return self;
}

@end
