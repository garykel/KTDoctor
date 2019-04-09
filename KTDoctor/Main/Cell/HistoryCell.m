//
//  HistoryCell.m
//  KTDoctor
//
//  Created by duwei on 2019/4/8.
//  Copyright © 2019 dz. All rights reserved.
//

#import "HistoryCell.h"
#define kHistory_HeadImg_TopMargin 10
#define kHistory_HeadImg_LeftMargin 45
#define kHistory_HeadImg_Width 70
#define kHistory_NameLbl_TopMargin 8
#define kHistory_NameLbl_Width 150
#define kHistory_Lbl_Height 15
#define kHistory_Lbl_FontSize 12.0
#define kHistory_IdLbl_TopMargin 10
#define kHistory_TypeButton_TopMargin 6
#define kHistory_TypeButton_Height 20
#define kHistory_TypeButton_Width 107
#define kHistory_CalendarImg_TopMargin 11
#define kHistory_CalendarImg_Width 12
#define kHistory_StartTimeLbl_Width 250
#define kHistory_StartTimeLbl_LeftMargin 14
#define kHistory_AccomplishView_TopMargin 14
#define kHistory_AccomplishView_LeftMargin 45
#define kHistory_AccomplishView_RightMargin 20
#define kHistory_AccomplishView_Height 26
#define kHistory_PreView_TopMargin 3
#define kHistory_PreView_PreLbl_Width 56
#define kHistory_PreView_Height 52
#define kHistory_PreView_NumberView_Width 15
#define kListView_Width kWidth - 2 * 18 * kXScal - 2 * 15

@interface HistoryCell ()
@property (nonatomic,strong)UIImageView *calendarImg;
@property (nonatomic,strong)UIView *topTitleView;
@property (nonatomic,strong)UILabel *accomplishLbl;
@property (nonatomic,strong)UIView *accomplishSeperateView;
@property (nonatomic,strong)UIView *accomplishValSeperateView;
@property (nonatomic,strong)UILabel *maxHrLbl;
@property (nonatomic,strong)UIView *maxHrSeperateView;
@property (nonatomic,strong)UIView *maxHrValSeperateView;
@property (nonatomic,strong)UILabel *avgHrLbl;
@property (nonatomic,strong)UIView *avgHrSeperateView;
@property (nonatomic,strong)UIView *avgHrValSeperateView;
@property (nonatomic,strong)UILabel *calorieLbl;
@property (nonatomic,strong)UIView *calorieSeperateView;
@property (nonatomic,strong)UIView *calorieValSeperateView;
@property (nonatomic,strong)UILabel *mileLbl;
@property (nonatomic,strong)UIView *mileSeperateView;
@property (nonatomic,strong)UIView *mileValSeperateView;
@property (nonatomic,strong)UILabel *avgSpeedLbl;
@property (nonatomic,strong)UIView *avgSpeedSeperateView;
@property (nonatomic,strong)UIView *avgSpeedValSeperateView;
@property (nonatomic,strong)UILabel *avgIntensityLbl;
@property (nonatomic,strong)UIView *avgIntensitySeperateView;
@property (nonatomic,strong)UIView *avgIntensityValSeperateView;
@property (nonatomic,strong)UILabel *totalTimeLbl;
@property (nonatomic,strong)UIView *topValueView;
@property (nonatomic,strong)UIView *preView;
@property (nonatomic,strong)UILabel *preLbl;
@property (nonatomic,strong)UIView *preSeperateView;
@property (nonatomic,strong)UIImageView *img1;
@property (nonatomic,strong)UIView *seperate1;
@property (nonatomic,strong)UIImageView *img2;
@property (nonatomic,strong)UIView *seperate2;
@property (nonatomic,strong)UIImageView *img3;
@property (nonatomic,strong)UIView *seperate3;
@property (nonatomic,strong)UIImageView *img4;
@property (nonatomic,strong)UIView *seperate4;
@property (nonatomic,strong)UIImageView *img5;
@property (nonatomic,strong)UIView *seperate5;
@property (nonatomic,strong)UIImageView *img6;
@property (nonatomic,strong)UIView *seperate6;
@property (nonatomic,strong)UIImageView *img7;
@property (nonatomic,strong)UIView *seperate7;
@property (nonatomic,strong)UIImageView *img8;
@property (nonatomic,strong)UIView *seperate8;
@property (nonatomic,strong)UIImageView *img9;
@property (nonatomic,strong)UIView *seperate9;
@property (nonatomic,strong)UIImageView *img10;
@property (nonatomic,strong)UIView *seperate10;
@property (nonatomic,strong)UIImageView *img11;
@property (nonatomic,strong)UIView *seperate11;
@property (nonatomic,strong)UIImageView *img12;
@property (nonatomic,strong)UIView *middleLine;
@end

