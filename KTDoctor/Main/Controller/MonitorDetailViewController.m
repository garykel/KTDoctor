//
//  MonitorDetailViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/1.
//  Copyright © 2019 dz. All rights reserved.
//

#import "MonitorDetailViewController.h"
#import "SportDataModel.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTimeLbl_LeftMargin 15
#define kTimeLbl_FontSize 16.0
#define kTimeLbl_Width 150
#define kIcon_TopMargin 60
#define kIcon_Width 28
#define KIcon_Height 25
#define kIcon_LeftMagin 20
#define kValueLbl_BottomMargin 30
#define kUnitLbl_LeftMargin 10
#define kUnitLbl_FontSize 10
#define kUnitLbl_Width 50
#define kLbl_Width 240
#define kLbl_FontSize 25
#define kUnitLbl_Height 15
#define kValueLbl_FontSize 28
#define kLbl_Height 30
#define kValueLbl_Width 110
#define kValueLbl_Height 34
#define kLbl_LeftMargin 20
#define kRightLbl_RightMargin 30
#define kSeperateView_Height 2
#define kSeperateView_Width 130
#define kTotalTime_RightMargin 30
#define kHRLbl_Width 80
#define kHRValLbl_Width 120
#define kHRLbl_BottomMargin 50
#define kTargetHRZone_Width 250
#define kTargetHRZone_Height 40
#define kTargetHRZone_Lbl_LeftMargin 15

extern NSMutableArray *patientsArr;

@interface MonitorDetailViewController ()
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *timeLbl;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)NSTimer *updateTimer;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIImageView *mileImg;
@property (nonatomic,strong)UILabel *mileLbl;
@property (nonatomic,strong)UILabel *mileValLbl;
@property (nonatomic,strong)UILabel *mileUnitLbl;
@property (nonatomic,strong)UIView *mileSeperateview;
@property (nonatomic,strong)UIImageView *calorieImg;
@property (nonatomic,strong)UILabel *calorieLbl;
@property (nonatomic,strong)UILabel *calorieValLbl;
@property (nonatomic,strong)UILabel *calorieUnitLbl;
@property (nonatomic,strong)UIView *calorieSeperateView;
@property (nonatomic,strong)UIImageView *currentSectionImg;//当前小节/总小节数
@property (nonatomic,strong)UILabel *currentSectionLbl;
@property (nonatomic,strong)UILabel *currentSectionValLbl;
@property (nonatomic,strong)UIView *dashBoardView;
@property (nonatomic,strong)UIImageView *heartImg;
@property (nonatomic,strong)UILabel *hrLbl;
@property (nonatomic,strong)UILabel *hrValLbl;
@property (nonatomic,strong)UILabel *hrUnitLbl;
@property (nonatomic,strong)UIImageView *intensionImg;
@property (nonatomic,strong)UILabel *intensionLbl;
@property (nonatomic,strong)UILabel *intensionValLbl;
@property (nonatomic,strong)UIImageView *targetHRZongImg;
@property (nonatomic,strong)UILabel *targetHRZongLbl;
@property (nonatomic,strong)UIImageView *totalTimeImg;
@property (nonatomic,strong)UILabel *totalTimeLbl;
@property (nonatomic,strong)UILabel *totalTimeValLbl;
@property (nonatomic,strong)UIView *totalTimeSeperateview;
@property (nonatomic,strong)UIImageView *leftTimeImg;
@property (nonatomic,strong)UILabel *leftTimeLbl;
@property (nonatomic,strong)UILabel *leftTimeValLbl;
@property (nonatomic,strong)UIView *leftTimeSeperateView;
@property (nonatomic,strong)UIImageView *speedImg;
@property (nonatomic,strong)UILabel *speedLbl;
@property (nonatomic,strong)UILabel *speedValLbl;
@property (nonatomic,strong)UILabel *speedUnitLbl;
@end

