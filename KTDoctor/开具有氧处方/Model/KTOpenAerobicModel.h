//
//  KTOpenAerobicModel.h
//  KTDoctor
//
//  Created by 张敬 on 2019/5/6.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KTOpenAerobicModel : BaseModel

#pragma mark - header
@property (nonatomic, copy) NSString *useConditionStr; //适用病症
@property (nonatomic, copy) NSString *riskLevelStr; //风险等级
@property (nonatomic, copy) NSString *deviceTypeStr; //设备类型
@property (nonatomic, copy) NSString *trainingSiteStr; //训练部位
@property (nonatomic, copy) NSString *trainingEquipmentStr; //训练设备
@property (nonatomic, copy) NSString *recommendStr; //推荐模板
@property (nonatomic, copy) NSString *treatmentStr; //疗程
@property (nonatomic, copy) NSString *trainingFrequencyStr; //周训练频次
@property (nonatomic, copy) NSString *pointMotionStr; //运动时间点

#pragma mark - cell


#pragma mark - footer

@property (nonatomic, copy) NSString *prescriptionNameStr; //处方名称
@property (nonatomic, copy) NSString *doctorAdviceStr; //医嘱


@end

NS_ASSUME_NONNULL_END
