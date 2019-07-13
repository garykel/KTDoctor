//
//  StrengthTemplateCell.m
//  KTDoctor
//
//  Created by duwei on 2019/5/27.
//  Copyright © 2019 dz. All rights reserved.
//

#import "StrengthTemplateCell.h"
#define kBgView_LeftMargin 20
#define kInfoView_TopMargin 15
#define kInfoView_LeftMargin 16
#define kInfoView_RightMargin 48
#define kGroupNameLbl_TopMargin 15
#define kGroupNameLbl_LeftMargin 15
#define kGroupNameLbl_Width 70
#define kGroupNameLbl_Height 16
#define kGroupNameLbl_Fontsize 17.0

#define kWeightLbl_LeftMargin 16
#define kWeightLbl_TopMargin 18
#define kWeightLbl_BottomMargin 26
#define kWeightLbl_RightMargin 5
#define kWeightLbl_Width 64
#define kWeightLbl_Height 13
#define kWeightLbl_Fontsize 13.0
#define kWeightUnitLbl_FontSize 11.0
#define kMenu_Width 68
#define kMenu_Height 20
#define kDropdownHeight 30
#define kMenu_RightMargin  5
#define kTildeLbl_Width 7
#define kTildeLbl_Height 3
#define kMinLbl_Width 22
#define kMinLbl_Height 12
#define kRestTimeLbl_Width 54
#define kRestTimeLbl_Height 12
#define kAddBtn_LeftMargin 15
#define kAddBtn_Width 18
#define kAddBtn_BottomMargin 10
#define kListView_LeftMargin 16
#define kListBgView_LeftMargin 20
#define kCell_Height 118
#define kDifficultyMenu_RightMargin 29

@interface StrengthTemplateCell()<XXTGDropdownMenuDelegate>

@end

@implementation StrengthTemplateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideAllMenus) name:kHideCellDropDownNotification object:nil];
        [self setUI];
    }
    return self;
}

