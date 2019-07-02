//
//  HistoryDetailViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/4.
//  Copyright © 2019 dz. All rights reserved.
//

#import "HistoryDetailViewController.h"
#import "DateValueFormatter.h"
#import "SymbolsValueFormatter.h"

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
#define kFinishImg_Width 58
#define kFinishImg_RightMargin 6
#define kFinishImg_TopMargin 22
#define kFinishLbl_Height 11
#define kFinishLbl_BottomMargin 4
#define kFinishLbl_FontSize 11
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
#define kMarkBgView_Width 125
#define kMarkBgView_Height 115
#define kHistoryMarkBgView_Width 125
#define kHistoryMarkBgView_Height 55
#define kHistoryMarkValLbl_LeftMargin 5
#define kMarkLbl_TopMargin 12
#define kMarkLbl_LeftMargin 18
#define kMarkLbl_Height 11
#define kMarkLbl_FontSize 11.0
#define kTopBgImg_Height 550
#define kTopBgImg_BottomMargin 15
#define kBottomBgImg_Height 665
#define kBottomBgImg_BottomMargin 15
#define kHistoryLbl_Height 18
#define kHistoryLbl_Width 150
#define kHistoryLbl_FontSize 18.0
#define kHistoryLbl_TopMargin 15
#define kHistoryLbl_BottomMargin 28
#define kHistoryLineChart_Space 15
#define kHistoryLineChart_BottomMargin 10
#define kBottomView_CompleteLbl_LeftMargin 60
#define kBottomView_CompleteLbl_RigtMargin 60
#define kBottomView_CompleteLbl_Width 110
#define kBottomView_CompleteLbl_Height 13
#define kBottomView_CompleteLbl_BottomMargin 15
#define kBottomView_CompleteLbl_FontSize 13.0
#define kBottomView_DescriptionLbl_Width 110
#define kBottomView_DescriptionLbl_Height 30
#define kBottomView_DescriptionLbl_FontSize 11.0
@interface HistoryDetailViewController ()<ChartViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *topBgImg;
@property (nonatomic,strong)UIImageView *bottomBgImg;
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
@property (nonatomic,strong)UILabel *avgDifficultyUnitLbl;
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
@property (nonatomic,strong)UILabel *markY;
@property (nonatomic,strong)UIImageView *markBgView;
@property (nonatomic,strong)UIImageView *historyCompleteMarkBgView;
@property (nonatomic,strong)UILabel *historyCompleteMarkTimeLbl;
@property (nonatomic,strong)UILabel *historyCompleteMarkValLbl;
@property (nonatomic,strong)UIImageView *historyCalorieMarkBgView;
@property (nonatomic,strong)UILabel *historyCalorieMarkTimeLbl;
@property (nonatomic,strong)UILabel *historyCalorieMarkValLbl;
@property (nonatomic,strong)UIImageView *historyMaxHrMarkBgView;
@property (nonatomic,strong)UILabel *historyMaxHrMarkTimeLbl;
@property (nonatomic,strong)UILabel *historyMaxMarkValLbl;
@property (nonatomic,strong)UIImageView *historyAvgHrMarkBgView;
@property (nonatomic,strong)UILabel *historyAvgHrMarkTimeLbl;
@property (nonatomic,strong)UILabel *historyAvgHrMarkValLbl;
@property (nonatomic,strong)LineChartDataSet *set1;
@property (nonatomic,strong)LineChartDataSet *set2;
@property (nonatomic,strong)UILabel *markTimeLbl;
@property (nonatomic,strong)UILabel *markHRLbl;
@property (nonatomic,strong)UILabel *markSpeedLbl;
@property (nonatomic,strong)UILabel *markPowerLbl;
@property (nonatomic,strong)UILabel *markCalorieLbl;
@property (nonatomic,strong)UILabel *markRpeLbl;
@property (nonatomic,strong)NSMutableArray *speedArr;
@property (nonatomic,strong)NSMutableArray *powerArr;
@property (nonatomic,strong)NSMutableArray *rpeArr;
@property (nonatomic,strong)NSMutableArray *calorieArr;
@property (nonatomic,strong)NSMutableArray *difficultyArr;
@property (nonatomic,strong)UIScrollView *scrollview;
@property (nonatomic,strong)UILabel *historyLbl;//运动历史数据
@property (nonatomic,strong)UILabel *historyCompleteLbl;//历史完成度
@property (nonatomic,strong)UILabel *historyCompleteDespLbl;//历史完成度描述
@property (nonatomic,strong)LineChartView *completeLinechart;
@property (nonatomic,strong)UILabel *historyCalorieLbl;//历史消耗
@property (nonatomic,strong)UILabel *historyCalorieDespLbl;//历史消耗描述
@property (nonatomic,strong)LineChartView *calorieLinechart;
@property (nonatomic,strong)UILabel *historyMaxHrLbl;//历史最大心率
@property (nonatomic,strong)UILabel *historyMaxHrDespLbl;//历史最大心率描述
@property (nonatomic,strong)LineChartView *maxHrLinechart;
@property (nonatomic,strong)UILabel *historyAvgHrLbl;//历史平均心率
@property (nonatomic,strong)UILabel *historyAvgHrDespLbl;//历史平均心率描述
@property (nonatomic,strong)LineChartView *avgHrLinechart;
@end

@implementation HistoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    NSDictionary *prescription = [self.sportDict valueForKey:@"prescription"];
    self.type2 = [[prescription valueForKey:@"type2"] integerValue];
    NSDictionary *sportData = [self.sportDict valueForKey:@"sportData"];
    NSInteger totalTime = [[sportData valueForKey:@"totalTime"] integerValue];
    self.speedArr = [NSMutableArray array];
    self.powerArr = [NSMutableArray array];
    self.rpeArr = [NSMutableArray array];
    self.calorieArr = [NSMutableArray array];
    self.difficultyArr = [NSMutableArray array];
    NSString *calorieSample = [sportData valueForKey:@"calorieSample"];
    if (calorieSample.length > 0) {
        NSArray *calorieSampleArr = [calorieSample componentsSeparatedByString:@","];
        if (calorieSampleArr.count > 0) {
            [self.calorieArr addObjectsFromArray:calorieSampleArr];
        } else {
            
        }
    } else {
        if (totalTime > 0) {
            for (NSInteger i = 0; i < totalTime; i++) {
                [self.calorieArr addObject:[NSString stringWithFormat:@"%.1f",0.0]];
            }
        }
    }
    NSString *difficultySample = [sportData valueForKey:@"difficultySample"];
    if (difficultySample.length > 0) {
        NSArray *difficultySampleArr = [difficultySample componentsSeparatedByString:@","];
        if (difficultySampleArr.count > 0) {
            [self.difficultyArr addObjectsFromArray:difficultySampleArr];
        } else {
            
        }
    } else {
        if (totalTime > 0) {
            for (NSInteger i = 0; i < totalTime; i++) {
                [self.difficultyArr addObject:[NSString stringWithFormat:@"%d",0]];
            }
        }
    }
    NSString *powerSample = [sportData valueForKey:@"powerSample"];
    if (powerSample.length > 0) {
        NSArray *powerSampleArr = [powerSample componentsSeparatedByString:@","];
        if (powerSampleArr.count > 0) {
            [self.powerArr addObjectsFromArray:powerSampleArr];
        } else {
            
        }
    } else {
        if (totalTime > 0) {
            for (NSInteger i = 0; i < totalTime; i++) {
                [self.powerArr addObject:[NSString stringWithFormat:@"%d",0]];
            }
        }
    }
    NSString *speedSample = [sportData valueForKey:@"speedSample"];
    if (speedSample.length > 0) {
        NSArray *speedSampleArr = [speedSample componentsSeparatedByString:@","];
        if (speedSampleArr.count > 0) {
            [self.speedArr addObjectsFromArray:speedSampleArr];
        } else {
            
        }
    } else {
        if (totalTime > 0) {
            for (NSInteger i = 0; i < totalTime; i++) {
                [self.speedArr addObject:[NSString stringWithFormat:@"%.1f",0.0]];
            }
        }
    }
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
    self.view.backgroundColor = [UIColor lightTextColor];
    self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWidth, kHeight - CGRectGetMaxY(self.navView.frame))];
    self.scrollview.delegate = self;
    self.scrollview.contentSize = CGSizeMake(kWidth, (kBackgroundImg_TopMargin + kTopBgImg_Height + kTopBgImg_BottomMargin + kBottomBgImg_Height + kBottomBgImg_BottomMargin) * kYScal);
    self.scrollview.backgroundColor = [UIColor clearColor];
    self.scrollview.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollview];
    [self configTopView];
    [self configBottomView];
}

