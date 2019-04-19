//
//  PatientInfoViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/18.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientInfoViewController.h"
#import "LMJDropdownMenu.h"
#import "UnitTextField.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 150
#define KScrollView_LeftMargin 20
#define kScrollView_Height 1369
#define kStatusLbl_TopMargin 15
#define kStatusLbl_LeftMargin 20
#define kStatusLbl_FontSize 13.0
#define kStatusLbl_Height 12
#define kStatusLbl_Width 103
#define kICCardBtn_FontSize 13.0
#define kICCardBtn_TopMargin 17
#define kICCardBtn_Height 20
#define kICCardBtn_RightMargin 15
#define kICCardBtn_Width 81
#define kMiddle_Space 41
#define kTopLbl_TopMargin 16
#define kTopLbl_Space 1
#define kTopLbl_Height 29
#define kTopLbl_FontSize 13.0
#define kHRDeviceLbl_Width 48
#define kHRDeviceLbl_FontSize 13.0
#define kHRDeviceLbl_RightMargin 10.0
#define kHRDeviceLbl_Height 13
#define kHRDeviceMenu_Width 179
#define kHRDeviceMenu_Height 21
#define kHRDeviceMenu_TitleLbl_FontSize 13.0
#define kLeftView_TopMargin 15
#define kContentView_TopMargin 15
#define kUpdateTimeLbl_FontSize 12.0
#define kUpdateTimeLbl_Height 11
#define kUpdateTimeLbl_Width 197
#define kDoctorLbl_TopMargin 10
#define kInfoLbl_TopMargin 15
#define kInfoLbl_RightMargin 15
#define kInfoLbl_Width 50
#define kInfoLbl_Height 12
#define kInfoLbl_FontSize 12
#define kHeadPhoto_Width 48
#define kHeadPhoto_LeftMargin 15
#define kHeadPhoto_TopMargin 46
#define kNameLbl_Width 56
#define kNameLbl_Height 12
#define kNameLbl_FontSize 13
#define kNameLbl_TopMargin 20
#define kNameLbl_BottomMargin 18
#define kRedStar_Width 6
#define kRedStar_LeftMargin 6
#define kNameTF_LeftMargin 5
#define kNameTF_Width 144
#define kNameTF_Height 21
#define kNameTF_BottomMargin 10
#define kNameTF_FontSize 13.0
#define kUnitLbl_Width 15
#define kUnitLbl_Height 6
#define kUnitLbl_FontSize 11
#define kLongLbl_Width 80
#define kLongLbl_Height 13
#define kLongLbl_RighMargin 5
#define kLongTF_Width 208
#define kLongTF_Height 21
#define kLongTF_LeftMargin 5
#define kQuestionLeftImg_Width 4
#define kQuestionLeftImg_Height 10
#define kQuestionLeftImg_TopMargin 32
#define kQuestionLbl_Height 15
#define kQuestionLbl_LeftMargin 11
#define kQuestionLbl_FontSize 15.0
#define kRadioBtn_TopMargin 16
#define kRadioBtn_LeftMargin 6
#define kRadioBtn_Width 10
#define kRadioBtn_RightMargin 10
#define kAnswerLbl_TopMargin 15
#define kAnswerLbl_Width 324
#define kAnswerLbl_FontSize 12.0
#define kRadioBtn_Yes_TopMargin 11
#define kAnswerLbl_Yes_TopMargin 10
#define kSecondQustionImg_TopMargin 16
#define kSecondeAnswerLbl_LeftMargin 34
#define kSecondAnswerLbl_TopMargin 15
#define kSecondAnswerLbl_Width 40
#define kSecondAnserLbl_BottomMargin 8
#define kSecondAnswerLbl_RightMargin 15
#define kSecondAnswerLbl_Yes_Width 12
#define kSecondAnswerLbl_Yes_RightMargin 20
#define kSecondAnswerLbl_FontSize 12
#define kFifthAnswerLbl_LeftMargin 28
#define kFifthAnswerLbl_BottomMargin 10
#define kSummaryView_TopMargin 26
#define kSummaryView_LeftMargin 29
#define kSummaryView_Lbl_TopMargin 10
#define kSummaryView_Lbl_LeftMargin 15
#define kSummaryView_Lbl_Width 135
#define kSummaryView_Lbl_Height 14
#define kSummaryView_Lbl_FontSize 14.0
#define kSummaryView_HRZoneLbl_RightMargin 58
#define kBottomButton_BottomMargin 15
#define kBottomButton_TopMargin 20
#define kBottomLongButton_LeftMargin 52
#define kBottomButton_Height 28
#define kBottomLongButton_Width 188
#define kBottomShortButton_Width 113
#define kBottomButton_FontSize 14.0
@interface PatientInfoViewController ()
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIScrollView *scrollview;
@property (nonatomic,strong)UILabel *statusLbl;
@property (nonatomic,strong)UILabel *deviceLbl;
@property (nonatomic,strong)UILabel *attributeLbl;
@property (nonatomic,strong)UIButton *testResultBtn;
@property (nonatomic,strong)UITableView *testResultListView;
@property (nonatomic,strong)UILabel *hrLbl;
@property (nonatomic,strong)LMJDropdownMenu *hrMenu;
@property (nonatomic,strong)UIButton *icCardBtn;
@property (nonatomic,strong)UIButton *updateInfoBtn;
@property (nonatomic,strong)UIButton *changeBtn;
@property (nonatomic,strong)UIView *leftView;
@property (nonatomic,strong)UIView *leftContentView;
@property (nonatomic,strong)UIView *rightView;
@property (nonatomic,strong)UIView *rightContentView;
@property (nonatomic,strong)UILabel *latestUpdateTimeLbl;
@property (nonatomic,strong)UILabel *latestDoctorLbl;
@property (nonatomic,strong)UILabel *oldTimeLbl;
@property (nonatomic,strong)UILabel *oldDoctorLbl;
@property (nonatomic,strong)UIButton *leftBtn;
@property (nonatomic,strong)UIButton *rightBtn;
@property (nonatomic,strong)UIView *latestContentView;
@property (nonatomic,strong)UIView *oldContentView;

//最新信息视图************************************************
@property (nonatomic,strong)UILabel *latestLbl;
@property (nonatomic,strong)UIImageView *latestPatientImg;
@property (nonatomic,strong)UILabel *latestNameLbl;
@property (nonatomic,strong)UIImageView *latestNameStar;
@property (nonatomic,strong)UnitTextField *latestNameTF;
@property (nonatomic,strong)UILabel *latestSexLbl;
@property (nonatomic,strong)UIImageView *latestSexStar;
@property (nonatomic,strong)UnitTextField *latestSexTF;
@property (nonatomic,strong)UILabel *latestPhoneLbl;
@property (nonatomic,strong)UIImageView *latestPhoneStar;
@property (nonatomic,strong)UnitTextField *latestPhoneTF;
@property (nonatomic,strong)UILabel *latestBirthLbl;
@property (nonatomic,strong)UIImageView *latestBirthStar;
@property (nonatomic,strong)UnitTextField *latestBirthTF;
@property (nonatomic,strong)UILabel *latestHeightLbl;
@property (nonatomic,strong)UIImageView *latestHeightStar;
@property (nonatomic,strong)UnitTextField *latestHeightTF;
@property (nonatomic,strong)UILabel *latestWeightLbl;
@property (nonatomic,strong)UIImageView *latestWeightStar;
@property (nonatomic,strong)UnitTextField *latestWeightTF;
@property (nonatomic,strong)UILabel *latestWaistLbl;
@property (nonatomic,strong)UIImageView *latestWaistStar;
@property (nonatomic,strong)UnitTextField *latestWaistTF;
@property (nonatomic,strong)UILabel *latestKFXTLbl;//空腹血糖
@property (nonatomic,strong)UIImageView *latestKFXTStar;
@property (nonatomic,strong)UnitTextField *latestKFXTHRTF;
@property (nonatomic,strong)UILabel *latestQuietHRLbl;
@property (nonatomic,strong)UIImageView *latestQuietHRStar;
@property (nonatomic,strong)UnitTextField *latestQuietHRTF;
@property (nonatomic,strong)UILabel *latestXLBYLbl;//心率变异
@property (nonatomic,strong)UIImageView *latestXLBYStar;
@property (nonatomic,strong)UnitTextField *latestXLBYTF;
@property (nonatomic,strong)UILabel *latestSSYLbl;//收缩压
@property (nonatomic,strong)UIImageView *latestSSYStar;
@property (nonatomic,strong)UnitTextField *latestSSYTF;
@property (nonatomic,strong)UILabel *latestSZYLbl;//舒张压
@property (nonatomic,strong)UIImageView *latestSZYStar;
@property (nonatomic,strong)UnitTextField *latestSZYTF;
@property (nonatomic,strong)UILabel *latestGMDZDBLbl;//高密度脂蛋白
@property (nonatomic,strong)UIImageView *latestGMDZDBStar;
@property (nonatomic,strong)UnitTextField *latestGMDZDBTF;
@property (nonatomic,strong)UILabel *latestSTZLZSLbl;//身体质量指数
@property (nonatomic,strong)UIImageView *latestSTZLZSStar;
@property (nonatomic,strong)UnitTextField *latestSTZLZSTF;
@property (nonatomic,strong)UILabel *latestMaxAlertHrLbl;//最大报警心率
@property (nonatomic,strong)UIImageView *latestMaxAlertHrStar;
@property (nonatomic,strong)UnitTextField *latestMaxAlertTF;
@property (nonatomic,strong)UIImageView *latestQuestionImg1;
@property (nonatomic,strong)UILabel *latestQuestionLbl1;
@property (nonatomic,strong)UIImageView *latestAnswer1YesImg;
@property (nonatomic,strong)UIImageView *latestAnswer1NoImg;
@property (nonatomic,strong)UILabel *latestAnswer1YesLbl;
@property (nonatomic,strong)UILabel *latestAnswer1NoLbl;