@implementation MonitorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showCurrentTime) userInfo:nil repeats:YES];
    [self setNavBar];
    [self setupUI];
    self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateSportData) userInfo:nil repeats:YES];
}

- (void)setNavBar {
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, kNavView_TopMargin, kWidth, kNavView_Height)];
    self.navView.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.view addSubview:self.navView];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    self.backButton.adjustsImageWhenHighlighted = NO;
    CGFloat backButtonTop = (kNavView_Height - kButton_Height)/2;
    self.backButton.frame = CGRectMake(kBackButton_LeftMargin, backButtonTop, kButton_Height, kButton_Height);
    self.backButton.layer.cornerRadius = kButton_Height / 2.0;
    self.backButton.layer.masksToBounds = YES;
    [self.backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.backButton];
    
    self.timeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.backButton.frame) + kTimeLbl_LeftMargin, self.backButton.frame.origin.y, kTimeLbl_Width, kButton_Height)];
    self.timeLbl.textAlignment = NSTextAlignmentLeft;
    NSString *currentDateStr = [self getCurrentTimeString];
    self.timeLbl.text = currentDateStr;
    self.timeLbl.textColor = [UIColor whiteColor];
    [self.navView addSubview:self.timeLbl];
}

- (void)setupUI {
    UIImage *image = [UIImage imageNamed:@"monitor_detailBg"];
    image = [self imageCompressWithSimple:image scaledToSize:CGSizeMake(kWidth, kHeight - CGRectGetMaxY(self.navView.frame))];
    self.bgImg = [[UIImageView alloc] initWithImage:image];
    self.bgImg.frame = CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWidth, kHeight - CGRectGetMaxY(self.navView.frame));
    [self.view addSubview:self.bgImg];
    
    CGFloat verticalSpace = (kHeight - CGRectGetMaxY(self.navView.frame) - 2 * kIcon_TopMargin * kYScal - 3 * kLbl_Height * kYScal - 3 * kValueLbl_Height - 2 * kValueLbl_BottomMargin * kYScal)/5;
    self.mileImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mile"]];
    self.mileImg.frame = CGRectMake(kIcon_LeftMagin, CGRectGetMaxY(self.navView.frame) + kIcon_TopMargin * kYScal, kIcon_Width * kXScal, KIcon_Height * kYScal);
    [self.view addSubview:self.mileImg];
    
    self.mileLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mileImg.frame) + kLbl_LeftMargin, CGRectGetMidY(self.mileImg.frame) - kLbl_Height * kYScal / 2, kLbl_Width * kXScal, kLbl_Height * kYScal)];
    self.mileLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    self.mileLbl.text = @"里 程";
    self.mileLbl.textColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.view addSubview:self.mileLbl];
    
    self.mileValLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.mileImg.frame.origin.x, CGRectGetMaxY(self.mileLbl.frame) + verticalSpace, kValueLbl_Width * kXScal, kValueLbl_Height * kYScal)];
    self.mileValLbl.textColor = [UIColor whiteColor];
    self.mileValLbl.textAlignment = NSTextAlignmentCenter;
    self.mileValLbl.font = [UIFont systemFontOfSize:kValueLbl_FontSize * kYScal];
    [self.view addSubview:self.mileValLbl];
    
    self.mileUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mileValLbl.frame) + kUnitLbl_LeftMargin, CGRectGetMaxY(self.mileValLbl.frame) - kLbl_FontSize * kYScal, kUnitLbl_Width * kXScal, kUnitLbl_Height * kYScal)];
    self.mileUnitLbl.textColor = [UIColor whiteColor];
    self.mileUnitLbl.text = @"km";
    [self.view addSubview:self.mileUnitLbl];
    
    self.mileSeperateview = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mileImg.frame), CGRectGetMaxY(self.mileValLbl.frame) + kValueLbl_BottomMargin, kSeperateView_Width,kSeperateView_Height)];
    self.mileSeperateview.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.mileSeperateview];
    
    self.calorieImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"totalCalorie"]];
    self.calorieImg.frame = CGRectMake(self.mileImg.frame.origin.x, CGRectGetMaxY(self.mileSeperateview.frame) + verticalSpace, kIcon_Width * kXScal, KIcon_Height * kYScal);
    [self.view addSubview:self.calorieImg];
    
    self.calorieLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.mileLbl.frame.origin.x, CGRectGetMidY(self.calorieImg.frame) - kLbl_Height * kYScal / 2, kLbl_Width * kXScal, kValueLbl_Height * kYScal)];
    self.calorieLbl.text = @"总消耗";
    self.calorieLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    self.calorieLbl.textColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.view addSubview:self.calorieLbl];
    
    self.calorieValLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.mileValLbl.frame.origin.x, CGRectGetMaxY(self.calorieLbl.frame) + verticalSpace, kValueLbl_Width * kXScal, kValueLbl_Height * kYScal)];
    self.calorieValLbl.textColor = [UIColor whiteColor];
    self.calorieValLbl.textAlignment = NSTextAlignmentCenter;
    self.calorieValLbl.font = [UIFont systemFontOfSize:kValueLbl_FontSize * kYScal];
    [self.view addSubview:self.calorieValLbl];
    
    self.calorieUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.calorieValLbl.frame) + kUnitLbl_LeftMargin, CGRectGetMaxY(self.calorieValLbl.frame) - kUnitLbl_FontSize * kYScal, kUnitLbl_Width * kXScal, kUnitLbl_Height * kYScal)];
    self.calorieUnitLbl.text = @"kcal";
    self.calorieUnitLbl.textColor = [UIColor whiteColor];
    [self.view addSubview:self.calorieUnitLbl];
    
    self.calorieSeperateView = [[UIView alloc] initWithFrame:CGRectMake(self.mileSeperateview.frame.origin.x, CGRectGetMaxY(self.calorieValLbl.frame) + kValueLbl_BottomMargin, kSeperateView_Width, kSeperateView_Height)];
    self.calorieSeperateView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.calorieSeperateView];
    
    self.currentSectionImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"currentSection"]];
    self.currentSectionImg.frame = CGRectMake(self.mileImg.frame.origin.x, CGRectGetMaxY(self.calorieSeperateView.frame) + verticalSpace, kIcon_Width * kXScal, KIcon_Height * kYScal);
    [self.view addSubview:self.currentSectionImg];
    
    self.currentSectionLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.mileLbl.frame.origin.x, CGRectGetMidY(self.currentSectionImg.frame) - kLbl_Height * kYScal / 2, kLbl_Width * kXScal, kLbl_Height * kYScal)];
    self.currentSectionLbl.textColor = [UIColor colorWithHexString:@"#10a9cc"];
    self.currentSectionLbl.text = @"当前小节/总小节数";
    self.currentSectionLbl.textAlignment = NSTextAlignmentCenter;
    self.currentSectionLbl.font = [UIFont systemFontOfSize:kValueLbl_FontSize * kYScal];
    [self.view addSubview:self.currentSectionLbl];
    
    self.currentSectionValLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.mileValLbl.frame.origin.x, CGRectGetMaxY(self.currentSectionLbl.frame) + verticalSpace, kValueLbl_Width * kXScal, kValueLbl_Height * kYScal)];
    self.currentSectionValLbl.textColor = [UIColor whiteColor];
    self.currentSectionValLbl.textAlignment = NSTextAlignmentCenter;
    self.currentSectionValLbl.font = [UIFont systemFontOfSize:kValueLbl_FontSize * kYScal];
    [self.view addSubview:self.currentSectionValLbl];
    
    self.targetHRZongImg = [[UIImageView alloc] initWithFrame:CGRectMake((kWidth - kTargetHRZone_Width * kXScal) / 2, self.calorieValLbl.frame.origin.y + 5, kTargetHRZone_Width * kXScal, kTargetHRZone_Height * kYScal)];
    self.targetHRZongImg.image = [UIImage imageNamed:@"targetHRZone"];
    [self.view addSubview:self.targetHRZongImg];
    
    self.targetHRZongLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.targetHRZongImg.frame.origin.x + kTargetHRZone_Lbl_LeftMargin * kXScal, self.targetHRZongImg.frame.origin.y + (kTargetHRZone_Height - kValueLbl_Height * kYScal)/2, kTargetHRZone_Width - kTargetHRZone_Lbl_LeftMargin * kXScal, kValueLbl_Height * kYScal)];
    self.targetHRZongLbl.textColor = [UIColor whiteColor];;
    self.targetHRZongLbl.text = @"目标心率区间";
    self.targetHRZongLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    [self.view addSubview:self.targetHRZongLbl];
    [self.view bringSubviewToFront:self.targetHRZongLbl];
    
    CGFloat hrImg_LeftMargin = (kWidth - (kIcon_LeftMagin + kIcon_Width + kLbl_LeftMargin + kLbl_Width) * 2 * kXScal - (kIcon_Width + kLbl_LeftMargin + kHRLbl_Width + kHRValLbl_Width + kUnitLbl_LeftMargin + kUnitLbl_Width) * kXScal) / 2;
    self.heartImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.currentSectionLbl.frame) + hrImg_LeftMargin, self.currentSectionImg.frame.origin.y, kIcon_Width * kXScal, KIcon_Height * kYScal)];
    self.heartImg.image = [UIImage imageNamed:@"heartRate"];
    [self.view addSubview:self.heartImg];
    
    self.hrLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.heartImg.frame) + kLbl_LeftMargin * kXScal, CGRectGetMidY(self.heartImg.frame) - kLbl_Height * kYScal / 2, kHRLbl_Width * kXScal, kLbl_Height * kYScal)];
    self.hrLbl.textColor = [UIColor colorWithHexString:@"#10a9cc"];
    self.hrLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    self.hrLbl.text = @"心  率";
    [self.view addSubview:self.hrLbl];
    
    self.hrValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.hrLbl.frame), CGRectGetMidY(self.hrLbl.frame) - kLbl_Height * kYScal / 2, kHRValLbl_Width * kXScal, kLbl_Height * kYScal)];
    self.hrValLbl.textAlignment = NSTextAlignmentCenter;
    self.hrValLbl.font = [UIFont systemFontOfSize:kValueLbl_FontSize * kYScal];
    self.hrValLbl.textColor = [UIColor whiteColor];
    [self.view addSubview:self.hrValLbl];
    
    self.hrUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.hrValLbl.frame) + kUnitLbl_LeftMargin * kXScal, CGRectGetMaxY(self.hrValLbl.frame) - kUnitLbl_Height * kYScal, kUnitLbl_Width * kXScal, kUnitLbl_Height * kYScal)];
    self.hrUnitLbl.text = @"bpm";
    self.hrUnitLbl.textColor = [UIColor whiteColor];
    [self.view addSubview:self.hrUnitLbl];
    
    self.intensionImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.heartImg.frame.origin.x, CGRectGetMaxY(self.heartImg.frame) + kHRLbl_BottomMargin * kYScal, kIcon_Width * kXScal, KIcon_Height * kYScal)];
    self.intensionImg.image = [UIImage imageNamed:@"intension"];
    [self.view addSubview:self.intensionImg];
    
    self.intensionLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hrLbl.frame.origin.x, CGRectGetMidY(self.intensionImg.frame) - kLbl_Height * kYScal / 2, kHRLbl_Width * kXScal, kLbl_Height * kYScal)];
    self.intensionLbl.textColor = [UIColor colorWithHexString:@"#10a9cc"];
    self.intensionLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    self.intensionLbl.text = @"强 度";
    [self.view addSubview:self.intensionLbl];
    
    self.intensionValLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hrValLbl.frame.origin.x, CGRectGetMidY(self.intensionLbl.frame) - kLbl_Height * kYScal / 2, kValueLbl_Width * kXScal, kValueLbl_Height * kYScal)];
    self.intensionValLbl.textColor = [UIColor whiteColor];
    self.intensionValLbl.textAlignment = NSTextAlignmentCenter;
    self.intensionValLbl.font = [UIFont systemFontOfSize:kValueLbl_FontSize * kYScal];
    [self.view addSubview:self.intensionValLbl];
    
    CGFloat rightIcon_LeftMargin = kWidth - (kIcon_Width + kLbl_LeftMargin + kLbl_Width) * kXScal - kRightLbl_RightMargin;
    self.totalTimeImg = [[UIImageView alloc] initWithFrame:CGRectMake(rightIcon_LeftMargin, self.mileImg.frame.origin.y, kIcon_Width * kXScal, KIcon_Height * kYScal)];
    self.totalTimeImg.image = [UIImage imageNamed:@"sportTime"];
    [self.view addSubview:self.totalTimeImg];
    
    self.totalTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.totalTimeImg.frame) + kLbl_LeftMargin * kXScal , CGRectGetMidY(self.totalTimeImg.frame) - kLbl_Height * kYScal / 2, kLbl_Width * kXScal, kLbl_Height * kYScal)];
    self.totalTimeLbl.text = @"总 时 长";
    self.totalTimeLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    self.totalTimeLbl.textColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.view addSubview:self.totalTimeLbl];
    
    self.totalTimeValLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.totalTimeLbl.frame.origin.x, self.mileValLbl.frame.origin.y, kValueLbl_Width * kXScal, kValueLbl_Height * kYScal)];
    self.totalTimeValLbl.textColor = [UIColor whiteColor];
    self.totalTimeValLbl.textAlignment = NSTextAlignmentCenter;
    self.totalTimeValLbl.font = [UIFont systemFontOfSize:kValueLbl_FontSize * kYScal];
    [self.view addSubview:self.totalTimeValLbl];
    
    self.totalTimeSeperateview = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.totalTimeImg.frame), self.mileSeperateview.frame.origin.y, kSeperateView_Width * kXScal, kSeperateView_Height * kYScal)];
    self.totalTimeSeperateview.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.totalTimeSeperateview];
    
    self.leftTimeImg = [[UIImageView alloc] initWithFrame:CGRectMake(rightIcon_LeftMargin, self.calorieImg.frame.origin.y, kIcon_Width * kXScal, KIcon_Height * kYScal)];
    self.leftTimeImg.image = [UIImage imageNamed:@"sportTime"];
    [self.view addSubview:self.leftTimeImg];
    
    self.leftTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.totalTimeLbl.frame.origin.x, CGRectGetMidY(self.leftTimeImg.frame) - kLbl_Height * kYScal / 2, kLbl_Width * kXScal, kLbl_Height * kYScal)];
    self.leftTimeLbl.textColor = [UIColor colorWithHexString:@"#10a9cc"];
    self.leftTimeLbl.text = @"本组剩余时长";
    self.leftTimeLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    [self.view addSubview:self.leftTimeLbl];
    
    self.leftTimeValLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.totalTimeValLbl.frame.origin.x, self.calorieValLbl.frame.origin.y, kValueLbl_Width * kXScal, kValueLbl_Height * kYScal)];
    self.leftTimeValLbl.textColor = [UIColor whiteColor];
    self.leftTimeValLbl.textAlignment = NSTextAlignmentCenter;
    self.leftTimeValLbl.font = [UIFont systemFontOfSize:kValueLbl_FontSize * kYScal];
    [self.view addSubview:self.leftTimeValLbl];
    
    self.leftTimeSeperateView = [[UIView alloc] initWithFrame:CGRectMake(self.totalTimeSeperateview.frame.origin.x, self.calorieSeperateView.frame.origin.y, kSeperateView_Width * kXScal, kSeperateView_Height * kYScal)];
    self.leftTimeSeperateView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.leftTimeSeperateView];
    
    self.speedImg = [[UIImageView alloc] initWithFrame:CGRectMake(rightIcon_LeftMargin, self.currentSectionImg.frame.origin.y, kIcon_Width * kXScal, KIcon_Height * kYScal)];
    self.speedImg.image = [UIImage imageNamed:@"speed"];
    [self.view addSubview:self.speedImg];
    
    self.speedLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.totalTimeLbl.frame.origin.x, CGRectGetMidY(self.speedImg.frame) - kLbl_Height * kYScal / 2, kLbl_Width * kXScal, kLbl_Height * kYScal)];
    self.speedLbl.text = @"速  度";
    self.speedLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    self.speedLbl.textColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.view addSubview:self.speedLbl];
    
    self.speedValLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.totalTimeValLbl.frame.origin.x, self.currentSectionValLbl.frame.origin.y, kValueLbl_Width * kXScal, kValueLbl_Height * kYScal)];
    self.speedValLbl.textColor = [UIColor whiteColor];
    self.speedValLbl.textAlignment = NSTextAlignmentCenter;
    self.speedValLbl.font = [UIFont systemFontOfSize:kValueLbl_FontSize * kYScal];
    [self.view addSubview:self.speedValLbl];
    
    self.speedUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.speedValLbl.frame) + kUnitLbl_LeftMargin * kXScal, CGRectGetMaxY(self.speedValLbl.frame) - kUnitLbl_Height * kYScal, kUnitLbl_Width * kXScal, kUnitLbl_Height * kYScal)];
    self.speedUnitLbl.textColor = [UIColor whiteColor];
    self.speedUnitLbl.text = @"km/h";
    [self.view addSubview:self.speedUnitLbl];
}

- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (NSString *)getCurrentTimeString{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.AMSymbol = @"上午";
    format.PMSymbol = @"下午";
    format.dateFormat = @"aaa HH:mm";
    NSDate *currentDate = [NSDate date];
    NSString *currentDateStr = [format stringFromDate:currentDate];
    return currentDateStr;
}

- (void)showCurrentTime {
    NSString *timeStr = [self getCurrentTimeString];
    NSString *lastTimeStr = self.timeLbl.text;
    if (![timeStr isEqualToString:lastTimeStr]) {
        self.timeLbl.text = timeStr;
    }
}

- (void)updateSportData {
    SportDataModel *data = (SportDataModel*)[patientsArr objectAtIndex:self.selectedIndex];
    self.mileValLbl.text = [NSString stringWithFormat:@"%.1f",data.lc];
    self.calorieValLbl.text = [NSString stringWithFormat:@"%.1f",data.kcal];
    self.currentSectionValLbl.text = [NSString stringWithFormat:@"%d",data.dqxjzxj];
    self.hrValLbl.text = [NSString stringWithFormat:@"%d",data.currHr];
    self.intensionValLbl.text = [NSString stringWithFormat:@"%d",data.diff];
    self.totalTimeValLbl.text = [NSString stringWithFormat:@"%@",[self getTimeString:data.time]];
    self.leftTimeValLbl.text = [NSString stringWithFormat:@"%@",[self getTimeString:data.xiaojietime]];
    self.speedValLbl.text = [NSString stringWithFormat:@"%.1f",data.speed];
}

- (NSString *)getTimeString:(NSInteger)seconds {
    NSString *timeStr = @"";
    NSInteger minute = seconds / 60;
    NSInteger second = seconds % 60;
    timeStr = [NSString stringWithFormat:@"%02ld:%02ld",(long)minute,(long)second];
    return timeStr;
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