- (void)setUI {
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(kBgView_LeftMargin * kXScal, 0, kWidth - 2 * kBgView_LeftMargin * kXScal, (kCell_Height + kInfoView_TopMargin)* kYScal)];
    self.bgView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    [self.contentView addSubview:self.bgView];
    
    self.infoBgView = [[UIView alloc] initWithFrame:CGRectMake(kInfoView_LeftMargin * kXScal, kInfoView_TopMargin * kYScal, kWidth - 2 * kBgView_LeftMargin * kXScal - kInfoView_LeftMargin * kXScal - kInfoView_RightMargin* kXScal, kCell_Height * kYScal)];
    //    self.infoBgView.layer.cornerRadius = 4;
    //    self.infoBgView.layer.masksToBounds = YES;
    self.infoBgView.backgroundColor = [UIColor colorWithHexString:@"#F5FDFF"];
    [self.bgView addSubview:self.infoBgView];
    
    self.groupNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(kGroupNameLbl_LeftMargin * kXScal, kGroupNameLbl_TopMargin * kYScal, kGroupNameLbl_Width * kXScal, kGroupNameLbl_Height * kYScal)];
    self.groupNameLbl.text = self.model.title;
    self.groupNameLbl.textColor = [UIColor colorWithHexString:@"#0FAAC9"];
    self.groupNameLbl.font = [UIFont systemFontOfSize:kGroupNameLbl_Fontsize * kYScal];
    [self.infoBgView addSubview:self.groupNameLbl];
    
    //重量
    self.weightLbl = [[UILabel alloc] initWithFrame:CGRectMake(kWeightLbl_LeftMargin * kXScal,CGRectGetMaxY(self.groupNameLbl.frame) + kWeightLbl_TopMargin * kYScal, kWeightLbl_Width * kXScal, kWeightLbl_Height * kYScal)];
    self.weightLbl.font = [UIFont systemFontOfSize:kWeightLbl_Fontsize * kYScal];
    self.weightLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.weightLbl.text = @"重        量";
    [self.infoBgView addSubview:self.weightLbl];
    
    self.weightMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.weightLbl.frame) + kMenu_RightMargin * kXScal, 0, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    self.weightMenu.backgroundColor = [UIColor whiteColor];
    self.weightMenu.center = CGPointMake(CGRectGetMaxX(self.weightLbl.frame) + kMenu_RightMargin * kXScal + kMenu_Width * kXScal/2.0, self.weightLbl.center.y);
    [self.weightMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.weightMenu.delegate = self;
    self.weightMenu.titles = @[@"2.5",@"5.0",@"7.5",@"10.0",@"12.5"];
    [self.infoBgView addSubview:self.weightMenu];
    
    self.weightUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.weightMenu.frame) + kMenu_RightMargin * kXScal, 0, kMinLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.weightUnitLbl.font = [UIFont systemFontOfSize:kWeightUnitLbl_FontSize * kYScal];
    self.weightUnitLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.weightUnitLbl.center = CGPointMake(CGRectGetMaxX(self.weightMenu.frame) + kMenu_RightMargin * kXScal + kMinLbl_Width * kXScal/2.0, self.weightLbl.center.y);
    self.weightUnitLbl.text = @"kg";
    [self.infoBgView addSubview:self.weightUnitLbl];
    
    CGFloat space = (self.infoBgView.frame.size.width - 2 * kWeightLbl_LeftMargin * kXScal - 2 * (kWeightLbl_Width + kWeightLbl_RightMargin + 2 * kMenu_Width + kMinLbl_Width) * kXScal - (kWeightLbl_Width + kWeightLbl_RightMargin + 2 * kMenu_Width + 2 * kMinLbl_Width) * kXScal)/2;
    
    //次数
    self.timesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.weightUnitLbl.frame) + kWeightLbl_RightMargin * kXScal + kMenu_Width * kXScal + space, self.weightLbl.frame.origin.y, kRestTimeLbl_Width * kXScal, kRestTimeLbl_Height * kYScal)];
    self.timesLbl.font = [UIFont systemFontOfSize:kWeightLbl_Fontsize * kYScal];
    self.timesLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.timesLbl.text = @"次      数";
    [self.infoBgView addSubview:self.timesLbl];
    
    self.timesMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.timesLbl.frame) + kWeightLbl_RightMargin * kXScal, self.weightMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.timesMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.timesMenu.delegate = self;
    NSMutableArray *times = [NSMutableArray array];
    for (NSInteger i = 0; i < 20; i++) {
        [times addObject:[NSString stringWithFormat:@"%d",i + 1]];
    }
    self.timesMenu.titles = [times copy];
    [self.infoBgView addSubview:self.timesMenu];
    
    self.timesUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.timesMenu.frame) + kMenu_RightMargin * kXScal, 0, kMinLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.timesUnitLbl.text = @"次";
    self.timesUnitLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.timesUnitLbl.center = CGPointMake(CGRectGetMaxX(self.timesMenu.frame) + kMenu_RightMargin * kXScal + kMinLbl_Width * kXScal/2.0, self.timesMenu.center.y);
    self.timesUnitLbl.font = [UIFont systemFontOfSize:kWeightLbl_Fontsize * kYScal];
    [self.infoBgView addSubview:self.timesUnitLbl];
    
    //rpe区间
    self.rpeZoneLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.timesUnitLbl.frame) + 2 * kWeightLbl_RightMargin * kXScal + kMenu_Width * kXScal + kMinLbl_Width * kXScal + space, self.weightLbl.frame.origin.y, kWeightLbl_Width * kXScal, kWeightLbl_Height * kYScal)];
    self.rpeZoneLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.rpeZoneLbl.font = [UIFont systemFontOfSize:kWeightLbl_Fontsize *kYScal];
    self.rpeZoneLbl.text = @"RPE区间";
    [self.infoBgView addSubview:self.rpeZoneLbl];
    
    self.rpeLeftMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpeZoneLbl.frame) + kWeightLbl_RightMargin * kXScal, self.timesMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.rpeLeftMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.rpeLeftMenu.delegate = self;
    NSMutableArray *rpes = [NSMutableArray array];
    for (NSInteger i = 0; i <= 100; i++) {
        if (i%5==0) {
            CGFloat rpe = i /10.0;
            [rpes addObject:[NSString stringWithFormat:@"%.1f",rpe]];
        }
    }
    self.rpeLeftMenu.titles = [rpes copy];
    [self.infoBgView addSubview:self.rpeLeftMenu];
    
    self.rpeTildeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpeLeftMenu.frame) + kMenu_RightMargin * kXScal, 0, kTildeLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.rpeTildeLbl.text = @"~";
    self.rpeTildeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpeTildeLbl.font = [UIFont systemFontOfSize:kWeightLbl_Fontsize * kYScal];
    self.rpeTildeLbl.center = CGPointMake(CGRectGetMaxX(self.rpeLeftMenu.frame) + kMenu_RightMargin * kXScal + kTildeLbl_Width * kXScal/2.0, self.rpeLeftMenu.center.y);
    [self.infoBgView addSubview:self.rpeTildeLbl];
    
    self.rpeRightMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpeTildeLbl.frame) + kWeightLbl_RightMargin, self.rpeLeftMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.rpeRightMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.rpeRightMenu.delegate = self;
    NSMutableArray *rightRpes = [NSMutableArray array];
    for (NSInteger i = 5; i <= 100; i++) {
        if (i%5==0) {
            CGFloat rpe = i /10.0;
            [rightRpes addObject:[NSString stringWithFormat:@"%.1f",rpe]];
        }
    }
    self.rpeRightMenu.titles = [rightRpes copy];
    [self.infoBgView addSubview:self.rpeRightMenu];
    
    //旋转角度
    self.rotationAngleLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.weightLbl.frame.origin.x, CGRectGetMaxY(self.weightLbl.frame) + kWeightLbl_BottomMargin * kYScal, kWeightLbl_Width * kXScal, kWeightLbl_Height * kYScal)];
    self.rotationAngleLbl.font = [UIFont systemFontOfSize:kWeightLbl_Fontsize * kYScal];
    self.rotationAngleLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.rotationAngleLbl.text = @"旋转角度";
    [self.infoBgView addSubview:self.rotationAngleLbl];
    
    self.rotationAngleLeftMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rotationAngleLbl.frame) + kMenu_RightMargin * kXScal, 0, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    self.rotationAngleLeftMenu.center = CGPointMake(CGRectGetMaxX(self.rotationAngleLbl.frame) + kMenu_RightMargin * kXScal + kMenu_Width * kXScal/2.0, self.rotationAngleLbl.center.y);
    [self.rotationAngleLeftMenu setDropdownHeight:kDropdownHeight * kYScal];
    NSMutableArray *angles = [NSMutableArray array];
    for (NSInteger j = 0; j <= 18 ; j++) {
        [angles addObject:[NSString stringWithFormat:@"%d",j * 10]];
    }
    self.rotationAngleLeftMenu.delegate = self;
    self.rotationAngleLeftMenu.titles = [angles copy];
    [self.infoBgView addSubview:self.rotationAngleLeftMenu];
    
    self.rotationAngleTildeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.weightUnitLbl.frame.origin.x, 0, kTildeLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.rotationAngleTildeLbl.text = @"~";
    self.rotationAngleTildeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rotationAngleTildeLbl.font = [UIFont systemFontOfSize:kWeightLbl_Fontsize * kYScal];
    self.rotationAngleTildeLbl.center = CGPointMake(self.weightUnitLbl.frame.origin.x + kTildeLbl_Width * kXScal/2.0, self.rotationAngleLeftMenu.center.y);
    [self.infoBgView addSubview:self.rotationAngleTildeLbl];
    
    self.rotationAngleRightMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rotationAngleTildeLbl.frame) + kWeightLbl_RightMargin, self.rotationAngleLeftMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.rotationAngleRightMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.rotationAngleRightMenu.delegate = self;
    self.rotationAngleRightMenu.titles = [angles copy];
    [self.infoBgView addSubview:self.rotationAngleRightMenu];
    
    //组间休息
    self.restLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.timesLbl.frame.origin.x, self.rotationAngleLbl.frame.origin.y, kRestTimeLbl_Width * kXScal, kRestTimeLbl_Height * kYScal)];
    self.restLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.restLbl.font = [UIFont systemFontOfSize:kWeightLbl_Fontsize * kYScal];
    self.restLbl.text = @"组间休息";
    [self.infoBgView addSubview:self.restLbl];

    self.restLeftMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.timesMenu.frame.origin.x, self.rotationAngleLeftMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.restLeftMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.restLeftMenu.delegate = self;
    self.restLeftMenu.titles = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    [self.infoBgView addSubview:self.restLeftMenu];

    self.restMinLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.timesUnitLbl.frame.origin.x, 0, kMinLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.restMinLbl.text = @"min";
    self.restMinLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.restMinLbl.font = [UIFont systemFontOfSize:kWeightLbl_Fontsize * kYScal];
    self.restMinLbl.center = CGPointMake(self.timesUnitLbl.frame.origin.x + kMinLbl_Width * kXScal/2.0, self.restLeftMenu.center.y);
    [self.infoBgView addSubview:self.restMinLbl];

    self.restRightMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.restMinLbl.frame) + kWeightLbl_RightMargin * kXScal, self.restLeftMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.restRightMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.restRightMenu.delegate = self;
    NSMutableArray *seconds = [NSMutableArray array];
    for (NSInteger k = 0; k < 60; k++) {
        [seconds addObject:[NSString stringWithFormat:@"%d",k]];
    }
    self.restRightMenu.titles = [seconds copy];
    [self.infoBgView addSubview:self.restRightMenu];

    self.restSecLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.restRightMenu.frame) + kWeightLbl_RightMargin * kXScal, self.restMinLbl.frame.origin.y, kMinLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.restSecLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.restSecLbl.font = [UIFont systemFontOfSize:kWeightLbl_Fontsize * kYScal];
    self.restSecLbl.text = @"s";
    [self.infoBgView addSubview:self.restSecLbl];
    
    CGFloat topMargin = (self.bgView.frame.size.height - 2 * kAddBtn_Width * kYScal - kAddBtn_BottomMargin * kYScal)/2 + kInfoView_TopMargin * kYScal/2.0;
    self.addBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.infoBgView.frame) + kAddBtn_LeftMargin * kXScal, topMargin, kAddBtn_Width * kYScal, kAddBtn_Width * kYScal)];
    [self.addBtn setImage:[UIImage imageNamed:@"addGroup"] forState:UIControlStateNormal];
    self.addBtn.layer.cornerRadius = kAddBtn_Width * kYScal/2.0;
    self.addBtn.layer.masksToBounds = YES;
    [self.bgView addSubview:self.addBtn];
    
    self.removeBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.addBtn.frame.origin.x, CGRectGetMaxY(self.addBtn.frame) + kAddBtn_BottomMargin * kYScal, kAddBtn_Width * kYScal, kAddBtn_Width * kYScal)];
    [self.removeBtn setImage:[UIImage imageNamed:@"removeGroup"] forState:UIControlStateNormal];
    self.removeBtn.layer.cornerRadius = kAddBtn_Width * kYScal/2.0;
    self.removeBtn.layer.masksToBounds = YES;
    [self.bgView addSubview:self.removeBtn];
}

