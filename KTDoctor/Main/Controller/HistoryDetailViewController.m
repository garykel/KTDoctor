//
//  HistoryDetailViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/4.
//  Copyright © 2019 dz. All rights reserved.
//

#import "HistoryDetailViewController.h"
#import "DateValueFormatter.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTimeLbl_LeftMargin 15
#define kTimeLbl_FontSize 16.0
#define kTimeLbl_Width 200
#define kTitle_FontSize 22
#define kBackgroundImg_TopMargin 10
#define kBackgroundImg_LeftMargin 15
#define kBackgroundImg_BottomMargin 15
#define kLeftView_TopMargin 50
#define kLeftView_BottomMargin 30
#define kLeftView_LeftMargin 10
#define kLeftView_RightMargin 10
#define kLeftView_Width 280
#define kHeadImg_TopMargin 15
#define kHeadImg_LeftMargin 40
#define kHeadImg_Width 47
#define kNameLbl_LeftMargin 7
#define kNameLbl_BottomMargin 5
#define kNameLbl_Height 15
#define kNameLbl_Width 100
#define kNameLbl_FontSize 15
#define kFinishImg_Width 55
#define kFinishImg_RightMargin 6
#define kFinishImg_TopMargin 22
#define kFinishLbl_Height 12
#define kFinishLbl_BottomMargin 6
#define kFinishLbl_FontSize 12
#define kSportView_TopMargin 12
#define kSportView_LeftMargin 6
#define kSportView_BottomMargin 15
#define kSportView_Lbl_FontSize 14
#define kLeftUnitLbl_RightMargin 10
#define kRightUnitLbl_LeftMargin 10
#define kLineCharView_TopMargin 10
#define kLineCharView_BottomMargin 20
#define kLeftUnitImg_Width 18
#define kLeftUnitImg_RightMargin 10
#define kLeftUnitImg_Height 84
#define kRightUnitImg_Width 17
#define kRightUnitImg_Height 87
#define kSeperateLine_Height 2
#define kCellLbl_LeftMargin 6
#define kCellLbl_Space 10
@interface HistoryDetailViewController ()<ChartViewDelegate>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *bgImg; 
@property (nonatomic,strong)UIView *leftView;
@property (nonatomic,strong)UIImageView *finishBgImg;
@property (nonatomic,strong)UILabel *finishLbl;
@property (nonatomic,strong)UILabel *finishValLbl;
@property (nonatomic,strong)UIImageView *headImg;
@property (nonatomic,strong)UILabel *nameLbl;
@property (nonatomic,strong)UILabel *idLbl;
@property (nonatomic,strong)UIView *sportView;
@property (nonatomic,strong)UILabel *avgHRLbl;
@property (nonatomic,strong)UILabel *avgHRValLbl;
@property (nonatomic,strong)UILabel *avgUnitLbl;
@property (nonatomic,strong)UILabel *maxHRLbl;
@property (nonatomic,strong)UILabel *maxHRValLbl;
@property (nonatomic,strong)UILabel *maxUnitLbl;
@property (nonatomic,strong)UILabel *avgSpeedLbl;
@property (nonatomic,strong)UILabel *avgSpeedValLbl;
@property (nonatomic,strong)UILabel *avgSpeedUnitLbl;
@property (nonatomic,strong)UILabel *avgDifficultyLbl;
@property (nonatomic,strong)UILabel *avgDifficultyValLbl;
@property (nonatomic,strong)UILabel *calorieLbl;
@property (nonatomic,strong)UILabel *calorieValLbl;
@property (nonatomic,strong)UILabel *calorieUnitLbl;
@property (nonatomic,strong)UILabel *mileLbl;
@property (nonatomic,strong)UILabel *mileValLbl;
@property (nonatomic,strong)UILabel *mileUnitLbl;
@property (nonatomic,strong)UILabel *timeLbl;
@property (nonatomic,strong)UILabel *timeValLbl;
@property (nonatomic,strong)UIView *seperateLine1;
@property (nonatomic,strong)UIView *seperateLine2;
@property (nonatomic,strong)UIView *seperateLine3;
@property (nonatomic,strong)UIView *seperateLine4;
@property (nonatomic,strong)UIView *seperateLine5;
@property (nonatomic,strong)UIView *seperateLine6;
@property (nonatomic,strong)UIImageView *leftUnitImg;
@property (nonatomic,strong)UIImageView *rightUnitImg;
@property (nonatomic,strong)LineChartView *lineChartView;
@property (nonatomic,strong)LineChartDataSet *set1;
@property (nonatomic,strong)LineChartDataSet *set2;
@end

