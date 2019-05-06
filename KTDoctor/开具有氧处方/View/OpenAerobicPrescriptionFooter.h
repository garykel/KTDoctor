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

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *vaules;

@property (nonatomic, strong) KTTextView *prescriptionTextView;
@property (nonatomic, strong) KTTextView *doctorAdviceTextView;

@property (nonatomic, strong) KTOpenAerobicModel *model;

@property (nonatomic, copy) dealOpenAerobicPrescriptionOperation block;
@property (nonatomic, copy) dealGeneralOperation openBlock;
@property (nonatomic, copy) dealGeneralOperation giveupBlock;



@end

NS_ASSUME_NONNULL_END