- (void)configTopView {
    UIImage *bgImg = [UIImage imageNamed:@"whiteBg"];
    bgImg = [self imageCompressWithSimple:bgImg scaledToSize:CGSizeMake(kWidth - 2 * kBackgroundImg_LeftMargin * kXScal, kTopBgImg_Height * kYScal)];
    self.topBgImg = [[UIImageView alloc] initWithFrame:CGRectMake(kBackgroundImg_LeftMargin * kXScal, kBackgroundImg_TopMargin * kYScal, kWidth - 2 * kBackgroundImg_LeftMargin * kXScal, kTopBgImg_Height * kYScal)];
    self.topBgImg.image = bgImg;
    [self.scrollview addSubview:self.topBgImg];
    self.topBgImg.userInteractionEnabled = YES;
    
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(kLeftView_LeftMargin * kXScal, kLeftView_TopMargin * kYScal, kLeftView_Width, self.topBgImg.frame.size.height - kLeftView_TopMargin * kYScal - kLeftView_BottomMargin * kYScal)];
    self.leftView.backgroundColor = [UIColor colorWithHexString:@"#d1f3f8"];
    [self.topBgImg addSubview:self.leftView];
    
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
    self.finishValLbl.text = @"100%";
    NSDictionary *sportData = [self.sportDict valueForKey:@"sportData"];
    NSInteger completePercent = [[sportData valueForKey:@"completePercent"] integerValue];
    self.finishValLbl.text = [NSString stringWithFormat:@"%ld%%",(long)completePercent];
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
    if (self.type2 == 2) {
        self.avgDifficultyLbl.text = @"平均功率";
    } else {
        self.avgDifficultyLbl.text = @"平均强度";
    }
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
    
    self.avgDifficultyUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgDifficultyValLbl.frame) + kCellLbl_Space * kXScal, self.avgDifficultyValLbl.frame.origin.y, lblWidth, cellHeight)];
    self.avgDifficultyUnitLbl.textColor = [UIColor blackColor];
    if (self.type2 == 2) {
        self.avgDifficultyUnitLbl.text = @"w";
    } else {
        self.avgDifficultyUnitLbl.text = @"";
    }
    self.avgDifficultyUnitLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    [self.sportView addSubview:self.avgDifficultyUnitLbl];
    
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
    
    
    self.timeValLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.mileValLbl.center.x, self.timeLbl.frame.origin.y, 2 * lblWidth, cellHeight)];
    self.timeValLbl.textColor = [UIColor blackColor];
    self.timeValLbl.textAlignment = NSTextAlignmentLeft;
    NSInteger totalTime = [[sportData valueForKey:@"totalTime"] integerValue];
    NSString *timeStr = [self getLongtimeString:totalTime];
    self.timeValLbl.text = [NSString stringWithFormat:@"%@",timeStr];
    self.timeValLbl.font = [UIFont systemFontOfSize:kSportView_Lbl_FontSize * kYScal];
    //    self.timeValLbl.center = CGPointMake(self.mileValLbl.center.x, self.timeLbl.center.y);
    [self.sportView addSubview:self.timeValLbl];
    
    CGFloat leftUnitImg_TopMargin = (self.topBgImg.frame.size.height - kLineCharView_TopMargin * kYScal - kLineCharView_BottomMargin * kYScal - kLeftUnitImg_Height * kYScal)/2;
    self.leftUnitImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.leftView.frame) + kLeftView_RightMargin * kXScal, leftUnitImg_TopMargin, kLeftUnitImg_Width * kXScal, kLeftUnitImg_Height * kYScal)];
    self.leftUnitImg.image = [UIImage imageNamed:@"leftUnit"];
    [self.topBgImg addSubview:self.leftUnitImg];
    
    CGFloat lineChartView_Width = self.topBgImg.frame.size.width - CGRectGetMaxX(self.leftUnitImg.frame) - kLeftUnitImg_RightMargin * kXScal - 2 * kRightUnitLbl_LeftMargin * kXScal - kRightUnitImg_Width * kXScal;
    CGFloat lineChartView_Height = self.topBgImg.frame.size.height - kLineCharView_TopMargin * kYScal - kLineCharView_BottomMargin * kYScal;
    self.lineChartView.frame = CGRectMake(CGRectGetMaxX(self.leftUnitImg.frame) + kLeftUnitImg_RightMargin * kXScal, kLineCharView_TopMargin * kYScal, lineChartView_Width, lineChartView_Height);
    [self setLineChartDataWithSportData:sportData];
    [self.topBgImg addSubview:self.lineChartView];
    
    CGFloat righUnitImg_TopMargin = (self.topBgImg.frame.size.height - kLineCharView_TopMargin * kYScal - kLineCharView_BottomMargin * kYScal - kRightUnitImg_Height * kYScal)/2;
    self.rightUnitImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lineChartView.frame) + kLeftUnitImg_RightMargin * kXScal, righUnitImg_TopMargin, kRightUnitImg_Width * kXScal, kRightUnitImg_Height * kYScal)];
    self.rightUnitImg.image = [UIImage imageNamed:@"rightUnit"];
    [self.topBgImg addSubview:self.rightUnitImg];
}

