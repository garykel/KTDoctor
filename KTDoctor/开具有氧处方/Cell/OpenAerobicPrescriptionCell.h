//
//  OpenAerobicPrescriptionCell.h
//  KTDoctor
//
//  Created by 张敬 on 2019/4/30.
//  Copyright © 2019年 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenAerobicPrescriptionCell : UITableViewCell

@property (nonatomic, strong) UILabel *groupLab; //第几组


@property (nonatomic, strong) UILabel *percentStrengthLab; //强度百分比
@property (nonatomic, strong) UILabel *percentStrengthGapLab; //~
@property (nonatomic, strong) UIImageView *icon; //icon
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_PSL;
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_PSR;
@property (nonatomic, strong) NSMutableArray *titles_PSL;
@property (nonatomic, strong) NSMutableArray *titles_PSR;



@property (nonatomic, strong) UILabel *trainingTimeLab; //训练时长
@property (nonatomic, strong) UILabel *trainingTimeGapLab; //~
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_TTL;
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_TTR;
@property (nonatomic, strong) NSMutableArray *titles_TTL;
@property (nonatomic, strong) NSMutableArray *titles_TTR;



@property (nonatomic, strong) UILabel *strengthLab; //强度
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_ST;
@property (nonatomic, strong) NSMutableArray *titles_ST;



@property (nonatomic, strong) UILabel *RPELab; //RPE区间
@property (nonatomic, strong) UILabel *RPEGapLab; //~
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_RPEL;
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_RPER;
@property (nonatomic, strong) NSMutableArray *titles_RPEL;
@property (nonatomic, strong) NSMutableArray *titles_RPER;



@property (nonatomic, strong) UILabel *restTimeLab; //组间休息
@property (nonatomic, strong) UILabel *restTimeGapLab; //~
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_RTL;
@property (nonatomic, strong) KTDropDownMenus *dropdownMenu_RTR;
@property (nonatomic, strong) NSMutableArray *titles_RTL;
@property (nonatomic, strong) NSMutableArray *titles_RTR;


@property (nonatomic, assign) NSInteger currentIndex; //当前是第几行

@property (nonatomic, copy) dealOpenAerobicCellOperation addBlock;
@property (nonatomic, copy) dealOpenAerobicCellOperation deleteBlock;


@end

NS_ASSUME_NONNULL_END
