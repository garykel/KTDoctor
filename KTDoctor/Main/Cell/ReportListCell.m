//
//  ReportListCell.m
//  KTDoctor
//
//  Created by duwei on 2019/4/24.
//  Copyright © 2019 dz. All rights reserved.
//

#import "ReportListCell.h"
#define kSequenceImg_Width 36
#define kSequenceImg_Height 34
#define kSequenceLbl_FontSize 12.0
#define kSequenceLbl_Height 10
#define kAccomplishImg_Width 53
#define kAccomplishImg_LeftMargin 57
#define kAccomplishImg_TopMargin 83
#define kAccomplishImg_BottomMargin 59
#define kAccomplishImg_RightMargin 30
#define kAccomplishLbl_Height 8
#define kAccomplishLbl_FontSize 10.0
#define kAccomplishTitleLbl_TopMargin 8
#define kCalanderImg_Width 11
#define kCalanderImg_TopMargin 16
#define kCalanderImg_RightMargin 10
#define kStartTimeLbl_FontSize 13.0
#define kStartTimeLbl_Height 13
#define kStartTimeLbl_Width 240
#define kListView_Width kWidth - 2 * 15 - 2 * 20
#define kTitleView_TopMargin 15
#define kTitleView_RightMargin 15
#define kTitleView_Height 33
#define kRpeImg_Width 17
#define kTitleView_ItemLbl_FontSize 14.0
#define kPreLbl_FontSize 15.0
#define kPreLbl_Height 12
#define kPre_TopMargin 4
#define kPre_Width 62
#define kPreView_Height 67
@implementation ReportListCell

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
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    self.sequenceImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sequence"]];
    self.sequenceImg.frame = CGRectMake(0, 0, kSequenceImg_Width * kXScal, kSequenceImg_Height * kYScal);
    [self.contentView addSubview:self.sequenceImg];
    
    self.sequenceLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.sequenceImg.frame.size.width, kSequenceLbl_Height * kYScal)];
    self.sequenceLbl.textColor = [UIColor whiteColor];
    self.sequenceLbl.textAlignment = NSTextAlignmentCenter;
    self.sequenceLbl.center = CGPointMake(self.sequenceImg.frame.size.width/2.0, self.sequenceImg.frame.size.height/2.0);
    self.sequenceLbl.font = [UIFont systemFontOfSize:kSequenceLbl_FontSize * kYScal];
    [self.contentView addSubview:self.sequenceLbl];
    
    self.accomplishImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accomplish"]];
    self.accomplishImg.frame = CGRectMake(kAccomplishImg_LeftMargin * kXScal, kAccomplishImg_TopMargin * kYScal, kAccomplishImg_Width * kYScal, kAccomplishImg_Width * kYScal);
    [self.contentView addSubview:self.accomplishImg];
    
    self.percentLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.accomplishImg.frame.size.width, kAccomplishLbl_Height * kYScal)];
    self.percentLbl.textAlignment = NSTextAlignmentCenter;
    self.percentLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.percentLbl.font = [UIFont systemFontOfSize:kAccomplishLbl_FontSize * kYScal];
    self.percentLbl.center = self.accomplishImg.center;
    [self.contentView addSubview:self.percentLbl];
    
    self.accomplishLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.accomplishImg.frame.size.width, kAccomplishLbl_FontSize * kYScal)];
    self.accomplishLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.accomplishLbl.font = [UIFont systemFontOfSize:kAccomplishLbl_FontSize * kYScal];
    self.accomplishLbl.textAlignment = NSTextAlignmentCenter;
    self.accomplishLbl.text = @"完成度";
    CGFloat accomplishLbl_CenterY = CGRectGetMaxY(self.accomplishImg.frame) + kAccomplishTitleLbl_TopMargin * kYScal + kAccomplishLbl_FontSize * kYScal/2.0;
    self.accomplishLbl.center = CGPointMake(self.accomplishImg.center.x, accomplishLbl_CenterY);
    [self.contentView addSubview:self.accomplishLbl];
    
    self.timeImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calendar"]];
    self.timeImg.frame = CGRectMake(CGRectGetMaxX(self.accomplishImg.frame) + kAccomplishImg_RightMargin * kXScal, kCalanderImg_TopMargin * kYScal, kCalanderImg_Width * kYScal, kCalanderImg_Width * kYScal);
    [self.contentView addSubview:self.timeImg];
    
    CGFloat timeLbl_CenterX = CGRectGetMaxX(self.timeImg.frame) + kCalanderImg_RightMargin * kXScal + kStartTimeLbl_Width * kXScal / 2.0;
    self.startTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kStartTimeLbl_Width * kXScal, kStartTimeLbl_Height * kYScal)];
    self.startTimeLbl.font = [UIFont systemFontOfSize:kStartTimeLbl_FontSize * kYScal];
    self.startTimeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.startTimeLbl.center = CGPointMake(timeLbl_CenterX, self.timeImg.center.y);
    [self.contentView addSubview:self.startTimeLbl];
    
    CGFloat titleView_Width = kListView_Width - self.timeImg.frame.origin.x - kTitleView_RightMargin * kXScal;
    [self configTitleViewWithWidth:titleView_Width];
    [self configRpeViewWithWidth:titleView_Width];
}

