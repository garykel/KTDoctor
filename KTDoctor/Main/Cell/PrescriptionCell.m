//
//  PrescriptionCell.m
//  KTDoctor
//
//  Created by duwei on 2019/5/6.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PrescriptionCell.h"
#define kGroupName_LeftMargin 15
#define kGroupName_TopMargin 15
#define kGroupName_FontSize 17.0
#define kGroupName_Width 60
#define kGroupName_Height 16
#define kItemLbl_LeftMargin 16
#define kItemLbl_TopMargin 18
#define kItemLbl_Height 13
#define kLongLbl_RightMargin 5
#define kLongLbl_BottomMargin 26
#define kLongLbl_Width 70
#define kItemLbl_FontSize 13.0
#define kPercentImg_Width 30
#define kPercentImg_RightMargin 15
#define kPercentTF_Width 61
#define kPercentTF_Height 20
#define kPercentTF_FontSize 13.0
#define kTilde_LeftMargin 9
#define kTilde_Width 10
#define kTilde_Height 3
#define kTilde_FontSize 13.0
#define kTrainingTimeLbl_Width 58
#define kTrainingTimeLbl_RightMargin 18
#define kTrainingTimeTF_Widht 45
#define kTrainingTimeTF_RightMargin 10
#define kMinLbl_Width 22
#define kMinLbl_Height 11
#define kDifficultyLbl_Width 50
#define kDifficultyLbl_RightMargin 17
#define kDifficultyTF_RightMargin 41
extern CGSize prescriptionListviewSize;
@implementation PrescriptionCell

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
    self.groupNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(kGroupName_LeftMargin * kXScal, kGroupName_TopMargin * kYScal, kGroupName_Width * kXScal, kGroupName_Height * kYScal)];
    self.groupNameLbl.font = [UIFont systemFontOfSize:kGroupName_FontSize * kYScal];
    self.groupNameLbl.text = @"";
    self.groupNameLbl.textColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.contentView addSubview:self.groupNameLbl];
    
    self.difficultyPercentLbl = [[UILabel alloc] initWithFrame:CGRectMake(kItemLbl_LeftMargin * kXScal, CGRectGetMaxY(self.groupNameLbl.frame) + kItemLbl_TopMargin * kYScal, kLongLbl_Width * kXScal, kItemLbl_Height * kYScal)];
    self.difficultyPercentLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.difficultyPercentLbl.text = @"强度百分比";
    self.difficultyPercentLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    [self.contentView addSubview:self.difficultyPercentLbl];
    
    self.difficultyImg = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.difficultyImg setImage:[UIImage imageNamed:@"difficulty"] forState:UIControlStateNormal];
    self.difficultyImg.layer.cornerRadius = kPercentImg_Width * kXScal/2.0;
    self.difficultyImg.layer.masksToBounds = YES;
    self.difficultyImg.frame = CGRectMake(0, 0, kPercentImg_Width * kXScal, kPercentImg_Width * kXScal);
    self.difficultyImg.center = CGPointMake(CGRectGetMaxX(self.difficultyPercentLbl.frame) + kLongLbl_RightMargin * kXScal + kPercentImg_Width * kXScal/2.0, self.difficultyPercentLbl.center.y);
    [self.contentView addSubview:self.difficultyImg];
    
    self.difficultyLeftTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.difficultyImg.frame) + kPercentImg_RightMargin * kXScal, 0, kPercentTF_Width * kXScal, kPercentTF_Height * kYScal)];
    self.difficultyLeftTF.backgroundColor = [UIColor whiteColor];
    self.difficultyLeftTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.difficultyLeftTF.enabled = NO;
    self.difficultyLeftTF.center = CGPointMake(CGRectGetMaxX(self.difficultyImg.frame) + kPercentImg_RightMargin * kXScal + kPercentTF_Width * kXScal/2.0, self.difficultyPercentLbl.center.y);
    self.difficultyLeftTF.font = [UIFont systemFontOfSize:kPercentTF_FontSize * kYScal];
    [self.contentView addSubview:self.difficultyLeftTF];
    
    self.difficultyTildeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.difficultyLeftTF.frame) + kTilde_LeftMargin * kXScal, 0, kTilde_Width * kXScal, kTilde_Height * kYScal)];
    self.difficultyTildeLbl.text = @"~";
    self.difficultyTildeLbl.font = [UIFont systemFontOfSize:kTilde_FontSize * kYScal];
    self.difficultyTildeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.difficultyTildeLbl.center = CGPointMake(CGRectGetMaxX(self.difficultyLeftTF.frame) + kTilde_LeftMargin * kXScal + kTilde_Width * kXScal/2.0, self.difficultyPercentLbl.center.y);
    [self.contentView addSubview:self.difficultyTildeLbl];
    
    self.difficultyRightTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.difficultyTildeLbl.frame) + kTilde_LeftMargin * kXScal, self.difficultyLeftTF.frame.origin.y,kPercentTF_Width * kXScal, kPercentTF_Height * kYScal)];
    self.difficultyRightTF.backgroundColor = [UIColor whiteColor];
    self.difficultyRightTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.difficultyRightTF.enabled = NO;
    self.difficultyRightTF.font = [UIFont systemFontOfSize:kPercentTF_FontSize * kYScal];
    [self.contentView addSubview:self.difficultyRightTF];
    
    CGFloat space = (prescriptionListviewSize.width - kItemLbl_LeftMargin * kXScal - (kLongLbl_Width + kDifficultyLbl_RightMargin + kPercentImg_Width + kPercentImg_RightMargin + 2 * kPercentTF_Width + kTilde_LeftMargin * 2 + kTilde_Width) * kXScal - (kTrainingTimeLbl_Width + kTrainingTimeLbl_RightMargin + 2 * kTrainingTimeTF_Widht + 3 * kTrainingTimeTF_RightMargin + 2 * kMinLbl_Width) * kXScal - (kDifficultyLbl_Width + kDifficultyLbl_RightMargin + kTrainingTimeTF_Widht) * kXScal - kDifficultyTF_RightMargin * kXScal)/2;
    
    self.traingingTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.difficultyRightTF.frame) + space, self.difficultyPercentLbl.frame.origin.y, kTrainingTimeLbl_Width * kXScal, kItemLbl_Height * kYScal)];
    self.traingingTimeLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.traingingTimeLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.traingingTimeLbl.text = @"训练时长";
    [self.contentView addSubview:self.traingingTimeLbl];
    
    self.traingingTimeLeftTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.traingingTimeLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal, self.difficultyLeftTF.frame.origin.y, kTrainingTimeTF_Widht * kXScal, kPercentTF_Height * kYScal)];
    self.traingingTimeLeftTF.backgroundColor = [UIColor whiteColor];
    self.traingingTimeLeftTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.traingingTimeLeftTF.font = [UIFont systemFontOfSize:kPercentTF_FontSize * kYScal];
    self.traingingTimeLeftTF.enabled = NO;
    [self.contentView addSubview:self.traingingTimeLeftTF];
    
    self.traingingTimeMinLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.traingingTimeLeftTF.frame) + kTrainingTimeTF_RightMargin * kXScal, 0, kMinLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.traingingTimeMinLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.traingingTimeMinLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.traingingTimeMinLbl.text = @"min";
    self.traingingTimeMinLbl.center = CGPointMake(CGRectGetMaxX(self.traingingTimeLeftTF.frame) + kTrainingTimeTF_RightMargin * kXScal + kMinLbl_Width * kXScal/2.0, self.traingingTimeLbl.center.y);
    [self.contentView addSubview:self.traingingTimeMinLbl];
    
    self.traingingTimeRightTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.traingingTimeMinLbl.frame) + kTrainingTimeTF_RightMargin * kXScal, self.traingingTimeLeftTF.frame.origin.y, kTrainingTimeTF_Widht * kXScal, kPercentTF_Height * kYScal)];
    self.traingingTimeRightTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.traingingTimeRightTF.font = [UIFont systemFontOfSize:kPercentTF_FontSize * kYScal];
    self.traingingTimeRightTF.backgroundColor = [UIColor whiteColor];
    self.traingingTimeRightTF.enabled = NO;
    [self.contentView addSubview:self.traingingTimeRightTF];
    
    self.traingingTimeSecLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.traingingTimeRightTF.frame) + kTrainingTimeTF_RightMargin * kXScal, self.traingingTimeMinLbl.frame.origin.y, kMinLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.traingingTimeSecLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.traingingTimeMinLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.traingingTimeSecLbl.text = @"s";
    [self.contentView addSubview:self.traingingTimeSecLbl];
    
    self.difficultyLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.traingingTimeSecLbl.frame) + space, self.traingingTimeLbl.frame.origin.y, kDifficultyLbl_Width * kXScal,kItemLbl_Height * kYScal)];
    self.difficultyLbl.text = @"强      度";
    self.difficultyLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.difficultyLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    [self.contentView addSubview:self.difficultyLbl];
    
    self.difficultyTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.difficultyLbl.frame) + kDifficultyLbl_RightMargin, self.traingingTimeLeftTF.frame.origin.y, kTrainingTimeTF_Widht * kXScal, kPercentTF_Height * kYScal)];
    self.difficultyTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.difficultyTF.backgroundColor = [UIColor whiteColor];
    self.difficultyTF.font = [UIFont systemFontOfSize:kPercentTF_FontSize * kYScal];
    self.difficultyTF.enabled = NO;
    [self.contentView addSubview:self.difficultyTF];
    
    self.rpeZoneLbl = [[UILabel alloc] initWithFrame:CGRectMake(kItemLbl_LeftMargin * kXScal, CGRectGetMaxY(self.difficultyPercentLbl.frame) + kLongLbl_BottomMargin * kYScal, kLongLbl_Width * kXScal, kItemLbl_Height * kYScal)];
    self.rpeZoneLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.rpeZoneLbl.text = @"R P E 区 间";
    self.rpeZoneLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    [self.contentView addSubview:self.rpeZoneLbl];
    
    self.rpeLeftTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.difficultyImg.frame) + kPercentImg_RightMargin * kXScal, 0, kPercentTF_Width * kXScal, kPercentTF_Height * kYScal)];
    self.rpeLeftTF.backgroundColor = [UIColor whiteColor];
    self.rpeLeftTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpeLeftTF.enabled = NO;
    self.rpeLeftTF.center = CGPointMake(self.difficultyLeftTF.origin.x + kPercentTF_Width * kXScal/2.0, self.rpeZoneLbl.center.y);
    self.rpeLeftTF.font = [UIFont systemFontOfSize:kPercentTF_FontSize * kYScal];
    [self.contentView addSubview:self.rpeLeftTF];
    
    self.rpeTildeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpeLeftTF.frame) + kTilde_LeftMargin * kXScal, 0, kTilde_Width * kXScal, kTilde_Height * kYScal)];
    self.rpeTildeLbl.text = @"~";
    self.rpeTildeLbl.font = [UIFont systemFontOfSize:kTilde_FontSize * kYScal];
    self.rpeTildeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpeTildeLbl.center = CGPointMake(CGRectGetMaxX(self.rpeLeftTF.frame) + kTilde_LeftMargin * kXScal + kTilde_Width * kXScal/2.0, self.rpeZoneLbl.center.y);
    [self.contentView addSubview:self.rpeTildeLbl];
    
    self.rpeRightTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpeTildeLbl.frame) + kTilde_LeftMargin * kXScal, self.rpeLeftTF.frame.origin.y,kPercentTF_Width * kXScal, kPercentTF_Height * kYScal)];
    self.rpeRightTF.backgroundColor = [UIColor whiteColor];
    self.rpeRightTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpeRightTF.enabled = NO;
    self.rpeRightTF.font = [UIFont systemFontOfSize:kPercentTF_FontSize * kYScal];
    [self.contentView addSubview:self.rpeRightTF];
    
    self.restLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpeRightTF.frame) + space, self.rpeZoneLbl.frame.origin.y, kTrainingTimeLbl_Width * kXScal, kItemLbl_Height * kYScal)];
    self.restLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.restLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.restLbl.text = @"组间休息";
    [self.contentView addSubview:self.restLbl];
    
    self.restLeftTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.restLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal, self.rpeLeftTF.frame.origin.y, kTrainingTimeTF_Widht * kXScal, kPercentTF_Height * kYScal)];
    self.restLeftTF.backgroundColor = [UIColor whiteColor];
    self.restLeftTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.restLeftTF.font = [UIFont systemFontOfSize:kPercentTF_FontSize * kYScal];
    self.restLeftTF.enabled = NO;
    [self.contentView addSubview:self.restLeftTF];
    
    self.restMinLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.restLeftTF.frame) + kTrainingTimeTF_RightMargin * kXScal, 0, kMinLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.restMinLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.restMinLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.restMinLbl.text = @"min";
    self.restMinLbl.center = CGPointMake(CGRectGetMaxX(self.restLeftTF.frame) + kTrainingTimeTF_RightMargin * kXScal + kMinLbl_Width * kXScal/2.0, self.restLbl.center.y);
    [self.contentView addSubview:self.restMinLbl];
    
    self.restRightTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.restMinLbl.frame) + kTrainingTimeTF_RightMargin * kXScal, self.restLeftTF.frame.origin.y, kTrainingTimeTF_Widht * kXScal, kPercentTF_Height * kYScal)];
    self.restRightTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.restRightTF.font = [UIFont systemFontOfSize:kPercentTF_FontSize * kYScal];
    self.restRightTF.backgroundColor = [UIColor whiteColor];
    self.restRightTF.enabled = NO;
    [self.contentView addSubview:self.restRightTF];
    
    self.restSecLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.restRightTF.frame) + kTrainingTimeTF_RightMargin * kXScal, self.restMinLbl.frame.origin.y, kMinLbl_Width * kXScal, kMinLbl_Height * kYScal)];
    self.restSecLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.restSecLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.restSecLbl.text = @"s";
    [self.contentView addSubview:self.restSecLbl];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