- (void)configBottomView {
    UIImage *bottomBgImg = [UIImage imageNamed:@"whiteBg"];
    bottomBgImg = [self imageCompressWithSimple:bottomBgImg scaledToSize:CGSizeMake(kWidth - 2 * kBackgroundImg_LeftMargin * kXScal, kBottomBgImg_Height * kYScal)];
    self.bottomBgImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.topBgImg.frame.origin.x, CGRectGetMaxY(self.topBgImg.frame)  + kBottomBgImg_BottomMargin * kYScal, self.topBgImg.frame.size.width, kBottomBgImg_Height * kYScal)];
    self.bottomBgImg.image = bottomBgImg;
    [self.scrollview addSubview:self.bottomBgImg];
    self.bottomBgImg.userInteractionEnabled = YES;
    
    self.historyLbl = [[UILabel alloc] initWithFrame:CGRectMake((self.bottomBgImg.frame.size.width - kHistoryLbl_Width)/2, kHistoryLbl_TopMargin * kYScal, kHistoryLbl_Width * kXScal, kHistoryLbl_Height * kYScal)];
    self.historyLbl.text = @"运动历史数据";
    self.historyLbl.font = [UIFont systemFontOfSize:kHistoryLbl_FontSize * kYScal];
    self.historyLbl.textAlignment = NSTextAlignmentCenter;
    self.historyLbl.textColor = [UIColor colorWithHexString:@"#10a9cb"];
    [self.bottomBgImg addSubview:self.historyLbl];
    
    CGFloat linechartHeight = (self.bottomBgImg.frame.size.height - CGRectGetMaxY(self.historyLbl.frame) - kHistoryLbl_BottomMargin * kYScal - 3 * kHistoryLineChart_Space * kYScal - kHistoryLineChart_BottomMargin * kYScal)/4;
    CGFloat linechartWidth = self.bottomBgImg.frame.size.width - (kBottomView_CompleteLbl_LeftMargin +  kBottomView_CompleteLbl_Width + kBottomView_CompleteLbl_RigtMargin) * kXScal;
    self.completeLinechart.frame = CGRectMake((kBottomView_CompleteLbl_LeftMargin +  kBottomView_CompleteLbl_Width + kBottomView_CompleteLbl_RigtMargin) * kXScal, CGRectGetMaxY(self.historyLbl.frame) + kHistoryLbl_BottomMargin * kYScal, linechartWidth, linechartHeight);
    [self setCompleteLinechartData];
    [self.bottomBgImg addSubview:self.completeLinechart];
    
    self.historyCompleteDespLbl = [[UILabel alloc] initWithFrame:CGRectMake(kBottomView_CompleteLbl_LeftMargin * kXScal, self.completeLinechart.frame.origin.y + linechartHeight/2.0 - 20, kBottomView_DescriptionLbl_Width * kXScal, kBottomView_DescriptionLbl_Height * kYScal)];
    self.historyCompleteDespLbl.font = [UIFont systemFontOfSize:kBottomView_DescriptionLbl_FontSize * kYScal];
    self.historyCompleteDespLbl.text = @"完成度越高说明您的运动效果越好。";
    self.historyCompleteDespLbl.numberOfLines = 2;
    self.historyCompleteDespLbl.textColor = [UIColor colorWithHexString:@"#f14444"];
    [self.bottomBgImg addSubview:self.historyCompleteDespLbl];
    
    self.historyCompleteLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.historyCompleteDespLbl.origin.x, self.historyCompleteDespLbl.frame.origin.y - kBottomView_CompleteLbl_BottomMargin * kYScal, kBottomView_DescriptionLbl_Width * kXScal, kBottomView_CompleteLbl_Height * kYScal)];
    self.historyCompleteLbl.font = [UIFont systemFontOfSize:kBottomView_CompleteLbl_FontSize * kYScal];
    self.historyCompleteLbl.text = @"完成度（%）";
    self.historyCompleteLbl.textColor = [UIColor colorWithHexString:@"#e51616"];
    [self.bottomBgImg addSubview:self.historyCompleteLbl];
    
    self.calorieLinechart.frame = CGRectMake((kBottomView_CompleteLbl_LeftMargin +  kBottomView_CompleteLbl_Width + kBottomView_CompleteLbl_RigtMargin) * kXScal, CGRectGetMaxY(self.completeLinechart.frame) + kHistoryLineChart_Space * kYScal, linechartWidth, linechartHeight);
    [self setCalorieLinechartData];
    [self.bottomBgImg addSubview:self.calorieLinechart];
    
    self.historyCalorieDespLbl = [[UILabel alloc] initWithFrame:CGRectMake(kBottomView_CompleteLbl_LeftMargin * kXScal, self.calorieLinechart.frame.origin.y + linechartHeight/2.0 - 20, kBottomView_DescriptionLbl_Width * kXScal, kBottomView_DescriptionLbl_Height * kYScal)];
    self.historyCalorieDespLbl.font = [UIFont systemFontOfSize:kBottomView_DescriptionLbl_FontSize * kYScal];
    self.historyCalorieDespLbl.text = @"消耗增加可能代表了您代谢能力的提高。";
    self.historyCalorieDespLbl.numberOfLines = 2;
    self.historyCalorieDespLbl.textColor = [UIColor colorWithHexString:@"#bc3eea"];
    [self.bottomBgImg addSubview:self.historyCalorieDespLbl];
    
    self.historyCalorieLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.historyCalorieDespLbl.origin.x, self.historyCalorieDespLbl.frame.origin.y - kBottomView_CompleteLbl_BottomMargin * kYScal, kBottomView_DescriptionLbl_Width * kXScal, kBottomView_CompleteLbl_Height * kYScal)];
    self.historyCalorieLbl.font = [UIFont systemFontOfSize:kBottomView_CompleteLbl_FontSize * kYScal];
    self.historyCalorieLbl.text = @"消耗（kcal）";
    self.historyCalorieLbl.textColor = [UIColor colorWithHexString:@"#af16e8"];
    [self.bottomBgImg addSubview:self.historyCalorieLbl];
    
    self.maxHrLinechart.frame = CGRectMake((kBottomView_CompleteLbl_LeftMargin +  kBottomView_CompleteLbl_Width + kBottomView_CompleteLbl_RigtMargin) * kXScal, CGRectGetMaxY(self.calorieLinechart.frame) + kHistoryLineChart_Space * kYScal, linechartWidth, linechartHeight);
    [self setMaxHrLinechartData];
    [self.bottomBgImg addSubview:self.maxHrLinechart];
    
    self.historyMaxHrDespLbl = [[UILabel alloc] initWithFrame:CGRectMake(kBottomView_CompleteLbl_LeftMargin * kXScal, self.maxHrLinechart.frame.origin.y + linechartHeight/2.0 - 20, kBottomView_DescriptionLbl_Width * kXScal, kBottomView_DescriptionLbl_Height * kYScal)];
    self.historyMaxHrDespLbl.font = [UIFont systemFontOfSize:kBottomView_DescriptionLbl_FontSize * kYScal];
    self.historyMaxHrDespLbl.text = @"最大心率降低可能代表了您心扉能力的增强。";
    self.historyMaxHrDespLbl.numberOfLines = 2;
    self.historyMaxHrDespLbl.textColor = [UIColor colorWithHexString:@"#3c5dda"];
    [self.bottomBgImg addSubview:self.historyMaxHrDespLbl];
    
    self.historyMaxHrLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.historyMaxHrDespLbl.origin.x, self.historyMaxHrDespLbl.frame.origin.y - kBottomView_CompleteLbl_BottomMargin * kYScal, kBottomView_DescriptionLbl_Width * kXScal, kBottomView_CompleteLbl_Height * kYScal)];
    self.historyMaxHrLbl.font = [UIFont systemFontOfSize:kBottomView_CompleteLbl_FontSize * kYScal];
    self.historyMaxHrLbl.text = @"最大心率（bpm）";
    self.historyMaxHrLbl.textColor = [UIColor colorWithHexString:@"#1537b6"];
    [self.bottomBgImg addSubview:self.historyMaxHrLbl];
    
    self.avgHrLinechart.frame = CGRectMake((kBottomView_CompleteLbl_LeftMargin +  kBottomView_CompleteLbl_Width + kBottomView_CompleteLbl_RigtMargin) * kXScal, CGRectGetMaxY(self.maxHrLinechart.frame) + kHistoryLineChart_Space * kYScal, linechartWidth, linechartHeight);
    [self setAvgHrLinechartData];
    [self.bottomBgImg addSubview:self.avgHrLinechart];
    
    self.historyAvgHrDespLbl = [[UILabel alloc] initWithFrame:CGRectMake(kBottomView_CompleteLbl_LeftMargin * kXScal, self.avgHrLinechart.frame.origin.y + linechartHeight/2.0 - 20, kBottomView_DescriptionLbl_Width * kXScal, kBottomView_DescriptionLbl_Height * kYScal)];
    self.historyAvgHrDespLbl.font = [UIFont systemFontOfSize:kBottomView_DescriptionLbl_FontSize * kYScal];
    self.historyAvgHrDespLbl.text = @"平均心率降低可能代表了您心肺能力的增强。";
    self.historyAvgHrDespLbl.numberOfLines = 2;
    self.historyAvgHrDespLbl.textColor = [UIColor colorWithHexString:@"#40a638"];
    [self.bottomBgImg addSubview:self.historyAvgHrDespLbl];
    
    self.historyAvgHrLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.historyAvgHrDespLbl.origin.x, self.historyAvgHrDespLbl.frame.origin.y - kBottomView_CompleteLbl_BottomMargin * kYScal, kBottomView_DescriptionLbl_Width * kXScal, kBottomView_CompleteLbl_Height * kYScal)];
    self.historyAvgHrLbl.font = [UIFont systemFontOfSize:kBottomView_CompleteLbl_FontSize * kYScal];
    self.historyAvgHrLbl.text = @"平均心率（bpm）";
    self.historyAvgHrLbl.textColor = [UIColor colorWithHexString:@"#15870c"];
    [self.bottomBgImg addSubview:self.historyAvgHrLbl];
}

