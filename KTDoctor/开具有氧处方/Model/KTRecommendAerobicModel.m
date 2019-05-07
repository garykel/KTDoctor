//
//  KTRecommendAerobicModel.m
//  KTDoctor
//
//  Created by 张敬 on 2019/5/7.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "KTRecommendAerobicModel.h"

@implementation KTRecommendAerobicModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"rows" : [KTRecommendAerobicItem class]
             };
}


@end

@implementation KTRecommendAerobicItem

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"typeList" : [TypeList class]
             };
}


@end


@implementation TypeList

@end