@implementation HistoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self setNavBar];
    [self setupUI];
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
    
    CGFloat titleLbl_LeftMargin = (kWidth - kTimeLbl_Width)/2;
    CGFloat titleLbl_TopMargin = (kNavView_Height - kButton_Height)/2;
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(titleLbl_LeftMargin, titleLbl_TopMargin, kTimeLbl_Width, kButton_Height)];
    self.titleLbl.font = [UIFont systemFontOfSize:kTitle_FontSize];
    self.titleLbl.textColor = [UIColor whiteColor];
    self.titleLbl.textAlignment = NSTextAlignmentCenter;
    self.titleLbl.text = @"运动结果";
    [self.navView addSubview:self.titleLbl];
}

- (void)setupUI {
    UIImage *bgImg = [UIImage imageNamed:@"whiteBg"];
    bgImg = [self imageCompressWithSimple:bgImg scaledToSize:CGSizeMake(kWidth - 2 * kBackgroundImg_LeftMargin * kXScal, kHeight - (CGRectGetMaxY(self.navView.frame) + kBackgroundImg_TopMargin * kYScal + kBackgroundImg_BottomMargin * kYScal))];
    self.bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(kBackgroundImg_LeftMargin * kXScal, CGRectGetMaxY(self.navView.frame) + kBackgroundImg_TopMargin * kYScal, kWidth - 2 * kBackgroundImg_LeftMargin * kXScal, kHeight - (CGRectGetMaxY(self.navView.frame) + kBackgroundImg_TopMargin * kYScal + kBackgroundImg_BottomMargin * kYScal))];
    self.bgImg.image = bgImg;
    [self.view addSubview:self.bgImg];
    self.bgImg.userInteractionEnabled = YES;
    
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(kLeftView_LeftMargin * kXScal, kLeftView_TopMargin * kYScal, kLeftView_Width, self.bgImg.frame.size.height - kLeftView_TopMargin * kYScal - kLeftView_BottomMargin * kYScal)];
    self.leftView.backgroundColor = [UIColor colorWithHexString:@"#d1f3f8"];
    [self.bgImg addSubview:self.leftView];
    
    CGFloat finishImgLeftMargin = self.leftView.frame.size.width - (kFinishImg_Width - kFinishImg_RightMargin) * kXScal;
    self.finishBgImg = [[UIImageView alloc] initWithFrame:CGRectMake(finishImgLeftMargin, -kFinishImg_TopMargin * kYScal, kFinishImg_Width * kYScal, kFinishImg_Width * kYScal)];
    self.finishBgImg.image = [UIImage imageNamed:@"finish"];
    [self.leftView addSubview:self.finishBgImg];
    
    CGFloat finishLbl_TopMargin = (kFinishImg_Width * kYScal - 2 * kFinishLbl_Height * kYScal - kFinishLbl_BottomMargin * kYScal)/2;
    self.finishLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, finishLbl_TopMargin, self.finishBgImg.frame.size.width, kFinishLbl_Height * kYScal)];
    self.finishLbl.textColor = [UIColor blackColor];
    self.finishLbl.text = @"完成度";
    self.finishLbl.textAlignment = NSTextAlignmentCenter;
    self.finishLbl.font = [UIFont systemFontOfSize:kFinishLbl_FontSize * kYScal];
    [self.finishBgImg addSubview:self.finishLbl];
    
    self.finishValLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.finishLbl.frame) + kFinishLbl_BottomMargin * kYScal, self.finishBgImg.frame.size.width, kFinishLbl_Height * kYScal)];
    self.finishValLbl.textAlignment = NSTextAlignmentCenter;
    self.finishValLbl.textColor = [UIColor blackColor];
    self.finishValLbl.text = @"0%";
    self.finishValLbl.font = [UIFont systemFontOfSize:kFinishLbl_FontSize * kYScal];
    [self.finishBgImg addSubview:self.finishValLbl];
    
    self.headImg = [[UIImageView alloc] initWithFrame:CGRectMake(kHeadImg_LeftMargin * kXScal, kHeadImg_TopMargin * kYScal, kHeadImg_Width * kYScal, kHeadImg_Width * kYScal)];
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:[self.sportDict valueForKey:@"headUrl"]] placeholderImage:[UIImage imageNamed:@"default_head"]];
    self.headImg.layer.cornerRadius = kHeadImg_Width * kYScal / 2.0;
    self.headImg.layer.masksToBounds = YES;
    [self.leftView addSubview:self.headImg];
    
    CGFloat nameLbl_TopMargin = (kHeadImg_Width * kYScal - 2 * kNameLbl_Height * kYScal - kNameLbl_BottomMargin * kYScal)/2;
    self.nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImg.frame) + kNameLbl_LeftMargin * kXScal,self.headImg.frame.origin.y + nameLbl_TopMargin, kNameLbl_Width * kXScal, kNameLbl_Height *kYScal)];
    self.nameLbl.textColor = [UIColor blackColor];
    self.nameLbl.text = [self.sportDict valueForKey:@"name"];
    self.nameLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.leftView addSubview:self.nameLbl];
    
    self.idLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x, CGRectGetMaxY(self.nameLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.idLbl.text = [NSString stringWithFormat:@"ID : %@",[self.sportDict valueForKey:@"userId"]];
    self.idLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.leftView addSubview:self.idLbl];
    
    self.sportView = [[UIView alloc] initWithFrame:CGRectMake(kSportView_LeftMargin * kXScal,CGRectGetMaxY(self.idLbl.frame) + kSportView_TopMargin * kYScal, self.leftView.frame.size.width - 2 * kSportView_LeftMargin * kXScal, self.leftView.frame.size.height - CGRectGetMaxY(self.headImg.frame) - kSportView_TopMargin * kYScal - kSportView_BottomMargin * kYScal)];
    self.sportView.layer.cornerRadius = 4;
    self.sportView.layer.masksToBounds = YES;
    self.sportView.backgroundColor = [UIColor colorWithHexString:@"#e4f7f8"];
    [self.leftView addSubview:self.sportView];
    
    CGFloat cellHeight = (self.sportView.frame.size.height - 6 * kSeperateLine_Height * kYScal)/7;
    CGFloat lblWidth = (self.sportView.frame.size.width - 2 * kCellLbl_Space)/3;
    self.avgHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(kCellLbl_LeftMargin * kXScal, 0,lblWidth, cellHeight)];
    self.avgHRLbl.text = @"平均心率";
    self.avgHRLbl.textColor = [UIColor blackColor];
    self.avgHRLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.avgHRLbl];
    
    self.avgHRValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgHRLbl.frame) + kCellLbl_Space * kXScal, 0, lblWidth, cellHeight)];
    self.avgHRValLbl.textColor = [UIColor blackColor];
    NSDictionary *sportData = [self.sportDict valueForKey:@"sportData"];
    NSInteger avgHr = [[sportData valueForKey:@"avgHr"] integerValue];
    self.avgHRValLbl.text = [NSString stringWithFormat:@"%d",avgHr];
    self.avgHRValLbl.textAlignment = NSTextAlignmentCenter;
    self.avgHRValLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.avgHRValLbl];
    
    self.avgUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgHRValLbl.frame) + kCellLbl_Space * kXScal, self.avgHRValLbl.frame.origin.y, lblWidth, cellHeight)];
    self.avgUnitLbl.textColor = [UIColor blackColor];
    self.avgUnitLbl.text = @"bpm";
    self.avgUnitLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.avgUnitLbl];
    
    self.seperateLine1 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.avgHRLbl.frame), self.sportView.frame.size.width, kSeperateLine_Height * kYScal)];
    self.seperateLine1.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.sportView addSubview:self.seperateLine1];
    
    self.maxHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.avgHRLbl.frame.origin.x, CGRectGetMaxY(self.seperateLine1.frame), lblWidth, cellHeight)];
    self.maxHRLbl.text = @"最大心率";
    self.maxHRLbl.textColor = [UIColor blackColor];
    self.maxHRLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.maxHRLbl];
    
    self.maxHRValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.maxHRLbl.frame) + kCellLbl_Space * kXScal, self.maxHRLbl.frame.origin.y, lblWidth, cellHeight)];
    self.maxHRValLbl.textColor = [UIColor blackColor];
    NSInteger maxHr = [[sportData valueForKey:@"maxHr"] integerValue];
    self.maxHRValLbl.text = [NSString stringWithFormat:@"%d",maxHr];
    self.maxHRValLbl.textAlignment = NSTextAlignmentCenter;
    self.maxHRValLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.maxHRValLbl];
    
    self.maxUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.maxHRValLbl.frame) + kCellLbl_Space * kXScal, self.maxHRValLbl.frame.origin.y, lblWidth, cellHeight)];
    self.maxUnitLbl.textColor = [UIColor blackColor];
    self.maxUnitLbl.text = @"bpm";
    self.maxUnitLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.maxUnitLbl];
    
    self.seperateLine2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.maxHRLbl.frame), self.sportView.frame.size.width, kSeperateLine_Height * kYScal)];
    self.seperateLine2.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.sportView addSubview:self.seperateLine2];
    
    self.avgSpeedLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.avgHRLbl.frame.origin.x, CGRectGetMaxY(self.seperateLine2.frame), lblWidth, cellHeight)];
    self.avgSpeedLbl.text = @"平均速度";
    self.avgSpeedLbl.textColor = [UIColor blackColor];
    self.avgSpeedLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.avgSpeedLbl];
    
    self.avgSpeedValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgSpeedLbl.frame) + kCellLbl_Space * kXScal, self.avgSpeedLbl.frame.origin.y, lblWidth, cellHeight)];
    self.avgSpeedValLbl.textColor = [UIColor blackColor];
    self.avgSpeedValLbl.textAlignment = NSTextAlignmentCenter;
    CGFloat speed = [[sportData valueForKey:@"speed"] floatValue];
    self.avgSpeedValLbl.text = [NSString stringWithFormat:@"%.1f",speed];
    self.avgSpeedValLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.avgSpeedValLbl];
    
    self.avgSpeedUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgSpeedValLbl.frame) + kCellLbl_Space * kXScal, self.avgSpeedValLbl.frame.origin.y, lblWidth, cellHeight)];
    self.avgSpeedUnitLbl.textColor = [UIColor blackColor];
    self.avgSpeedUnitLbl.text = @"km/h";
    self.avgSpeedUnitLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.avgSpeedUnitLbl];
    
    self.seperateLine3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.avgSpeedUnitLbl.frame), self.sportView.frame.size.width, kSeperateLine_Height * kYScal)];
    self.seperateLine3.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.sportView addSubview:self.seperateLine3];
    
    self.avgDifficultyLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.avgHRLbl.frame.origin.x, CGRectGetMaxY(self.seperateLine3.frame), lblWidth, cellHeight)];
    self.avgDifficultyLbl.text = @"平均强度";
    self.avgDifficultyLbl.textColor = [UIColor blackColor];
    self.avgDifficultyLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.avgDifficultyLbl];
    
    self.avgDifficultyValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgDifficultyLbl.frame) + kCellLbl_Space * kXScal, self.avgDifficultyLbl.frame.origin.y, lblWidth, cellHeight)];
    self.avgDifficultyValLbl.textColor = [UIColor blackColor];
    self.avgDifficultyValLbl.textAlignment = NSTextAlignmentCenter;
    NSString *avgDifficulty = [sportData valueForKey:@"avgDifficulty"];
    if ([avgDifficulty class] == [NSNull class]) {
        avgDifficulty = @"0";
    }
    self.avgDifficultyValLbl.text = [NSString stringWithFormat:@"%@",avgDifficulty];
    self.avgDifficultyValLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.avgDifficultyValLbl];
    
    self.seperateLine4 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.avgDifficultyLbl.frame), self.sportView.frame.size.width, kSeperateLine_Height * kYScal)];
    self.seperateLine4.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.sportView addSubview:self.seperateLine4];
    
    self.calorieLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.avgHRLbl.frame.origin.x, CGRectGetMaxY(self.seperateLine4.frame), lblWidth, cellHeight)];
    self.calorieLbl.text = @"消    耗";
    self.calorieLbl.textColor = [UIColor blackColor];
    self.calorieLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.calorieLbl];
    
    self.calorieValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.calorieLbl.frame) + kCellLbl_Space * kXScal, self.calorieLbl.frame.origin.y, lblWidth, cellHeight)];
    self.calorieValLbl.textColor = [UIColor blackColor];
    self.calorieValLbl.textAlignment = NSTextAlignmentCenter;
    CGFloat calorie = [[sportData valueForKey:@"calorie"] floatValue];
    self.calorieValLbl.text = [NSString stringWithFormat:@"%.1f",calorie];
    self.calorieValLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.calorieValLbl];
    
    self.calorieUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.calorieValLbl.frame) + kCellLbl_Space * kXScal, self.calorieValLbl.frame.origin.y, lblWidth, cellHeight)];
    self.calorieUnitLbl.textColor = [UIColor blackColor];
    self.calorieUnitLbl.text = @"kcal";
    self.calorieUnitLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.calorieUnitLbl];
    
    self.seperateLine5 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.calorieLbl.frame), self.sportView.frame.size.width, kSeperateLine_Height * kYScal)];
    self.seperateLine5.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.sportView addSubview:self.seperateLine5];
    
    self.mileLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.avgHRLbl.frame.origin.x, CGRectGetMaxY(self.seperateLine5.frame), lblWidth, cellHeight)];
    self.mileLbl.text = @"里      程";
    self.mileLbl.textColor = [UIColor blackColor];
    self.mileLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.mileLbl];
    
    self.mileValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgSpeedLbl.frame) + kCellLbl_Space * kXScal, self.mileLbl.frame.origin.y, lblWidth, cellHeight)];
    self.mileValLbl.textColor = [UIColor blackColor];
    self.mileValLbl.textAlignment = NSTextAlignmentCenter;
    CGFloat totalMileage = [[sportData valueForKey:@"totalMileage"] floatValue];
    self.mileValLbl.text = [NSString stringWithFormat:@"%.1f",totalMileage];
    self.mileValLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.mileValLbl];
    
    self.mileUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mileValLbl.frame) + kCellLbl_Space * kXScal, self.mileValLbl.frame.origin.y, lblWidth, cellHeight)];
    self.mileUnitLbl.textColor = [UIColor blackColor];
    self.mileUnitLbl.text = @"km";
    self.mileUnitLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.mileUnitLbl];
    
    self.seperateLine6 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.mileLbl.frame), self.sportView.frame.size.width, kSeperateLine_Height * kYScal)];
    self.seperateLine6.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.sportView addSubview:self.seperateLine6];
    
    self.timeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.avgHRLbl.frame.origin.x, CGRectGetMaxY(self.seperateLine6.frame), lblWidth, cellHeight)];
    self.timeLbl.text = @"时      长";
    self.timeLbl.textColor = [UIColor blackColor];
    self.timeLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.timeLbl];
    
    
    self.timeValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgSpeedLbl.frame) + kCellLbl_Space * kXScal, self.timeLbl.frame.origin.y, 2 * lblWidth, cellHeight)];
    self.timeValLbl.textColor = [UIColor blackColor];
    self.timeValLbl.textAlignment = NSTextAlignmentCenter;
    NSInteger totalTime = [[sportData valueForKey:@"totalTime"] integerValue];
    NSString *timeStr = [self getLongtimeString:totalTime];
    self.timeValLbl.text = [NSString stringWithFormat:@"%@",timeStr];
    self.timeValLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.timeValLbl];
        
    CGFloat leftUnitImg_TopMargin = (self.bgImg.frame.size.height - kLineCharView_TopMargin * kYScal - kLineCharView_BottomMargin * kYScal - kLeftUnitImg_Height * kYScal)/2;
    self.leftUnitImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.leftView.frame) + kLeftView_RightMargin * kXScal, leftUnitImg_TopMargin, kLeftUnitImg_Width * kXScal, kLeftUnitImg_Height * kYScal)];
    self.leftUnitImg.image = [UIImage imageNamed:@"leftUnit"];
    [self.bgImg addSubview:self.leftUnitImg];
    
    CGFloat lineChartView_Width = self.bgImg.frame.size.width - CGRectGetMaxX(self.leftUnitImg.frame) - kLeftUnitImg_RightMargin * kXScal - 2 * kRightUnitLbl_LeftMargin * kXScal - kRightUnitImg_Width * kXScal;
    CGFloat lineChartView_Height = self.bgImg.frame.size.height - kLineCharView_TopMargin * kYScal - kLineCharView_BottomMargin * kYScal;
    self.lineChartView.frame = CGRectMake(CGRectGetMaxX(self.leftUnitImg.frame) + kLeftUnitImg_RightMargin * kXScal, kLineCharView_TopMargin * kYScal, lineChartView_Width, lineChartView_Height);
    [self setLineChartDataWithSportData:sportData];
    [self.bgImg addSubview:self.lineChartView];
    
    CGFloat righUnitImg_TopMargin = (self.bgImg.frame.size.height - kLineCharView_TopMargin * kYScal - kLineCharView_BottomMargin * kYScal - kRightUnitImg_Height * kYScal)/2;
    self.rightUnitImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lineChartView.frame) + kLeftUnitImg_RightMargin * kXScal, righUnitImg_TopMargin, kRightUnitImg_Width * kXScal, kRightUnitImg_Height * kYScal)];
    self.rightUnitImg.image = [UIImage imageNamed:@"rightUnit"];
    [self.bgImg addSubview:self.rightUnitImg];
}