- (void)setCompleteLinechartData {
    if (self.reports.count > 0) {
        NSMutableArray *xVals = [NSMutableArray array];
        for (NSInteger i = 0; i < self.reports.count; i++) {
            [xVals addObject:[NSString stringWithFormat:@"%d",i+1]];
        }
        NSMutableArray *dataSets = [NSMutableArray array];
        NSMutableArray *leftVals = [NSMutableArray array];
        if (xVals.count > 0) {
            _completeLinechart.xAxis.valueFormatter = [[ChartIndexAxisValueFormatter alloc] initWithValues:xVals];
            for (NSInteger j = 0; j < xVals.count; j++) {
                NSDictionary *dict = [self.reports objectAtIndex:j];
                NSInteger completePercent = [[dict valueForKey:@"completePercent"] integerValue];
                ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:j y:completePercent];
                [leftVals addObject:entry];
            }
        }
        LineChartDataSet *set = [[LineChartDataSet alloc] initWithValues:leftVals label:@"完成度"];
        set.axisDependency = AxisDependencyLeft;
        set.lineWidth = 2.0;
        set.drawValuesEnabled = YES;
        [set setColor:[UIColor colorWithHexString:@"#e51616"]];
        set.drawCirclesEnabled = NO;
        set.drawFilledEnabled = NO;
        set.highlightEnabled = YES;//选中拐点开启高亮效果
        set.highlightColor = [UIColor clearColor];
        [dataSets addObject:set];
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:[UIFont systemFontOfSize:11.0]];
        [data setValueTextColor:[UIColor clearColor]];
        _completeLinechart.data = data;
    }
}

- (void)setCalorieLinechartData {
    if (self.reports.count > 0) {
        NSMutableArray *xVals = [NSMutableArray array];
        for (NSInteger i = 0; i < self.reports.count; i++) {
            [xVals addObject:[NSString stringWithFormat:@"%d",i+1]];
        }
        NSMutableArray *dataSets = [NSMutableArray array];
        NSMutableArray *leftVals = [NSMutableArray array];
        if (xVals.count > 0) {
            _calorieLinechart.xAxis.valueFormatter = [[ChartIndexAxisValueFormatter alloc] initWithValues:xVals];
            for (NSInteger j = 0; j < xVals.count; j++) {
                NSDictionary *dict = [self.reports objectAtIndex:j];
                CGFloat calorie = [[dict valueForKey:@"calorie"] floatValue];
                ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:j y:calorie];
                [leftVals addObject:entry];
            }
        }
        LineChartDataSet *set = [[LineChartDataSet alloc] initWithValues:leftVals label:@"消耗"];
        set.axisDependency = AxisDependencyLeft;
        set.lineWidth = 2.0;
        set.drawValuesEnabled = YES;
        [set setColor:[UIColor colorWithHexString:@"#af16e8"]];
        set.drawCirclesEnabled = NO;
        set.drawFilledEnabled = NO;
        set.highlightEnabled = YES;//选中拐点开启高亮效果
        set.highlightColor = [UIColor clearColor];
        [dataSets addObject:set];
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:[UIFont systemFontOfSize:11.0]];
        [data setValueTextColor:[UIColor clearColor]];
        _calorieLinechart.data = data;
    }
}

- (void)setMaxHrLinechartData {
    if (self.reports.count > 0) {
        NSMutableArray *xVals = [NSMutableArray array];
        for (NSInteger i = 0; i < self.reports.count; i++) {
            [xVals addObject:[NSString stringWithFormat:@"%d",i+1]];
        }
        NSMutableArray *dataSets = [NSMutableArray array];
        NSMutableArray *leftVals = [NSMutableArray array];
        if (xVals.count > 0) {
            _maxHrLinechart.xAxis.valueFormatter = [[ChartIndexAxisValueFormatter alloc] initWithValues:xVals];
            for (NSInteger j = 0; j < xVals.count; j++) {
                NSDictionary *dict = [self.reports objectAtIndex:j];
                NSInteger calorie = [[dict valueForKey:@"maxHr"] integerValue];
                ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:j y:calorie];
                [leftVals addObject:entry];
            }
        }
        LineChartDataSet *set = [[LineChartDataSet alloc] initWithValues:leftVals label:@"最大心率"];
        set.axisDependency = AxisDependencyLeft;
        set.lineWidth = 2.0;
        set.drawValuesEnabled = YES;
        [set setColor:[UIColor colorWithHexString:@"#1537b6"]];
        set.drawCirclesEnabled = NO;
        set.drawFilledEnabled = NO;
        set.highlightEnabled = YES;//选中拐点开启高亮效果
        set.highlightColor = [UIColor clearColor];
        [dataSets addObject:set];
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:[UIFont systemFontOfSize:11.0]];
        [data setValueTextColor:[UIColor clearColor]];
        _maxHrLinechart.data = data;
    }
}