@implementation HistoryCell

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
    self.headImg = [[UIImageView alloc] initWithFrame:CGRectMake(kHistory_HeadImg_LeftMargin * kXScal, kHistory_HeadImg_TopMargin * kYScal, kHistory_HeadImg_Width * kYScal, kHistory_HeadImg_Width * kYScal)];
    self.headImg.backgroundColor = [UIColor greenColor];
    self.headImg.layer.cornerRadius = kHistory_HeadImg_Width * kYScal / 2.0;
    self.headImg.layer.masksToBounds = YES;
    [self.contentView addSubview:self.headImg];
    
    self.nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kHistory_NameLbl_Width * kXScal, kHistory_Lbl_Height * kYScal)];
    self.nameLbl.textColor = [UIColor blackColor];
    self.nameLbl.textAlignment = NSTextAlignmentCenter;
    self.nameLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    CGFloat nameCenterY = CGRectGetMaxY(self.headImg.frame) + kHistory_NameLbl_TopMargin * kYScal + kHistory_Lbl_Height * kYScal / 2.0;
    self.nameLbl.center = CGPointMake(self.headImg.center.x, nameCenterY);
    [self.contentView addSubview:self.nameLbl];
    
    self.idLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kHistory_NameLbl_Width * kXScal, kHistory_Lbl_Height * kYScal)];
    self.idLbl.textColor = [UIColor blackColor];
    self.idLbl.textAlignment = NSTextAlignmentCenter;
    self.idLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    CGFloat idLblCenterY = CGRectGetMaxY(self.nameLbl.frame) + kHistory_IdLbl_TopMargin * kYScal + kHistory_Lbl_Height * kYScal / 2.0;
    self.idLbl.center = CGPointMake(self.headImg.center.x, idLblCenterY);
    [self.contentView addSubview:self.idLbl];
    
    self.patientTypeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.patientTypeBtn.backgroundColor = [UIColor whiteColor];
    self.patientTypeBtn.frame = CGRectMake(0, 0, kHistory_TypeButton_Width * kXScal, kHistory_TypeButton_Height * kYScal);
    CGFloat patientTypeCenterY = CGRectGetMaxY(self.idLbl.frame) + kHistory_PreView_TopMargin * kYScal + kHistory_TypeButton_Height * kYScal / 2.0;
    self.patientTypeBtn.center = CGPointMake(self.headImg.center.x, patientTypeCenterY);
    self.patientTypeBtn.layer.cornerRadius = 4;
    [self.patientTypeBtn.titleLabel setFont:[UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal]];
    self.patientTypeBtn.layer.masksToBounds = YES;
    [self.patientTypeBtn setTitleColor:[UIColor colorWithHexString:@"#69bbc9"] forState:UIControlStateNormal];
    self.patientTypeBtn.userInteractionEnabled = NO;
    [self.contentView addSubview:self.patientTypeBtn];
    
    self.calendarImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calendar"]];
    self.calendarImg.frame = CGRectMake(CGRectGetMaxX(self.headImg.frame) + kHistory_AccomplishView_LeftMargin * kXScal, kHistory_CalendarImg_TopMargin * kYScal, kHistory_CalendarImg_Width * kYScal, kHistory_CalendarImg_Width * kYScal);
    [self.contentView addSubview:self.calendarImg];
    
    self.startTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kHistory_StartTimeLbl_Width * kXScal, kHistory_Lbl_Height * kYScal)];
    self.startTimeLbl.textColor = [UIColor blackColor];
    self.startTimeLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    CGFloat startTimeCenterX = CGRectGetMaxX(self.calendarImg.frame) + kHistory_StartTimeLbl_LeftMargin * kXScal + kHistory_StartTimeLbl_Width * kXScal / 2.0;
    CGFloat startTimeCenterY = self.calendarImg.center.y;
    self.startTimeLbl.center = CGPointMake(startTimeCenterX, startTimeCenterY);
    [self.contentView addSubview:self.startTimeLbl];
    
    CGFloat accomplishViewWidth = kListView_Width - self.calendarImg.frame.origin.x - kHistory_AccomplishView_RightMargin * kXScal;
    [self configUpperViewWithWidth:accomplishViewWidth];
    [self configPreViewWithWidth:accomplishViewWidth];
}