@property (nonatomic,strong)UIImageView *latestQuestionImg2;
@property (nonatomic,strong)UILabel *latestQuestionLbl2;
@property (nonatomic,strong)UILabel *latestHypertensionLbl;//高血压
@property (nonatomic,strong)UIImageView *latestHypertensionYesImg;
@property (nonatomic,strong)UILabel *latestHypertensionYesLbl;
@property (nonatomic,strong)UIImageView *latestHypertensionNoImg;
@property (nonatomic,strong)UILabel *latestHypertensionNoLbl;
@property (nonatomic,strong)UILabel *latestHyperglycemiaLbl;//高血糖
@property (nonatomic,strong)UIImageView *latestHyperglycemiaYesImg;
@property (nonatomic,strong)UILabel *latestHyperglycemiaYesLbl;
@property (nonatomic,strong)UIImageView *latestHyperglycemiaNoImg;
@property (nonatomic,strong)UILabel *latestHyperglycemiaNoLbl;
@property (nonatomic,strong)UILabel *latestHyperlipidemiaLbl;//高血脂
@property (nonatomic,strong)UILabel *latestHyperlipidemiaYesLbl;
@property (nonatomic,strong)UIImageView *latestHyperlipidemiaYesImg;
@property (nonatomic,strong)UILabel *latestHyperlipidemiaNoLbl;
@property (nonatomic,strong)UIImageView *latestHyperlipidemiaNoImg;
@property (nonatomic,strong)UILabel *latestHighSmokeLbl;//吸烟
@property (nonatomic,strong)UIImageView *latestSmokeYesImg;
@property (nonatomic,strong)UILabel *latestSmokeYesLbl;
@property (nonatomic,strong)UIImageView *latestSmokeNoImg;
@property (nonatomic,strong)UILabel *latestSmokeNoLbl;

@property (nonatomic,strong)UIImageView *latestQuestionImg3;
@property (nonatomic,strong)UILabel *latestQuestionLbl3;
@property (nonatomic,strong)UIImageView *latestQuestion3YesImg;
@property (nonatomic,strong)UILabel *latestQuestion3YesLbl;
@property (nonatomic,strong)UIImageView *latestQuestion3NoImg;
@property (nonatomic,strong)UILabel *latestQuestion3NoLbl;

@property (nonatomic,strong)UIImageView *latestQuestionImg4;
@property (nonatomic,strong)UILabel *latestQuestionLbl4;
@property (nonatomic,strong)UIImageView *latestQuestion4YesImg;
@property (nonatomic,strong)UILabel *latestQuestion4YesLbl;
@property (nonatomic,strong)UIImageView *latestQuestion4NoImg;
@property (nonatomic,strong)UILabel *latestQuestion4NoLbl;

@property (nonatomic,strong)UIImageView *latestQuestionImg5;
@property (nonatomic,strong)UILabel *latestQuestionLbl5;
@property (nonatomic,strong)UIImageView *latestQuestion5YesImg;
@property (nonatomic,strong)UILabel *latestQuestion5YesLbl;
@property (nonatomic,strong)UIImageView *latestQuestion5NoImg;
@property (nonatomic,strong)UILabel *latestQuestion5NoLbl;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl1;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl2;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl3;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl4;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl5;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl6;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl7;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl8;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl9;

@property (nonatomic,strong)UIView *latestSummaryView;
@property (nonatomic,strong)UILabel *latestRiskLevelLbl;
@property (nonatomic,strong)UILabel *latestHRZoneLbl;
@property (nonatomic,strong)UILabel *latestRPERangeLbll;


//历史信息视图***************************************************************
@property (nonatomic,strong)UILabel *olderLbl;
@property (nonatomic,strong)UIImageView *olderPatientImg;
@property (nonatomic,strong)UILabel *olderNameLbl;
@property (nonatomic,strong)UIImageView *olderNameStar;
@property (nonatomic,strong)UnitTextField *olderNameTF;
@property (nonatomic,strong)UILabel *olderSexLbl;
@property (nonatomic,strong)UIImageView *olderSexStar;
@property (nonatomic,strong)UnitTextField *olderSexTF;
@property (nonatomic,strong)UILabel *olderPhoneLbl;
@property (nonatomic,strong)UIImageView *olderPhoneStar;
@property (nonatomic,strong)UnitTextField *olderPhoneTF;
@property (nonatomic,strong)UILabel *olderBirthLbl;
@property (nonatomic,strong)UIImageView *olderBirthStar;
@property (nonatomic,strong)UnitTextField *olderBirthTF;
@property (nonatomic,strong)UILabel *olderHeightLbl;
@property (nonatomic,strong)UIImageView *olderHeightStar;
@property (nonatomic,strong)UnitTextField *olderHeightTF;
@property (nonatomic,strong)UILabel *olderWeightLbl;
@property (nonatomic,strong)UIImageView *olderWeightStar;
@property (nonatomic,strong)UnitTextField *olderWeightTF;
@property (nonatomic,strong)UILabel *olderWaistLbl;
@property (nonatomic,strong)UIImageView *olderWaistStar;
@property (nonatomic,strong)UnitTextField *olderWaistTF;
@property (nonatomic,strong)UILabel *olderKFXTLbl;//空腹血糖
@property (nonatomic,strong)UIImageView *olderKFXTStar;
@property (nonatomic,strong)UnitTextField *olderKFXTHRTF;
@property (nonatomic,strong)UILabel *olderQuietHRLbl;
@property (nonatomic,strong)UIImageView *olderQuietHRStar;
@property (nonatomic,strong)UnitTextField *olderQuietHRTF;
@property (nonatomic,strong)UILabel *olderXLBYLbl;//心率变异
@property (nonatomic,strong)UIImageView *olderXLBYStar;
@property (nonatomic,strong)UnitTextField *olderXLBYTF;
@property (nonatomic,strong)UILabel *olderSSYLbl;//收缩压
@property (nonatomic,strong)UIImageView *olderSSYStar;
@property (nonatomic,strong)UnitTextField *olderSSYTF;
@property (nonatomic,strong)UILabel *olderSZYLbl;//舒张压
@property (nonatomic,strong)UIImageView *olderSZYStar;
@property (nonatomic,strong)UnitTextField *olderSZYTF;
@property (nonatomic,strong)UILabel *olderGMDZDBLbl;//高密度脂蛋白
@property (nonatomic,strong)UIImageView *olderGMDZDBStar;
@property (nonatomic,strong)UnitTextField *olderGMDZDBTF;
@property (nonatomic,strong)UILabel *olderSTZLZSLbl;//身体质量指数
@property (nonatomic,strong)UIImageView *olderSTZLZSStar;
@property (nonatomic,strong)UnitTextField *olderSTZLZSTF;
@property (nonatomic,strong)UILabel *olderMaxAlertHrLbl;//最大报警心率
@property (nonatomic,strong)UIImageView *olderMaxAlertHrStar;
@property (nonatomic,strong)UnitTextField *olderMaxAlertTF;
@property (nonatomic,strong)UIImageView *olderQuestionImg1;
@property (nonatomic,strong)UILabel *olderQuestionLbl1;
@property (nonatomic,strong)UIImageView *olderAnswer1YesImg;
@property (nonatomic,strong)UIImageView *olderAnswer1NoImg;
@property (nonatomic,strong)UILabel *olderAnswer1YesLbl;
@property (nonatomic,strong)UILabel *olderAnswer1NoLbl;

@property (nonatomic,strong)UIImageView *olderQuestionImg2;
@property (nonatomic,strong)UILabel *olderQuestionLbl2;
@property (nonatomic,strong)UILabel *olderHypertensionLbl;//高血压
@property (nonatomic,strong)UIImageView *olderHypertensionYesImg;
@property (nonatomic,strong)UILabel *olderHypertensionYesLbl;
@property (nonatomic,strong)UIImageView *olderHypertensionNoImg;
@property (nonatomic,strong)UILabel *olderHypertensionNoLbl;
@property (nonatomic,strong)UILabel *olderHyperglycemiaLbl;//高血糖
@property (nonatomic,strong)UIImageView *olderHyperglycemiaYesImg;
@property (nonatomic,strong)UILabel *olderHyperglycemiaYesLbl;
@property (nonatomic,strong)UIImageView *olderHyperglycemiaNoImg;
@property (nonatomic,strong)UILabel *olderHyperglycemiaNoLbl;
@property (nonatomic,strong)UILabel *olderHyperlipidemiaLbl;//高血脂
@property (nonatomic,strong)UILabel *olderHyperlipidemiaYesLbl;
@property (nonatomic,strong)UIImageView *olderHyperlipidemiaYesImg;
@property (nonatomic,strong)UILabel *olderHyperlipidemiaNoLbl;
@property (nonatomic,strong)UIImageView *olderHyperlipidemiaNoImg;
@property (nonatomic,strong)UILabel *olderHighSmokeLbl;//吸烟
@property (nonatomic,strong)UIImageView *olderSmokeYesImg;
@property (nonatomic,strong)UILabel *olderSmokeYesLbl;
@property (nonatomic,strong)UIImageView *olderSmokeNoImg;
@property (nonatomic,strong)UILabel *olderSmokeNoLbl;

@property (nonatomic,strong)UIImageView *olderQuestionImg3;
@property (nonatomic,strong)UILabel *olderQuestionLbl3;
@property (nonatomic,strong)UIImageView *olderQuestion3YesImg;
@property (nonatomic,strong)UILabel *olderQuestion3YesLbl;
@property (nonatomic,strong)UIImageView *olderQuestion3NoImg;
@property (nonatomic,strong)UILabel *olderQuestion3NoLbl;

@property (nonatomic,strong)UIImageView *olderQuestionImg4;
@property (nonatomic,strong)UILabel *olderQuestionLbl4;
@property (nonatomic,strong)UIImageView *olderQuestion4YesImg;
@property (nonatomic,strong)UILabel *olderQuestion4YesLbl;
@property (nonatomic,strong)UIImageView *olderQuestion4NoImg;
@property (nonatomic,strong)UILabel *olderQuestion4NoLbl;

@property (nonatomic,strong)UIImageView *olderQuestionImg5;
@property (nonatomic,strong)UILabel *olderQuestionLbl5;
@property (nonatomic,strong)UIImageView *olderQuestion5YesImg;
@property (nonatomic,strong)UILabel *olderQuestion5YesLbl;
@property (nonatomic,strong)UIImageView *olderQuestion5NoImg;
@property (nonatomic,strong)UILabel *olderQuestion5NoLbl;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl1;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl2;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl3;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl4;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl5;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl6;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl7;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl8;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl9;

@property (nonatomic,strong)UIView *olderSummaryView;
@property (nonatomic,strong)UILabel *olderRiskLevelLbl;
@property (nonatomic,strong)UILabel *olderHRZoneLbl;
@property (nonatomic,strong)UILabel *olderRPERangeLbll;