- (void)setAvgHrLinechartData {
    if (self.reports.count > 0) {
        NSMutableArray *xVals = [NSMutableArray array];
        for (NSInteger i = 0; i < self.reports.count; i++) {
            [xVals addObject:[NSString stringWithFormat:@"%d",i+1]];
        }
        NSMutableArray *dataSets = [NSMutableArray array];
        NSMutableArray *leftVals = [NSMutableArray array];
        if (xVals.count > 0) {
            _avgHrLinechart.xAxis.valueFormatter = [[ChartIndexAxisValueFormatter alloc] initWithValues:xVals];
            for (NSInteger j = 0; j < xVals.count; j++) {
                NSDictionary *dict = [self.reports objectAtIndex:j];
                NSInteger calorie = [[dict valueForKey:@"avgHr"] integerValue];
                ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:j y:calorie];
                [leftVals addObject:entry];
            }
        }
        LineChartDataSet *set = [[LineChartDataSet alloc] initWithValues:leftVals label:@"平均心率"];
        set.axisDependency = AxisDependencyLeft;
        set.lineWidth = 2.0;
        set.drawValuesEnabled = YES;
        [set setColor:[UIColor colorWithHexString:@"#15870c"]];
        set.drawCirclesEnabled = NO;
        set.drawFilledEnabled = NO;
        set.highlightEnabled = YES;//选中拐点开启高亮效果
        set.highlightColor = [UIColor clearColor];
        [dataSets addObject:set];
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:[UIFont systemFontOfSize:11.0]];
        [data setValueTextColor:[UIColor clearColor]];
        _avgHrLinechart.data = data;
    }
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
    NSMutableArray *dataSets = [NSMutableArray array];
    if (xVals.count > 0) {
        _lineChartView.xAxis.valueFormatter = [[DateValueFormatter alloc] initWithArr:xVals];
        NSMutableArray *leftVals = [NSMutableArray array];
        if (hrSample.length > 0) {
            NSArray *hrArr = [hrSample componentsSeparatedByString:@","];
            for (NSInteger j = 0; j < xVals.count; j++) {
                NSInteger hr = 0;
                hr = [[hrArr objectAtIndex:j] integerValue];
                ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:j y:hr];
                [leftVals addObject:entry];
            }
        } else {
            for (NSInteger j = 0; j < xVals.count; j++) {
                NSInteger hr = 0;
                ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:j y:hr];
                [leftVals addObject:entry];
            }
        }
        _set1 = [[LineChartDataSet alloc] initWithValues:leftVals label:@"心率"];
        _set1.axisDependency = AxisDependencyLeft;
        _set1.lineWidth = 2.0;
        _set1.drawValuesEnabled = YES;
        [_set1 setColor:[UIColor redColor]];
        _set1.drawCirclesEnabled = NO;
        _set1.drawFilledEnabled = NO;
        _set1.highlightEnabled = YES;//选中拐点开启高亮效果
        _set1.highlightColor = [UIColor clearColor];
        [dataSets addObject:_set1];
        
        NSMutableArray *rightVals = [NSMutableArray array];
        if (speedSample.length > 0) {
            NSArray *speedArr = [speedSample componentsSeparatedByString:@","];
            for (NSInteger k = 0; k < xVals.count; k++) {
                NSInteger speed = 0;
                speed = [[speedArr objectAtIndex:k] integerValue];
                ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:k y:speed];
                [rightVals addObject:entry];
            }
        } else {
            for (NSInteger k = 0; k < xVals.count; k++) {
                NSInteger speed = 0;
                ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:k y:speed];
                [rightVals addObject:entry];
            }
        }
        _set2 = [[LineChartDataSet alloc] initWithValues:rightVals label:@"速度"];
        _set2.axisDependency = AxisDependencyRight;
        _set2.lineWidth = 2.0;
        _set2.drawValuesEnabled = YES;
        [_set2 setColor:[UIColor greenColor]];
        _set2.drawCirclesEnabled = NO;
        _set2.drawFilledEnabled = NO;
        _set2.highlightEnabled = YES;
        _set2.highlightColor = [UIColor clearColor];
        [dataSets addObject:_set2];
    }
    LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
    [data setValueFont:[UIFont systemFontOfSize:11.0]];
    [data setValueTextColor:[UIColor clearColor]];
    _lineChartView.data = data;
}

- (LineChartView*)completeLinechart {
    if (_completeLinechart == nil) {
        _completeLinechart = [[LineChartView alloc] init];
        _completeLinechart.noDataText = @"暂无数据";
        _completeLinechart.chartDescription.enabled = NO;
        _completeLinechart.scaleYEnabled = NO;
        _completeLinechart.scaleXEnabled = NO;
        _completeLinechart.doubleTapToZoomEnabled = NO;
        ChartMarkerView *markerY = [[ChartMarkerView alloc] init];
        markerY.offset = CGPointMake(-kHistoryMarkBgView_Width * kXScal, -kHistoryMarkBgView_Height * kYScal - 5);
        markerY.chartView = _completeLinechart;
        _completeLinechart.marker = markerY;
        [markerY addSubview:self.historyCompleteMarkBgView];
        
        _completeLinechart.rightAxis.enabled = NO;//不绘制右轴
        ChartXAxis *xAxis = _completeLinechart.xAxis;
        xAxis.granularityEnabled = YES;
        xAxis.labelPosition = XAxisLabelPositionBottom;
        xAxis.gridColor = [UIColor clearColor];
        xAxis.labelTextColor = [UIColor blackColor];
        xAxis.axisLineColor = [UIColor grayColor];
        _completeLinechart.maxVisibleCount = 999;
        if (self.reports.count > 5) {
            xAxis.labelCount = self.reports.count;
        }
        
        ChartYAxis *leftAxis = _completeLinechart.leftAxis;//获取左边Y轴
        leftAxis.labelCount = 6;//Y轴label数量，数值不一定，如果forceLabelsEnabled等于YES, 则强制绘制制定数量的label, 但是可能不平均
        leftAxis.forceLabelsEnabled = YES;//不强制绘制指定数量的label
        leftAxis.axisMinimum = 0;//设置Y轴的最小值
        leftAxis.axisMaximum = 100;//设置Y轴的最大值
        leftAxis.inverted = NO;//是否将Y轴进行上下翻转
        leftAxis.axisLineColor = [UIColor colorWithHexString:@"#e51616"];//Y轴颜色
        leftAxis.labelPosition = YAxisLabelPositionOutsideChart;//label位置
        leftAxis.labelTextColor = [UIColor redColor];//文字颜色
        leftAxis.labelFont = [UIFont systemFontOfSize:10.0f];//文字字体
        leftAxis.drawAxisLineEnabled = YES;//画Y轴线
        leftAxis.axisLineColor = [UIColor grayColor];
        leftAxis.drawGridLinesEnabled = YES;
        leftAxis.gridAntialiasEnabled = NO;//开启抗锯齿
        _completeLinechart.delegate = self;
    }
    return _completeLinechart;
}

- (LineChartView*)calorieLinechart {
    if (_calorieLinechart == nil) {
        _calorieLinechart = [[LineChartView alloc] init];
        _calorieLinechart.noDataText = @"暂无数据";
        _calorieLinechart.chartDescription.enabled = NO;
        _calorieLinechart.scaleYEnabled = NO;
        _calorieLinechart.scaleXEnabled = NO;
        _calorieLinechart.doubleTapToZoomEnabled = NO;
        
        ChartMarkerView *markerY = [[ChartMarkerView alloc] init];
        markerY.offset = CGPointMake(-kHistoryMarkBgView_Width * kXScal, -kHistoryMarkBgView_Height * kYScal - 5);
        markerY.chartView = _calorieLinechart;
        _calorieLinechart.marker = markerY;
        [markerY addSubview:self.historyCalorieMarkBgView];
        
        _calorieLinechart.rightAxis.enabled = NO;//不绘制右轴
        ChartXAxis *xAxis = _calorieLinechart.xAxis;
        xAxis.granularityEnabled = YES;
        xAxis.labelPosition = XAxisLabelPositionBottom;
        xAxis.gridColor = [UIColor clearColor];
        xAxis.labelTextColor = [UIColor blackColor];
        xAxis.axisLineColor = [UIColor grayColor];
        _calorieLinechart.maxVisibleCount = 999;
        NSMutableArray *calories = [NSMutableArray array];
        if (self.reports.count > 0) {
            for (NSDictionary *dict in self.reports) {
                CGFloat calorie = [[dict valueForKey:@"calorie"] floatValue];
                [calories addObject:[NSNumber numberWithFloat:calorie]];
            }
            if (self.reports.count > 5) {
                xAxis.labelCount = self.reports.count;
            }
        }
        CGFloat maxCalorie = 0.0;
        maxCalorie = [[calories valueForKeyPath:@"@max.floatValue"] floatValue];
        CGFloat minCalorie = 0.0;
        minCalorie = [[calories valueForKeyPath:@"@min.floatValue"] floatValue];
        NSInteger max = (NSInteger)(maxCalorie * 10);
        if (max %2==0) {
            maxCalorie+=4.0;
        } else {
            maxCalorie+=5.0;
        }
        ChartYAxis *leftAxis = _calorieLinechart.leftAxis;//获取左边Y轴
        leftAxis.labelCount = 6;//Y轴label数量，数值不一定，如果forceLabelsEnabled等于YES, 则强制绘制制定数量的label, 但是可能不平均
        leftAxis.forceLabelsEnabled = YES;//不强制绘制指定数量的label
        leftAxis.axisMinimum = minCalorie;//设置Y轴的最小值
        leftAxis.axisMaximum = maxCalorie;//设置Y轴的最大值
        leftAxis.inverted = NO;//是否将Y轴进行上下翻转
        leftAxis.axisLineColor = [UIColor colorWithHexString:@"#af16e8"];//Y轴颜色
        leftAxis.labelPosition = YAxisLabelPositionOutsideChart;//label位置
        leftAxis.labelTextColor = [UIColor colorWithHexString:@"#af16e8"];//文字颜色
        leftAxis.labelFont = [UIFont systemFontOfSize:10.0f];//文字字体
        leftAxis.drawAxisLineEnabled = YES;//画Y轴线
        leftAxis.axisLineColor = [UIColor grayColor];
        leftAxis.drawGridLinesEnabled = YES;
        leftAxis.gridAntialiasEnabled = NO;//开启抗锯齿
        _calorieLinechart.delegate = self;
    }
    return _calorieLinechart;
}

