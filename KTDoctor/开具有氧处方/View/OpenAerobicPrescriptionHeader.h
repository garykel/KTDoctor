//
//  OpenAerobicPrescriptionHeader.h
//  KTDoctor
//
//  Created by 张敬 on 2019/4/30.
//  Copyright © 2019年 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTOpenAerobicModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface OpenAerobicPrescriptionHeader : UIView<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *useConditionsLab; //适用病症
@property (nonatomic, strong) UITextField *useConditionsTextField;


@property (nonatomic, strong) UILabel *riskLevelLab; //风险等级
@property (nonatomic, strong) UITextField *riskLevelTextField;


@property (nonatomic, strong) UILabel *deviceTypeLab; //设备类型
@property (nonatomic, strong) UITextField *deviceTypeTextField;


@property (nonatomic, strong) UILabel *trainingSiteLab; //训练部位
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_TS;
@property (nonatomic, strong) NSMutableArray *titles_TS;


@property (nonatomic, strong) UILabel *trainingEquipmentLab; //训练设备
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_TE;
@property (nonatomic, strong) NSMutableArray *titles_TE;


@property (nonatomic, strong) UILabel *recommendLab; //推荐模板
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_R;
//@property (nonatomic, strong) NSMutableArray *titles_R;
@property (nonatomic, strong) NSArray *titles_R;



@property (nonatomic, strong) UILabel *treatmentLab; //疗程
@property (nonatomic, strong) UILabel *treatmentGapLab; //周
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_T;
@property (nonatomic, strong) NSMutableArray *titles_T;



@property (nonatomic, strong) UILabel *trainingFrequencyLab; //周训练频次
@property (nonatomic, strong) UILabel *trainingFrequencyGapLab; //天
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_TF;
@property (nonatomic, strong) NSMutableArray *titles_TF;



@property (nonatomic, strong) UILabel *pointMotionLab; //运动时间点
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_PM;
@property (nonatomic, strong) NSMutableArray *titles_PM;


@property (nonatomic, strong) KTOpenAerobicModel *model;
@property (nonatomic, copy) dealOpenAerobicPrescriptionOperation block;





@end

NS_ASSUME_NONNULL_END
