//
//  CreatePrescriptionCell.m
//  KTDoctor
//
//  Created by duwei on 2019/5/9.
//  Copyright © 2019 dz. All rights reserved.
//

#import "CreatePrescriptionCell.h"
#define kBgView_LeftMargin 20
#define kInfoView_TopMargin 15
#define kInfoView_LeftMargin 16
#define kInfoView_RightMargin 48
#define kGroupNameLbl_TopMargin 15
#define kGroupNameLbl_LeftMargin 15
#define kGroupNameLbl_Width 70
#define kGroupNameLbl_Height 16
#define kGroupNameLbl_Fontsize 17.0
#define kDifficultyPercentLbl_LeftMargin 16
#define kDifficultyPercentLbl_TopMargin 18
#define kDifficultyPercentLbl_BottomMargin 26
#define kDifficultyPercentLbl_RightMargin 5
#define kDifficultyPercentLbl_Width 64
#define kDifficultyPercentLbl_Height 13
#define kDifficultyPercentLbl_Fontsize 13.0
#define kDifficultyPercentImg_Widht 13
#define kDifficultyPercentImg_Right 15
#define kMenu_Width 68
#define kMenu_Height 20
#define kDropdownHeight 30
#define kMenu_RightMargin  9
#define kTildeLbl_Width 7
#define kTildeLbl_Height 3
#define kMinLbl_Width 22
#define kMinLbl_Height 11
#define kTrainingTimeLbl_Width 54
#define kTrainingTimeLbl_Height 12
#define kTrainingTimeLbl_Right 18
#define kDifficultyLbl_Width 48
#define kDifficultyLbl_Height 13
#define kAddBtn_LeftMargin 15
#define kAddBtn_Width 18
#define kAddBtn_BottomMargin 10
#define kListView_LeftMargin 16
#define kListBgView_LeftMargin 20
#define kCell_Height 118
#define kDifficultyMenu_RightMargin 29

@interface CreatePrescriptionCell()<XXTGDropdownMenuDelegate>

@end