- (void)setLineChartDataWithSportData:(NSDictionary*)sportData {
    NSString *hrSample = [sportData valueForKey:@"hrSample"];
    NSString *speedSample = [sportData valueForKey:@"speedSample"];
    NSInteger totalTime = [[sportData valueForKey:@"totalTime"] integerValue];
    NSMutableArray *xVals = [NSMutableArray array];
    if (totalTime > 0) {
        for (NSInteger i = 1; i <= totalTime; i++) {
            NSString *timeStr = [self getShortTimeString:i];
            [xVals addObject:timeStr];
        }
    }
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    if (xVals.count > 0) {
        _lineChartView.xAxis.valueFormatter = [[DateValueFormatter alloc] initWithArr:xVals];
        if (hrSample.length > 0) {
            NSArray *hrArr = [hrSample componentsSeparatedByString:@","];
            NSMutableArray *leftVals = [NSMutableArray array];
            for (NSInteger j = 0; j < xVals.count; j++) {
                NSInteger hr = 0;
                hr = [[hrArr objectAtIndex:j] integerValue];
                ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:j y:hr];
                [leftVals addObject:entry];
            }
            _set1 = [[LineChartDataSet alloc] initWithValues:leftVals label:@"心率"];
            _set1.axisDependency = AxisDependencyLeft;
            _set1.lineWidth = 2.0;
            _set1.drawValuesEnabled = YES;
            [_set1 setColor:[UIColor redColor]];
            _set1.drawCirclesEnabled = NO;
            _set1.drawFilledEnabled = NO;
            _set1.highlightEnabled = NO;
            [dataSets addObject:_set1];
        }
        if (speedSample.length > 0) {
            NSArray *speedArr = [speedSample componentsSeparatedByString:@","];
            NSMutableArray *rightVals = [NSMutableArray array];
            for (NSInteger k = 0; k < xVals.count; k++) {
                NSInteger speed = 0;
                speed = [[speedArr objectAtIndex:k] integerValue];
                ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:k y:speed];
                [rightVals addObject:entry];
            }
            _set2 = [[LineChartDataSet alloc] initWithValues:rightVals label:@"速度"];
            _set2.axisDependency = AxisDependencyRight;
            _set2.lineWidth = 2.0;
            _set2.drawValuesEnabled = YES;
            [_set2 setColor:[UIColor greenColor]];
            _set2.drawCirclesEnabled = NO;
            _set2.drawFilledEnabled = NO;
            _set2.highlightEnabled = NO;
            [dataSets addObject:_set2];
        }
    }
    LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
    [data setValueFont:[UIFont systemFontOfSize:11.0]];
    [data setValueTextColor:[UIColor clearColor]];
    _lineChartView.data = data;
}