- (void)configUpperViewWithWidth:(CGFloat)width {
    self.topTitleView = [[UIView alloc] initWithFrame:CGRectMake(self.calendarImg.frame.origin.x, CGRectGetMaxY(self.startTimeLbl.frame) + kHistory_AccomplishView_TopMargin * kYScal, width, kHistory_AccomplishView_Height * kYScal)];
    self.topTitleView.backgroundColor = [UIColor whiteColor];
    self.topTitleView.layer.cornerRadius = 4;
    self.topTitleView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.topTitleView];
    
    CGFloat lblWidth = (width - 7 * 1)/8;
    self.accomplishLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.accomplishLbl.textColor = [UIColor blackColor];
    self.accomplishLbl.textAlignment = NSTextAlignmentCenter;
    self.accomplishLbl.text = @"完成度";
    self.accomplishLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topTitleView addSubview:self.accomplishLbl];
    
    self.accomplishSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.accomplishLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.accomplishSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topTitleView addSubview:self.accomplishSeperateView];
    
    self.maxHrLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.accomplishSeperateView.frame), 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.maxHrLbl.textColor = [UIColor blackColor];
    self.maxHrLbl.textAlignment = NSTextAlignmentCenter;
    self.maxHrLbl.text = @"最大心率";
    self.maxHrLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topTitleView addSubview:self.maxHrLbl];
    
    self.maxHrSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.maxHrLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.maxHrSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topTitleView addSubview:self.maxHrSeperateView];
    
    self.avgHrLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.maxHrSeperateView.frame), 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.avgHrLbl.textColor = [UIColor blackColor];
    self.avgHrLbl.textAlignment = NSTextAlignmentCenter;
    self.avgHrLbl.text = @"平均心率";
    self.avgHrLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topTitleView addSubview:self.avgHrLbl];
    
    self.avgHrSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgHrLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.avgHrSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topTitleView addSubview:self.avgHrSeperateView];
    
    self.calorieLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgHrSeperateView.frame), 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.calorieLbl.textColor = [UIColor blackColor];
    self.calorieLbl.textAlignment = NSTextAlignmentCenter;
    self.calorieLbl.text = @"消耗";
    self.calorieLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topTitleView addSubview:self.calorieLbl];
    
    self.calorieSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.calorieLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.calorieSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topTitleView addSubview:self.calorieSeperateView];
    
    self.mileLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.calorieSeperateView.frame), 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.mileLbl.textColor = [UIColor blackColor];
    self.mileLbl.textAlignment = NSTextAlignmentCenter;
    self.mileLbl.text = @"里程";
    self.mileLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topTitleView addSubview:self.mileLbl];
    
    self.mileSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mileLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.mileSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topTitleView addSubview:self.mileSeperateView];
    
    self.avgSpeedLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mileSeperateView.frame), 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.avgSpeedLbl.textColor = [UIColor blackColor];
    self.avgSpeedLbl.textAlignment = NSTextAlignmentCenter;
    self.avgSpeedLbl.text = @"平均速度";
    self.avgSpeedLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topTitleView addSubview:self.avgSpeedLbl];
    
    self.avgSpeedSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgSpeedLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.avgSpeedSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topTitleView addSubview:self.avgSpeedSeperateView];
    
    self.avgIntensityLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgSpeedSeperateView.frame), 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.avgIntensityLbl.textColor = [UIColor blackColor];
    self.avgIntensityLbl.textAlignment = NSTextAlignmentCenter;
    self.avgIntensityLbl.text = @"平均强度";
    self.avgIntensityLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topTitleView addSubview:self.avgIntensityLbl];
    
    self.avgIntensitySeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgIntensityLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.avgIntensitySeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topTitleView addSubview:self.avgIntensitySeperateView];
    
    self.totalTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgIntensitySeperateView.frame), 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.totalTimeLbl.textColor = [UIColor blackColor];
    self.totalTimeLbl.textAlignment = NSTextAlignmentCenter;
    self.totalTimeLbl.text = @"总时长";
    self.totalTimeLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topTitleView addSubview:self.totalTimeLbl];
    
    self.topValueView = [[UIView alloc] initWithFrame:CGRectMake(self.calendarImg.frame.origin.x, CGRectGetMaxY(self.topTitleView.frame) + 1, width, kHistory_AccomplishView_Height * kYScal)];
    self.topValueView.backgroundColor = [UIColor whiteColor];
    self.topValueView.layer.cornerRadius = 4;
    self.topValueView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.topValueView];
    
    self.accomplishValLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.accomplishValLbl.textColor = [UIColor blackColor];
    self.accomplishValLbl.textAlignment = NSTextAlignmentCenter;
    self.accomplishValLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topValueView addSubview:self.accomplishValLbl];
    
    self.accomplishValSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.accomplishValLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.accomplishValSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topValueView addSubview:self.accomplishValSeperateView];
    
    self.maxHrValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.accomplishValLbl.frame) + 1, 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.maxHrValLbl.textColor = [UIColor blackColor];
    self.maxHrValLbl.textAlignment = NSTextAlignmentCenter;
    self.maxHrValLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topValueView addSubview:self.maxHrValLbl];
    
    self.maxHrValSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.maxHrValLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.maxHrValSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topValueView addSubview:self.maxHrValSeperateView];
    
    self.avgHrValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.maxHrValLbl.frame) + 1, 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.avgHrValLbl.textColor = [UIColor blackColor];
    self.avgHrValLbl.textAlignment = NSTextAlignmentCenter;
    self.avgHrValLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topValueView addSubview:self.avgHrValLbl];
    
    self.avgHrValSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgHrValLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.avgHrValSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topValueView addSubview:self.avgHrValSeperateView];
    
    self.calorieValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgHrValLbl.frame) + 1, 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.calorieValLbl.textColor = [UIColor blackColor];
    self.calorieValLbl.textAlignment = NSTextAlignmentCenter;
    self.calorieValLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topValueView addSubview:self.calorieValLbl];
    
    self.calorieValSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.calorieValLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.calorieValSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topValueView addSubview:self.calorieValSeperateView];
    
    self.mileValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.calorieValLbl.frame) + 1, 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.mileValLbl.textColor = [UIColor blackColor];
    self.mileValLbl.textAlignment = NSTextAlignmentCenter;
    self.mileValLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topValueView addSubview:self.mileValLbl];
    
    self.mileValSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mileValLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.mileValSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topValueView addSubview:self.mileValSeperateView];
    
    self.avgSpeedValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mileValLbl.frame) + 1, 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.avgSpeedValLbl.textColor = [UIColor blackColor];
    self.avgSpeedValLbl.textAlignment = NSTextAlignmentCenter;
    self.avgSpeedValLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topValueView addSubview:self.avgSpeedValLbl];
    
    self.avgSpeedValSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgSpeedValLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.avgSpeedValSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topValueView addSubview:self.avgSpeedValSeperateView];
    
    self.avgIntensityValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgSpeedValLbl.frame) + 1, 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.avgIntensityValLbl.textColor = [UIColor blackColor];
    self.avgIntensityValLbl.textAlignment = NSTextAlignmentCenter;
    self.avgIntensityValLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topValueView addSubview:self.avgIntensityValLbl];
    
    self.avgIntensityValSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgIntensityValLbl.frame), 0, 1, kHistory_AccomplishView_Height * kYScal )];
    self.avgIntensityValSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.topValueView addSubview:self.avgIntensityValSeperateView];
    
    self.totalTimeValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgIntensityValLbl.frame) + 1, 0, lblWidth, kHistory_AccomplishView_Height * kYScal)];
    self.totalTimeValLbl.textColor = [UIColor blackColor];
    self.totalTimeValLbl.textAlignment = NSTextAlignmentCenter;
    self.totalTimeValLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    [self.topValueView addSubview:self.totalTimeValLbl];
}

