//
//  KTOpenAerobicriptionModel.h
//  KTDoctor
//
//  Created by 张敬 on 2019/5/7.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KTOpenAerobicriptionModel : BaseModel

@property (nonatomic, copy) NSString *percentStrength_PSL; //强度百分比
@property (nonatomic, copy) NSString *percentStrength_PSR;
@property (nonatomic, copy) NSString *trainingTime_TTL; //训练时长
@property (nonatomic, copy) NSString *trainingTime_TTR;
@property (nonatomic, copy) NSString *strength_ST; //强度
@property (nonatomic, copy) NSString *RPE_RPEL; //RPE区间
@property (nonatomic, copy) NSString *RPE_RPER;
@property (nonatomic, copy) NSString *restTime_RTL; //组间休息
@property (nonatomic, copy) NSString *restTime_RTR;

@end

NS_ASSUME_NONNULL_END
