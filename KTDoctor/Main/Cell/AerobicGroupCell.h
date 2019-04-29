//
//  AerobicGroupCell.h
//  KTDoctor
//
//  Created by duwei on 2019/4/29.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AerobicGroupCell : UITableViewCell
@property (nonatomic,strong)UIView *groupView;
@property (nonatomic,strong)UILabel *groupNameLbl;
@property (nonatomic,strong)UILabel *difficultyPercentLbl;
@property (nonatomic,strong)UIImageView *difficultyImg;
@property (nonatomic,strong)UIView *difficultyLeftMenu;
@property (nonatomic,strong)UILabel *difficultyTildeLbl;
@property (nonatomic,strong)UIView *difficultyRightMenu;
@property (nonatomic,strong)UILabel *traingingTimeLbl;
@property (nonatomic,strong)UIView *traingingTimeLeftMenu;
@property (nonatomic,strong)UILabel *traingingTimeMinLbl;
@property (nonatomic,strong)UIView *traingingTimeRightMenu;
@property (nonatomic,strong)UILabel *traingingTimeSecLbl;
@property (nonatomic,strong)UILabel *difficultyLbl;
@property (nonatomic,strong)UIView *difficultyMenu;
@property (nonatomic,strong)UILabel *rpeZoneLbl;
@property (nonatomic,strong)UIView *rpeLeftMenu;
@property (nonatomic,strong)UILabel *rpeTildeLbl;
@property (nonatomic,strong)UIView *rpeRightMenu;
@property (nonatomic,strong)UILabel *restLbl;
@property (nonatomic,strong)UIView *restLeftMenu;
@property (nonatomic,strong)UILabel *restMinLbl;
@property (nonatomic,strong)UIView *restRightMenu;
@property (nonatomic,strong)UILabel *restSecLbl;
@property (nonatomic,strong)UIButton *addBtn;
@property (nonatomic,strong)UIButton *removeBtn;
@end