- (void)configTitleViewWithWidth:(CGFloat)width {
    self.titleView = [[UIView alloc] initWithFrame:CGRectMake(self.timeImg.frame.origin.x,CGRectGetMaxY(self.startTimeLbl.frame) + kTitleView_TopMargin * kYScal, width, kTitleView_Height * kYScal)];
    self.titleView.backgroundColor = [UIColor whiteColor];
    self.titleView.layer.cornerRadius = 4;
    self.titleView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.titleView];
    
    CGFloat itemWidth = (width - 6 * 1)/7;
    self.totalTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, itemWidth, kTitleView_Height * kYScal)];
    self.totalTimeLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.totalTimeLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.totalTimeLbl.text = @"总时长";
    self.totalTimeLbl.textAlignment = NSTextAlignmentCenter;
    [self.titleView addSubview:self.totalTimeLbl];
    
    self.titleSeperateView1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.totalTimeLbl.frame), 0, 1, kTitleView_Height * kYScal)];
    self.titleSeperateView1.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.titleView addSubview:self.titleSeperateView1];
    
    self.middleLine = [[UILabel alloc] initWithFrame:CGRectMake(4, CGRectGetMaxY(self.titleView.frame), width - 2 * 4, 1)];
    self.middleLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.titleView addSubview:self.middleLine];
    
    self.valueView = [[UIView alloc] initWithFrame:CGRectMake(self.titleView.frame.origin.x, CGRectGetMaxY(self.middleLine.frame), width, kTitleView_Height * kYScal)];
    self.valueView.backgroundColor = [UIColor whiteColor];
    self.valueView.layer.cornerRadius = 4;
    self.valueView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.valueView];
    
    self.totalTimeValLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, itemWidth, kTitleView_Height * kYScal)];
    self.totalTimeValLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.totalTimeValLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.totalTimeValLbl.textAlignment = NSTextAlignmentCenter;
    [self.valueView addSubview:self.totalTimeValLbl];
    
    self.valueSeperateView1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.totalTimeValLbl.frame), 0, 1, kTitleView_Height * kYScal)];
    self.valueSeperateView1.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.valueView addSubview:self.valueSeperateView1];
    
    self.avgHrLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleSeperateView1.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.avgHrLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.avgHrLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.avgHrLbl.text = @"平均心率";
    self.avgHrLbl.textAlignment = NSTextAlignmentCenter;
    [self.titleView addSubview:self.avgHrLbl];
    
    self.titleSeperateView2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgHrLbl.frame), 0, 1, kTitleView_Height * kYScal)];
    self.titleSeperateView2.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.titleView addSubview:self.titleSeperateView2];
    
    self.avgHrValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.valueSeperateView1.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.avgHrValLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.avgHrValLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.avgHrValLbl.textAlignment = NSTextAlignmentCenter;
    [self.valueView addSubview:self.avgHrValLbl];
    
    self.valueSeperateView2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgHrValLbl.frame), 0, 1, kTitleView_Height * kYScal)];
    self.valueSeperateView2.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.valueView addSubview:self.valueSeperateView2];
    
    self.maxHrLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleSeperateView2.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.maxHrLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.maxHrLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.maxHrLbl.text = @"最大心率";
    self.maxHrLbl.textAlignment = NSTextAlignmentCenter;
    [self.titleView addSubview:self.maxHrLbl];
    
    self.titleSeperateView3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.maxHrLbl.frame), 0, 1, kTitleView_Height * kYScal)];
    self.titleSeperateView3.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.titleView addSubview:self.titleSeperateView3];
    
    self.maxHrValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.valueSeperateView2.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.maxHrValLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.maxHrValLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.maxHrValLbl.textAlignment = NSTextAlignmentCenter;
    [self.valueView addSubview:self.maxHrValLbl];
    
    self.valueSeperateView3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.maxHrValLbl.frame), 0, 1, kTitleView_Height * kYScal)];
    self.valueSeperateView3.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.valueView addSubview:self.valueSeperateView3];
    
    self.mileLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleSeperateView3.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.mileLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.mileLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.mileLbl.text = @"里程";
    self.mileLbl.textAlignment = NSTextAlignmentCenter;
    [self.titleView addSubview:self.mileLbl];
    
    self.titleSeperateView4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mileLbl.frame), 0, 1, kTitleView_Height * kYScal)];
    self.titleSeperateView4.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.titleView addSubview:self.titleSeperateView4];
    
    self.mileValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.valueSeperateView3.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.mileValLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.mileValLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.mileValLbl.textAlignment = NSTextAlignmentCenter;
    [self.valueView addSubview:self.mileValLbl];
    
    self.valueSeperateView4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mileValLbl.frame), 0, 1, kTitleView_Height * kYScal)];
    self.valueSeperateView4.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.valueView addSubview:self.valueSeperateView4];
    
    self.calorieLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleSeperateView4.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.calorieLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.calorieLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.calorieLbl.text = @"消耗";
    self.calorieLbl.textAlignment = NSTextAlignmentCenter;
    [self.titleView addSubview:self.calorieLbl];
    
    self.titleSeperateView5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.calorieLbl.frame), 0, 1, kTitleView_Height * kYScal)];
    self.titleSeperateView5.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.titleView addSubview:self.titleSeperateView5];
    
    self.calorieValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.valueSeperateView4.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.calorieValLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.calorieValLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.calorieValLbl.textAlignment = NSTextAlignmentCenter;
    [self.valueView addSubview:self.calorieValLbl];
    
    self.valueSeperateView5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.calorieValLbl.frame), 0, 1, kTitleView_Height * kYScal)];
    self.valueSeperateView5.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.valueView addSubview:self.valueSeperateView5];
    
    self.avgSpeedLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleSeperateView5.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.avgSpeedLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.avgSpeedLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.avgSpeedLbl.text = @"平均速度";
    self.avgSpeedLbl.textAlignment = NSTextAlignmentCenter;
    [self.titleView addSubview:self.avgSpeedLbl];
    
    self.titleSeperateView6 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgSpeedLbl.frame), 0, 1, kTitleView_Height * kYScal)];
    self.titleSeperateView6.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.titleView addSubview:self.titleSeperateView6];
    
    self.avgSpeedValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.valueSeperateView5.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.avgSpeedValLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.avgSpeedValLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.avgSpeedValLbl.textAlignment = NSTextAlignmentCenter;
    [self.valueView addSubview:self.avgSpeedValLbl];
    
    self.valueSeperateView6 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgSpeedValLbl.frame), 0, 1, kTitleView_Height * kYScal)];
    self.valueSeperateView6.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.valueView addSubview:self.valueSeperateView6];
    
    self.avgDifficultyLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleSeperateView6.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.avgDifficultyLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.avgDifficultyLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.avgDifficultyLbl.text = @"平均强度";
    self.avgDifficultyLbl.textAlignment = NSTextAlignmentCenter;
    [self.titleView addSubview:self.avgDifficultyLbl];
    
    self.avgDifficultyValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.valueSeperateView6.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.avgDifficultyValLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.avgDifficultyValLbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize];
    self.avgDifficultyValLbl.textAlignment = NSTextAlignmentCenter;
    [self.valueView addSubview:self.avgDifficultyValLbl];
}