- (LineChartView*)maxHrLinechart {
    if (_maxHrLinechart == nil) {
        _maxHrLinechart = [[LineChartView alloc] init];
        _maxHrLinechart.noDataText = @"暂无数据";
        _maxHrLinechart.chartDescription.enabled = NO;
        _maxHrLinechart.scaleYEnabled = NO;
        _maxHrLinechart.scaleXEnabled = NO;
        _maxHrLinechart.doubleTapToZoomEnabled = NO;

        ChartMarkerView *markerY = [[ChartMarkerView alloc] init];
        markerY.offset = CGPointMake(-kHistoryMarkBgView_Width * kXScal, -kHistoryMarkBgView_Height * kYScal - 5);
        markerY.chartView = _maxHrLinechart;
        _maxHrLinechart.marker = markerY;
        [markerY addSubview:self.historyMaxHrMarkBgView];
        
        _maxHrLinechart.rightAxis.enabled = NO;//不绘制右轴
        ChartXAxis *xAxis = _maxHrLinechart.xAxis;
        xAxis.granularityEnabled = YES;
        xAxis.labelPosition = XAxisLabelPositionBottom;
        xAxis.gridColor = [UIColor clearColor];
        xAxis.labelTextColor = [UIColor blackColor];
        xAxis.axisLineColor = [UIColor grayColor];
        _maxHrLinechart.maxVisibleCount = 999;
        if (self.reports.count > 5) {
            xAxis.labelCount = self.reports.count;
        }
        
        ChartYAxis *leftAxis = _maxHrLinechart.leftAxis;//获取左边Y轴
        leftAxis.labelCount = 7;//Y轴label数量，数值不一定，如果forceLabelsEnabled等于YES, 则强制绘制制定数量的label, 但是可能不平均
        leftAxis.forceLabelsEnabled = YES;//不强制绘制指定数量的label
        leftAxis.axisMinimum = 0;//设置Y轴的最小值
        leftAxis.axisMaximum = 240;//设置Y轴的最大值
        leftAxis.inverted = NO;//是否将Y轴进行上下翻转
        leftAxis.axisLineColor = [UIColor redColor];//Y轴颜色
        leftAxis.labelPosition = YAxisLabelPositionOutsideChart;//label位置
        leftAxis.labelTextColor = [UIColor colorWithHexString:@"#1537b6"];//文字颜色
        leftAxis.labelFont = [UIFont systemFontOfSize:10.0f];//文字字体
        leftAxis.drawAxisLineEnabled = YES;//画Y轴线
        leftAxis.axisLineColor = [UIColor grayColor];
        leftAxis.drawGridLinesEnabled = YES;
        leftAxis.gridAntialiasEnabled = NO;//开启抗锯齿
        _maxHrLinechart.delegate = self;
    }
    return _maxHrLinechart;
}

- (LineChartView*)avgHrLinechart {
    if (_avgHrLinechart == nil) {
        _avgHrLinechart = [[LineChartView alloc] init];
        _avgHrLinechart.noDataText = @"暂无数据";
        _avgHrLinechart.chartDescription.enabled = NO;
        _avgHrLinechart.scaleYEnabled = NO;
        _avgHrLinechart.scaleXEnabled = NO;
        _avgHrLinechart.doubleTapToZoomEnabled = NO;

        ChartMarkerView *markerY = [[ChartMarkerView alloc] init];
        markerY.offset = CGPointMake(-kHistoryMarkBgView_Width * kXScal, -kHistoryMarkBgView_Height * kYScal - 5);
        markerY.chartView = _avgHrLinechart;
        _avgHrLinechart.marker = markerY;
        [markerY addSubview:self.historyAvgHrMarkBgView];
        
        _avgHrLinechart.rightAxis.enabled = NO;//不绘制右轴
        ChartXAxis *xAxis = _avgHrLinechart.xAxis;
        xAxis.granularityEnabled = YES;
        xAxis.labelPosition = XAxisLabelPositionBottom;
        xAxis.gridColor = [UIColor clearColor];
        xAxis.labelTextColor = [UIColor blackColor];
        xAxis.axisLineColor = [UIColor grayColor];
        _avgHrLinechart.maxVisibleCount = 999;
        if (self.reports.count > 5) {
            xAxis.labelCount = self.reports.count;
        }
        
        ChartYAxis *leftAxis = _avgHrLinechart.leftAxis;//获取左边Y轴
        leftAxis.labelCount = 7;//Y轴label数量，数值不一定，如果forceLabelsEnabled等于YES, 则强制绘制制定数量的label, 但是可能不平均
        leftAxis.forceLabelsEnabled = YES;//不强制绘制指定数量的label
        leftAxis.axisMinimum = 0;//设置Y轴的最小值
        leftAxis.axisMaximum = 240;//设置Y轴的最大值
        leftAxis.inverted = NO;//是否将Y轴进行上下翻转
        leftAxis.axisLineColor = [UIColor redColor];//Y轴颜色
        leftAxis.labelPosition = YAxisLabelPositionOutsideChart;//label位置
        leftAxis.labelTextColor = [UIColor colorWithHexString:@"#15870c"];//文字颜色
        leftAxis.labelFont = [UIFont systemFontOfSize:10.0f];//文字字体
        leftAxis.drawAxisLineEnabled = YES;//画Y轴线
        leftAxis.axisLineColor = [UIColor grayColor];
        leftAxis.drawGridLinesEnabled = YES;
        leftAxis.gridAntialiasEnabled = NO;//开启抗锯齿
        _avgHrLinechart.delegate = self;
    }
    return _avgHrLinechart;
}