- (LineChartView*)lineChartView {
    if (_lineChartView == nil) {
        _lineChartView = [[LineChartView alloc] init];
        _lineChartView.noDataText = @"暂无数据";
        _lineChartView.chartDescription.enabled = NO;
        _lineChartView.scaleYEnabled = NO;
        _lineChartView.doubleTapToZoomEnabled = NO;
        _lineChartView.rightAxis.enabled = YES;
        
        ChartXAxis *xAxis = _lineChartView.xAxis;
        xAxis.granularityEnabled = YES;
        xAxis.labelPosition = XAxisLabelPositionBottom;
        xAxis.gridColor = [UIColor clearColor];
        xAxis.labelTextColor = [UIColor blackColor];
        xAxis.axisLineColor = [UIColor grayColor];
        _lineChartView.maxVisibleCount = 999;
        
        ChartYAxis *leftAxis = _lineChartView.leftAxis;//获取左边Y轴
        leftAxis.labelCount = 9;//Y轴label数量，数值不一定，如果forceLabelsEnabled等于YES, 则强制绘制制定数量的label, 但是可能不平均
        leftAxis.forceLabelsEnabled = YES;//不强制绘制指定数量的label
        leftAxis.axisMinimum = 0;//设置Y轴的最小值
        leftAxis.axisMaximum = 240;//设置Y轴的最大值
        leftAxis.inverted = NO;//是否将Y轴进行上下翻转
        leftAxis.axisLineColor = [UIColor grayColor];//Y轴颜色
        leftAxis.labelPosition = YAxisLabelPositionOutsideChart;//label位置
        leftAxis.labelTextColor = [UIColor redColor];//文字颜色
        leftAxis.labelFont = [UIFont systemFontOfSize:10.0f];//文字字体
        leftAxis.drawAxisLineEnabled = YES;//画Y轴线
        leftAxis.axisLineColor = [UIColor grayColor];
        leftAxis.drawGridLinesEnabled = YES;
        leftAxis.gridAntialiasEnabled = NO;//开启抗锯齿
        
        ChartYAxis *rightAxis = _lineChartView.rightAxis;//获取右边Y轴
        rightAxis.labelCount = 9;
        rightAxis.forceLabelsEnabled = YES;//不强制绘制指定数量的label
        rightAxis.axisMinimum = 0;//设置Y轴的最小值
        rightAxis.axisMaximum = 50;//设置Y轴的最大值
        rightAxis.inverted = NO;//是否将Y轴进行上下翻转
        rightAxis.axisLineColor = [UIColor grayColor];//Y轴颜色
        rightAxis.labelPosition = YAxisLabelPositionOutsideChart;//label位置
        rightAxis.labelTextColor = [UIColor greenColor];//文字颜色
        rightAxis.labelFont = [UIFont systemFontOfSize:10.0f];//文字字体
        rightAxis.drawAxisLineEnabled = YES;//画Y轴线
        rightAxis.axisLineColor = [UIColor grayColor];
        rightAxis.drawGridLinesEnabled = NO;
        rightAxis.gridAntialiasEnabled = NO;//开启抗锯齿
        _lineChartView.delegate = self;
    }
    return _lineChartView;
}

- (NSString *)getLongtimeString:(NSInteger)seconds {
    NSString *timeStr = @"";
    NSInteger hour = seconds / 3600;
    NSInteger minute = seconds / 60;
    NSInteger second = seconds % 60;
    timeStr = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)hour,(long)minute,(long)second];
    return timeStr;
}

- (NSString *)getShortTimeString:(NSInteger)seconds {
    NSString *timeStr = @"";
    NSInteger minute = seconds / 60;
    NSInteger second = seconds % 60;
    timeStr = [NSString stringWithFormat:@"%02ld:%02ld",(long)minute,(long)second];
    return timeStr;
}

- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - button click events
- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