- (void)configRpeViewWithWidth:(CGFloat)width {
    self.rpeView = [[UIView alloc] initWithFrame:CGRectMake(self.timeImg.frame.origin.x,CGRectGetMaxY(self.valueView.frame) + kPre_TopMargin * kYScal, width, kPreView_Height * kYScal)];
    self.rpeView.backgroundColor = [UIColor whiteColor];
    self.rpeView.layer.cornerRadius = 4;
    self.rpeView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.rpeView];
    
    self.rpeLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kPre_Width * kXScal, kPreView_Height * kYScal)];
    self.rpeLbl.text = @"RPE";
    self.rpeLbl.textAlignment = NSTextAlignmentCenter;
    self.rpeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpeLbl.font = [UIFont systemFontOfSize:kPreLbl_FontSize * kYScal];
    [self.rpeView addSubview:self.rpeLbl];
    
    self.rpeSeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpeLbl.frame), 0, 1, kPreView_Height * kYScal)];
    self.rpeSeperateLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpeSeperateLine];
    
    CGFloat itemWidth = (width - kPre_Width * kXScal - 12 * 1)/12;
    
    self.rpe1ImgBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpeSeperateLine.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.rpe1ImgBgView.backgroundColor = [UIColor clearColor];
    [self.rpeView addSubview:self.rpe1ImgBgView];
    
    self.rpeMiddleLine = [[UIView alloc] initWithFrame:CGRectMake(self.rpe1ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpe1ImgBgView.frame), width - kPre_Width * kXScal, 1)];
    self.rpeMiddleLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpeMiddleLine];
    
    self.rpe1Img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre1"]];
    self.rpe1Img.frame = CGRectMake(0, 0, kRpeImg_Width * kYScal, kRpeImg_Width * kYScal);
    CGFloat imgCenterX = itemWidth/2.0;
    CGFloat imgCenterY = kTitleView_Height * kYScal/2.0;
    self.rpe1Img.center = CGPointMake(imgCenterX, imgCenterY);
    [self.rpe1ImgBgView addSubview:self.rpe1Img];
    
    self.rpe1Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rpe1ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpeMiddleLine.frame), itemWidth, kTitleView_Height * kYScal)];
    self.rpe1Lbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpe1Lbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.rpe1Lbl.textAlignment = NSTextAlignmentCenter;
    [self.rpeView addSubview:self.rpe1Lbl];
    
    self.rpe1SeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe1ImgBgView.frame), 0, 1, kPreView_Height * kYScal)];
    self.rpe1SeperateLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpe1SeperateLine];
    
    self.rpe2ImgBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe1SeperateLine.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.rpe2ImgBgView.backgroundColor = [UIColor clearColor];
    [self.rpeView addSubview:self.rpe2ImgBgView];
    
    self.rpe2Img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre2"]];
    self.rpe2Img.frame = CGRectMake(0, 0, kRpeImg_Width * kYScal, kRpeImg_Width * kYScal);
    self.rpe2Img.center = CGPointMake(imgCenterX, imgCenterY);
    [self.rpe2ImgBgView addSubview:self.rpe2Img];
    
    self.rpe2Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rpe2ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpeMiddleLine.frame), itemWidth, kTitleView_Height * kYScal)];
    self.rpe2Lbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpe2Lbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.rpe2Lbl.textAlignment = NSTextAlignmentCenter;
    [self.rpeView addSubview:self.rpe2Lbl];
    
    self.rpe2SeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe2ImgBgView.frame), 0, 1, kPreView_Height * kYScal)];
    self.rpe2SeperateLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpe2SeperateLine];
    
    self.rpe3ImgBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe2SeperateLine.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.rpe3ImgBgView.backgroundColor = [UIColor clearColor];
    [self.rpeView addSubview:self.rpe3ImgBgView];
    
    self.rpe3Img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre3"]];
    self.rpe3Img.frame = CGRectMake(0, 0, kRpeImg_Width * kYScal, kRpeImg_Width * kYScal);
    self.rpe3Img.center = CGPointMake(imgCenterX, imgCenterY);
    [self.rpe3ImgBgView addSubview:self.rpe3Img];
    
    self.rpe3Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rpe3ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpeMiddleLine.frame), itemWidth, kTitleView_Height * kYScal)];
    self.rpe3Lbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpe3Lbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.rpe3Lbl.textAlignment = NSTextAlignmentCenter;
    [self.rpeView addSubview:self.rpe3Lbl];
    
    self.rpe3SeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe3ImgBgView.frame), 0, 1, kPreView_Height * kYScal)];
    self.rpe3SeperateLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpe3SeperateLine];
    
    self.rpe4ImgBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe3SeperateLine.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.rpe4ImgBgView.backgroundColor = [UIColor clearColor];
    [self.rpeView addSubview:self.rpe4ImgBgView];
    
    self.rpe4Img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre4"]];
    self.rpe4Img.frame = CGRectMake(0, 0, kRpeImg_Width * kYScal, kRpeImg_Width * kYScal);
    self.rpe4Img.center = CGPointMake(imgCenterX, imgCenterY);
    [self.rpe4ImgBgView addSubview:self.rpe4Img];
    
    self.rpe4Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rpe4ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpeMiddleLine.frame), itemWidth, kTitleView_Height * kYScal)];
    self.rpe4Lbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpe4Lbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.rpe4Lbl.textAlignment = NSTextAlignmentCenter;
    [self.rpeView addSubview:self.rpe4Lbl];
    
    self.rpe4SeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe4ImgBgView.frame), 0, 1, kPreView_Height * kYScal)];
    self.rpe4SeperateLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpe4SeperateLine];
    
    self.rpe5ImgBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe4SeperateLine.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.rpe5ImgBgView.backgroundColor = [UIColor clearColor];
    [self.rpeView addSubview:self.rpe5ImgBgView];
    
    self.rpe5Img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre5"]];
    self.rpe5Img.frame = CGRectMake(0, 0, kRpeImg_Width * kYScal, kRpeImg_Width * kYScal);
    self.rpe5Img.center = CGPointMake(imgCenterX, imgCenterY);
    [self.rpe5ImgBgView addSubview:self.rpe5Img];
    
    self.rpe5Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rpe5ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpeMiddleLine.frame), itemWidth, kTitleView_Height * kYScal)];
    self.rpe5Lbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpe5Lbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.rpe5Lbl.textAlignment = NSTextAlignmentCenter;
    [self.rpeView addSubview:self.rpe5Lbl];
    
    self.rpe5SeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe5ImgBgView.frame), 0, 1, kPreView_Height * kYScal)];
    self.rpe5SeperateLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpe5SeperateLine];
    
    self.rpe6ImgBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe5SeperateLine.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.rpe6ImgBgView.backgroundColor = [UIColor clearColor];
    [self.rpeView addSubview:self.rpe6ImgBgView];
    
    self.rpe6Img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre6"]];
    self.rpe6Img.frame = CGRectMake(0, 0, kRpeImg_Width * kYScal, kRpeImg_Width * kYScal);
    self.rpe6Img.center = CGPointMake(imgCenterX, imgCenterY);
    [self.rpe6ImgBgView addSubview:self.rpe6Img];
    
    self.rpe6Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rpe6ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpeMiddleLine.frame), itemWidth, kTitleView_Height * kYScal)];
    self.rpe6Lbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpe6Lbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.rpe6Lbl.textAlignment = NSTextAlignmentCenter;
    [self.rpeView addSubview:self.rpe6Lbl];
    
    self.rpe6SeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe6ImgBgView.frame), 0, 1, kPreView_Height * kYScal)];
    self.rpe6SeperateLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpe6SeperateLine];
    
    self.rpe7ImgBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe6SeperateLine.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.rpe7ImgBgView.backgroundColor = [UIColor clearColor];
    [self.rpeView addSubview:self.rpe7ImgBgView];
    
    self.rpe7Img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre7"]];
    self.rpe7Img.frame = CGRectMake(0, 0, kRpeImg_Width * kYScal, kRpeImg_Width * kYScal);
    self.rpe7Img.center = CGPointMake(imgCenterX, imgCenterY);
    [self.rpe7ImgBgView addSubview:self.rpe7Img];
    
    self.rpe7Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rpe7ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpeMiddleLine.frame), itemWidth, kTitleView_Height * kYScal)];
    self.rpe7Lbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpe7Lbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.rpe7Lbl.textAlignment = NSTextAlignmentCenter;
    [self.rpeView addSubview:self.rpe7Lbl];
    
    self.rpe7SeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe7ImgBgView.frame), 0, 1, kPreView_Height * kYScal)];
    self.rpe7SeperateLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpe7SeperateLine];
    
    self.rpe8ImgBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe7SeperateLine.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.rpe8ImgBgView.backgroundColor = [UIColor clearColor];
    [self.rpeView addSubview:self.rpe8ImgBgView];
    
    self.rpe8Img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre8"]];
    self.rpe8Img.frame = CGRectMake(0, 0, kRpeImg_Width * kYScal, kRpeImg_Width * kYScal);
    self.rpe8Img.center = CGPointMake(imgCenterX, imgCenterY);
    [self.rpe8ImgBgView addSubview:self.rpe8Img];
    
    self.rpe8Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rpe8ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpeMiddleLine.frame), itemWidth, kTitleView_Height * kYScal)];
    self.rpe8Lbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpe8Lbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.rpe8Lbl.textAlignment = NSTextAlignmentCenter;
    [self.rpeView addSubview:self.rpe8Lbl];
    
    self.rpe8SeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe8ImgBgView.frame), 0, 1, kPreView_Height * kYScal)];
    self.rpe8SeperateLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpe8SeperateLine];
    
    self.rpe9ImgBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe8SeperateLine.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.rpe9ImgBgView.backgroundColor = [UIColor clearColor];
    [self.rpeView addSubview:self.rpe9ImgBgView];
    
    self.rpe9Img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre9"]];
    self.rpe9Img.frame = CGRectMake(0, 0, kRpeImg_Width * kYScal, kRpeImg_Width * kYScal);
    self.rpe9Img.center = CGPointMake(imgCenterX, imgCenterY);
    [self.rpe9ImgBgView addSubview:self.rpe9Img];
    
    self.rpe9Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rpe9ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpeMiddleLine.frame), itemWidth, kTitleView_Height * kYScal)];
    self.rpe9Lbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpe9Lbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.rpe9Lbl.textAlignment = NSTextAlignmentCenter;
    [self.rpeView addSubview:self.rpe9Lbl];
    
    self.rpe9SeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe9ImgBgView.frame), 0, 1, kPreView_Height * kYScal)];
    self.rpe9SeperateLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpe9SeperateLine];
    
    self.rpe10ImgBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe9SeperateLine.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.rpe10ImgBgView.backgroundColor = [UIColor clearColor];
    [self.rpeView addSubview:self.rpe10ImgBgView];
    
    self.rpe10Img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre10"]];
    self.rpe10Img.frame = CGRectMake(0, 0, kRpeImg_Width * kYScal, kRpeImg_Width * kYScal);
    self.rpe10Img.center = CGPointMake(imgCenterX, imgCenterY);
    [self.rpe10ImgBgView addSubview:self.rpe10Img];
    
    self.rpe10Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rpe10ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpeMiddleLine.frame), itemWidth, kTitleView_Height * kYScal)];
    self.rpe10Lbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpe10Lbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.rpe10Lbl.textAlignment = NSTextAlignmentCenter;
    [self.rpeView addSubview:self.rpe10Lbl];
    
    self.rpe10SeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe10ImgBgView.frame), 0, 1, kPreView_Height * kYScal)];
    self.rpe10SeperateLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpe10SeperateLine];
    
    self.rpe11ImgBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe10SeperateLine.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.rpe11ImgBgView.backgroundColor = [UIColor clearColor];
    [self.rpeView addSubview:self.rpe11ImgBgView];
    
    self.rpe11Img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre11"]];
    self.rpe11Img.frame = CGRectMake(0, 0, kRpeImg_Width * kYScal, kRpeImg_Width * kYScal);
    self.rpe11Img.center = CGPointMake(imgCenterX, imgCenterY);
    [self.rpe11ImgBgView addSubview:self.rpe11Img];
    
    self.rpe11Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rpe11ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpeMiddleLine.frame), itemWidth, kTitleView_Height * kYScal)];
    self.rpe11Lbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpe11Lbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.rpe11Lbl.textAlignment = NSTextAlignmentCenter;
    [self.rpeView addSubview:self.rpe11Lbl];
    
    self.rpe11SeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe11ImgBgView.frame), 0, 1, kPreView_Height * kYScal)];
    self.rpe11SeperateLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.rpeView addSubview:self.rpe11SeperateLine];
    
    self.rpe12ImgBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rpe11SeperateLine.frame), 0, itemWidth, kTitleView_Height * kYScal)];
    self.rpe12ImgBgView.backgroundColor = [UIColor clearColor];
    [self.rpeView addSubview:self.rpe12ImgBgView];
    
    self.rpe12Img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre12"]];
    self.rpe12Img.frame = CGRectMake(0, 0, kRpeImg_Width * kYScal, kRpeImg_Width * kYScal);
    self.rpe12Img.center = CGPointMake(imgCenterX, imgCenterY);
    [self.rpe12ImgBgView addSubview:self.rpe12Img];
    
    self.rpe12Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rpe12ImgBgView.frame.origin.x, CGRectGetMaxY(self.rpeMiddleLine.frame), itemWidth, kTitleView_Height * kYScal)];
    self.rpe12Lbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.rpe12Lbl.font = [UIFont systemFontOfSize:kTitleView_ItemLbl_FontSize * kYScal];
    self.rpe12Lbl.textAlignment = NSTextAlignmentCenter;
    [self.rpeView addSubview:self.rpe12Lbl];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