//底部功能按钮
@property (nonatomic,strong)UIButton *aerobicReportBtn;//查看有氧历史处方及报告
@property (nonatomic,strong)UIButton *powerReportBtn;//查看力量历史处方及报告
@property (nonatomic,strong)UIButton *createAerobicPrescriptionBtn;//开具有氧处方
@property (nonatomic,strong)UIButton *createPowerPrescriptionBtn;//开具力量处方
@end

@implementation PatientInfoViewController

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
    
    CGFloat titleLbl_TopMargin = (kNavView_Height - kButton_Height)/2;
    CGFloat titleLbl_LeftMargin = kWidth/2 - kTitleLbl_Width/2;
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(titleLbl_LeftMargin, titleLbl_TopMargin, kTitleLbl_Width, kButton_Height)];
    self.titleLbl.font = [UIFont systemFontOfSize:kTitle_FontSize];
    self.titleLbl.textColor = [UIColor whiteColor];
    self.titleLbl.textAlignment = NSTextAlignmentCenter;
    self.titleLbl.text = @"患者详情";
    [self.navView addSubview:self.titleLbl];
}

- (void)setupUI {
    self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(KScrollView_LeftMargin * kXScal, CGRectGetMaxY(self.navView.frame), kWidth - 2 * KScrollView_LeftMargin, kHeight - CGRectGetMaxY(self.navView.frame))];
    self.scrollview.delegate = self;
    self.scrollview.contentSize = CGSizeMake(kWidth - 2 * KScrollView_LeftMargin, kScrollView_Height * kYScal);
    self.scrollview.backgroundColor = [UIColor whiteColor];
    self.scrollview.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollview];
    
    self.statusLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, kStatusLbl_TopMargin * kYScal, kStatusLbl_Width * kXScal, kStatusLbl_Height * kYScal)];
    self.statusLbl.text = @"状态: 待开具处方";
    self.statusLbl.font = [UIFont systemFontOfSize:kStatusLbl_FontSize * kYScal];
    self.statusLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.scrollview addSubview:self.statusLbl];
    
    self.icCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.icCardBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    CGFloat icCardBtn_LeftMargin = self.scrollview.frame.size.width - 2 * kICCardBtn_Width * kXScal - kICCardBtn_RightMargin * kXScal;
    self.icCardBtn.frame = CGRectMake(icCardBtn_LeftMargin, kICCardBtn_TopMargin * kYScal, kICCardBtn_Width * kXScal, kICCardBtn_Height * kYScal);
    [self.icCardBtn.titleLabel setFont:[UIFont systemFontOfSize:kICCardBtn_FontSize * kYScal]];
    [self.icCardBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.icCardBtn setTitle:@"写入IC卡" forState:UIControlStateNormal];
    self.icCardBtn.layer.cornerRadius = kICCardBtn_Height * kYScal/2.0;
    self.icCardBtn.layer.masksToBounds = YES;
    [self.scrollview addSubview:self.icCardBtn];
    
    self.updateInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.updateInfoBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    self.updateInfoBtn.frame = CGRectMake(CGRectGetMaxX(self.icCardBtn.frame) + kICCardBtn_RightMargin * kXScal, self.icCardBtn.frame.origin.y, kICCardBtn_Width * kXScal, kICCardBtn_Height * kYScal);
    [self.updateInfoBtn.titleLabel setFont:[UIFont systemFontOfSize:kICCardBtn_FontSize * kYScal]];
    [self.updateInfoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.updateInfoBtn setTitle:@"修改资料" forState:UIControlStateNormal];
    self.updateInfoBtn.layer.cornerRadius = kICCardBtn_Height * kYScal/2.0;
    self.updateInfoBtn.layer.masksToBounds = YES;
    [self.scrollview addSubview:self.updateInfoBtn];
    
    CGFloat leftView_Width = (self.scrollview.frame.size.width - kMiddle_Space * kXScal)/2.0;
    CGFloat lbl_Width = (leftView_Width - 2 * kTopLbl_Space)/3.0;
    self.deviceLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.statusLbl.frame) + kTopLbl_TopMargin * kYScal, lbl_Width, kTopLbl_Height * kYScal)];
    self.deviceLbl.backgroundColor = [UIColor colorWithHexString:@"#CFEEF4"];
    self.deviceLbl.font = [UIFont systemFontOfSize:kTopLbl_FontSize * kYScal];
    self.deviceLbl.text = @"设备";
    self.deviceLbl.textAlignment = NSTextAlignmentCenter;
    self.deviceLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.scrollview addSubview:self.deviceLbl];
    
    self.attributeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deviceLbl.frame) + kTopLbl_Space, self.deviceLbl.frame.origin.y, lbl_Width, kTopLbl_Height * kYScal)];
    self.attributeLbl.backgroundColor = [UIColor colorWithHexString:@"#CFEEF4"];
    self.attributeLbl.font = [UIFont systemFontOfSize:kTopLbl_FontSize * kYScal];
    self.attributeLbl.text = @"属性";
    self.attributeLbl.textAlignment = NSTextAlignmentCenter;
    self.attributeLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.scrollview addSubview:self.attributeLbl];
    
    self.testResultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.testResultBtn setTitle:@"测试结果" forState:UIControlStateNormal];
    [self.testResultBtn.titleLabel setFont:[UIFont systemFontOfSize:kTopLbl_FontSize * kYScal]];
    self.testResultBtn.frame = CGRectMake(CGRectGetMaxX(self.attributeLbl.frame) + kTopLbl_Space, self.deviceLbl.frame.origin.y, lbl_Width, kTopLbl_Height * kYScal);
    [self.testResultBtn setTitleColor:[UIColor colorWithHexString:@"#000033"] forState:UIControlStateNormal];
    [self.testResultBtn setImage:[UIImage imageNamed:@"dropdownMenu"] forState:UIControlStateNormal];
    [self.testResultBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.testResultBtn.imageView.frame.size.width - 20, 0, self.testResultBtn.imageView.frame.size.width)];
    [self.testResultBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.testResultBtn.titleLabel.bounds.size.width, 0, -self.testResultBtn.titleLabel.bounds.size.width)];
    self.testResultBtn.backgroundColor = [UIColor colorWithHexString:@"#CFEEF4"];
    [self.scrollview addSubview:self.testResultBtn];
    
    CGFloat hrLbl_LeftMargin = CGRectGetMaxX(self.testResultBtn.frame) + kMiddle_Space * kXScal;
    self.hrLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kHRDeviceLbl_Width * kXScal, kHRDeviceLbl_Height * kYScal)];
    self.hrLbl.center = CGPointMake(hrLbl_LeftMargin + kHRDeviceLbl_Width * kXScal / 2.0, self.testResultBtn.center.y);
    self.hrLbl.text = @"心率带";
    self.hrLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.hrLbl.font = [UIFont systemFontOfSize:kHRDeviceLbl_FontSize * kYScal];
    [self.scrollview addSubview:self.hrLbl];
    
    self.hrMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.hrLbl.frame) + kHRDeviceLbl_RightMargin * kXScal, 0, kHRDeviceMenu_Width * kXScal, kHRDeviceMenu_Height * kYScal)];
    self.hrMenu.center = CGPointMake(CGRectGetMaxX(self.hrLbl.frame) + kHRDeviceLbl_RightMargin * kXScal + kHRDeviceMenu_Width * kXScal / 2.0, self.hrLbl.center.y);
    [self.scrollview addSubview:self.hrMenu];
    
    self.changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.changeBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    self.changeBtn.frame = CGRectMake(0, 0, kICCardBtn_Width * kXScal, kICCardBtn_Height * kYScal);
    [self.changeBtn.titleLabel setFont:[UIFont systemFontOfSize:kICCardBtn_FontSize * kYScal]];
    [self.changeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.changeBtn.center = CGPointMake(self.icCardBtn.frame.origin.x + kICCardBtn_Width * kXScal / 2.0, self.hrLbl.center.y);
    [self.changeBtn setTitle:@"修改资料" forState:UIControlStateNormal];
    self.changeBtn.layer.cornerRadius = kICCardBtn_Height * kYScal/2.0;
    self.changeBtn.layer.masksToBounds = YES;
    [self.scrollview addSubview:self.changeBtn];
    
    [self configLatestInfoView];
    [self configOlderInfoView];
    
    CGFloat button_space = (self.scrollview.frame.size.width - 2 * kBottomLongButton_LeftMargin * kXScal - 2 * kBottomLongButton_Width * kXScal - 2 * kBottomShortButton_Width * kXScal)/3;
    self.aerobicReportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.aerobicReportBtn.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    self.aerobicReportBtn.frame = CGRectMake(kBottomLongButton_LeftMargin * kXScal, CGRectGetMaxY(self.leftView.frame) + kBottomButton_TopMargin * kYScal, kBottomLongButton_Width * kXScal, kBottomButton_Height * kYScal);
    [self.aerobicReportBtn setTitle:@"查看有氧历史处方及报告" forState:UIControlStateNormal];
    self.aerobicReportBtn.layer.cornerRadius = kBottomButton_Height * kYScal / 2.0;
    self.aerobicReportBtn.layer.masksToBounds = YES;
    [self.aerobicReportBtn.titleLabel setFont:[UIFont systemFontOfSize:kBottomButton_FontSize * kYScal]];
    [self.aerobicReportBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.scrollview addSubview:self.aerobicReportBtn];
    
    self.powerReportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.powerReportBtn.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    self.powerReportBtn.frame = CGRectMake(CGRectGetMaxX(self.aerobicReportBtn.frame) + button_space, CGRectGetMaxY(self.leftView.frame) + kBottomButton_TopMargin * kYScal, kBottomLongButton_Width * kXScal, kBottomButton_Height * kYScal);
    [self.powerReportBtn setTitle:@"查看力量历史处方及报告" forState:UIControlStateNormal];
    self.powerReportBtn.layer.cornerRadius = kBottomButton_Height * kYScal / 2.0;
    self.powerReportBtn.layer.masksToBounds = YES;
    [self.powerReportBtn.titleLabel setFont:[UIFont systemFontOfSize:kBottomButton_FontSize * kYScal]];
    [self.powerReportBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.scrollview addSubview:self.powerReportBtn];
    
    self.createAerobicPrescriptionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.createAerobicPrescriptionBtn.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    self.createAerobicPrescriptionBtn.frame = CGRectMake(CGRectGetMaxX(self.powerReportBtn.frame) + button_space, CGRectGetMaxY(self.leftView.frame) + kBottomButton_TopMargin * kYScal, kBottomShortButton_Width * kXScal, kBottomButton_Height * kYScal);
    [self.createAerobicPrescriptionBtn setTitle:@"开具有氧处方" forState:UIControlStateNormal];
    self.createAerobicPrescriptionBtn.layer.cornerRadius = kBottomButton_Height * kYScal / 2.0;
    self.createAerobicPrescriptionBtn.layer.masksToBounds = YES;
    [self.createAerobicPrescriptionBtn.titleLabel setFont:[UIFont systemFontOfSize:kBottomButton_FontSize * kYScal]];
    [self.createAerobicPrescriptionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.scrollview addSubview:self.createAerobicPrescriptionBtn];
    
    self.createPowerPrescriptionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.createPowerPrescriptionBtn.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    self.createPowerPrescriptionBtn.frame = CGRectMake(CGRectGetMaxX(self.createAerobicPrescriptionBtn.frame) + button_space, CGRectGetMaxY(self.leftView.frame) + kBottomButton_TopMargin * kYScal, kBottomShortButton_Width * kXScal, kBottomButton_Height * kYScal);
    [self.createPowerPrescriptionBtn setTitle:@"开具力量处方" forState:UIControlStateNormal];
    self.createPowerPrescriptionBtn.layer.cornerRadius = kBottomButton_Height * kYScal / 2.0;
    self.createPowerPrescriptionBtn.layer.masksToBounds = YES;
    [self.createPowerPrescriptionBtn.titleLabel setFont:[UIFont systemFontOfSize:kBottomButton_FontSize * kYScal]];
    [self.createPowerPrescriptionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.scrollview addSubview:self.createPowerPrescriptionBtn];
}