- (void)configPreViewWithWidth:(CGFloat)width {
    self.preView = [[UIView alloc] initWithFrame:CGRectMake(self.calendarImg.frame.origin.x, CGRectGetMaxY(self.topValueView.frame) + kHistory_PreView_TopMargin * kYScal, width, kHistory_PreView_Height * kYScal)];
    self.preView.backgroundColor = [UIColor whiteColor];
    self.preView.layer.cornerRadius = 4;
    self.preView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.preView];
    
    self.preLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kHistory_PreView_PreLbl_Width * kXScal, kHistory_PreView_Height * kYScal)];
    self.preLbl.textColor = [UIColor blackColor];
    self.preLbl.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preLbl.text = @"PRE";
    self.preLbl.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preLbl];
    
    self.preSeperateView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.preLbl.frame), 0, 1, kHistory_PreView_Height * kYScal)];
    self.preSeperateView.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.preSeperateView];
    
    CGFloat lblHeight = (kHistory_PreView_Height * kYScal - 1)/2;
    self.middleLine = [[UIView alloc] initWithFrame:CGRectMake(kHistory_PreView_PreLbl_Width * kXScal, lblHeight, width - CGRectGetMaxX(self.preSeperateView.frame) -1, 1)];
    self.middleLine.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.middleLine];
    
    CGFloat blockWidth = (width - kHistory_PreView_PreLbl_Width * kXScal - 12 * 1)/12;
    CGFloat imgLeftMargin = (blockWidth - kHistory_PreView_NumberView_Width * kYScal)/2;
    CGFloat imgTopMargin = (lblHeight - kHistory_PreView_NumberView_Width * kYScal)/2;
    
    self.img1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre1"]];
    self.img1.frame = CGRectMake(CGRectGetMaxX(self.preSeperateView.frame) + imgLeftMargin, imgTopMargin, kHistory_PreView_NumberView_Width, kHistory_PreView_NumberView_Width);
    [self.preView addSubview:self.img1];
    
    self.preValLbl1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.preSeperateView.frame), CGRectGetMaxY(self.middleLine.frame), blockWidth, lblHeight)];
    self.preValLbl1.textColor = [UIColor blackColor];
    self.preValLbl1.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preValLbl1.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preValLbl1];
    
    self.seperate1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.preSeperateView.frame) + blockWidth, 0, 1, kHistory_PreView_Height * kYScal)];
    self.seperate1.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.seperate1];
    
    self.img2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre2"]];
    self.img2.frame = CGRectMake(CGRectGetMaxX(self.seperate1.frame) + imgLeftMargin, imgTopMargin, kHistory_PreView_NumberView_Width, kHistory_PreView_NumberView_Width);
    [self.preView addSubview:self.img2];
    
    self.preValLbl2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate1.frame), CGRectGetMaxY(self.middleLine.frame), blockWidth, lblHeight)];
    self.preValLbl2.textColor = [UIColor blackColor];
    self.preValLbl2.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preValLbl2.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preValLbl2];
    
    self.seperate2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate1.frame) + blockWidth, 0, 1, kHistory_PreView_Height * kYScal)];
    self.seperate2.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.seperate2];
    
    self.img3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre3"]];
    self.img3.frame = CGRectMake(CGRectGetMaxX(self.seperate2.frame) + imgLeftMargin, imgTopMargin, kHistory_PreView_NumberView_Width, kHistory_PreView_NumberView_Width);
    [self.preView addSubview:self.img3];
    
    self.preValLbl3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate2.frame), CGRectGetMaxY(self.middleLine.frame), blockWidth, lblHeight)];
    self.preValLbl3.textColor = [UIColor blackColor];
    self.preValLbl3.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preValLbl3.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preValLbl3];
    
    self.seperate3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate2.frame) + blockWidth, 0, 1, kHistory_PreView_Height * kYScal)];
    self.seperate3.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.seperate3];
    
    self.img4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre4"]];
    self.img4.frame = CGRectMake(CGRectGetMaxX(self.seperate3.frame) + imgLeftMargin, imgTopMargin, kHistory_PreView_NumberView_Width, kHistory_PreView_NumberView_Width);
    [self.preView addSubview:self.img4];
    
    self.preValLbl4 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate3.frame), CGRectGetMaxY(self.middleLine.frame), blockWidth, lblHeight)];
    self.preValLbl4.textColor = [UIColor blackColor];
    self.preValLbl4.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preValLbl4.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preValLbl4];
    
    self.seperate4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate3.frame) + blockWidth, 0, 1, kHistory_PreView_Height * kYScal)];
    self.seperate4.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.seperate4];

    self.img5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre5"]];
    self.img5.frame = CGRectMake(CGRectGetMaxX(self.seperate4.frame) + imgLeftMargin, imgTopMargin, kHistory_PreView_NumberView_Width, kHistory_PreView_NumberView_Width);
    [self.preView addSubview:self.img5];
    
    self.preValLbl5 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate4.frame), CGRectGetMaxY(self.middleLine.frame), blockWidth, lblHeight)];
    self.preValLbl5.textColor = [UIColor blackColor];
    self.preValLbl5.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preValLbl5.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preValLbl5];
    
    self.seperate5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate4.frame) + blockWidth, 0, 1, kHistory_PreView_Height * kYScal)];
    self.seperate5.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.seperate5];

    self.img6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre6"]];
    self.img6.frame = CGRectMake(CGRectGetMaxX(self.seperate5.frame) + imgLeftMargin, imgTopMargin, kHistory_PreView_NumberView_Width, kHistory_PreView_NumberView_Width);
    [self.preView addSubview:self.img6];
    
    self.preValLbl6 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate5.frame), CGRectGetMaxY(self.middleLine.frame), blockWidth, lblHeight)];
    self.preValLbl6.textColor = [UIColor blackColor];
    self.preValLbl6.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preValLbl6.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preValLbl6];
    
    self.seperate6 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate5.frame) + blockWidth, 0, 1, kHistory_PreView_Height * kYScal)];
    self.seperate6.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.seperate6];

    self.img7 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre7"]];
    self.img7.frame = CGRectMake(CGRectGetMaxX(self.seperate6.frame) + imgLeftMargin, imgTopMargin, kHistory_PreView_NumberView_Width, kHistory_PreView_NumberView_Width);
    [self.preView addSubview:self.img7];
    
    self.preValLbl7 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate6.frame), CGRectGetMaxY(self.middleLine.frame), blockWidth, lblHeight)];
    self.preValLbl7.textColor = [UIColor blackColor];
    self.preValLbl7.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preValLbl7.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preValLbl7];
    
    self.seperate7 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate6.frame) + blockWidth, 0, 1, kHistory_PreView_Height * kYScal)];
    self.seperate7.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.seperate7];

    self.img8 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre8"]];
    self.img8.frame = CGRectMake(CGRectGetMaxX(self.seperate7.frame) + imgLeftMargin, imgTopMargin, kHistory_PreView_NumberView_Width, kHistory_PreView_NumberView_Width);
    [self.preView addSubview:self.img8];
    
    self.preValLbl8 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate7.frame), CGRectGetMaxY(self.middleLine.frame), blockWidth, lblHeight)];
    self.preValLbl8.textColor = [UIColor blackColor];
    self.preValLbl8.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preValLbl8.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preValLbl8];
    
    self.seperate8 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate7.frame) + blockWidth, 0, 1, kHistory_PreView_Height * kYScal)];
    self.seperate8.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.seperate8];

    self.img9 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre9"]];
    self.img9.frame = CGRectMake(CGRectGetMaxX(self.seperate8.frame) + imgLeftMargin, imgTopMargin, kHistory_PreView_NumberView_Width, kHistory_PreView_NumberView_Width);
    [self.preView addSubview:self.img9];
    
    self.preValLbl9 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate8.frame), CGRectGetMaxY(self.middleLine.frame), blockWidth, lblHeight)];
    self.preValLbl9.textColor = [UIColor blackColor];
    self.preValLbl9.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preValLbl9.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preValLbl9];
    
    self.seperate9 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate8.frame) + blockWidth, 0, 1, kHistory_PreView_Height * kYScal)];
    self.seperate9.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.seperate9];

    self.img10 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre10"]];
    self.img10.frame = CGRectMake(CGRectGetMaxX(self.seperate9.frame) + imgLeftMargin, imgTopMargin, kHistory_PreView_NumberView_Width, kHistory_PreView_NumberView_Width);
    [self.preView addSubview:self.img10];
    
    self.preValLbl10 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate9.frame), CGRectGetMaxY(self.middleLine.frame), blockWidth, lblHeight)];
    self.preValLbl10.textColor = [UIColor blackColor];
    self.preValLbl10.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preValLbl10.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preValLbl10];
    
    self.seperate10 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate9.frame) + blockWidth, 0, 1, kHistory_PreView_Height * kYScal)];
    self.seperate10.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.seperate10];

    self.img11 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre11"]];
    self.img11.frame = CGRectMake(CGRectGetMaxX(self.seperate10.frame) + imgLeftMargin, imgTopMargin, kHistory_PreView_NumberView_Width, kHistory_PreView_NumberView_Width);
    [self.preView addSubview:self.img11];
    
    self.preValLbl11 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate10.frame), CGRectGetMaxY(self.middleLine.frame), blockWidth, lblHeight)];
    self.preValLbl11.textColor = [UIColor blackColor];
    self.preValLbl11.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preValLbl11.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preValLbl11];
    
    self.seperate11 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate10.frame) + blockWidth, 0, 1, kHistory_PreView_Height * kYScal)];
    self.seperate11.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    [self.preView addSubview:self.seperate11];

    self.img12 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pre12"]];
    self.img12.frame = CGRectMake(CGRectGetMaxX(self.seperate11.frame) + imgLeftMargin, imgTopMargin, kHistory_PreView_NumberView_Width, kHistory_PreView_NumberView_Width);
    [self.preView addSubview:self.img12];
    
    self.preValLbl12 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperate11.frame), CGRectGetMaxY(self.middleLine.frame), blockWidth, lblHeight)];
    self.preValLbl12.textColor = [UIColor blackColor];
    self.preValLbl12.font = [UIFont systemFontOfSize:kHistory_Lbl_FontSize * kYScal];
    self.preValLbl12.textAlignment = NSTextAlignmentCenter;
    [self.preView addSubview:self.preValLbl12];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
