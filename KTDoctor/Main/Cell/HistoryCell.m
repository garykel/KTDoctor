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
#define kListView_Width kWidth - 2 * 18 * kXScal - 2 * 15

@interface HistoryCell ()
@property (nonatomic,strong)UIImageView *calendarImg;
@property (nonatomic,strong)UIView *topTitleView;
@property (nonatomic,strong)UILabel *accomplishLbl;
@property (nonatomic,strong)UIView *accomplishSeperateView;
@property (nonatomic,strong)UILabel *maxHrLbl;
@property (nonatomic,strong)UIView *maxHrSeperateView;
@property (nonatomic,strong)UILabel *avgHrLbl;
@property (nonatomic,strong)UIView *avgHrSeperateView;
@property (nonatomic,strong)UILabel *calorieLbl;
@property (nonatomic,strong)UIView *calorieSeperateView;
@property (nonatomic,strong)UILabel *mileLbl;
@property (nonatomic,strong)UIView *mileSeperateView;
@property (nonatomic,strong)UILabel *avgSpeedLbl;
@property (nonatomic,strong)UIView *avgSpeedSeperateView;
@property (nonatomic,strong)UILabel *avgIntensityLbl;
@property (nonatomic,strong)UIView *avgIntensitySeperateView;
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
    self.topTitleView = [[UIView alloc] initWithFrame:CGRectMake(self.calendarImg.frame.origin.x, CGRectGetMaxY(self.startTimeLbl.frame) + kHistory_AccomplishView_TopMargin * kYScal, accomplishViewWidth, kHistory_AccomplishView_Height * kYScal)];
    self.topTitleView.backgroundColor = [UIColor whiteColor];
    self.topTitleView.layer.cornerRadius = 4;
    self.topTitleView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.topTitleView];
    
    self.topValueView = [[UIView alloc] initWithFrame:CGRectMake(self.calendarImg.frame.origin.x, CGRectGetMaxY(self.topTitleView.frame) + 1, accomplishViewWidth, kHistory_AccomplishView_Height * kYScal)];
    self.topValueView.backgroundColor = [UIColor whiteColor];
    self.topValueView.layer.cornerRadius = 4;
    self.topValueView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.topValueView];
    
    self.preView = [[UIView alloc] initWithFrame:CGRectMake(self.calendarImg.frame.origin.x, CGRectGetMaxY(self.topValueView.frame) + kHistory_PreView_TopMargin * kYScal, accomplishViewWidth, kHistory_PreView_Height * kYScal)];
    self.preView.backgroundColor = [UIColor whiteColor];
    self.preView.layer.cornerRadius = 4;
    self.preView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.preView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