- (void)configLatestInfoView {
    CGFloat leftView_Width = (self.scrollview.frame.size.width - kMiddle_Space * kXScal)/2.0;
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.deviceLbl.frame) + kLeftView_TopMargin * kYScal, leftView_Width, self.scrollview.contentSize.height - CGRectGetMaxY(self.deviceLbl.frame) - kLeftView_TopMargin * kYScal - kBottomButton_TopMargin * kYScal - kBottomButton_BottomMargin * kYScal - kBottomButton_Height * kYScal)];
    self.leftView.backgroundColor = [UIColor whiteColor];
    [self.scrollview addSubview:self.leftView];
    
    self.latestLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kUpdateTimeLbl_Width * kXScal, kUpdateTimeLbl_Height * kYScal)];
    self.latestLbl.text = @"更新日期：2019-04-19 11:39:50";
    self.latestLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestLbl.font = [UIFont systemFontOfSize:kUpdateTimeLbl_FontSize * kYScal];
    [self.leftView addSubview:self.latestLbl];
    
    self.latestDoctorLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.latestLbl.frame) + kDoctorLbl_TopMargin *kYScal, kUpdateTimeLbl_Width * kXScal, self.latestLbl.frame.size.height)];
    self.latestDoctorLbl.text = @"医    师：王医师";
    self.latestDoctorLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestDoctorLbl.font = [UIFont systemFontOfSize:kUpdateTimeLbl_FontSize * kYScal];
    [self.leftView addSubview:self.latestDoctorLbl];
    
    self.leftContentView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.latestDoctorLbl.frame) + kContentView_TopMargin * kYScal, leftView_Width, self.leftView.frame.size.height - CGRectGetMaxY(self.latestDoctorLbl.frame) - kContentView_TopMargin * kYScal)];
    self.leftContentView.backgroundColor = [UIColor colorWithHexString:@"#DAF1F5"];
    self.leftContentView.layer.cornerRadius = 4;
    self.leftContentView.layer.masksToBounds = YES;
    [self.leftView addSubview:self.leftContentView];
    
    self.latestLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.leftView.frame.size.width - kInfoLbl_Width * kXScal - kInfoLbl_RightMargin * kXScal, kInfoLbl_TopMargin * kYScal, kInfoLbl_Width * kXScal, kInfoLbl_Height* kYScal)];
    self.latestLbl.text = @"最新信息";
    self.latestLbl.textColor = [UIColor colorWithHexString:@"#E85403"];
    self.latestLbl.font = [UIFont systemFontOfSize:kInfoLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestLbl];
    
    self.latestPatientImg = [[UIImageView alloc] initWithFrame:CGRectMake(kHeadPhoto_LeftMargin * kXScal, kHeadPhoto_TopMargin * kYScal, kHeadPhoto_Width * kYScal, kHeadPhoto_Width * kYScal)];
    [self.latestPatientImg sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"default_head"]];
    self.latestPatientImg.layer.cornerRadius = kHeadPhoto_Width * kXScal / 2.0;
    self.latestPatientImg.layer.masksToBounds = YES;
    [self.leftContentView addSubview:self.latestPatientImg];
    
    self.latestNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestPatientImg.frame) + kNameLbl_TopMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestNameLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestNameLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestNameLbl.text = @"姓       名";
    [self.leftContentView addSubview:self.latestNameLbl];
    
    self.latestNameStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestNameStar.frame = CGRectMake(CGRectGetMaxX(self.latestNameLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestNameLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestNameStar];
    
    self.latestNameTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestNameStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestNameTF.center = CGPointMake(CGRectGetMaxX(self.latestNameStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestNameLbl.center.y);
    self.latestNameTF.backgroundColor = [UIColor whiteColor];
    self.latestNameTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestNameTF.layer.borderWidth = 1;
    self.latestNameTF.layer.cornerRadius = 2;
    [self.leftContentView addSubview:self.latestNameTF];
    
    CGFloat hSpace = self.leftView.frame.size.width - 2 * kHeadPhoto_LeftMargin * kXScal - 2 * (kNameLbl_Width + kRedStar_LeftMargin + kNameTF_LeftMargin + kNameTF_Width + kRedStar_Width) * kXScal;
    self.latestSexLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestNameTF.frame) + hSpace, self.latestNameLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestSexLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestSexLbl.text = @"性       别";
    self.latestSexLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestSexLbl];
    
    self.latestSexStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestSexStar.frame = CGRectMake(CGRectGetMaxX(self.latestSexLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestSexLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestSexStar];
    
    self.latestSexTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestSexStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestSexTF.center = CGPointMake(CGRectGetMaxX(self.latestSexStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestSexLbl.center.y);
    self.latestSexTF.backgroundColor = [UIColor whiteColor];
    self.latestSexTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestSexTF.layer.borderWidth = 1;
    self.latestSexTF.layer.cornerRadius = 2;
    [self.leftContentView addSubview:self.latestSexTF];
    
    self.latestPhoneLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestNameLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestPhoneLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestPhoneLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestPhoneLbl.text = @"手机号码";
    [self.leftContentView addSubview:self.latestPhoneLbl];
    
    self.latestPhoneStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestPhoneStar.frame = CGRectMake(CGRectGetMaxX(self.latestPhoneLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestPhoneLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestPhoneStar];
    
    self.latestPhoneTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestNameStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestPhoneTF.center = CGPointMake(CGRectGetMaxX(self.latestPhoneStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestPhoneLbl.center.y);
    self.latestPhoneTF.backgroundColor = [UIColor whiteColor];
    self.latestPhoneTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestPhoneTF.layer.borderWidth = 1;
    self.latestPhoneTF.layer.cornerRadius = 2;
    [self.leftContentView addSubview:self.latestPhoneTF];
    
    self.latestBirthLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestPhoneTF.frame) + hSpace, self.latestPhoneLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestBirthLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestBirthLbl.text = @"出生日期";
    self.latestBirthLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestBirthLbl];
    
    self.latestBirthStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestBirthStar.frame = CGRectMake(CGRectGetMaxX(self.latestBirthLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestBirthLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestBirthStar];
    
    self.latestBirthTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestSexStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestBirthTF.center = CGPointMake(CGRectGetMaxX(self.latestBirthStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestBirthLbl.center.y);
    self.latestBirthTF.backgroundColor = [UIColor whiteColor];
    self.latestBirthTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestBirthTF.layer.borderWidth = 1;
    self.latestBirthTF.layer.cornerRadius = 2;
    [self.leftContentView addSubview:self.latestBirthTF];
    
    self.latestHeightLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestBirthLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestHeightLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestHeightLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestHeightLbl.text = @"身       高";
    [self.leftContentView addSubview:self.latestHeightLbl];
    
    self.latestHeightStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestHeightStar.frame = CGRectMake(CGRectGetMaxX(self.latestHeightLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestBirthLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestHeightStar];
    
    self.latestHeightTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestNameStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestHeightTF.center = CGPointMake(CGRectGetMaxX(self.latestPhoneStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestHeightLbl.center.y);
    self.latestHeightTF.backgroundColor = [UIColor whiteColor];
    self.latestHeightTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestHeightTF.layer.borderWidth = 1;
    self.latestHeightTF.layer.cornerRadius = 2;
    self.latestHeightTF.unitLbl.text = @"cm";
    [self.leftContentView addSubview:self.latestHeightTF];
    
    self.latestWeightLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHeightTF.frame) + hSpace, self.latestHeightLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestWeightLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestWeightLbl.text = @"体       重";
    self.latestWeightLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestWeightLbl];
    
    self.latestWeightStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestWeightStar.frame = CGRectMake(CGRectGetMaxX(self.latestWeightLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestWeightLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestWeightStar];
    
    self.latestWeightTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestWeightStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestWeightTF.center = CGPointMake(CGRectGetMaxX(self.latestBirthStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestWeightLbl.center.y);
    self.latestWeightTF.backgroundColor = [UIColor whiteColor];
    self.latestWeightTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestWeightTF.layer.borderWidth = 1;
    self.latestWeightTF.layer.cornerRadius = 2;
    self.latestWeightTF.unitLbl.text = @"kg";
    [self.leftContentView addSubview:self.latestWeightTF];
    
    self.latestWaistLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestHeightLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestWaistLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestWaistLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestWaistLbl.text = @"腰       围";
    [self.leftContentView addSubview:self.latestWaistLbl];
    
    self.latestWaistStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestWaistStar.frame = CGRectMake(CGRectGetMaxX(self.latestWaistLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestWaistLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestWaistStar];
    
    self.latestWaistTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestWaistStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestWaistTF.center = CGPointMake(CGRectGetMaxX(self.latestPhoneStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestWaistLbl.center.y);
    self.latestWaistTF.backgroundColor = [UIColor whiteColor];
    self.latestWaistTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestWaistTF.layer.borderWidth = 1;
    self.latestWaistTF.layer.cornerRadius = 2;
    self.latestWaistTF.unitLbl.text = @"cm";
    [self.leftContentView addSubview:self.latestWaistTF];
    
    self.latestKFXTLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestWaistTF.frame) + hSpace, self.latestWaistLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestKFXTLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestKFXTLbl.text = @"空腹血糖";
    self.latestKFXTLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestKFXTLbl];
    
    self.latestKFXTStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestKFXTStar.frame = CGRectMake(CGRectGetMaxX(self.latestKFXTLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestKFXTLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestKFXTStar];
    
    self.latestKFXTHRTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestKFXTStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestKFXTHRTF.center = CGPointMake(CGRectGetMaxX(self.latestBirthStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestKFXTLbl.center.y);
    self.latestKFXTHRTF.backgroundColor = [UIColor whiteColor];
    self.latestKFXTHRTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestKFXTHRTF.layer.borderWidth = 1;
    self.latestKFXTHRTF.layer.cornerRadius = 2;
    self.latestKFXTHRTF.unitLbl.text = @"mmlo/L";
    [self.leftContentView addSubview:self.latestKFXTHRTF];
    
    self.latestQuietHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestKFXTLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestQuietHRLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestQuietHRLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestQuietHRLbl.text = @"安静心率";
    [self.leftContentView addSubview:self.latestQuietHRLbl];
    
    self.latestQuietHRStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestQuietHRStar.frame = CGRectMake(CGRectGetMaxX(self.latestQuietHRLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestQuietHRLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestQuietHRStar];
    
    self.latestQuietHRTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuietHRStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestQuietHRTF.center = CGPointMake(CGRectGetMaxX(self.latestPhoneStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestQuietHRLbl.center.y);
    self.latestQuietHRTF.backgroundColor = [UIColor whiteColor];
    self.latestQuietHRTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestQuietHRTF.layer.borderWidth = 1;
    self.latestQuietHRTF.layer.cornerRadius = 2;
    self.latestQuietHRTF.unitLbl.text = @"bpm";
    [self.leftContentView addSubview:self.latestQuietHRTF];
    
    self.latestXLBYLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuietHRTF.frame) + hSpace, self.latestQuietHRLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestXLBYLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestXLBYLbl.text = @"心率变异";
    self.latestXLBYLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestXLBYLbl];
    
    self.latestXLBYStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestXLBYStar.frame = CGRectMake(CGRectGetMaxX(self.latestXLBYLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestXLBYLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestXLBYStar];
    
    self.latestXLBYTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestXLBYStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestXLBYTF.center = CGPointMake(CGRectGetMaxX(self.latestBirthStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestXLBYLbl.center.y);
    self.latestXLBYTF.backgroundColor = [UIColor whiteColor];
    self.latestXLBYTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestXLBYTF.layer.borderWidth = 1;
    self.latestXLBYTF.layer.cornerRadius = 2;
    [self.leftContentView addSubview:self.latestXLBYTF];
    
    self.latestSSYLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestXLBYLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestSSYLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestSSYLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestSSYLbl.text = @"收  缩  压";
    [self.leftContentView addSubview:self.latestSSYLbl];
    
    self.latestSSYStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestSSYStar.frame = CGRectMake(CGRectGetMaxX(self.latestSSYLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestSSYLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestSSYStar];
    
    self.latestSSYTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestSSYStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestSSYTF.center = CGPointMake(CGRectGetMaxX(self.latestSSYStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestSSYLbl.center.y);
    self.latestSSYTF.backgroundColor = [UIColor whiteColor];
    self.latestSSYTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestSSYTF.layer.borderWidth = 1;
    self.latestSSYTF.layer.cornerRadius = 2;
    self.latestSSYTF.unitLbl.text = @"mmHg";
    [self.leftContentView addSubview:self.latestSSYTF];
    
    self.latestSZYLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestSSYTF.frame) + hSpace, self.latestSSYLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestSZYLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestSZYLbl.text = @"舒  张  压";
    self.latestSZYLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestSZYLbl];
    
    self.latestSZYStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestSZYStar.frame = CGRectMake(CGRectGetMaxX(self.latestSZYLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestSZYLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestSZYStar];
    
    self.latestSZYTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestSZYStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestSZYTF.center = CGPointMake(CGRectGetMaxX(self.latestBirthStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestSZYLbl.center.y);
    self.latestSZYTF.backgroundColor = [UIColor whiteColor];
    self.latestSZYTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestSZYTF.layer.borderWidth = 1;
    self.latestSZYTF.layer.cornerRadius = 2;
    self.latestSZYTF.unitLbl.text = @"mmHg";
    [self.leftContentView addSubview:self.latestSZYTF];
    
    self.latestGMDZDBLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestSSYLbl.frame) + kNameLbl_BottomMargin * kYScal, kLongLbl_Width * kXScal, kLongLbl_Height * kYScal)];
    self.latestGMDZDBLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestGMDZDBLbl.text = @"高密度脂蛋白";
    self.latestGMDZDBLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestGMDZDBLbl];
    
    self.latestGMDZDBStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestGMDZDBStar.frame = CGRectMake(CGRectGetMaxX(self.latestGMDZDBLbl.frame) + kLongLbl_RighMargin * kXScal, self.latestGMDZDBLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestGMDZDBStar];
    
    self.latestGMDZDBTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestGMDZDBStar.frame) + kLongTF_LeftMargin * kXScal, 0, kLongTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestGMDZDBTF.center = CGPointMake(CGRectGetMaxX(self.latestGMDZDBStar.frame) + kLongTF_LeftMargin * kXScal + kLongTF_Width * kXScal / 2.0, self.latestGMDZDBLbl.center.y);
    self.latestGMDZDBTF.backgroundColor = [UIColor whiteColor];
    self.latestGMDZDBTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestGMDZDBTF.layer.borderWidth = 1;
    self.latestGMDZDBTF.layer.cornerRadius = 2;
    self.latestGMDZDBTF.unitLbl.text = @"mmlo/L";
    [self.leftContentView addSubview:self.latestGMDZDBTF];
    
    self.latestSTZLZSLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestGMDZDBLbl.frame) + kNameLbl_BottomMargin * kYScal, kLongLbl_Width * kXScal, kLongLbl_Height * kYScal)];
    self.latestSTZLZSLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestSTZLZSLbl.text = @"身体质量指数";
    self.latestSTZLZSLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestSTZLZSLbl];
    
    self.latestSTZLZSStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestSTZLZSStar.frame = CGRectMake(CGRectGetMaxX(self.latestSTZLZSLbl.frame) + kLongLbl_RighMargin * kXScal, self.latestSTZLZSLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestSTZLZSStar];
    
    self.latestSTZLZSTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestSTZLZSStar.frame) + kLongTF_LeftMargin * kXScal, 0, kLongTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestSTZLZSTF.center = CGPointMake(CGRectGetMaxX(self.latestSTZLZSStar.frame) + kLongTF_LeftMargin * kXScal + kLongTF_Width * kXScal / 2.0, self.latestSTZLZSLbl.center.y);
    self.latestSTZLZSTF.backgroundColor = [UIColor whiteColor];
    self.latestSTZLZSTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestSTZLZSTF.layer.borderWidth = 1;
    self.latestSTZLZSTF.layer.cornerRadius = 2;
    self.latestSTZLZSTF.unitLbl.text = @"mmlo/L";
    [self.leftContentView addSubview:self.latestSTZLZSTF];
    
    self.latestMaxAlertHrLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestSTZLZSLbl.frame) + kNameLbl_BottomMargin * kYScal, kLongLbl_Width * kXScal, kLongLbl_Height * kYScal)];
    self.latestMaxAlertHrLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestMaxAlertHrLbl.text = @"最大报警心率";
    self.latestMaxAlertHrLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestMaxAlertHrLbl];
    
    self.latestMaxAlertHrStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestMaxAlertHrStar.frame = CGRectMake(CGRectGetMaxX(self.latestMaxAlertHrLbl.frame) + kLongLbl_RighMargin * kXScal, self.latestMaxAlertHrLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestMaxAlertHrStar];
    
    self.latestMaxAlertTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestMaxAlertHrStar.frame) + kLongTF_LeftMargin * kXScal, 0, kLongTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestMaxAlertTF.center = CGPointMake(CGRectGetMaxX(self.latestMaxAlertHrStar.frame) + kLongTF_LeftMargin * kXScal + kLongTF_Width * kXScal / 2.0, self.latestMaxAlertHrLbl.center.y);
    self.latestMaxAlertTF.backgroundColor = [UIColor whiteColor];
    self.latestMaxAlertTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestMaxAlertTF.layer.borderWidth = 1;
    self.latestMaxAlertTF.layer.cornerRadius = 2;
    self.latestMaxAlertTF.unitLbl.text = @"mmlo/L";
    [self.leftContentView addSubview:self.latestMaxAlertTF];
    
    self.latestQuestionImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestMaxAlertHrLbl.frame) + kQuestionLeftImg_TopMargin * kYScal,kQuestionLeftImg_Width * kXScal , kQuestionLeftImg_Height * kYScal)];
    self.latestQuestionImg1.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.leftContentView addSubview:self.latestQuestionImg1];
    
    self.latestQuestionLbl1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuestionImg1.frame) + kQuestionLbl_LeftMargin * kXScal, 0 ,self.leftView.frame.size.width - CGRectGetMaxX(self.latestQuestionImg1.frame) - kQuestionLbl_LeftMargin * kXScal, kNameLbl_Height * kYScal)];
    self.latestQuestionLbl1.text = @"您平时做多少运动？";
    self.latestQuestionLbl1.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    CGFloat question1_CenterX = CGRectGetMaxX(self.latestQuestionImg1.frame) + kQuestionLbl_LeftMargin * kXScal + (self.leftView.frame.size.width - CGRectGetMaxX(self.latestQuestionImg1.frame) - kQuestionLbl_LeftMargin * kXScal)/2.0;
    self.latestQuestionLbl1.center = CGPointMake(question1_CenterX, self.latestQuestionImg1.center.y);
    self.latestQuestionLbl1.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.leftContentView addSubview:self.latestQuestionLbl1];
    
    self.latestAnswer1NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    self.latestAnswer1NoImg.frame = CGRectMake(self.latestQuestionLbl1.frame.origin.x + kRadioBtn_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestionLbl1.frame) + kRadioBtn_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestAnswer1NoImg];
    
    self.latestAnswer1NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestAnswer1NoImg.frame) + kRadioBtn_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestionLbl1.frame) + kAnswerLbl_TopMargin * kYScal, kAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestAnswer1NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestAnswer1NoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestAnswer1NoLbl.numberOfLines = 0;
    self.latestAnswer1NoLbl.text = @"一天基本不运动或者很少运动（选择这个选项，如果每周您做了少于150分钟的中等强度运动或者每周做了少于75分钟的高强度运动）";
    CGSize anser1NoTextSize = [self.latestAnswer1NoLbl sizeThatFits:CGSizeMake(kAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.latestAnswer1NoLbl.frame = CGRectMake(CGRectGetMaxX(self.latestAnswer1NoImg.frame) + kRadioBtn_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestionLbl1.frame) + kAnswerLbl_TopMargin * kYScal, anser1NoTextSize.width, anser1NoTextSize.height);
    [self.leftContentView addSubview:self.latestAnswer1NoLbl];
    
    self.latestAnswer1YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    self.latestAnswer1YesImg.frame = CGRectMake(self.latestAnswer1NoImg.frame.origin.x, CGRectGetMaxY(self.latestAnswer1NoLbl.frame) + kRadioBtn_Yes_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestAnswer1YesImg];
    
    self.latestAnswer1YesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestAnswer1YesImg.frame) + kRadioBtn_RightMargin * kXScal, CGRectGetMaxY(self.latestAnswer1NoLbl.frame) + kAnswerLbl_Yes_TopMargin * kYScal, kAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestAnswer1YesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestAnswer1YesLbl.text = @"一天基本不做运动或者很少做运动（选择这个选项，如果每周您做了少于150分钟的中等强度运动或者每周少于75分钟的高强度运动）";
    self.latestAnswer1YesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestAnswer1YesLbl.numberOfLines = 0;
    CGSize anser1YesTextSize = [self.latestAnswer1NoLbl sizeThatFits:CGSizeMake(kAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.latestAnswer1YesLbl.frame = CGRectMake(CGRectGetMaxX(self.latestAnswer1YesImg.frame) + kRadioBtn_RightMargin * kXScal, CGRectGetMaxY(self.latestAnswer1NoLbl.frame) + kAnswerLbl_Yes_TopMargin * kYScal, anser1YesTextSize.width, anser1YesTextSize.height);
    [self.leftContentView addSubview:self.latestAnswer1YesLbl];
    
    self.latestQuestionImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestAnswer1YesLbl.frame) + kRadioBtn_TopMargin * kYScal,kQuestionLeftImg_Width * kXScal , kQuestionLeftImg_Height * kYScal)];
    self.latestQuestionImg2.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.leftContentView addSubview:self.latestQuestionImg2];
    
    self.latestQuestionLbl2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuestionImg2.frame) + kQuestionLbl_LeftMargin * kXScal, 0 ,self.leftView.frame.size.width - CGRectGetMaxX(self.latestQuestionImg1.frame) - kQuestionLbl_LeftMargin * kXScal, kNameLbl_Height * kYScal)];
    self.latestQuestionLbl2.text = @"有没有以下情况";
    self.latestQuestionLbl2.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    CGFloat question2_CenterX = CGRectGetMaxX(self.latestQuestionImg2.frame) + kQuestionLbl_LeftMargin * kXScal + (self.leftView.frame.size.width - CGRectGetMaxX(self.latestQuestionImg2.frame) - kQuestionLbl_LeftMargin * kXScal)/2.0;
    self.latestQuestionLbl2.center = CGPointMake(question2_CenterX, self.latestQuestionImg2.center.y);
    self.latestQuestionLbl2.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.leftContentView addSubview:self.latestQuestionLbl2];
    
    //高血压
    self.latestHypertensionLbl = [[UILabel alloc] initWithFrame:CGRectMake(kSecondeAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestionLbl2.frame) + kSecondAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHypertensionLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHypertensionLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHypertensionLbl.text = @"高血压";
    [self.leftContentView addSubview:self.latestHypertensionLbl];
    
    self.latestHypertensionYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    self.latestHypertensionYesImg.frame = CGRectMake(0, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat latestHypertensionYesImg_CenterX = CGRectGetMaxX(self.latestHypertensionLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal / 2.0;
    self.latestHypertensionYesImg.center = CGPointMake(latestHypertensionYesImg_CenterX, self.latestHypertensionLbl.center.y);
    [self.leftContentView addSubview:self.latestHypertensionYesImg];
    
    self.latestHypertensionYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHypertensionYesImg.frame) + kRadioBtn_LeftMargin * kXScal, self.latestHypertensionLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHypertensionYesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHypertensionYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHypertensionYesLbl.text = @"有";
    [self.leftContentView addSubview:self.latestHypertensionYesLbl];
    
    self.latestHypertensionNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    self.latestHypertensionNoImg.frame = CGRectMake(0, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat latestHypertensionNoImg_CenterX = CGRectGetMaxX(self.latestHypertensionYesLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal / 2.0;
    self.latestHypertensionNoImg.center = CGPointMake(latestHypertensionNoImg_CenterX, self.latestHypertensionLbl.center.y);
    [self.leftContentView addSubview:self.latestHypertensionNoImg];
    
    self.latestHypertensionNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHypertensionNoImg.frame) + kRadioBtn_LeftMargin * kXScal, self.latestHypertensionLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHypertensionNoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHypertensionNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHypertensionNoLbl.text = @"无";
    [self.leftContentView addSubview:self.latestHypertensionNoLbl];
    
//    //高血糖
//    latestHyperglycemiaLbl
    self.latestHyperglycemiaLbl = [[UILabel alloc] initWithFrame:CGRectMake(kSecondeAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestHypertensionLbl.frame) + kSecondAnserLbl_BottomMargin * kYScal, kSecondAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHyperglycemiaLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHyperglycemiaLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHyperglycemiaLbl.text = @"高血糖";
    [self.leftContentView addSubview:self.latestHyperglycemiaLbl];
    
    self.latestHyperglycemiaYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    self.latestHyperglycemiaYesImg.frame = CGRectMake(0, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat latestHyperglycemiaYesImg_CenterX = CGRectGetMaxX(self.latestHyperglycemiaLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal / 2.0;
    self.latestHypertensionYesImg.center = CGPointMake(latestHyperglycemiaYesImg_CenterX, self.latestHyperglycemiaLbl.center.y);
    [self.leftContentView addSubview:self.latestHypertensionYesImg];
    
    self.latestHyperglycemiaYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHyperglycemiaYesImg.frame) + kRadioBtn_LeftMargin * kXScal, self.latestHyperglycemiaLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHyperglycemiaYesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHyperglycemiaYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHyperglycemiaYesLbl.text = @"有";
    [self.leftContentView addSubview:self.latestHyperglycemiaYesLbl];
    
    self.latestHyperglycemiaNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    self.latestHypertensionNoImg.frame = CGRectMake(0, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat latestHyperglycemiaNoImgNoImg_CenterX = CGRectGetMaxX(self.latestHyperglycemiaYesLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal / 2.0;
    self.latestHypertensionNoImg.center = CGPointMake(latestHyperglycemiaNoImgNoImg_CenterX, self.latestHyperglycemiaLbl.center.y);
    [self.leftContentView addSubview:self.latestHypertensionNoImg];
    
    self.latestHypertensionNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHypertensionNoImg.frame) + kRadioBtn_LeftMargin * kXScal, self.latestHypertensionLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHypertensionNoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHypertensionNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHypertensionNoLbl.text = @"无";
//    [self.leftContentView addSubview:self.latestHypertensionNoLbl];
    
    self.latestHyperlipidemiaLbl = [[UILabel alloc] initWithFrame:CGRectMake(kSecondeAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestHyperglycemiaLbl.frame) + kSecondAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHyperlipidemiaLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHyperlipidemiaLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHyperlipidemiaLbl.text = @"高血脂";
    [self.leftContentView addSubview:self.latestHyperlipidemiaLbl];
    
    self.latestHyperlipidemiaYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    self.latestHyperlipidemiaYesImg.frame = CGRectMake(0, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat latestHyperlipidemiaNoImg_CenterX = CGRectGetMaxX(self.latestHyperlipidemiaLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal / 2.0;
    self.latestHyperlipidemiaYesImg.center = CGPointMake(latestHyperlipidemiaNoImg_CenterX, self.latestHyperlipidemiaLbl.center.y);
    [self.leftContentView addSubview:self.latestHyperlipidemiaYesImg];
    
    self.latestHyperlipidemiaYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHyperlipidemiaYesImg.frame) + kRadioBtn_LeftMargin * kXScal, self.latestHyperlipidemiaLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHyperlipidemiaYesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHyperlipidemiaYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHyperlipidemiaYesLbl.text = @"有";
    [self.leftContentView addSubview:self.latestHyperlipidemiaYesLbl];
    
    self.latestHyperlipidemiaNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    self.latestHyperlipidemiaNoImg.frame = CGRectMake(0, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat latestHyperlipidemiaYesImg_CenterX = CGRectGetMaxX(self.latestHyperlipidemiaYesLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal / 2.0;
    self.latestHyperlipidemiaNoImg.center = CGPointMake(latestHyperlipidemiaYesImg_CenterX, self.latestHypertensionLbl.center.y);
    [self.leftContentView addSubview:self.latestHyperlipidemiaNoImg];
    
    self.latestHyperlipidemiaNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHyperlipidemiaNoImg.frame) + kRadioBtn_LeftMargin * kXScal, self.latestHyperlipidemiaLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHyperlipidemiaNoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHyperlipidemiaNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHyperlipidemiaNoLbl.text = @"无";
    [self.leftContentView addSubview:self.latestHyperlipidemiaNoLbl];
    
//    //
//
}

- (void)configOlderInfoView {
    CGFloat rightView_Width = (self.scrollview.frame.size.width - kMiddle_Space * kXScal)/2.0;
    self.rightView = [[UIView alloc] initWithFrame:CGRectMake(self.hrLbl.frame.origin.x, CGRectGetMaxY(self.deviceLbl.frame) + kLeftView_TopMargin * kYScal, rightView_Width, self.scrollview.contentSize.height - CGRectGetMaxY(self.deviceLbl.frame) - kLeftView_TopMargin * kYScal - kLeftView_TopMargin * kYScal - kBottomButton_TopMargin * kYScal - kBottomButton_BottomMargin * kYScal - kBottomButton_Height * kYScal)];
    self.rightView.backgroundColor = [UIColor whiteColor];
    [self.scrollview addSubview:self.rightView];
    
    self.oldTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kUpdateTimeLbl_Width * kXScal, kUpdateTimeLbl_Height * kYScal)];
    self.oldTimeLbl.text = @"更新日期：2019-04-19 11:39:50";
    self.oldTimeLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.oldTimeLbl.font = [UIFont systemFontOfSize:kUpdateTimeLbl_FontSize * kYScal];
    [self.rightView addSubview:self.oldTimeLbl];
    
    self.oldDoctorLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, self.latestDoctorLbl.frame.origin.y, kUpdateTimeLbl_Width * kXScal, self.latestLbl.frame.size.height)];
    self.oldDoctorLbl.text = @"医    师：王医师";
    self.oldDoctorLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.oldDoctorLbl.font = [UIFont systemFontOfSize:kUpdateTimeLbl_FontSize * kYScal];
    [self.rightView addSubview:self.oldDoctorLbl];
    
    self.rightContentView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.latestDoctorLbl.frame) + kContentView_TopMargin * kYScal, rightView_Width, self.rightView.frame.size.height - CGRectGetMaxY(self.latestDoctorLbl.frame) - kContentView_TopMargin * kYScal)];
    self.rightContentView.backgroundColor = [UIColor colorWithHexString:@"#DAF1F5"];
    self.rightContentView.layer.cornerRadius = 4;
    self.rightContentView.layer.masksToBounds = YES;
    [self.rightView addSubview:self.rightContentView];
    
    self.olderLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.rightView.frame.size.width - kInfoLbl_Width * kXScal - kInfoLbl_RightMargin * kXScal, kInfoLbl_TopMargin * kYScal, kInfoLbl_Width * kXScal, kInfoLbl_Height* kYScal)];
    self.olderLbl.text = @"历史信息";
    self.olderLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.olderLbl.font = [UIFont systemFontOfSize:kInfoLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderLbl];
    
    self.olderPatientImg = [[UIImageView alloc] initWithFrame:CGRectMake(kHeadPhoto_LeftMargin * kXScal, kHeadPhoto_TopMargin * kYScal, kHeadPhoto_Width * kYScal, kHeadPhoto_Width * kYScal)];
    [self.olderPatientImg sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"default_head"]];
    self.olderPatientImg.layer.cornerRadius = kHeadPhoto_Width * kXScal / 2.0;
    self.olderPatientImg.layer.masksToBounds = YES;
    [self.rightContentView addSubview:self.olderPatientImg];
    
    self.olderNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderPatientImg.frame) + kNameLbl_TopMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderNameLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderNameLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderNameLbl.text = @"姓       名";
    [self.rightContentView addSubview:self.olderNameLbl];
    
    self.olderNameStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderNameStar.frame = CGRectMake(CGRectGetMaxX(self.olderNameLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderNameLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderNameStar];
    
    self.olderNameTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderNameStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderNameTF.center = CGPointMake(CGRectGetMaxX(self.olderNameStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderNameLbl.center.y);
    self.olderNameTF.backgroundColor = [UIColor whiteColor];
    self.olderNameTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderNameTF.layer.borderWidth = 1;
    self.olderNameTF.layer.cornerRadius = 2;
    [self.rightContentView addSubview:self.olderNameTF];
    
    CGFloat hSpace = self.rightView.frame.size.width - 2 * kHeadPhoto_LeftMargin * kXScal - 2 * (kNameLbl_Width + kRedStar_LeftMargin + kNameTF_LeftMargin + kNameTF_Width + kRedStar_Width) * kXScal;
    self.olderSexLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderNameTF.frame) + hSpace, self.olderNameLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderSexLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderSexLbl.text = @"性       别";
    self.olderSexLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderSexLbl];
    
    self.olderSexStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderSexStar.frame = CGRectMake(CGRectGetMaxX(self.olderSexLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderSexLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderSexStar];
    
    self.olderSexTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderSexStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderSexTF.center = CGPointMake(CGRectGetMaxX(self.olderSexStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderSexLbl.center.y);
    self.olderSexTF.backgroundColor = [UIColor whiteColor];
    self.olderSexTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderSexTF.layer.borderWidth = 1;
    self.olderSexTF.layer.cornerRadius = 2;
    [self.rightContentView addSubview:self.olderSexTF];
    
    self.olderPhoneLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderNameLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderPhoneLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderPhoneLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderPhoneLbl.text = @"手机号码";
    [self.rightContentView addSubview:self.olderPhoneLbl];
    
    self.olderPhoneStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderPhoneStar.frame = CGRectMake(CGRectGetMaxX(self.olderPhoneLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderPhoneLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderPhoneStar];
    
    self.olderPhoneTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderNameStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderPhoneTF.center = CGPointMake(CGRectGetMaxX(self.olderPhoneStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderPhoneLbl.center.y);
    self.olderPhoneTF.backgroundColor = [UIColor whiteColor];
    self.olderPhoneTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderPhoneTF.layer.borderWidth = 1;
    self.olderPhoneTF.layer.cornerRadius = 2;
    [self.rightContentView addSubview:self.olderPhoneTF];
    
    self.olderBirthLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderPhoneTF.frame) + hSpace, self.olderPhoneLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderBirthLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderBirthLbl.text = @"出生日期";
    self.olderBirthLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderBirthLbl];
    
    self.olderBirthStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderBirthStar.frame = CGRectMake(CGRectGetMaxX(self.olderBirthLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderBirthLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderBirthStar];
    
    self.olderBirthTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderSexStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderBirthTF.center = CGPointMake(CGRectGetMaxX(self.olderBirthStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderBirthLbl.center.y);
    self.olderBirthTF.backgroundColor = [UIColor whiteColor];
    self.olderBirthTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderBirthTF.layer.borderWidth = 1;
    self.olderBirthTF.layer.cornerRadius = 2;
    [self.rightContentView addSubview:self.olderBirthTF];
    
    self.olderHeightLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderBirthLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderHeightLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderHeightLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderHeightLbl.text = @"身       高";
    [self.rightContentView addSubview:self.olderHeightLbl];
    
    self.olderHeightStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderHeightStar.frame = CGRectMake(CGRectGetMaxX(self.olderHeightLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderBirthLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderHeightStar];
    
    self.olderHeightTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderNameStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderHeightTF.center = CGPointMake(CGRectGetMaxX(self.olderPhoneStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderHeightLbl.center.y);
    self.olderHeightTF.backgroundColor = [UIColor whiteColor];
    self.olderHeightTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderHeightTF.layer.borderWidth = 1;
    self.olderHeightTF.layer.cornerRadius = 2;
    self.olderHeightTF.unitLbl.text = @"cm";
    [self.rightContentView addSubview:self.olderHeightTF];
    
    self.olderWeightLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderHeightTF.frame) + hSpace, self.olderHeightLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderWeightLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderWeightLbl.text = @"体       重";
    self.olderWeightLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderWeightLbl];
    
    self.olderWeightStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderWeightStar.frame = CGRectMake(CGRectGetMaxX(self.olderWeightLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderWeightLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderWeightStar];
    
    self.olderWeightTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderWeightStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderWeightTF.center = CGPointMake(CGRectGetMaxX(self.olderBirthStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderWeightLbl.center.y);
    self.olderWeightTF.backgroundColor = [UIColor whiteColor];
    self.olderWeightTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderWeightTF.layer.borderWidth = 1;
    self.olderWeightTF.layer.cornerRadius = 2;
    self.olderWeightTF.unitLbl.text = @"kg";
    [self.rightContentView addSubview:self.olderWeightTF];
    
    self.olderWaistLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderHeightLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderWaistLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderWaistLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderWaistLbl.text = @"腰       围";
    [self.rightContentView addSubview:self.olderWaistLbl];
    
    self.olderWaistStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderWaistStar.frame = CGRectMake(CGRectGetMaxX(self.olderWaistLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderWaistLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderWaistStar];
    
    self.olderWaistTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderWaistStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderWaistTF.center = CGPointMake(CGRectGetMaxX(self.olderPhoneStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderWaistLbl.center.y);
    self.olderWaistTF.backgroundColor = [UIColor whiteColor];
    self.olderWaistTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderWaistTF.layer.borderWidth = 1;
    self.olderWaistTF.layer.cornerRadius = 2;
    self.olderWaistTF.unitLbl.text = @"cm";
    [self.rightContentView addSubview:self.olderWaistTF];
    
    self.olderKFXTLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderWaistTF.frame) + hSpace, self.olderWaistLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderKFXTLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderKFXTLbl.text = @"空腹血糖";
    self.olderKFXTLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderKFXTLbl];
    
    self.olderKFXTStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderKFXTStar.frame = CGRectMake(CGRectGetMaxX(self.olderKFXTLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderKFXTLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderKFXTStar];
    
    self.olderKFXTHRTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderKFXTStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderKFXTHRTF.center = CGPointMake(CGRectGetMaxX(self.olderBirthStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderKFXTLbl.center.y);
    self.olderKFXTHRTF.backgroundColor = [UIColor whiteColor];
    self.olderKFXTHRTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderKFXTHRTF.layer.borderWidth = 1;
    self.olderKFXTHRTF.layer.cornerRadius = 2;
    self.olderKFXTHRTF.unitLbl.text = @"mmlo/L";
    [self.rightContentView addSubview:self.olderKFXTHRTF];
    
    self.olderQuietHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderKFXTLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderQuietHRLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderQuietHRLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderQuietHRLbl.text = @"安静心率";
    [self.rightContentView addSubview:self.olderQuietHRLbl];
    
    self.olderQuietHRStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderQuietHRStar.frame = CGRectMake(CGRectGetMaxX(self.olderQuietHRLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderQuietHRLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderQuietHRStar];
    
    self.olderQuietHRTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuietHRStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderQuietHRTF.center = CGPointMake(CGRectGetMaxX(self.olderPhoneStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderQuietHRLbl.center.y);
    self.olderQuietHRTF.backgroundColor = [UIColor whiteColor];
    self.olderQuietHRTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderQuietHRTF.layer.borderWidth = 1;
    self.olderQuietHRTF.layer.cornerRadius = 2;
    self.olderQuietHRTF.unitLbl.text = @"bpm";
    [self.rightContentView addSubview:self.olderQuietHRTF];
    
    self.olderXLBYLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuietHRTF.frame) + hSpace, self.olderQuietHRLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderXLBYLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderXLBYLbl.text = @"心率变异";
    self.olderXLBYLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderXLBYLbl];
    
    self.olderXLBYStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderXLBYStar.frame = CGRectMake(CGRectGetMaxX(self.olderXLBYLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderXLBYLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderXLBYStar];
    
    self.olderXLBYTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderXLBYStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderXLBYTF.center = CGPointMake(CGRectGetMaxX(self.olderBirthStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderXLBYLbl.center.y);
    self.olderXLBYTF.backgroundColor = [UIColor whiteColor];
    self.olderXLBYTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderXLBYTF.layer.borderWidth = 1;
    self.olderXLBYTF.layer.cornerRadius = 2;
    [self.rightContentView addSubview:self.olderXLBYTF];
    
    self.olderSSYLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderXLBYLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderSSYLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderSSYLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderSSYLbl.text = @"收  缩  压";
    [self.rightContentView addSubview:self.olderSSYLbl];
    
    self.olderSSYStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderSSYStar.frame = CGRectMake(CGRectGetMaxX(self.olderSSYLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderSSYLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderSSYStar];
    
    self.olderSSYTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderSSYStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderSSYTF.center = CGPointMake(CGRectGetMaxX(self.olderSSYStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderSSYLbl.center.y);
    self.olderSSYTF.backgroundColor = [UIColor whiteColor];
    self.olderSSYTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderSSYTF.layer.borderWidth = 1;
    self.olderSSYTF.layer.cornerRadius = 2;
    self.olderSSYTF.unitLbl.text = @"mmHg";
    [self.rightContentView addSubview:self.olderSSYTF];
    
    self.olderSZYLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderSSYTF.frame) + hSpace, self.olderSSYLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderSZYLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderSZYLbl.text = @"舒  张  压";
    self.olderSZYLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderSZYLbl];
    
    self.olderSZYStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderSZYStar.frame = CGRectMake(CGRectGetMaxX(self.olderSZYLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderSZYLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderSZYStar];
    
    self.olderSZYTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderSZYStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderSZYTF.center = CGPointMake(CGRectGetMaxX(self.olderBirthStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderSZYLbl.center.y);
    self.olderSZYTF.backgroundColor = [UIColor whiteColor];
    self.olderSZYTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderSZYTF.layer.borderWidth = 1;
    self.olderSZYTF.layer.cornerRadius = 2;
    self.olderSZYTF.unitLbl.text = @"mmHg";
    [self.rightContentView addSubview:self.olderSZYTF];
    
    self.olderGMDZDBLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderSSYLbl.frame) + kNameLbl_BottomMargin * kYScal, kLongLbl_Width * kXScal, kLongLbl_Height * kYScal)];
    self.olderGMDZDBLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderGMDZDBLbl.text = @"高密度脂蛋白";
    self.olderGMDZDBLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderGMDZDBLbl];
    
    self.olderGMDZDBStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderGMDZDBStar.frame = CGRectMake(CGRectGetMaxX(self.olderGMDZDBLbl.frame) + kLongLbl_RighMargin * kXScal, self.olderGMDZDBLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderGMDZDBStar];
    
    self.olderGMDZDBTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderGMDZDBStar.frame) + kLongTF_LeftMargin * kXScal, 0, kLongTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderGMDZDBTF.center = CGPointMake(CGRectGetMaxX(self.olderGMDZDBStar.frame) + kLongTF_LeftMargin * kXScal + kLongTF_Width * kXScal / 2.0, self.olderGMDZDBLbl.center.y);
    self.olderGMDZDBTF.backgroundColor = [UIColor whiteColor];
    self.olderGMDZDBTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderGMDZDBTF.layer.borderWidth = 1;
    self.olderGMDZDBTF.layer.cornerRadius = 2;
    self.olderGMDZDBTF.unitLbl.text = @"mmlo/L";
    [self.rightContentView addSubview:self.olderGMDZDBTF];
    
    self.olderSTZLZSLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderGMDZDBLbl.frame) + kNameLbl_BottomMargin * kYScal, kLongLbl_Width * kXScal, kLongLbl_Height * kYScal)];
    self.olderSTZLZSLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderSTZLZSLbl.text = @"身体质量指数";
    self.olderSTZLZSLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderSTZLZSLbl];
    
    self.olderSTZLZSStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderSTZLZSStar.frame = CGRectMake(CGRectGetMaxX(self.olderSTZLZSLbl.frame) + kLongLbl_RighMargin * kXScal, self.olderSTZLZSLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderSTZLZSStar];
    
    self.olderSTZLZSTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderSTZLZSStar.frame) + kLongTF_LeftMargin * kXScal, 0, kLongTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderSTZLZSTF.center = CGPointMake(CGRectGetMaxX(self.olderSTZLZSStar.frame) + kLongTF_LeftMargin * kXScal + kLongTF_Width * kXScal / 2.0, self.olderSTZLZSLbl.center.y);
    self.olderSTZLZSTF.backgroundColor = [UIColor whiteColor];
    self.olderSTZLZSTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderSTZLZSTF.layer.borderWidth = 1;
    self.olderSTZLZSTF.layer.cornerRadius = 2;
    self.olderSTZLZSTF.unitLbl.text = @"mmlo/L";
    [self.rightContentView addSubview:self.olderSTZLZSTF];
    
    self.olderMaxAlertHrLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderSTZLZSLbl.frame) + kNameLbl_BottomMargin * kYScal, kLongLbl_Width * kXScal, kLongLbl_Height * kYScal)];
    self.olderMaxAlertHrLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderMaxAlertHrLbl.text = @"最大报警心率";
    self.olderMaxAlertHrLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderMaxAlertHrLbl];
    
    self.olderMaxAlertHrStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderMaxAlertHrStar.frame = CGRectMake(CGRectGetMaxX(self.olderMaxAlertHrLbl.frame) + kLongLbl_RighMargin * kXScal, self.olderMaxAlertHrLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderMaxAlertHrStar];
    
    self.olderMaxAlertTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderMaxAlertHrStar.frame) + kLongTF_LeftMargin * kXScal, 0, kLongTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderMaxAlertTF.center = CGPointMake(CGRectGetMaxX(self.olderMaxAlertHrStar.frame) + kLongTF_LeftMargin * kXScal + kLongTF_Width * kXScal / 2.0, self.olderMaxAlertHrLbl.center.y);
    self.olderMaxAlertTF.backgroundColor = [UIColor whiteColor];
    self.olderMaxAlertTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderMaxAlertTF.layer.borderWidth = 1;
    self.olderMaxAlertTF.layer.cornerRadius = 2;
    self.olderMaxAlertTF.unitLbl.text = @"mmlo/L";
    [self.rightContentView addSubview:self.olderMaxAlertTF];
    
    self.olderQuestionImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderMaxAlertHrLbl.frame) + kQuestionLeftImg_TopMargin * kYScal,kQuestionLeftImg_Width * kXScal , kQuestionLeftImg_Height * kYScal)];
    self.olderQuestionImg1.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.rightContentView addSubview:self.olderQuestionImg1];
    
    self.olderQuestionLbl1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuestionImg1.frame) + kQuestionLbl_LeftMargin * kXScal, 0 ,self.leftView.frame.size.width - CGRectGetMaxX(self.olderQuestionImg1.frame) - kQuestionLbl_LeftMargin * kXScal, kNameLbl_Height * kYScal)];
    self.olderQuestionLbl1.text = @"您平时做多少运动？";
    self.olderQuestionLbl1.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    CGFloat question1_CenterX = CGRectGetMaxX(self.olderQuestionImg1.frame) + kQuestionLbl_LeftMargin * kXScal + (self.leftView.frame.size.width - CGRectGetMaxX(self.olderQuestionImg1.frame) - kQuestionLbl_LeftMargin * kXScal)/2.0;
    self.olderQuestionLbl1.center = CGPointMake(question1_CenterX, self.olderQuestionImg1.center.y);
    self.olderQuestionLbl1.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.rightContentView addSubview:self.olderQuestionLbl1];
    
    self.olderAnswer1NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    self.olderAnswer1NoImg.frame = CGRectMake(self.olderQuestionLbl1.frame.origin.x + kRadioBtn_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestionLbl1.frame) + kRadioBtn_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderAnswer1NoImg];
    
    self.olderAnswer1NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderAnswer1NoImg.frame) + kRadioBtn_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestionLbl1.frame) + kAnswerLbl_TopMargin * kYScal, kAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderAnswer1NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderAnswer1NoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderAnswer1NoLbl.numberOfLines = 0;
    self.olderAnswer1NoLbl.text = @"一天基本不运动或者很少运动（选择这个选项，如果每周您做了少于150分钟的中等强度运动或者每周做了少于75分钟的高强度运动）";
    CGSize anser1NoTextSize = [self.olderAnswer1NoLbl sizeThatFits:CGSizeMake(kAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.olderAnswer1NoLbl.frame = CGRectMake(CGRectGetMaxX(self.olderAnswer1NoImg.frame) + kRadioBtn_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestionLbl1.frame) + kAnswerLbl_TopMargin * kYScal, anser1NoTextSize.width, anser1NoTextSize.height);
    [self.rightContentView addSubview:self.olderAnswer1NoLbl];
    
    self.olderAnswer1YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    self.olderAnswer1YesImg.frame = CGRectMake(self.olderAnswer1NoImg.frame.origin.x, CGRectGetMaxY(self.olderAnswer1NoLbl.frame) + kRadioBtn_Yes_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderAnswer1YesImg];
    
    self.olderAnswer1YesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderAnswer1YesImg.frame) + kRadioBtn_RightMargin * kXScal, CGRectGetMaxY(self.olderAnswer1NoLbl.frame) + kAnswerLbl_Yes_TopMargin * kYScal, kAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderAnswer1YesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderAnswer1YesLbl.text = @"一天基本不做运动或者很少做运动（选择这个选项，如果每周您做了少于150分钟的中等强度运动或者每周少于75分钟的高强度运动）";
    self.olderAnswer1YesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderAnswer1YesLbl.numberOfLines = 0;
    CGSize anser1YesTextSize = [self.olderAnswer1NoLbl sizeThatFits:CGSizeMake(kAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.olderAnswer1YesLbl.frame = CGRectMake(CGRectGetMaxX(self.olderAnswer1YesImg.frame) + kRadioBtn_RightMargin * kXScal, CGRectGetMaxY(self.olderAnswer1NoLbl.frame) + kAnswerLbl_Yes_TopMargin * kYScal, anser1YesTextSize.width, anser1YesTextSize.height);
    [self.rightContentView addSubview:self.olderAnswer1YesLbl];
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

@end
