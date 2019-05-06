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
#define kGroupName_Width 43
#define kGroupName_Height 16
#define kItemLbl_LeftMargin 16
#define kItemLbl_TopMargin 18
#define kItemLbl_Height 13
#define kLongLbl_RightMargin 5
#define kLongLbl_BottomMargin 26
#define kLongLbl_Width 64
#define kItemLbl_FontSize 13.0
#define kPercentImg_Width 13
#define kPercentImg_RightMargin 15
#define kPercentTF_Width 61
#define kPercentTF_Height 20
#define kPercentTF_FontSize 13.0
#define kTilde_LeftMargin 9
#define kTilde_Width 7
#define kTilde_Height 3
#define kTilde_FontSize 13.0
#define kTrainingTimeLbl_Width 51
#define kTrainingTimeLbl_RightMargin 18
#define kTrainingTimeTF_Widht 45
#define kTrainingTimeTF_RightMargin 10
#define kMinLbl_Width 22
#define kMinLbl_Height 11
#define kDifficultyLbl_Width 48
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
    
    self.difficultyImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"difficulty"]];
    self.difficultyImg.layer.cornerRadius = kPercentImg_Width * kYScal/2.0;
    self.difficultyImg.layer.masksToBounds = YES;
    self.difficultyImg.frame = CGRectMake(0, 0, kPercentImg_Width * kYScal, kPercentImg_Width * kYScal);
    self.difficultyImg.center = CGPointMake(CGRectGetMaxX(self.difficultyPercentLbl.frame) + kLongLbl_RightMargin * kXScal + kPercentImg_Width * kYScal/2.0, self.difficultyPercentLbl.center.y);
    [self.contentView addSubview:self.difficultyImg];
    
    self.difficultyLeftTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.difficultyImg.frame) + kPercentImg_RightMargin * kXScal, 0, kPercentTF_Width * kXScal, kPercentTF_Height * kYScal)];
    self.difficultyLeftTF.backgroundColor = [UIColor whiteColor];
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
    self.difficultyRightTF.enabled = NO;
    self.difficultyRightTF.font = [UIFont systemFontOfSize:kPercentTF_FontSize * kYScal];
    [self.contentView addSubview:self.difficultyRightTF];
    
    CGFloat space = prescriptionListviewSize.width - kItemLbl_LeftMargin * kXScal - kLongLbl_Width * kXScal - kDifficultyLbl_RightMargin * kXScal - kPercentImg_Width * kXScal - kPercentImg_RightMargin * kXScal - kPercentTF_Width * kXScal - kTilde_LeftMargin * kXScal * 2 - kTilde_Width * kXScal - kPercentTF_Width * kXScal - (kTrainingTimeLbl_Width * kXScal + kTrainingTimeLbl_RightMargin * kXScal + kTrainingTimeTF_Widht * kXScal + kTrainingTimeTF_RightMargin * kXScal + kMinLbl_Width * kXScal + kTrainingTimeTF_RightMargin * kXScal + kTrainingTimeTF_Widht * kXScal * 2 + kMinLbl_Width * kXScal ) - (kDifficultyLbl_Width * kXScal + kTrainingTimeTF_RightMargin * kXScal + kTrainingTimeTF_RightMargin * kXScal) - kDifficultyTF_RightMargin * kXScal;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