- (LineChartView*)lineChartView {
    if (_lineChartView == nil) {
        _lineChartView = [[LineChartView alloc] init];
        _lineChartView.noDataText = @"暂无数据";
        _lineChartView.chartDescription.enabled = NO;
        _lineChartView.scaleYEnabled = NO;
        _lineChartView.doubleTapToZoomEnabled = NO;
        ChartMarkerView *markerY = [[ChartMarkerView alloc] init];
        markerY.offset = CGPointMake(-kMarkBgView_Width * kXScal, -kMarkBgView_Height * kYScal - 5);
        markerY.chartView = _lineChartView;
        _lineChartView.marker = markerY;
//        [self.markBgView addSubview:self.markY];
        [markerY addSubview:self.markBgView];
        
        _lineChartView.rightAxis.enabled = YES;//不绘制右轴
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

- (UILabel *)markY{
    if (!_markY) {
        _markY = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
        _markY.font = [UIFont systemFontOfSize:10.0];
        _markY.textAlignment = NSTextAlignmentCenter;
        _markY.numberOfLines = 2;
        _markY.text =@"";
        _markY.textColor = [UIColor whiteColor];
    }
    return _markY;
}

- (UIImageView*)historyCompleteMarkBgView {
    if (!_historyCompleteMarkBgView) {
        _historyCompleteMarkBgView = [[UIImageView alloc] init];
        _historyCompleteMarkBgView.backgroundColor = [UIColor colorWithHexString:@"#e4f7f8"];
        _historyCompleteMarkBgView.frame = CGRectMake(0, 0, kHistoryMarkBgView_Width * kXScal, kHistoryMarkBgView_Height * kYScal);
        
        _historyCompleteMarkTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(kMarkLbl_LeftMargin * kXScal, kMarkLbl_TopMargin * kYScal, kMarkBgView_Width * kXScal - kMarkLbl_LeftMargin * kXScal, kMarkLbl_Height * kYScal)];
        _historyCompleteMarkTimeLbl.text = @"第1次";
        _historyCompleteMarkTimeLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        _historyCompleteMarkTimeLbl.textColor = [UIColor blackColor];
        [_historyCompleteMarkBgView addSubview:_historyCompleteMarkTimeLbl];
        CGFloat vSpace = kHistoryMarkBgView_Height * kYScal - 2 * kMarkLbl_TopMargin * kYScal - 2 * kMarkLbl_Height * kYScal;
        
        _historyCompleteMarkValLbl = [[UILabel alloc] initWithFrame:CGRectMake(_historyCompleteMarkTimeLbl.frame.origin.x + kHistoryMarkValLbl_LeftMargin * kXScal, CGRectGetMaxY(_historyCompleteMarkTimeLbl.frame) + vSpace, _historyCompleteMarkTimeLbl.frame.size.width, _historyCompleteMarkTimeLbl.frame.size.height)];
        _historyCompleteMarkValLbl.textColor = [UIColor blackColor];
        _historyCompleteMarkValLbl.text = @"完成度：0";
        _historyCompleteMarkValLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        [_historyCompleteMarkBgView addSubview:_historyCompleteMarkValLbl];
    }
    return _historyCompleteMarkBgView;
}

- (UIImageView*)historyCalorieMarkBgView {
    if (!_historyCalorieMarkBgView) {
        _historyCalorieMarkBgView = [[UIImageView alloc] init];
        _historyCalorieMarkBgView.backgroundColor = [UIColor colorWithHexString:@"#e4f7f8"];
        _historyCalorieMarkBgView.frame = CGRectMake(0, 0, kHistoryMarkBgView_Width * kXScal, kHistoryMarkBgView_Height * kYScal);
        
        _historyCalorieMarkTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(kMarkLbl_LeftMargin * kXScal, kMarkLbl_TopMargin * kYScal, kMarkBgView_Width * kXScal - kMarkLbl_LeftMargin * kXScal, kMarkLbl_Height * kYScal)];
        _historyCalorieMarkTimeLbl.text = @"第1次";
        _historyCalorieMarkTimeLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        _historyCalorieMarkTimeLbl.textColor = [UIColor blackColor];
        [_historyCalorieMarkBgView addSubview:_historyCalorieMarkTimeLbl];
        CGFloat vSpace = kHistoryMarkBgView_Height * kYScal - 2 * kMarkLbl_TopMargin * kYScal - 2 * kMarkLbl_Height * kYScal;
        
        _historyCalorieMarkValLbl = [[UILabel alloc] initWithFrame:CGRectMake(_historyCalorieMarkTimeLbl.frame.origin.x + kHistoryMarkValLbl_LeftMargin * kXScal, CGRectGetMaxY(_historyCalorieMarkTimeLbl.frame) + vSpace, _historyCalorieMarkTimeLbl.frame.size.width, _historyCalorieMarkTimeLbl.frame.size.height)];
        _historyCalorieMarkValLbl.textColor = [UIColor blackColor];
        _historyCalorieMarkValLbl.text = @"消耗：0.0";
        _historyCalorieMarkValLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        [_historyCalorieMarkBgView addSubview:_historyCalorieMarkValLbl];
    }
    return _historyCalorieMarkBgView;
}

- (UIImageView*)historyMaxHrMarkBgView {
    if (!_historyMaxHrMarkBgView) {
        _historyMaxHrMarkBgView = [[UIImageView alloc] init];
        _historyMaxHrMarkBgView.backgroundColor = [UIColor colorWithHexString:@"#e4f7f8"];
        _historyMaxHrMarkBgView.frame = CGRectMake(0, 0, kHistoryMarkBgView_Width * kXScal, kHistoryMarkBgView_Height * kYScal);
        
        _historyMaxHrMarkTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(kMarkLbl_LeftMargin * kXScal, kMarkLbl_TopMargin * kYScal, kMarkBgView_Width * kXScal - kMarkLbl_LeftMargin * kXScal, kMarkLbl_Height * kYScal)];
        _historyMaxHrMarkTimeLbl.text = @"第1次";
        _historyMaxHrMarkTimeLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        _historyMaxHrMarkTimeLbl.textColor = [UIColor blackColor];
        [_historyMaxHrMarkBgView addSubview:_historyMaxHrMarkTimeLbl];
        CGFloat vSpace = kHistoryMarkBgView_Height * kYScal - 2 * kMarkLbl_TopMargin * kYScal - 2 * kMarkLbl_Height * kYScal;
        
        _historyMaxMarkValLbl = [[UILabel alloc] initWithFrame:CGRectMake(_historyMaxHrMarkTimeLbl.frame.origin.x + kHistoryMarkValLbl_LeftMargin * kXScal, CGRectGetMaxY(_historyMaxHrMarkTimeLbl.frame) + vSpace, _historyMaxHrMarkTimeLbl.frame.size.width, _historyMaxHrMarkTimeLbl.frame.size.height)];
        _historyMaxMarkValLbl.textColor = [UIColor blackColor];
        _historyMaxMarkValLbl.text = @"最大心率：0";
        _historyMaxMarkValLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        [_historyMaxHrMarkBgView addSubview:_historyMaxMarkValLbl];
    }
    return _historyMaxHrMarkBgView;
}