- (void)hideAllMenus {
    for (UIView *view in self.infoBgView.subviews) {
        if ([view isKindOfClass:[KTDropDownMenus class]]) {
            KTDropDownMenus *ktMenu = (KTDropDownMenus*)view;
            [ktMenu hiddenCityList];
        }
    }
}

#pragma mark - XXTGDropdownMenuDelegate

- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string
{
    if (menu == self.weightMenu) {
        CGFloat weight = [self.weightMenu.mainBtn.titleLabel.text floatValue];
        self.model.weight = weight;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ComputeWeightNotification" object:nil];
    } else if (menu == self.timesMenu) {
        NSInteger times = [self.timesMenu.mainBtn.titleLabel.text integerValue];
        self.model.times = times;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ComputeWeightNotification" object:nil];
    } else if (menu == self.rotationAngleLeftMenu) {
        NSInteger angle = [string integerValue];
        [self.rotationAngleLeftMenu.mainBtn setTitle:[NSString stringWithFormat:@"%d°",angle] forState:UIControlStateNormal];
        NSMutableArray *angles = [NSMutableArray array];
        for (NSInteger i = angle + 10; i <= 180; i++) {
            if (i%10==0) {
                [angles addObject:[NSString stringWithFormat:@"%d",i]];
            }
        }
        self.rotationAngleRightMenu.titles = [angles copy];
        [self.rotationAngleRightMenu.mTableView reloadData];
    } else if (menu == self.rotationAngleRightMenu) {
        NSInteger angle = [string integerValue];
        [self.rotationAngleRightMenu.mainBtn setTitle:[NSString stringWithFormat:@"%d°",angle] forState:UIControlStateNormal];
        NSString *title = self.rotationAngleLeftMenu.mainBtn.titleLabel.text;
        NSArray *leftAngles = [title componentsSeparatedByString:@"°"];
        if (leftAngles.count > 0) {
            self.model.rotationAngle = [NSString stringWithFormat:@"%@-%@",leftAngles[0],string];
        } else {
            self.model.rotationAngle = [NSString stringWithFormat:@"%@-%@",title,string];
        }
        NSMutableArray *angles = [NSMutableArray array];
        for (NSInteger i = 0; i <= angle - 10; i++) {
            if (i%10==0) {
                [angles addObject:[NSString stringWithFormat:@"%d",i]];
            }
        }
        self.rotationAngleLeftMenu.titles = [angles copy];
        [self.rotationAngleLeftMenu.mTableView reloadData];
    } else if (menu == self.rpeLeftMenu) {
        CGFloat rpeLeft = [string floatValue];
        CGFloat rpeRight = [self.rpeRightMenu.mainBtn.titleLabel.text floatValue];
        NSMutableArray *rpes = [NSMutableArray array];
        NSInteger rpe = (NSInteger)(rpeLeft * 10);
        for (NSInteger i = rpe + 5; i <= 100; i++) {
            if (i%5==0) {
                [rpes addObject:[NSString stringWithFormat:@"%.1f",i/10.0]];
            }
        }
        self.rpeRightMenu.titles = [rpes copy];
        [self.rpeRightMenu.mTableView reloadData];
        self.model.rpeRange = [NSString stringWithFormat:@"%.1f-%.1f",rpeLeft,rpeRight];
    } else if (menu == self.rpeRightMenu) {
        CGFloat rpeLeft = [self.rpeLeftMenu.mainBtn.titleLabel.text floatValue];
        CGFloat rpeRight = [string floatValue];
        NSMutableArray *rpes = [NSMutableArray array];
        NSInteger rpe = (NSInteger)(rpeRight * 10);
        for (NSInteger i = 0; i <= rpe - 5; i++) {
            if (i%5==0) {
                [rpes addObject:[NSString stringWithFormat:@"%.1f",i/10.0]];
            }
        }
        self.rpeLeftMenu.titles = [rpes copy];
        [self.rpeLeftMenu.mTableView reloadData];
        self.model.rpeRange = [NSString stringWithFormat:@"%.1f-%.1f",rpeLeft,rpeRight];
    } else if (menu == self.restLeftMenu) {
        NSInteger num = [string integerValue];
        if (num == 0) {
            NSMutableArray *items = [NSMutableArray array];
            for (NSInteger i = 20; i < 60; i++) {
                [items addObject:[NSString stringWithFormat:@"%d",i]];
            }
            [self.restRightMenu.mainBtn setTitle:@"20" forState:UIControlStateNormal];
            [self.restRightMenu.mainBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            self.restRightMenu.titles = [items copy];
            [self.restRightMenu.mTableView reloadData];
        } else if (num > 0) {
            NSMutableArray *items = [NSMutableArray array];
            for (NSInteger i = 0; i < 60; i++) {
                [items addObject:[NSString stringWithFormat:@"%d",i]];
            }
            self.restRightMenu.titles = [items copy];
            [self.restRightMenu.mTableView reloadData];
        }
        NSInteger sec = [self.restRightMenu.mainBtn.titleLabel.text integerValue];
        self.model.restDuration = num * 60 + sec;
    } else if (menu == self.rpeRightMenu) {
        NSInteger min = [self.restLeftMenu.mainBtn.titleLabel.text integerValue];
        self.model.restDuration = min * 60 + [string integerValue];
    }
}

- (void)dropdownMenu:(KTDropDownMenus *)menu mainBtnClick:(UIButton *)sender {
    [self hideOtherMenuExcept:menu];
    if (menu == self.restRightMenu) {
        NSString *leftRest = self.restLeftMenu.mainBtn.titleLabel.text;
        if (leftRest.length == 0 || [leftRest isEqualToString:@"0"]) {
            NSMutableArray *rightRests = [NSMutableArray array];
            for (NSInteger i = 20; i< 60; i++) {
                [rightRests addObject:[NSString stringWithFormat:@"%d",i]];
            }
            self.restRightMenu.titles = [rightRests copy];
            [self.restRightMenu.mTableView reloadData];
        }
    }
}

- (void)hideOtherMenuExcept:(KTDropDownMenus*)menu {
    for (UIView *view in self.infoBgView.subviews) {
        if ([view isKindOfClass:[KTDropDownMenus class]]) {
            KTDropDownMenus *ktMenu = (KTDropDownMenus*)view;
            if (ktMenu != menu) {
                [ktMenu hiddenCityList];
            }
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
