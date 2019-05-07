//
//  OpenAerobicPrescriptionFooter.h
//  KTDoctor
//
//  Created by 张敬 on 2019/4/30.
//  Copyright © 2019年 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTOpenAerobicModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface OpenAerobicPrescriptionFooter : UIView

@property (nonatomic, strong) UILabel *trainingTimeLab; //训练时长
@property (nonatomic, strong) UILabel *groupLab; //组数
@property (nonatomic, strong) UILabel *intensityLab; //平均强度

@property (nonatomic, strong) KTTextView *prescriptionTextView;
@property (nonatomic, strong) KTTextView *doctorAdviceTextView;

@property (nonatomic, strong) KTOpenAerobicModel *model;

@property (nonatomic, strong) NSArray *titles;


@property (nonatomic, copy) dealOpenAerobicPrescriptionOperation block;
@property (nonatomic, copy) dealGeneralOperation openBlock;
@property (nonatomic, copy) dealGeneralOperation giveupBlock;

- (void)resetLabValue:(NSString *)string tag:(NSInteger)tag;



@end

NS_ASSUME_NONNULL_END
