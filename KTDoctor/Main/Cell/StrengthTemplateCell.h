//
//  StrengthTemplateCell.h
//  KTDoctor
//
//  Created by duwei on 2019/5/27.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTDropDownMenus.h"
#import "AerobicriptionModel.h"

@interface StrengthTemplateCell : UITableViewCell
@property (nonatomic,strong)UIView *bgView;//蓝色背景视图
@property (nonatomic,strong)UIView *infoBgView;//白色内容视图
@property (nonatomic,strong)UILabel *groupNameLbl;
@property (nonatomic,strong)UILabel *weightLbl;
@property (nonatomic,strong)KTDropDownMenus *weightMenu;
@property (nonatomic,strong)UILabel *weightUnitLbl;
@property (nonatomic,strong)UILabel *timesLbl;
@property (nonatomic,strong)KTDropDownMenus *timesMenu;
@property (nonatomic,strong)UILabel *timesUnitLbl;
@property (nonatomic,strong)UILabel *rpeZoneLbl;
@property (nonatomic,strong)KTDropDownMenus *rpeLeftMenu;
@property (nonatomic,strong)UILabel *rpeTildeLbl;
@property (nonatomic,strong)KTDropDownMenus *rpeRightMenu;
@property (nonatomic,strong)UILabel *rotationAngleLbl;
@property (nonatomic,strong)KTDropDownMenus *rotationAngleLeftMenu;
@property (nonatomic,strong)UILabel *rotationAngleTildeLbl;
@property (nonatomic,strong)KTDropDownMenus *rotationAngleRightMenu;
@property (nonatomic,strong)UILabel *restLbl;
@property (nonatomic,strong)KTDropDownMenus *restLeftMenu;
@property (nonatomic,strong)UILabel *restMinLbl;
@property (nonatomic,strong)KTDropDownMenus *restRightMenu;
@property (nonatomic,strong)UILabel *restSecLbl;
@property (nonatomic,strong)UIButton *addBtn;
@property (nonatomic,strong)UIButton *removeBtn;
@property (nonatomic,strong)AerobicriptionModel *model;
@end

