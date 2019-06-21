//
//  PowerTemplateCell.h
//  KTDoctor
//
//  Created by duwei on 2019/5/20.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTDropDownMenus.h"
#import "AerobicriptionModel.h"

@interface PowerTemplateCell : UITableViewCell
@property (nonatomic,strong)UIView *bgView;//蓝色背景视图
@property (nonatomic,strong)UIView *infoBgView;//白色内容视图
@property (nonatomic,strong)UILabel *groupNameLbl;
@property (nonatomic,strong)UILabel *difficultyPercentLbl;
@property (nonatomic,strong)UIButton *difficultyImg;
@property (nonatomic,strong)KTDropDownMenus *difficultyLeftMenu;
@property (nonatomic,strong)UILabel *difficultyTildeLbl;
@property (nonatomic,strong)KTDropDownMenus *difficultyRightMenu;
@property (nonatomic,strong)UILabel *traingingTimeLbl;
@property (nonatomic,strong)KTDropDownMenus *traingingTimeLeftMenu;
@property (nonatomic,strong)UILabel *traingingTimeMinLbl;
@property (nonatomic,strong)KTDropDownMenus *traingingTimeRightMenu;
@property (nonatomic,strong)UILabel *traingingTimeSecLbl;
@property (nonatomic,strong)UILabel *difficultyLbl;
@property (nonatomic,strong)KTDropDownMenus *difficultyMenu;
@property (nonatomic,strong)UILabel *rpeZoneLbl;
@property (nonatomic,strong)KTDropDownMenus *rpeLeftMenu;
@property (nonatomic,strong)UILabel *rpeTildeLbl;
@property (nonatomic,strong)KTDropDownMenus *rpeRightMenu;
@property (nonatomic,strong)UILabel *restLbl;
@property (nonatomic,strong)KTDropDownMenus *restLeftMenu;
@property (nonatomic,strong)UILabel *restMinLbl;
@property (nonatomic,strong)KTDropDownMenus *restRightMenu;
@property (nonatomic,strong)UILabel *restSecLbl;
@property (nonatomic,strong)UIButton *addBtn;
@property (nonatomic,strong)UIButton *removeBtn;
@property (nonatomic,strong)AerobicriptionModel *model;
@end

