//
//  Define_Block.h
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2019/4/12.
//  Copyright © 2019年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KTOpenAerobicModel.h"
#import "KTOpenAerobicriptionModel.h"


#pragma mark - 通用Block

typedef void (^dealGeneralOperation)(void);

typedef void (^dealBtnOperation)(UIButton *btn);


#pragma mark - 开具有氧处方
typedef void (^dealOpenAerobicPrescriptionOperation)(KTOpenAerobicModel *model);

typedef void (^dealOpenAerobicCellModelOperation)(KTOpenAerobicriptionModel *model, NSInteger index);

typedef void (^dealOpenAerobicCellOperation)(NSInteger index);