- (UIImageView*)historyAvgHrMarkBgView {
    if (!_historyAvgHrMarkBgView) {
        _historyAvgHrMarkBgView = [[UIImageView alloc] init];
        _historyAvgHrMarkBgView.backgroundColor = [UIColor colorWithHexString:@"#e4f7f8"];
        _historyAvgHrMarkBgView.frame = CGRectMake(0, 0, kHistoryMarkBgView_Width * kXScal, kHistoryMarkBgView_Height * kYScal);
        
        _historyAvgHrMarkTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(kMarkLbl_LeftMargin * kXScal, kMarkLbl_TopMargin * kYScal, kMarkBgView_Width * kXScal - kMarkLbl_LeftMargin * kXScal, kMarkLbl_Height * kYScal)];
        _historyAvgHrMarkTimeLbl.text = @"第1次";
        _historyAvgHrMarkTimeLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        _historyAvgHrMarkTimeLbl.textColor = [UIColor blackColor];
        [_historyAvgHrMarkBgView addSubview:_historyAvgHrMarkTimeLbl];
        CGFloat vSpace = kHistoryMarkBgView_Height * kYScal - 2 * kMarkLbl_TopMargin * kYScal - 2 * kMarkLbl_Height * kYScal;
        
        _historyAvgHrMarkValLbl = [[UILabel alloc] initWithFrame:CGRectMake(_historyAvgHrMarkTimeLbl.frame.origin.x + kHistoryMarkValLbl_LeftMargin * kXScal, CGRectGetMaxY(_historyAvgHrMarkTimeLbl.frame) + vSpace, _historyAvgHrMarkTimeLbl.frame.size.width, _historyAvgHrMarkTimeLbl.frame.size.height)];
        _historyAvgHrMarkValLbl.textColor = [UIColor blackColor];
        _historyAvgHrMarkValLbl.text = @"平均心率：0";
        _historyAvgHrMarkValLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        [_historyAvgHrMarkBgView addSubview:_historyAvgHrMarkValLbl];
    }
    return _historyAvgHrMarkBgView;
}
- (UIImageView*)markBgView {
    if (!_markBgView) {
        _markBgView = [[UIImageView alloc] init];
        _markBgView.backgroundColor = [UIColor colorWithHexString:@"#e4f7f8"];
        _markBgView.frame = CGRectMake(0, 0, kMarkBgView_Width * kXScal, kMarkBgView_Height * kYScal);
        _markTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(kMarkLbl_LeftMargin * kXScal, kMarkLbl_TopMargin * kYScal, kMarkBgView_Width * kXScal - kMarkLbl_LeftMargin * kXScal, kMarkLbl_Height * kYScal)];
        _markTimeLbl.text = @"时间：05:09";
        _markTimeLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        _markTimeLbl.textColor = [UIColor blackColor];
        [_markBgView addSubview:_markTimeLbl];
        CGFloat vSpace = (kMarkBgView_Height * kYScal - 2 * kMarkLbl_TopMargin * kYScal - 6 * kMarkLbl_Height * kYScal)/5;
        
        _markHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(_markTimeLbl.frame.origin.x, CGRectGetMaxY(_markTimeLbl.frame) + vSpace, _markTimeLbl.frame.size.width, _markTimeLbl.frame.size.height)];
        _markHRLbl.textColor = [UIColor colorWithHexString:@"#e0aab5"];
        _markHRLbl.text = @"心率：95 bpm";
        _markHRLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        [_markBgView addSubview:_markHRLbl];
        
        _markSpeedLbl = [[UILabel alloc] initWithFrame:CGRectMake(_markTimeLbl.frame.origin.x, CGRectGetMaxY(_markHRLbl.frame) + vSpace, _markTimeLbl.frame.size.width, _markTimeLbl.frame.size.height)];
        _markSpeedLbl.textColor = [UIColor colorWithHexString:@"#7dc489"];
        _markSpeedLbl.text = @"速度：17.1 km/h";
        _markSpeedLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        [_markBgView addSubview:_markSpeedLbl];
        
        _markPowerLbl = [[UILabel alloc] initWithFrame:CGRectMake(_markTimeLbl.frame.origin.x, CGRectGetMaxY(_markSpeedLbl.frame) + vSpace, _markTimeLbl.frame.size.width, _markTimeLbl.frame.size.height)];
        _markPowerLbl.textColor = [UIColor colorWithHexString:@"#7475e4"];
        _markPowerLbl.text = @"功率：120 w";
        _markPowerLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        [_markBgView addSubview:_markPowerLbl];
        
        _markCalorieLbl = [[UILabel alloc] initWithFrame:CGRectMake(_markTimeLbl.frame.origin.x, CGRectGetMaxY(_markPowerLbl.frame) + vSpace, _markTimeLbl.frame.size.width, _markTimeLbl.frame.size.height)];
        _markCalorieLbl.textColor = [UIColor colorWithHexString:@"#c7a779"];
        _markCalorieLbl.text = @"消耗：17.8 kcal";
        _markCalorieLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        [_markBgView addSubview:_markCalorieLbl];
        
        _markRpeLbl = [[UILabel alloc] initWithFrame:CGRectMake(_markTimeLbl.frame.origin.x, CGRectGetMaxY(_markCalorieLbl.frame) + vSpace, _markTimeLbl.frame.size.width, _markTimeLbl.frame.size.height)];
        _markRpeLbl.textColor = [UIColor colorWithHexString:@"#d4e2e6"];
        _markRpeLbl.text = @"RPE：2.0";
        _markRpeLbl.font = [UIFont systemFontOfSize:kMarkLbl_FontSize * kYScal];
        [_markBgView addSubview:_markRpeLbl];
    }
    return _markBgView;
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

#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase *)chartView entry:(ChartDataEntry *)entry highlight:(ChartHighlight *)highlight {
    if (chartView == self.lineChartView) {
        NSString *timeStr = [self getShortTimeString:(NSInteger)entry.x + 1];
        self.markTimeLbl.text = [NSString stringWithFormat:@"时间：%@",timeStr];
        self.markHRLbl.text = [NSString stringWithFormat:@"心率：%d bpm",(NSInteger)entry.y];
        CGFloat speed = [[self.speedArr objectAtIndex:(NSInteger)entry.x ] floatValue];
        self.markSpeedLbl.text = [NSString stringWithFormat:@"速度：%.1f km/h",speed];
        if (self.type2 == 2) {
            NSInteger power = [[self.difficultyArr objectAtIndex:(NSInteger)entry.x] integerValue];
            self.markPowerLbl.text = [NSString stringWithFormat:@"功率：%d w",power];
        } else {
            NSInteger power = [[self.difficultyArr objectAtIndex:(NSInteger)entry.x] integerValue];
            self.markPowerLbl.text = [NSString stringWithFormat:@"强度：%d ",power];
        }
        CGFloat calorie = [[self.calorieArr objectAtIndex:(NSInteger)entry.x] floatValue];
        self.markCalorieLbl.text = [NSString stringWithFormat:@"消耗：%.1f kcal",calorie];
        [self.lineChartView centerViewToAnimatedWithXValue:entry.x yValue:entry.y axis:[self.lineChartView.data getDataSetByIndex:highlight.dataSetIndex].axisDependency duration:1.0];
    } else if (chartView == self.completeLinechart) {
        self.historyCompleteMarkTimeLbl.text = [NSString stringWithFormat:@"第%d次",(NSInteger)entry.x + 1];
        self.historyCompleteMarkValLbl.text = [NSString stringWithFormat:@"完成度：%d",(NSInteger)entry.y];
        [self.completeLinechart centerViewToAnimatedWithXValue:entry.x yValue:entry.y axis:[self.completeLinechart.data getDataSetByIndex:highlight.dataSetIndex].axisDependency duration:1.0];
    } else if (chartView == self.calorieLinechart) {
        self.historyCalorieMarkTimeLbl.text = [NSString stringWithFormat:@"第%d次",(NSInteger)entry.x + 1];
        CGFloat calorie = (CGFloat)entry.y;
        self.historyCalorieMarkValLbl.text = [NSString stringWithFormat:@"消耗：%.1f",calorie];
        [self.calorieLinechart centerViewToAnimatedWithXValue:entry.x yValue:entry.y axis:[self.calorieLinechart.data getDataSetByIndex:highlight.dataSetIndex].axisDependency duration:1.0];
    } else if (chartView == self.maxHrLinechart) {
        self.historyMaxHrMarkTimeLbl.text = [NSString stringWithFormat:@"第%d次",(NSInteger)entry.x + 1];
        self.historyMaxMarkValLbl.text = [NSString stringWithFormat:@"最大心率：%d",(NSInteger)entry.y];
        [self.maxHrLinechart centerViewToAnimatedWithXValue:entry.x yValue:entry.y axis:[self.maxHrLinechart.data getDataSetByIndex:highlight.dataSetIndex].axisDependency duration:1.0];
    } else if (chartView == self.avgHrLinechart) {
        self.historyAvgHrMarkTimeLbl.text = [NSString stringWithFormat:@"第%d次",(NSInteger)entry.x + 1];
        self.historyAvgHrMarkValLbl.text = [NSString stringWithFormat:@"平均心率：%d",(NSInteger)entry.y];
        [self.avgHrLinechart centerViewToAnimatedWithXValue:entry.x yValue:entry.y axis:[self.avgHrLinechart.data getDataSetByIndex:highlight.dataSetIndex].axisDependency duration:1.0];
    }
}

#pragma mark - button click events
- (void)back:(UIButton*)sender {
    if (self.isFromReport) {
        [self dismissViewControllerAnimated:NO completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
