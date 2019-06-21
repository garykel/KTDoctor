//
//  PrescriptionCell.h
//  KTDoctor
//
//  Created by duwei on 2019/5/6.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrescriptionCell : UITableViewCell
@property (nonatomic,strong)UILabel *groupNameLbl;//第几组
@property (nonatomic,strong)UILabel *difficultyPercentLbl;//强度百分比
@property (nonatomic,strong)UIButton *difficultyImg;
@property (nonatomic,strong)UITextField *difficultyLeftTF;//强度百分比左边界
@property (nonatomic,strong)UILabel *difficultyTildeLbl;//～
@property (nonatomic,strong)UITextField *difficultyRightTF;//强度百分比右边界
@property (nonatomic,strong)UILabel *traingingTimeLbl;//训练时长
@property (nonatomic,strong)UITextField *traingingTimeLeftTF;
@property (nonatomic,strong)UILabel *traingingTimeMinLbl;//min标签
@property (nonatomic,strong)UITextField *traingingTimeRightTF;
@property (nonatomic,strong)UILabel *traingingTimeSecLbl;//s标签
@property (nonatomic,strong)UILabel *difficultyLbl;//强度
@property (nonatomic,strong)UITextField *difficultyTF;
@property (nonatomic,strong)UILabel *rpeZoneLbl;//RPE区间
@property (nonatomic,strong)UITextField *rpeLeftTF;
@property (nonatomic,strong)UILabel *rpeTildeLbl;//～
@property (nonatomic,strong)UITextField *rpeRightTF;
@property (nonatomic,strong)UILabel *restLbl;//组间休息
@property (nonatomic,strong)UITextField *restLeftTF;
@property (nonatomic,strong)UILabel *restMinLbl;//min标签
@property (nonatomic,strong)UITextField *restRightTF;
@property (nonatomic,strong)UILabel *restSecLbl;//s标签
@end