@implementation CreatePrescriptionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
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
    
    self.difficultyPercentLbl = [[UILabel alloc] initWithFrame:CGRectMake(kDifficultyPercentLbl_LeftMargin * kXScal,CGRectGetMaxY(self.groupNameLbl.frame) + kDifficultyPercentLbl_TopMargin * kYScal, kGroupNameLbl_Width * kXScal, kDifficultyPercentLbl_Height * kYScal)];
    self.difficultyPercentLbl.font = [UIFont systemFontOfSize:kDifficultyPercentLbl_Fontsize * kYScal];
    self.difficultyPercentLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.difficultyPercentLbl.text = @"强度百分比";
    [self.infoBgView addSubview:self.difficultyPercentLbl];
    
    self.difficultyImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"difficulty"]];
    self.difficultyImg.frame = CGRectMake(kDifficultyPercentLbl_RightMargin * kXScal, 0, kDifficultyPercentImg_Widht * kYScal, kDifficultyPercentImg_Widht * kYScal);
    self.difficultyImg.center = CGPointMake(CGRectGetMaxX(self.difficultyPercentLbl.frame) + kDifficultyPercentLbl_RightMargin * kXScal + kDifficultyPercentImg_Widht * kYScal/2.0, self.difficultyPercentLbl.center.y);
    self.difficultyImg.layer.cornerRadius = kDifficultyPercentImg_Widht * kYScal/2.0;
    self.difficultyImg.layer.masksToBounds = YES;
    [self.infoBgView addSubview:self.difficultyImg];
    
    self.difficultyLeftMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.difficultyImg.frame) + kDifficultyPercentImg_Right * kXScal, 0, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    self.difficultyLeftMenu.backgroundColor = [UIColor whiteColor];
    self.difficultyLeftMenu.center = CGPointMake(CGRectGetMaxX(self.difficultyImg.frame) + kDifficultyPercentImg_Right * kXScal + kMenu_Width * kXScal/2.0, self.difficultyPercentLbl.center.y);
    [self.difficultyLeftMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.difficultyLeftMenu.delegate = self;
    self.difficultyLeftMenu.titles = @[@"5",@"10",@"15",@"20",@"25",@"30",@"35",@"40",@"45",@"50",@"55",@"60",@"65",@"70",@"75",@"80",@"85",@"90",@"95",@"100"];
    [self.infoBgView addSubview:self.difficultyLeftMenu];
    
    self.difficultyTildeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.difficultyLeftMenu.frame) + kMenu_RightMargin * kXScal, 0, kTildeLbl_Width * kXScal, kTildeLbl_Height * kYScal)];
    self.difficultyTildeLbl.font = [UIFont systemFontOfSize:kDifficultyPercentLbl_Fontsize * kYScal];
    self.difficultyTildeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.difficultyTildeLbl.center = CGPointMake(CGRectGetMaxX(self.difficultyLeftMenu.frame) + kMenu_RightMargin * kXScal + kTildeLbl_Width * kXScal/2.0, self.difficultyPercentLbl.center.y);
    self.difficultyTildeLbl.text = @"~";
    [self.infoBgView addSubview:self.difficultyTildeLbl];
    
    self.difficultyRightMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.difficultyTildeLbl.frame) + kMenu_RightMargin * kXScal, self.difficultyLeftMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.difficultyRightMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.difficultyRightMenu.delegate = self;
    self.difficultyRightMenu.titles = @[@"10",@"15",@"20",@"25",@"30",@"35",@"40",@"45",@"50",@"55",@"60",@"65",@"70",@"75",@"80",@"85",@"90",@"95",@"100"];
    [self.infoBgView addSubview:self.difficultyRightMenu];
    
    CGFloat space = (self.infoBgView.frame.size.width - kDifficultyPercentLbl_LeftMargin * kXScal - kDifficultyPercentLbl_Width * kXScal - kDifficultyPercentLbl_RightMargin * kXScal - kDifficultyPercentImg_Widht * kXScal -kDifficultyPercentImg_Right * kXScal - 2 * kMenu_Width * kXScal - kMenu_RightMargin * kXScal - kTildeLbl_Width * kXScal - kMenu_RightMargin * kXScal - kTrainingTimeLbl_Width * kXScal - kTrainingTimeLbl_Right * kXScal - 2 * kMenu_Width * kXScal - 2 * kMinLbl_Width * kXScal - 3 * kMenu_RightMargin * kXScal - kDifficultyLbl_Width * kXScal - kTrainingTimeLbl_Right - kMenu_Width * kXScal)/2;
    self.traingingTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.difficultyRightMenu.frame) + space, self.difficultyPercentLbl.frame.origin.y, kTrainingTimeLbl_Width * kXScal, kTrainingTimeLbl_Height * kYScal)];
    self.traingingTimeLbl.font = [UIFont systemFontOfSize:kDifficultyPercentLbl_Fontsize * kYScal];
    self.traingingTimeLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.traingingTimeLbl.text = @"训练时长";
    [self.infoBgView addSubview:self.traingingTimeLbl];
    
    self.traingingTimeLeftMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.traingingTimeLbl.frame) + kTrainingTimeLbl_Right * kXScal, self.difficultyRightMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.traingingTimeLeftMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.traingingTimeLeftMenu.delegate = self;
    NSMutableArray *times = [NSMutableArray array];
    for (NSInteger i = 0; i < 60; i++) {
        [times addObject:[NSString stringWithFormat:@"%d",i]];
    }
    self.traingingTimeLeftMenu.titles = [times copy];
    [self.infoBgView addSubview:self.traingingTimeLeftMenu];
    
    self.traingingTimeMinLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.traingingTimeLeftMenu.frame) + kMenu_RightMargin * kXScal, 0, kMinLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.traingingTimeMinLbl.text = @"min";
    self.traingingTimeMinLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.traingingTimeMinLbl.center = CGPointMake(CGRectGetMaxX(self.traingingTimeLeftMenu.frame) + kMenu_RightMargin * kXScal + kMinLbl_Width * kXScal/2.0, self.traingingTimeLeftMenu.center.y);
    self.traingingTimeMinLbl.font = [UIFont systemFontOfSize:kDifficultyPercentLbl_Fontsize * kYScal];
    [self.infoBgView addSubview:self.traingingTimeMinLbl];
    
    self.traingingTimeRightMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.traingingTimeMinLbl.frame) + kMenu_RightMargin * kXScal, self.traingingTimeLeftMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.traingingTimeRightMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.traingingTimeRightMenu.delegate = self;
    self.traingingTimeRightMenu.titles = [times copy];
    [self.infoBgView addSubview:self.traingingTimeRightMenu];
    
    self.traingingTimeSecLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.traingingTimeRightMenu.frame) + kMenu_RightMargin * kXScal, self.traingingTimeMinLbl.frame.origin.y, kMinLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.traingingTimeSecLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.traingingTimeSecLbl.font = [UIFont systemFontOfSize:kDifficultyPercentLbl_Fontsize * kYScal];
    self.traingingTimeSecLbl.text = @"s";
    [self.infoBgView addSubview:self.traingingTimeSecLbl];
    
    self.difficultyLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.traingingTimeSecLbl.frame) + space, self.traingingTimeLbl.frame.origin.y, kDifficultyLbl_Width * kXScal, kDifficultyLbl_Height * kYScal)];
    self.difficultyLbl.font = [UIFont systemFontOfSize:kDifficultyPercentLbl_Fontsize * kYScal];
    self.difficultyLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.difficultyLbl.text = @"强   度";
    [self.infoBgView addSubview:self.difficultyLbl];
    
    self.difficultyMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.difficultyLbl.frame) + kMenu_RightMargin * kXScal, self.traingingTimeRightMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.difficultyMenu setDropdownHeight:kDropdownHeight * kYScal];
    NSMutableArray *difficulties = [NSMutableArray array];
    for (NSInteger j = 0; j < 16 ; j++) {
        [difficulties addObject:[NSString stringWithFormat:@"%d",j + 1]];
    }
    self.difficultyMenu.delegate = self;
    self.difficultyMenu.titles = [difficulties copy];
    [self.infoBgView addSubview:self.difficultyMenu];
    
    self.rpeZoneLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.difficultyPercentLbl.frame.origin.x, CGRectGetMaxY(self.difficultyPercentLbl.frame) + kDifficultyPercentLbl_BottomMargin * kYScal, kDifficultyPercentLbl_Width * kXScal, kDifficultyPercentLbl_Height * kYScal)];
    self.rpeZoneLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.rpeZoneLbl.font = [UIFont systemFontOfSize:kDifficultyPercentLbl_Fontsize *kYScal];
    self.rpeZoneLbl.text = @"R P E 区间";
    [self.infoBgView addSubview:self.rpeZoneLbl];
    
    self.rpeLeftMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.difficultyLeftMenu.frame.origin.x, 0, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    self.rpeLeftMenu.center = CGPointMake(self.difficultyLeftMenu.frame.origin.x + kMenu_Width * kXScal/2.0, self.rpeZoneLbl.center.y);
    [self.rpeLeftMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.rpeLeftMenu.delegate = self;
    self.rpeLeftMenu.titles = @[@"0.0",@"0.5",@"1.0"];
    [self.infoBgView addSubview:self.rpeLeftMenu];
    
    self.rpeTildeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.difficultyTildeLbl.frame.origin.x, 0, kTildeLbl_Width * kXScal, kTildeLbl_Height * kYScal)];
    self.rpeTildeLbl.text = @"~";
    self.rpeTildeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpeTildeLbl.font = [UIFont systemFontOfSize:kDifficultyPercentLbl_Fontsize * kYScal];
    self.rpeTildeLbl.center = CGPointMake(self.difficultyTildeLbl.frame.origin.x + kTildeLbl_Width * kXScal/2.0, self.rpeLeftMenu.center.y);
    [self.infoBgView addSubview:self.rpeTildeLbl];
    
    self.rpeRightMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.difficultyRightMenu.frame.origin.x, self.rpeLeftMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.rpeRightMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.rpeRightMenu.delegate = self;
    self.rpeRightMenu.titles = @[@"0.0",@"0.5",@"1.0",@"1.5",@"2.0",@"2.5",@"3.0",@"3.5",@"4.0",@"4.5",@"5.0",@"5.5",@"6.0",@"6.5",@"7.0",@"7.5",@"8.0",@"8.5",@"9.0",@"9.5",@"10.0"];
    [self.infoBgView addSubview:self.rpeRightMenu];
    
    self.restLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.traingingTimeLbl.frame.origin.x, self.rpeZoneLbl.frame.origin.y, kTrainingTimeLbl_Width * kXScal, kTrainingTimeLbl_Height * kYScal)];
    self.restLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.restLbl.font = [UIFont systemFontOfSize:kDifficultyPercentLbl_Fontsize * kYScal];
    self.restLbl.text = @"组间休息";
    [self.infoBgView addSubview:self.restLbl];
    
    self.restLeftMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.traingingTimeLeftMenu.frame.origin.x, self.rpeLeftMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.restLeftMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.restLeftMenu.delegate = self;
    self.restLeftMenu.titles = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    [self.infoBgView addSubview:self.restLeftMenu];
    
    self.restMinLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.traingingTimeMinLbl.frame.origin.x, 0, kMinLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.restMinLbl.text = @"min";
    self.restMinLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.restMinLbl.font = [UIFont systemFontOfSize:kDifficultyPercentLbl_Fontsize * kYScal];
    self.restMinLbl.center = CGPointMake(self.traingingTimeMinLbl.frame.origin.x + kMinLbl_Width * kXScal/2.0, self.restLeftMenu.center.y);
    [self.infoBgView addSubview:self.restMinLbl];
    
    self.restRightMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.traingingTimeRightMenu.frame.origin.x, self.restLeftMenu.frame.origin.y, kMenu_Width * kXScal, kMenu_Height * kYScal)];
    [self.restRightMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.restRightMenu.delegate = self;
    NSMutableArray *seconds = [NSMutableArray array];
    for (NSInteger k = 0; k < 60; k++) {
        [seconds addObject:[NSString stringWithFormat:@"%d",k]];
    }
    self.restRightMenu.titles = [seconds copy];
    [self.infoBgView addSubview:self.restRightMenu];
    
    self.restSecLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.traingingTimeSecLbl.frame.origin.x, self.restMinLbl.frame.origin.y, kMinLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.restSecLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.restSecLbl.font = [UIFont systemFontOfSize:kDifficultyPercentLbl_Fontsize * kYScal];
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

#pragma mark - XXTGDropdownMenuDelegate

- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string
{
    if (menu == self.difficultyLeftMenu) {
        [self.difficultyLeftMenu.mainBtn setTitle:[NSString stringWithFormat:@"%@%%",string] forState:UIControlStateNormal];
        NSString *difficultyRight = self.difficultyRightMenu.mainBtn.titleLabel.text;
        self.model.hrRange = [NSString stringWithFormat:@"%@-%@",string,[difficultyRight substringToIndex:(difficultyRight.length - 1)]];
    } else if (menu == self.difficultyRightMenu) {
        [self.difficultyRightMenu.mainBtn setTitle:[NSString stringWithFormat:@"%@%%",string] forState:UIControlStateNormal];
        NSString *difficultyLeft = self.difficultyLeftMenu.mainBtn.titleLabel.text;
        self.model.hrRange = [NSString stringWithFormat:@"%@-%@",[difficultyLeft substringToIndex:(difficultyLeft.length - 1)],string];
    } else if (menu == self.traingingTimeLeftMenu) {
        NSInteger num = [string integerValue];
        if (num == 0) {
            NSMutableArray *items = [NSMutableArray array];
            for (NSInteger i = 20; i < 60; i++) {
                [items addObject:[NSString stringWithFormat:@"%d",i]];
            }
            self.traingingTimeRightMenu.titles = [items copy];
            [self.traingingTimeRightMenu.mTableView reloadData];
        } else if (num > 0) {
            NSMutableArray *items = [NSMutableArray array];
            for (NSInteger i = 0; i < 60; i++) {
                [items addObject:[NSString stringWithFormat:@"%d",i]];
            }
            self.traingingTimeRightMenu.titles = [items copy];
            [self.traingingTimeRightMenu.mTableView reloadData];
        }
        NSInteger sec = [self.traingingTimeRightMenu.mainBtn.titleLabel.text integerValue];
        self.model.duration = num * 60 + sec;
    } else if (menu == self.traingingTimeRightMenu) {
        NSInteger min = [self.traingingTimeLeftMenu.mainBtn.titleLabel.text integerValue];
        self.model.duration = min * 60 + [string integerValue];
    } else if (menu == self.difficultyMenu) {
        self.model.difficulty = string;
    } else if (menu == self.rpeLeftMenu) {
        self.model.rpeRange = [NSString stringWithFormat:@"%@-%@",string,self.rpeRightMenu.mainBtn.titleLabel.text];
    } else if (menu == self.rpeRightMenu) {
        self.model.rpeRange = [NSString stringWithFormat:@"%@-%@",self.rpeLeftMenu.mainBtn.titleLabel.text,string];
    } else if (menu == self.restLeftMenu) {
        NSInteger num = [string integerValue];
        if (num == 0) {
            NSMutableArray *items = [NSMutableArray array];
            for (NSInteger i = 20; i < 60; i++) {
                [items addObject:[NSString stringWithFormat:@"%d",i]];
            }
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

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
