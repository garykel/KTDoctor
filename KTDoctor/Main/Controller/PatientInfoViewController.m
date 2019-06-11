//
//  PatientInfoViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/18.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientInfoViewController.h"
#import "PatientBaseInfoViewController.h"
#import "CreateAerobicPrescriptionViewController.h"
#import "AerobicPrescriptionAndReportViewController.h"
#import "CreatePowerPrescriptionViewController.h"
#import "CheckEvaluateReportViewController.h"
#import "OpenAerobicPrescriptionVC.h"
#import "TestResultsCell.h"
#import "KTDropDownMenus.h"
#import "UnitTextField.h"
#import "UserModel.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 150
#define kLeftBtn_Width 21
#define kDropMenu_Item_Height 40
#define kSearch_TF_Font 13.0
#define kSearch_DropView_Font 12.0
#define KScrollView_LeftMargin 20
#define kScrollView_Height 1369
#define kStatusLbl_TopMargin 15
#define kStatusLbl_LeftMargin 20
#define kStatusLbl_FontSize 13.0
#define kStatusLbl_Height 12
#define kStatusLbl_Width 120
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
#define kDropdownHeight 30
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
#define kRedStar_LeftMargin 3
#define kNameTF_LeftMargin 6
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
#define kThirdAnswerLbl_LeftMargin 34
#define kFifthAnswerLbl_LeftMargin 28
#define kFifthAnswerNoLbl_RightMargin 5
#define kFifthAnswerLbl_TopMargin 15
#define kFifthAnswerLbl_Width 330
#define kFifthAnswerLbl_BottomMargin 10
#define kSummaryView_TopMargin 26
#define kSummaryView_LeftMargin 29
#define kSummaryView_Lbl_TopMargin 10
#define kSummaryView_Lbl_LeftMargin 15
#define kSummaryView_Lbl_Width 150
#define kSummaryView_Lbl_Height 14
#define kSummaryView_Lbl_FontSize 14.0
#define kSummaryView_HRZoneLbl_RightMargin 58
#define kBottomButton_BottomMargin 15
#define kBottomButton_TopMargin 20
#define kBottomLongButton_LeftMargin 52
#define kBottomButton_Height 28
#define kBottomLongButton_Width 188
#define kBottomShortButton_Width 120
#define kBottomButton_FontSize 14.0

CGSize testResultsListViewSize;

@interface PatientInfoViewController ()<XXTGDropdownMenuDelegate,UITableViewDelegate,UITableViewDataSource>
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
@property (nonatomic,strong)KTDropDownMenus *hrMenu;
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
@property (nonatomic,strong)NSDictionary *latestInfoDict;
@property (nonatomic,strong)NSDictionary *olderInfoDict;
@property (nonatomic,strong)NSString *hrMenuTitle;
@property (nonatomic,strong)NSMutableArray *allHrDevices;
@property (nonatomic,strong)UserModel *user;
@property (nonatomic,strong)NSMutableArray *testResults;
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
@property (nonatomic,strong)UILabel *latestHbpLbl;//高血压
@property (nonatomic,strong)UIImageView *latestHbpYesImg;
@property (nonatomic,strong)UILabel *latestHbpYesLbl;
@property (nonatomic,strong)UIImageView *latestHbpNoImg;
@property (nonatomic,strong)UILabel *latestHbpNoLbl;
@property (nonatomic,strong)UILabel *latestHbsLbl;//高血糖
@property (nonatomic,strong)UIImageView *latestHbsYesImg;
@property (nonatomic,strong)UILabel *latestHbsYesLbl;
@property (nonatomic,strong)UIImageView *latestHbsNoImg;
@property (nonatomic,strong)UILabel *latestHbsNoLbl;
@property (nonatomic,strong)UILabel *latestHbfLbl;//高血脂
@property (nonatomic,strong)UILabel *latestHbfYesLbl;
@property (nonatomic,strong)UIImageView *latestHbfYesImg;
@property (nonatomic,strong)UILabel *latestHbfNoLbl;
@property (nonatomic,strong)UIImageView *latestHbfNoImg;
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
@property (nonatomic,strong)UILabel *latestQuestion5Lbl11;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl2;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl22;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl3;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl33;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl4;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl44;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl5;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl55;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl6;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl66;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl7;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl77;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl8;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl88;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl9;
@property (nonatomic,strong)UILabel *latestQuestion5Lbl99;

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
@property (nonatomic,strong)UILabel *olderHbpLbl;//高血压
@property (nonatomic,strong)UIImageView *olderHbpYesImg;
@property (nonatomic,strong)UILabel *olderHbpYesLbl;
@property (nonatomic,strong)UIImageView *olderHbpNoImg;
@property (nonatomic,strong)UILabel *olderHbpNoLbl;
@property (nonatomic,strong)UILabel *olderHbsLbl;//高血糖
@property (nonatomic,strong)UIImageView *olderHbsYesImg;
@property (nonatomic,strong)UILabel *olderHbsYesLbl;
@property (nonatomic,strong)UIImageView *olderHbsNoImg;
@property (nonatomic,strong)UILabel *olderHbsNoLbl;
@property (nonatomic,strong)UILabel *olderHbfLbl;//高血脂
@property (nonatomic,strong)UILabel *olderHbfYesLbl;
@property (nonatomic,strong)UIImageView *olderHbfYesImg;
@property (nonatomic,strong)UILabel *olderHbfNoLbl;
@property (nonatomic,strong)UIImageView *olderHbfNoImg;
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
@property (nonatomic,strong)UILabel *olderQuestion5Lbl11;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl2;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl22;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl3;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl33;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl4;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl44;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl5;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl55;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl6;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl66;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl7;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl77;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl8;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl88;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl9;
@property (nonatomic,strong)UILabel *olderQuestion5Lbl99;

@property (nonatomic,strong)UIView *olderSummaryView;
@property (nonatomic,strong)UILabel *olderRiskLevelLbl;
@property (nonatomic,strong)UILabel *olderHRZoneLbl;
@property (nonatomic,strong)UILabel *olderRPERangeLbll;

//底部功能按钮
@property (nonatomic,strong)UIButton *aerobicReportBtn;//查看有氧历史处方及报告
@property (nonatomic,strong)UIButton *powerReportBtn;//查看力量历史处方及报告
@property (nonatomic,strong)UIButton *createAerobicPrescriptionBtn;//开具有氧处方
@property (nonatomic,strong)UIButton *createPowerPrescriptionBtn;//开具力量处方
@property (nonatomic,strong)UIButton *checkEvaluateBtn;//查看体能评估结果
@property (nonatomic,assign)NSInteger offset;
@property (nonatomic,assign)NSInteger leftOffset;//向左偏移
@property (nonatomic,assign)BOOL hasEnded;//是否停止获取网络数据
@property (nonatomic,strong)NSMutableArray *privateDeviceArr;
@property (nonatomic,copy)NSString *selectedDeviceCode;
@property (nonatomic,strong)NSArray *deviceTypeArr;
@end

@implementation PatientInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.offset = 2;
    self.leftOffset = 2;
    self.hasEnded = NO;
    self.navigationController.navigationBar.hidden = YES;
    if (self.infoArr.count > 0) {
        self.latestInfoDict = [self.infoArr objectAtIndex:0];
        if (self.infoArr.count > 1) {
            self.olderInfoDict = [self.infoArr lastObject];
        }
    }
    self.allHrDevices = [NSMutableArray array];
    self.testResults = [NSMutableArray array];
    self.privateDeviceArr = [NSMutableArray arrayWithObjects:@"无", nil];
    self.selectedDeviceCode = @"";
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    self.user = [[UserModel sharedUserModel] getCurrentUser];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    NSInteger userId = [[self.latestInfoDict valueForKey:@"userId"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    [self getPrivateHrDevice:parameter];
    
    NSMutableDictionary *testPara = [NSMutableDictionary dictionary];
    [testPara setValue:orgCode forKey:@"orgCode"];
    [testPara setValue:@(userId) forKey:@"userId"];
    [self getUserDeviceMeasure:testPara];
    
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setValue:orgCode forKey:@"orgCode"];
    [self getDeviceTypeList:parameter];
    [self setNavBar];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [para setValue:orgCode forKey:@"orgCode"];
    NSInteger userId = [[self.latestInfoDict valueForKey:@"userId"] integerValue];
    [para setValue:@(userId) forKey:@"userId"];
    [para setValue:orgCode forKey:@"orgCode"];
    [para setValue:@14 forKey:@"deviceType"];
    [self showAllHrDevices:para];
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
    self.statusLbl.text = [NSString stringWithFormat:@"状态：%@",self.statusStr];
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
    [self.updateInfoBtn addTarget:self action:@selector(updateInfoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
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
    [self.testResultBtn addTarget:self action:@selector(showTestResults:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.testResultBtn];
    
    self.testResultListView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.testResultBtn.frame), leftView_Width, kTopLbl_Height * kYScal) style:UITableViewStylePlain];
    self.testResultListView.backgroundColor = [UIColor whiteColor];
    self.testResultListView.delegate = self;
    self.testResultListView.dataSource = self;
    self.testResultListView.showsVerticalScrollIndicator = NO;
    self.testResultListView.separatorColor = [UIColor clearColor];
    self.testResultListView.hidden = YES;
    [self.scrollview addSubview:self.testResultListView];
    
    self.testResultListView.estimatedRowHeight = 0;
    self.testResultListView.estimatedSectionHeaderHeight = 0;
    self.testResultListView.estimatedSectionFooterHeight = 0;
    
    testResultsListViewSize = self.testResultListView.frame.size;
    
    if (@available(iOS 11.0, *)) {
        self.testResultListView.contentInsetAdjustmentBehavior= UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }if (@available(iOS 11.0, *)) {
        self.testResultListView.contentInsetAdjustmentBehavior= UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    CGFloat hrLbl_LeftMargin = CGRectGetMaxX(self.testResultBtn.frame) + kMiddle_Space * kXScal;
    self.hrLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kHRDeviceLbl_Width * kXScal, kHRDeviceLbl_Height * kYScal)];
    self.hrLbl.center = CGPointMake(hrLbl_LeftMargin + kHRDeviceLbl_Width * kXScal / 2.0, self.testResultBtn.center.y);
    self.hrLbl.text = @"心率带";
    self.hrLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.hrLbl.font = [UIFont systemFontOfSize:kHRDeviceLbl_FontSize * kYScal];
    [self.scrollview addSubview:self.hrLbl];
    
    self.hrMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.hrLbl.frame) + kHRDeviceLbl_RightMargin * kXScal, 0, kHRDeviceMenu_Width * kXScal, kHRDeviceMenu_Height * kYScal)];
    self.hrMenu.delegate = self;
    self.hrMenu.center = CGPointMake(CGRectGetMaxX(self.hrLbl.frame) + kHRDeviceLbl_RightMargin * kXScal + kHRDeviceMenu_Width * kXScal / 2.0, self.hrLbl.center.y);
    [self.hrMenu setDropdownHeight:kDropdownHeight * kYScal];
    //    self.hrMenu.defualtStr = @"无";
    [self.hrMenu.mainBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.hrMenu.titles = [self.privateDeviceArr copy];
    self.hrMenu.delegate = self;
    [self.scrollview addSubview:self.hrMenu];
    
    self.changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.changeBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    self.changeBtn.frame = CGRectMake(0, 0, kICCardBtn_Width * kXScal, kICCardBtn_Height * kYScal);
    [self.changeBtn.titleLabel setFont:[UIFont systemFontOfSize:kICCardBtn_FontSize * kYScal]];
    [self.changeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.changeBtn.center = CGPointMake(self.icCardBtn.frame.origin.x + kICCardBtn_Width * kXScal / 2.0, self.hrLbl.center.y);
    [self.changeBtn setTitle:@"更换" forState:UIControlStateNormal];
    [self.changeBtn addTarget:self action:@selector(updateHRDevice) forControlEvents:UIControlEventTouchUpInside];
    self.changeBtn.layer.cornerRadius = kICCardBtn_Height * kYScal/2.0;
    self.changeBtn.layer.masksToBounds = YES;
    [self.scrollview addSubview:self.changeBtn];
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.leftBtn setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    self.leftBtn.frame = CGRectMake(0, self.view.center.y, kLeftBtn_Width * kXScal, kLeftBtn_Width * kXScal);
    [self.leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.leftBtn];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    self.rightBtn.frame = CGRectMake(kWidth - kLeftBtn_Width * kXScal, self.view.center.y, kLeftBtn_Width * kXScal, kLeftBtn_Width * kXScal);
    [self.rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:self.rightBtn];
    
    [self configLatestInfoView];
    [self configOlderInfoView];
    
    CGFloat button_space = (self.scrollview.frame.size.width - 2 * kBottomLongButton_LeftMargin * kXScal - 2 * kBottomLongButton_Width * kXScal - 3 * kBottomShortButton_Width * kXScal)/4;
    self.aerobicReportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.aerobicReportBtn.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    self.aerobicReportBtn.frame = CGRectMake(kBottomLongButton_LeftMargin * kXScal, CGRectGetMaxY(self.leftView.frame) + kBottomButton_TopMargin * kYScal, kBottomLongButton_Width * kXScal, kBottomButton_Height * kYScal);
    [self.aerobicReportBtn setTitle:@"查看有氧历史处方及报告" forState:UIControlStateNormal];
    self.aerobicReportBtn.layer.cornerRadius = kBottomButton_Height * kYScal / 2.0;
    self.aerobicReportBtn.layer.masksToBounds = YES;
    [self.aerobicReportBtn addTarget:self action:@selector(checkAerobicReport:) forControlEvents:UIControlEventTouchUpInside];
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
    [self.createAerobicPrescriptionBtn addTarget:self action:@selector(createAerobicPrescription:) forControlEvents:UIControlEventTouchUpInside];
    [self.createAerobicPrescriptionBtn.titleLabel setFont:[UIFont systemFontOfSize:kBottomButton_FontSize * kYScal]];
    [self.createAerobicPrescriptionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.scrollview addSubview:self.createAerobicPrescriptionBtn];
    
    self.createPowerPrescriptionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.createPowerPrescriptionBtn.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    self.createPowerPrescriptionBtn.frame = CGRectMake(CGRectGetMaxX(self.createAerobicPrescriptionBtn.frame) + button_space, CGRectGetMaxY(self.leftView.frame) + kBottomButton_TopMargin * kYScal, kBottomShortButton_Width * kXScal, kBottomButton_Height * kYScal);
    [self.createPowerPrescriptionBtn setTitle:@"开具力量处方" forState:UIControlStateNormal];
    self.createPowerPrescriptionBtn.layer.cornerRadius = kBottomButton_Height * kYScal / 2.0;
    self.createPowerPrescriptionBtn.layer.masksToBounds = YES;
    [self.createPowerPrescriptionBtn addTarget:self action:@selector(createPowerPrescription:) forControlEvents:UIControlEventTouchUpInside];
    [self.createPowerPrescriptionBtn.titleLabel setFont:[UIFont systemFontOfSize:kBottomButton_FontSize * kYScal]];
    [self.createPowerPrescriptionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.scrollview addSubview:self.createPowerPrescriptionBtn];
    
    self.checkEvaluateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.checkEvaluateBtn.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    self.checkEvaluateBtn.frame = CGRectMake(CGRectGetMaxX(self.createPowerPrescriptionBtn.frame) + button_space, CGRectGetMaxY(self.leftView.frame) + kBottomButton_TopMargin * kYScal, kBottomShortButton_Width * kXScal, kBottomButton_Height * kYScal);
    [self.checkEvaluateBtn setTitle:@"查看体能评估结果" forState:UIControlStateNormal];
    self.checkEvaluateBtn.layer.cornerRadius = kBottomButton_Height * kYScal / 2.0;
    self.checkEvaluateBtn.layer.masksToBounds = YES;
    [self.checkEvaluateBtn addTarget:self action:@selector(checkEvaluateResult:) forControlEvents:UIControlEventTouchUpInside];
    [self.checkEvaluateBtn.titleLabel setFont:[UIFont systemFontOfSize:kBottomButton_FontSize * kYScal]];
    [self.checkEvaluateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.scrollview addSubview:self.checkEvaluateBtn];
}

- (void)configLatestInfoView {
    CGFloat leftView_Width = (self.scrollview.frame.size.width - kMiddle_Space * kXScal)/2.0;
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.testResultListView.frame) + kLeftView_TopMargin * kYScal, leftView_Width, self.scrollview.contentSize.height - CGRectGetMaxY(self.testResultListView.frame) - kLeftView_TopMargin * kYScal - kBottomButton_TopMargin * kYScal - kBottomButton_BottomMargin * kYScal - kBottomButton_Height * kYScal)];
    self.leftView.backgroundColor = [UIColor whiteColor];
    [self.scrollview addSubview:self.leftView];
    
    self.latestLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kUpdateTimeLbl_Width * kXScal, kUpdateTimeLbl_Height * kYScal)];
    self.latestLbl.text = [NSString stringWithFormat:@"更新日期：%@",[self.latestInfoDict valueForKey:@"createTime"]];
    self.latestLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestLbl.font = [UIFont systemFontOfSize:kUpdateTimeLbl_FontSize * kYScal];
    [self.leftView addSubview:self.latestLbl];
    
    self.latestDoctorLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.latestLbl.frame) + kDoctorLbl_TopMargin *kYScal, kUpdateTimeLbl_Width * kXScal, self.latestLbl.frame.size.height)];
    self.latestDoctorLbl.text = [NSString stringWithFormat:@"医       师：%@",self.user.name];
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
    NSString *headUrl = [self.latestInfoDict valueForKey:@"headUrl"];
    [self.latestPatientImg sd_setImageWithURL:[NSURL URLWithString:headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
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
    self.latestNameTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestNameTF.enabled = NO;
    NSString *latestName = [self.latestInfoDict valueForKey:@"name"];
    NSString *olderName = [self.olderInfoDict valueForKey:@"name"];
    if (![latestName isEqualToString:olderName]) {
        self.latestNameTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestNameTF.text = latestName;
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
    self.latestSexTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestSexTF.enabled = NO;
    NSInteger latestSex = [[self.latestInfoDict valueForKey:@"sex"] integerValue];
    NSInteger olderSex = [[self.olderInfoDict valueForKey:@"sex"] integerValue];
    if (latestSex != olderSex) {
        self.latestSexTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    NSString *sex = @"男";
    if (latestSex == 1) {
        sex = @"男";
    } else if (latestSex == 2) {
        sex = @"女";
    }
    self.latestSexTF.text = sex;
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
    self.latestPhoneTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestPhoneTF.enabled = NO;
    NSString *latestMobile = [self.latestInfoDict valueForKey:@"mobile"];
    NSString *olderMobile = [self.olderInfoDict valueForKey:@"mobile"];
    if (![latestMobile isEqualToString:olderMobile]) {
        self.latestPhoneTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestPhoneTF.text = latestMobile;
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
    self.latestBirthTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestBirthTF.enabled = NO;
    NSString *latestBirthday = [self.latestInfoDict valueForKey:@"birthdate"];
    NSString *olderBirthday = [self.olderInfoDict valueForKey:@"birthdate"];
    if (![latestBirthday isEqualToString:olderBirthday]) {
        self.latestBirthTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestBirthTF.text = latestBirthday;
    [self.leftContentView addSubview:self.latestBirthTF];
    
    self.latestHeightLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestBirthLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestHeightLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestHeightLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestHeightLbl.text = @"身       高";
    [self.leftContentView addSubview:self.latestHeightLbl];
    
    self.latestHeightStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.latestHeightStar.frame = CGRectMake(CGRectGetMaxX(self.latestHeightLbl.frame) + kRedStar_LeftMargin * kXScal, self.latestHeightLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.leftContentView addSubview:self.latestHeightStar];
    
    self.latestHeightTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestNameStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.latestHeightTF.center = CGPointMake(CGRectGetMaxX(self.latestPhoneStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.latestHeightLbl.center.y);
    self.latestHeightTF.backgroundColor = [UIColor whiteColor];
    self.latestHeightTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.latestHeightTF.layer.borderWidth = 1;
    self.latestHeightTF.layer.cornerRadius = 2;
    self.latestHeightTF.unitLbl.text = @"cm";
    self.latestHeightTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestHeightTF.enabled = NO;
    CGFloat latestHeight = [[self.latestInfoDict valueForKey:@"height"] floatValue];
    CGFloat olderHeight = [[self.olderInfoDict valueForKey:@"height"] floatValue];
    if (latestHeight != olderHeight) {
        self.latestHeightTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestHeightTF.text = [NSString stringWithFormat:@"%.1f",latestHeight];
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
    self.latestWeightTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestWeightTF.enabled = NO;
    CGFloat latestWidht = [[self.latestInfoDict valueForKey:@"weight"] floatValue];
    CGFloat olderWidht = [[self.olderInfoDict valueForKey:@"weight"] floatValue];
    if (latestWidht != olderWidht) {
        self.latestWeightTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestWeightTF.text = [NSString stringWithFormat:@"%.1f",latestWidht];
    [self.leftContentView addSubview:self.latestWeightTF];
    
    self.latestWaistLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestHeightLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestWaistLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
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
    self.latestWaistTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestWaistTF.enabled = NO;
    CGFloat latestWaistline = [[self.latestInfoDict valueForKey:@"waistline"] floatValue];
    CGFloat olderWaistline = [[self.olderInfoDict valueForKey:@"waistline"] floatValue];
    if (latestWaistline != olderWaistline) {
        self.latestWaistTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestWaistTF.text = [NSString stringWithFormat:@"%.1f",latestWaistline];
    [self.leftContentView addSubview:self.latestWaistTF];
    
    self.latestKFXTLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestWaistTF.frame) + hSpace, self.latestWaistLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestKFXTLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestKFXTLbl.text = @"空腹血糖";//fbg
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
    CGFloat latestFbg = [[self.latestInfoDict valueForKey:@"fbg"] floatValue];
    CGFloat olderFbg = [[self.olderInfoDict valueForKey:@"fbg"] floatValue];
    if (latestFbg !=olderFbg) {
        self.latestKFXTHRTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestKFXTHRTF.text = [NSString stringWithFormat:@"%.1f",latestFbg];
    self.latestKFXTHRTF.unitLbl.text = @"mmlo/L";
    self.latestKFXTHRTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestKFXTHRTF.enabled = NO;
    [self.leftContentView addSubview:self.latestKFXTHRTF];
    
    self.latestQuietHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestKFXTLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestQuietHRLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestQuietHRLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestQuietHRLbl.text = @"安静心率";//restHr
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
    NSInteger latestRestHr = [[self.latestInfoDict valueForKey:@"restHr"] integerValue];
    NSInteger olderRestHr = [[self.olderInfoDict valueForKey:@"restHr"] integerValue];
    if (latestRestHr !=olderRestHr) {
        self.latestQuietHRTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestQuietHRTF.text = [NSString stringWithFormat:@"%d",latestRestHr];
    self.latestQuietHRTF.unitLbl.text = @"bpm";
    self.latestQuietHRTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestQuietHRTF.enabled = NO;
    [self.leftContentView addSubview:self.latestQuietHRTF];
    
    self.latestXLBYLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuietHRTF.frame) + hSpace, self.latestQuietHRLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestXLBYLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestXLBYLbl.text = @"心率变异";//hrv
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
    CGFloat latestHrv = [[self.latestInfoDict valueForKey:@"hrv"] floatValue];
    CGFloat olderHrv = [[self.olderInfoDict valueForKey:@"hrv"] floatValue];
    if (latestHrv !=olderHrv) {
        self.latestXLBYTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestXLBYTF.text = [NSString stringWithFormat:@"%.1f",latestHrv];
    self.latestXLBYTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestXLBYTF.enabled = NO;
    [self.leftContentView addSubview:self.latestXLBYTF];
    
    self.latestSSYLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestXLBYLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestSSYLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestSSYLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestSSYLbl.text = @"收  缩  压";//sdp
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
    NSInteger latestSbp = [[self.latestInfoDict valueForKey:@"sbp"] integerValue];
    NSInteger olderSbp = [[self.olderInfoDict valueForKey:@"sbp"] integerValue];
    if (latestSbp !=olderSbp) {
        self.latestSSYTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestSSYTF.text = [NSString stringWithFormat:@"%ld",(long)latestSbp];
    self.latestSSYTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestSSYTF.enabled = NO;

    [self.leftContentView addSubview:self.latestSSYTF];
    
    self.latestSZYLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestSSYTF.frame) + hSpace, self.latestSSYLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.latestSZYLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestSZYLbl.text = @"舒  张  压";//dbp
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
    NSInteger latestdbp = [[self.latestInfoDict valueForKey:@"dbp"] integerValue];
    NSInteger olderdbp = [[self.olderInfoDict valueForKey:@"dbp"] integerValue];
    if (latestdbp !=olderdbp) {
        self.latestSZYTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestSZYTF.text = [NSString stringWithFormat:@"%ld",(long)latestdbp];
    self.latestSZYTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestSZYTF.enabled = NO;

    [self.leftContentView addSubview:self.latestSZYTF];
    
    self.latestGMDZDBLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestSSYLbl.frame) + kNameLbl_BottomMargin * kYScal, kLongLbl_Width * kXScal, kLongLbl_Height * kYScal)];
    self.latestGMDZDBLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestGMDZDBLbl.text = @"高密度脂蛋白";//hdl
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
    CGFloat latestHdl = [[self.latestInfoDict valueForKey:@"hdl"] floatValue];
    CGFloat olderHdl = [[self.olderInfoDict valueForKey:@"hdl"] floatValue];
    if (latestHdl !=olderHdl) {
        self.latestGMDZDBTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestGMDZDBTF.text = [NSString stringWithFormat:@"%.1f",latestHdl];
    self.latestGMDZDBTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestGMDZDBTF.enabled = NO;
    [self.leftContentView addSubview:self.latestGMDZDBTF];
    
    self.latestSTZLZSLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestGMDZDBLbl.frame) + kNameLbl_BottomMargin * kYScal, kLongLbl_Width * kXScal, kLongLbl_Height * kYScal)];
    self.latestSTZLZSLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.latestSTZLZSLbl.text = @"身体质量指数";//bmi
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
    CGFloat latestBmi = [[self.latestInfoDict valueForKey:@"bmi"] floatValue];
    CGFloat olderBmi = [[self.olderInfoDict valueForKey:@"bmi"] floatValue];
    if (latestBmi !=olderBmi) {
        self.latestSTZLZSTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestSTZLZSTF.text = [NSString stringWithFormat:@"%.1f",latestBmi];
    self.latestSTZLZSTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestSTZLZSTF.enabled = NO;
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
    self.latestMaxAlertTF.unitLbl.text = @"bpm";
    NSInteger latestMaxAlarmHr = [[self.latestInfoDict valueForKey:@"maxAlarmHr"] integerValue];
    NSInteger olderMaxAlarmHr = [[self.olderInfoDict valueForKey:@"maxAlarmHr"] integerValue];
    if (latestMaxAlarmHr != olderMaxAlarmHr) {
        self.latestMaxAlertTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    }
    self.latestMaxAlertTF.text = [NSString stringWithFormat:@"%ld",(long)latestMaxAlarmHr];
    self.latestMaxAlertTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.latestMaxAlertTF.enabled = NO;
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
    NSInteger sportFrequency = [[self.latestInfoDict valueForKey:@"sportFrequency"] integerValue];
    if (sportFrequency == 2) {
        self.latestAnswer1NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestAnswer1NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestAnswer1NoImg.frame = CGRectMake(self.latestQuestionLbl1.frame.origin.x + kRadioBtn_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestionLbl1.frame) + kRadioBtn_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestAnswer1NoImg];
    
    self.latestAnswer1NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestAnswer1NoImg.frame) + kRadioBtn_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestionLbl1.frame) + kAnswerLbl_TopMargin * kYScal, kAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestAnswer1NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestAnswer1NoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestAnswer1NoLbl.numberOfLines = 0;
    self.latestAnswer1NoLbl.text = @"一天做了不少运动或者非常多的运动（选择这个选项，如果每周您做了多于150分钟的中等强度的运动或者每周做的多于75分钟的高强度运动）";
    CGSize anser1NoTextSize = [self.latestAnswer1NoLbl sizeThatFits:CGSizeMake(kAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.latestAnswer1NoLbl.frame = CGRectMake(CGRectGetMaxX(self.latestAnswer1NoImg.frame) + kRadioBtn_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestionLbl1.frame) + kAnswerLbl_TopMargin * kYScal, anser1NoTextSize.width, anser1NoTextSize.height);
    [self.leftContentView addSubview:self.latestAnswer1NoLbl];
    CGFloat latestAnsweriNoImg_centerX = self.latestQuestionLbl1.frame.origin.x + kRadioBtn_LeftMargin * kXScal + kRadioBtn_Width * kXScal/2.0;
    self.latestAnswer1NoImg.center = CGPointMake(latestAnsweriNoImg_centerX, self.latestAnswer1NoLbl.center.y);
    
    if (sportFrequency == 1) {
        self.latestAnswer1YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestAnswer1YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
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
    self.latestAnswer1YesImg.center = CGPointMake(latestAnsweriNoImg_centerX, self.latestAnswer1YesLbl.center.y);
    
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
    self.latestHbpLbl = [[UILabel alloc] initWithFrame:CGRectMake(kSecondeAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestionLbl2.frame) + kSecondAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Width * kXScal,kAnswerLbl_FontSize * kYScal)];
    self.latestHbpLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHbpLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHbpLbl.text = @"高血压";
    [self.leftContentView addSubview:self.latestHbpLbl];
    
    NSInteger hasHbp = [[self.latestInfoDict valueForKey:@"hasHbp"] integerValue];
    if (hasHbp == 1) {
        self.latestHbpYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestHbpYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestHbpYesImg.frame = CGRectMake(CGRectGetMaxX(self.latestHbpLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat latestHbpYesImg_centerX = CGRectGetMaxX(self.latestHbpLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal / 2.0;
    self.latestHbpYesImg.center = CGPointMake(latestHbpYesImg_centerX, self.latestHbpLbl.center.y);
    [self.leftContentView addSubview:self.latestHbpYesImg];
    
    self.latestHbpYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHbpYesImg.frame) + kRadioBtn_RightMargin * kXScal, self.latestHbpLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHbpYesLbl.text = @"有";
    self.latestHbpYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHbpYesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestHbpYesLbl];
    
    if (hasHbp == 2) {
        self.latestHbpNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestHbpNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestHbpNoImg.frame = CGRectMake(CGRectGetMaxX(self.latestHbpYesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.latestHbpYesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestHbpNoImg];
    
    self.latestHbpNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHbpNoImg.frame) + kRadioBtn_RightMargin * kXScal, self.latestHbpLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHbpNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHbpNoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHbpNoLbl.text = @"无";
    [self.leftContentView addSubview:self.latestHbpNoLbl];
    
    //高血糖
    self.latestHbsLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestHbpLbl.frame.origin.x, CGRectGetMaxY(self.latestHbpLbl.frame) + kSecondAnserLbl_BottomMargin * kYScal, kSecondAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHbsLbl.text = @"高血糖";
    self.latestHbsLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHbsLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestHbsLbl];
    NSInteger hasHbs = [[self.latestInfoDict valueForKey:@"hasHbs"] integerValue];
    if (hasHbs == 1) {
        self.latestHbsYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestHbsYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestHbsYesImg.frame = CGRectMake(CGRectGetMaxX(self.latestHbsLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat latestHbsYesImg_CenterX = CGRectGetMaxX(self.latestHbsLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal/2.0;
    self.latestHbsYesImg.center = CGPointMake(latestHbsYesImg_CenterX, self.latestHbsLbl.center.y);
    [self.leftContentView addSubview:self.latestHbsYesImg];
    
    self.latestHbsYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHbsYesImg.frame) + kRadioBtn_RightMargin * kXScal, self.latestHbsLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHbsYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHbsYesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHbsYesLbl.text = @"有";
    [self.leftContentView addSubview:self.latestHbsYesLbl];
    if (hasHbs == 2) {
        self.latestHbsNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestHbsNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestHbsNoImg.frame = CGRectMake(CGRectGetMaxX(self.latestHbsYesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.latestHbsYesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestHbsNoImg];
    
    self.latestHbsNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHbsNoImg.frame) + kRadioBtn_RightMargin * kXScal, self.latestHbsYesLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHbsNoLbl.text = @"无";
    self.latestHbsNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHbsNoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestHbsNoLbl];
    
    //高血脂
    self.latestHbfLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestHbpLbl.frame.origin.x, CGRectGetMaxY(self.latestHbsLbl.frame) + kSecondAnserLbl_BottomMargin * kYScal, kSecondAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHbfLbl.text = @"高血脂";
    self.latestHbfLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHbfLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestHbfLbl];
    NSInteger hasHbf = [[self.latestInfoDict valueForKey:@"hasHbf"] integerValue];
    if (hasHbf == 1) {
        self.latestHbfYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestHbfYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestHbfYesImg.frame = CGRectMake(CGRectGetMaxX(self.latestHbfLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat latestHbfYesImg_CenterX = CGRectGetMaxX(self.latestHbfLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal/2.0;
    self.latestHbfYesImg.center = CGPointMake(latestHbfYesImg_CenterX, self.latestHbfLbl.center.y);
    [self.leftContentView addSubview:self.latestHbfYesImg];
    
    self.latestHbfYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHbfYesImg.frame) + kRadioBtn_RightMargin * kXScal, self.latestHbfLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHbfYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHbfYesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestHbfYesLbl.text = @"有";
    [self.leftContentView addSubview:self.latestHbfYesLbl];
    if (hasHbf == 2) {
        self.latestHbfNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestHbfNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestHbfNoImg.frame = CGRectMake(CGRectGetMaxX(self.latestHbfYesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.latestHbfYesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestHbfNoImg];
    
    self.latestHbfNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestHbfNoImg.frame) + kRadioBtn_RightMargin * kXScal, self.latestHbfYesLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHbfNoLbl.text = @"无";
    self.latestHbfNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHbfNoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestHbfNoLbl];
    
    //吸烟
    self.latestHighSmokeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestHbfLbl.frame.origin.x, CGRectGetMaxY(self.latestHbfLbl.frame) + kSecondAnserLbl_BottomMargin * kYScal, kSecondAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestHighSmokeLbl.text = @"吸   烟";
    self.latestHighSmokeLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestHighSmokeLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestHighSmokeLbl];
    
    NSInteger hasSmoking = [[self.latestInfoDict valueForKey:@"hasSmoking"] integerValue];
    if (hasSmoking == 1) {
        self.latestSmokeYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestSmokeYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestSmokeYesImg.frame = CGRectMake(CGRectGetMaxX(self.latestHighSmokeLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat latestSmokefYesImg_CenterX = CGRectGetMaxX(self.latestHighSmokeLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal/2.0;
    self.latestSmokeYesImg.center = CGPointMake(latestSmokefYesImg_CenterX, self.latestHighSmokeLbl.center.y);
    [self.leftContentView addSubview:self.latestSmokeYesImg];
    
    self.latestSmokeYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestSmokeYesImg.frame) + kRadioBtn_RightMargin * kXScal, self.latestHighSmokeLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestSmokeYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestSmokeYesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestSmokeYesLbl.text = @"有";
    [self.leftContentView addSubview:self.latestSmokeYesLbl];
    if (hasSmoking == 2) {
        self.latestSmokeNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestSmokeNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestSmokeNoImg.frame = CGRectMake(CGRectGetMaxX(self.latestSmokeYesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.latestSmokeYesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestSmokeNoImg];
    
    self.latestSmokeNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestSmokeNoImg.frame) + kRadioBtn_RightMargin * kXScal, self.latestSmokeYesLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestSmokeNoLbl.text = @"无";
    self.latestSmokeNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestSmokeNoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestSmokeNoLbl];
    
    //问题三
    self.latestQuestionImg3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestHighSmokeLbl.frame) + kRadioBtn_TopMargin * kYScal,kQuestionLeftImg_Width * kXScal , kQuestionLeftImg_Height * kYScal)];
    self.latestQuestionImg3.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.leftContentView addSubview:self.latestQuestionImg3];
    
    self.latestQuestionLbl3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuestionImg3.frame) + kQuestionLbl_LeftMargin * kXScal, 0 ,self.leftView.frame.size.width - CGRectGetMaxX(self.latestQuestionImg3.frame) - kQuestionLbl_LeftMargin * kXScal, kNameLbl_Height * kYScal)];
    self.latestQuestionLbl3.text = @"您家里有没有人患糖尿病？";
    self.latestQuestionLbl3.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    CGFloat question3_CenterX = CGRectGetMaxX(self.latestQuestionImg3.frame) + kQuestionLbl_LeftMargin * kXScal + (self.leftView.frame.size.width - CGRectGetMaxX(self.latestQuestionImg3.frame) - kQuestionLbl_LeftMargin * kXScal)/2.0;
    self.latestQuestionLbl3.center = CGPointMake(question3_CenterX, self.latestQuestionImg3.center.y);
    self.latestQuestionLbl3.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.leftContentView addSubview:self.latestQuestionLbl3];
    NSInteger familyDiabetes = [[self.latestInfoDict valueForKey:@"familyDiabetes"] integerValue];
    if (familyDiabetes == 1) {
        self.latestQuestion3YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestQuestion3YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestQuestion3YesImg.frame = CGRectMake(kThirdAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestionLbl3.frame) + kSecondQustionImg_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestQuestion3YesImg];
    
    self.latestQuestion3YesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuestion3YesImg.frame) + kRadioBtn_LeftMargin * kXScal, 0, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    CGFloat latestQuestion3YesLbl_CenterX = CGRectGetMaxX(self.latestQuestion3YesImg.frame) + kRadioBtn_LeftMargin * kXScal + kSecondAnswerLbl_Yes_Width /2.0;
    self.latestQuestion3YesLbl.center = CGPointMake(latestQuestion3YesLbl_CenterX, self.latestQuestion3YesImg.center.y);
    self.latestQuestion3YesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion3YesLbl.text = @"有";
    self.latestQuestion3YesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion3YesLbl];
    if (familyDiabetes == 2) {
        self.latestQuestion3NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestQuestion3NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestQuestion3NoImg.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion3YesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.latestQuestion3YesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestQuestion3NoImg];
    
    self.latestQuestion3NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuestion3NoImg.frame) + kRadioBtn_LeftMargin, self.latestQuestion3YesLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion3NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion3NoLbl.text = @"无";
    self.latestQuestion3NoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion3NoLbl];
    
    //问题四
    self.latestQuestionImg4 = [[UIImageView alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestQuestion3YesImg.frame) + kSecondQustionImg_TopMargin * kYScal,kQuestionLeftImg_Width * kXScal , kQuestionLeftImg_Height * kYScal)];
    self.latestQuestionImg4.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.leftContentView addSubview:self.latestQuestionImg4];
    
    self.latestQuestionLbl4 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuestionImg4.frame) + kQuestionLbl_LeftMargin * kXScal, 0 ,self.leftView.frame.size.width - CGRectGetMaxX(self.latestQuestionImg4.frame) - kQuestionLbl_LeftMargin * kXScal, kNameLbl_Height * kYScal)];
    self.latestQuestionLbl4.text = @"您家里有没有人出现猝死的情况？";
    self.latestQuestionLbl4.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    CGFloat question4_CenterX = CGRectGetMaxX(self.latestQuestionImg4.frame) + kQuestionLbl_LeftMargin * kXScal + (self.leftView.frame.size.width - CGRectGetMaxX(self.latestQuestionImg4.frame) - kQuestionLbl_LeftMargin * kXScal)/2.0;
    self.latestQuestionLbl4.center = CGPointMake(question4_CenterX, self.latestQuestionImg4.center.y);
    self.latestQuestionLbl4.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.leftContentView addSubview:self.latestQuestionLbl4];
    NSInteger familySuddenDeath = [[self.latestInfoDict valueForKey:@"familySuddenDeath"] integerValue];
    if (familySuddenDeath == 1) {
        self.latestQuestion4YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestQuestion4YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestQuestion4YesImg.frame = CGRectMake(kThirdAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestionLbl4.frame) + kSecondQustionImg_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestQuestion4YesImg];
    
    self.latestQuestion4YesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuestion4YesImg.frame) + kRadioBtn_LeftMargin * kXScal, 0, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    CGFloat latestQuestion4YesLbl_CenterX = CGRectGetMaxX(self.latestQuestion4YesImg.frame) + kRadioBtn_LeftMargin * kXScal + kSecondAnswerLbl_Yes_Width /2.0;
    self.latestQuestion4YesLbl.center = CGPointMake(latestQuestion4YesLbl_CenterX, self.latestQuestion4YesImg.center.y);
    self.latestQuestion4YesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion4YesLbl.text = @"有";
    self.latestQuestion4YesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion4YesLbl];
    
    if (familySuddenDeath == 2) {
        self.latestQuestion4NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestQuestion4NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestQuestion4NoImg.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion4YesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.latestQuestion4YesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestQuestion4NoImg];
    
    self.latestQuestion4NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuestion4NoImg.frame) + kRadioBtn_LeftMargin, self.latestQuestion4YesLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion4NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion4NoLbl.text = @"无";
    self.latestQuestion4NoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion4NoLbl];
    
    //问题五
    self.latestQuestionImg5 = [[UIImageView alloc] initWithFrame:CGRectMake(self.latestPatientImg.frame.origin.x, CGRectGetMaxY(self.latestQuestion4YesImg.frame) + kRadioBtn_TopMargin * kYScal,kQuestionLeftImg_Width * kXScal , kQuestionLeftImg_Height * kYScal)];
    self.latestQuestionImg5.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.leftContentView addSubview:self.latestQuestionImg5];
    
    self.latestQuestionLbl5 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuestionImg5.frame) + kQuestionLbl_LeftMargin * kXScal, 0 ,self.leftView.frame.size.width - CGRectGetMaxX(self.latestQuestionImg5.frame) - kQuestionLbl_LeftMargin * kXScal, kNameLbl_Height * kYScal)];
    self.latestQuestionLbl5.text = @"最近三个月有无以下状况出现？";
    self.latestQuestionLbl5.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    CGFloat question5_CenterX = CGRectGetMaxX(self.latestQuestionImg5.frame) + kQuestionLbl_LeftMargin * kXScal + (self.leftView.frame.size.width - CGRectGetMaxX(self.latestQuestionImg3.frame) - kQuestionLbl_LeftMargin * kXScal)/2.0;
    self.latestQuestionLbl5.center = CGPointMake(question5_CenterX, self.latestQuestionImg5.center.y);
    self.latestQuestionLbl5.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.leftContentView addSubview:self.latestQuestionLbl5];
    NSInteger threeMonthStatus = [[self.latestInfoDict valueForKey:@"threeMonthStatus"] integerValue];
    if (threeMonthStatus == 1) {
        self.latestQuestion5YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestQuestion5YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestQuestion5YesImg.frame = CGRectMake(kThirdAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestionLbl5.frame) + kSecondQustionImg_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestQuestion5YesImg];
    
    self.latestQuestion5YesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuestion5YesImg.frame) + kRadioBtn_LeftMargin * kXScal, 0, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    CGFloat latestQuestion5YesLbl_CenterX = CGRectGetMaxX(self.latestQuestion5YesImg.frame) + kRadioBtn_LeftMargin * kXScal + kSecondAnswerLbl_Yes_Width /2.0;
    self.latestQuestion5YesLbl.center = CGPointMake(latestQuestion5YesLbl_CenterX, self.latestQuestion5YesImg.center.y);
    self.latestQuestion5YesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5YesLbl.text = @"有";
    self.latestQuestion5YesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion5YesLbl];
    if (threeMonthStatus == 2) {
        self.latestQuestion5NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.latestQuestion5NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.latestQuestion5NoImg.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5YesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.latestQuestion5YesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.leftContentView addSubview:self.latestQuestion5NoImg];
    
    self.latestQuestion5NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuestion5NoImg.frame) + kRadioBtn_LeftMargin, self.latestQuestion5YesLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5NoLbl.text = @"无";
    self.latestQuestion5NoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion5NoLbl];
    
    self.latestQuestion5Lbl11 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5YesLbl.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl11.text = @"1.";
    self.latestQuestion5Lbl11.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl11.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion5Lbl11];
    
    self.latestQuestion5Lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5YesLbl.frame) + kFifthAnswerLbl_TopMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl1.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestQuestion5Lbl1.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl1.numberOfLines = 0;
    self.latestQuestion5Lbl1.text = @"可能是由于局部缺血造成的疼痛（感觉闷）或不适，在胸部、颈部、下颌、手臂或其他区域；";
    CGSize latestQuestion5Lbl1Size = [self.latestQuestion5Lbl1 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.latestQuestion5Lbl1.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5YesLbl.frame) + kFifthAnswerLbl_TopMargin * kYScal, latestQuestion5Lbl1Size.width, latestQuestion5Lbl1Size.height);
    [self.leftContentView addSubview:self.latestQuestion5Lbl1];
    self.latestQuestion5Lbl11.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl1.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.latestQuestion5Lbl22 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl1.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl22.text = @"2.";
    self.latestQuestion5Lbl22.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl22.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion5Lbl22];
    
    self.latestQuestion5Lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl1.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl2.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestQuestion5Lbl2.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl2.text = @"呼吸急促，在休息或轻度用力时呼吸困难；";
    self.latestQuestion5Lbl2.numberOfLines = 0;
    CGSize latestQuestion5Lbl2Size = [self.latestQuestion5Lbl2 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.latestQuestion5Lbl2.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl1.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl2Size.width, latestQuestion5Lbl2Size.height);
    [self.leftContentView addSubview:self.latestQuestion5Lbl2];
    self.latestQuestion5Lbl22.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl2.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.latestQuestion5Lbl33 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl2.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl33.text = @"3.";
    self.latestQuestion5Lbl33.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl33.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion5Lbl33];
    
    self.latestQuestion5Lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl2.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl3.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestQuestion5Lbl3.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl3.text = @"端坐呼吸困难（坐着都感觉呼吸困难）；";
    self.latestQuestion5Lbl3.numberOfLines = 0;
    CGSize latestQuestion5Lbl3Size = [self.latestQuestion5Lbl3 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.latestQuestion5Lbl3.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl2.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl3Size.width, latestQuestion5Lbl3Size.height);
    [self.leftContentView addSubview:self.latestQuestion5Lbl3];
    self.latestQuestion5Lbl33.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl3.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.latestQuestion5Lbl44 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl3.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl44.text = @"4.";
    self.latestQuestion5Lbl44.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl44.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion5Lbl44];
    
    self.latestQuestion5Lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl3.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl4.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestQuestion5Lbl4.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl4.text = @"踝部水肿；";
    self.latestQuestion5Lbl4.numberOfLines = 0;
    CGSize latestQuestion5Lbl4Size = [self.latestQuestion5Lbl4 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.latestQuestion5Lbl4.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl3.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl4Size.width, latestQuestion5Lbl4Size.height);
    [self.leftContentView addSubview:self.latestQuestion5Lbl4];
    self.latestQuestion5Lbl44.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl4.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.latestQuestion5Lbl55 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl4.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl55.text = @"5.";
    self.latestQuestion5Lbl55.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl55.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion5Lbl55];
    
    self.latestQuestion5Lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl4.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl5.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestQuestion5Lbl5.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl5.text = @"心悸或心动过速；";
    self.latestQuestion5Lbl5.numberOfLines = 0;
    CGSize latestQuestion5Lbl5Size = [self.latestQuestion5Lbl5 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.latestQuestion5Lbl5.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl4.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl5Size.width, latestQuestion5Lbl5Size.height);
    [self.leftContentView addSubview:self.latestQuestion5Lbl5];
    self.latestQuestion5Lbl55.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl5.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.latestQuestion5Lbl66 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl5.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl66.text = @"6.";
    self.latestQuestion5Lbl66.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl66.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion5Lbl66];
    
    self.latestQuestion5Lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl5.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl6.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestQuestion5Lbl6.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl6.text = @"间歇性跛行（有疼痛感，或与供血不足有关的下肢痉挛）；";
    self.latestQuestion5Lbl6.numberOfLines = 0;
    CGSize latestQuestion5Lbl6Size = [self.latestQuestion5Lbl6 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.latestQuestion5Lbl6.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl5.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl6Size.width, latestQuestion5Lbl6Size.height);
    [self.leftContentView addSubview:self.latestQuestion5Lbl6];
    self.latestQuestion5Lbl66.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl6.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.latestQuestion5Lbl77 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl6.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl77.text = @"7.";
    self.latestQuestion5Lbl77.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl77.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion5Lbl77];
    
    self.latestQuestion5Lbl7 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl6.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl7.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestQuestion5Lbl7.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl7.text = @"已知的心脏杂音；";
    self.latestQuestion5Lbl7.numberOfLines = 0;
    CGSize latestQuestion5Lbl7Size = [self.latestQuestion5Lbl7 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.latestQuestion5Lbl7.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl6.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl7Size.width, latestQuestion5Lbl7Size.height);
    [self.leftContentView addSubview:self.latestQuestion5Lbl7];
    self.latestQuestion5Lbl77.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl7.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.latestQuestion5Lbl88 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl7.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl88.text = @"8.";
    self.latestQuestion5Lbl88.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl88.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion5Lbl88];
    
    self.latestQuestion5Lbl8 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl7.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl8.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestQuestion5Lbl8.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl8.text = @"异常疲劳或日常活动呼吸困难；";
    self.latestQuestion5Lbl8.numberOfLines = 0;
    CGSize latestQuestion5Lbl8Size = [self.latestQuestion5Lbl8 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.latestQuestion5Lbl8.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl7.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl8Size.width, latestQuestion5Lbl8Size.height);
    [self.leftContentView addSubview:self.latestQuestion5Lbl8];
    self.latestQuestion5Lbl88.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl8.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.latestQuestion5Lbl99 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl8.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl99.text = @"9.";
    self.latestQuestion5Lbl99.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl99.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.leftContentView addSubview:self.latestQuestion5Lbl99];
    
    self.latestQuestion5Lbl9 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl8.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.latestQuestion5Lbl9.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.latestQuestion5Lbl9.textColor = [UIColor colorWithHexString:@"#444444"];
    self.latestQuestion5Lbl9.text = @"由大脑供血不足引起的头晕或晕厥。";
    self.latestQuestion5Lbl9.numberOfLines = 0;
    CGSize latestQuestion5Lbl9Size = [self.latestQuestion5Lbl9 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.latestQuestion5Lbl9.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl8.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl9Size.width, latestQuestion5Lbl9Size.height);
    [self.leftContentView addSubview:self.latestQuestion5Lbl9];
    self.latestQuestion5Lbl99.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl9.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.latestSummaryView = [[UIView alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl11.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl9.frame) + kSummaryView_TopMargin * kYScal, self.leftContentView.frame.size.width - 2 * self.latestQuestion5Lbl11.frame.origin.x, self.leftContentView.frame.size.height - CGRectGetMaxY(self.latestQuestion5Lbl9.frame) - 2 * kSummaryView_TopMargin * kYScal)];
    self.latestSummaryView.backgroundColor = [UIColor colorWithHexString:@"#fefefe"];
    self.latestSummaryView.layer.cornerRadius = 4;
    self.latestSummaryView.layer.masksToBounds = YES;
    [self.leftContentView addSubview:self.latestSummaryView];
    
    self.latestRiskLevelLbl = [[UILabel alloc] initWithFrame:CGRectMake(kSummaryView_LeftMargin * kXScal, kSummaryView_Lbl_TopMargin * kYScal, kSummaryView_Lbl_Width * kXScal, kSummaryView_Lbl_Height * kYScal)];
    NSInteger riskLevel = [[self.latestInfoDict valueForKey:@"riskLevel"] integerValue];
    NSDictionary *riskDict = [self getHrRangeAndRPERange:riskLevel];
    self.latestRiskLevelLbl.text = [NSString stringWithFormat:@"风险等级：%@",[riskDict valueForKey:@"riskLevel"]];
    self.latestRiskLevelLbl.font = [UIFont systemFontOfSize:kSummaryView_Lbl_FontSize * kYScal];
    self.latestRiskLevelLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    [self.latestSummaryView addSubview:self.latestRiskLevelLbl];
    
    self.latestHRZoneLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.latestSummaryView.frame.size.width - kSummaryView_Lbl_Width * kXScal - kSummaryView_HRZoneLbl_RightMargin * kXScal, self.latestRiskLevelLbl.frame.origin.y, kSummaryView_Lbl_Width * kXScal, kSummaryView_Lbl_Height * kYScal)];
    self.latestHRZoneLbl.text = [NSString stringWithFormat:@"心率区间：%@",[riskDict valueForKey:@"hrRange"]];
    self.latestHRZoneLbl.font = [UIFont systemFontOfSize:kSummaryView_Lbl_FontSize * kYScal];
    self.latestHRZoneLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    [self.latestSummaryView addSubview:self.latestHRZoneLbl];
    
    self.latestRPERangeLbll = [[UILabel alloc] initWithFrame:CGRectMake(self.latestRiskLevelLbl.frame.origin.x, self.latestSummaryView.frame.size.height - kSummaryView_Lbl_Height * kYScal - kSummaryView_Lbl_TopMargin * kYScal, kSummaryView_Lbl_Width * kXScal, kSummaryView_Lbl_Height * kYScal)];
    self.latestRPERangeLbll.textColor = [UIColor colorWithHexString:@"#333333"];
    self.latestRPERangeLbll.text = [NSString stringWithFormat:@"RPE范围：%@",[riskDict valueForKey:@"rpeRange"]];
    self.latestRPERangeLbll.font = [UIFont systemFontOfSize:kSummaryView_Lbl_FontSize * kYScal];
    [self.latestSummaryView addSubview:self.latestRPERangeLbll];
}

- (NSDictionary *)getHrRangeAndRPERange:(NSInteger)riskLevel {
    NSString *riskLevelStr = @"低";
    NSString *hrRangeStr = @"80%-100%";
    NSString *rpeRangeStr = @"6.5-7";
    if (riskLevel == 1) {
        riskLevelStr = @"低";
        hrRangeStr = @"80%-100%";
        rpeRangeStr = @"6.5-7";
    } else if (riskLevel == 2) {
        riskLevelStr = @"中";
        hrRangeStr = @"60%-80%";
        rpeRangeStr = @"5-6";
    } else if (riskLevel == 3) {
        riskLevelStr = @"高";
        hrRangeStr = @"0%-60%";
        rpeRangeStr = @"3-4.5";
    }
    return @{@"hrRange":hrRangeStr,@"rpeRange":rpeRangeStr,@"riskLevel":riskLevelStr};
}

- (void)configOlderInfoView {
    CGFloat rightView_Width = (self.scrollview.frame.size.width - kMiddle_Space * kXScal)/2.0;
    self.rightView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.leftView.frame) + kMiddle_Space * kXScal, CGRectGetMaxY(self.testResultListView.frame) + kLeftView_TopMargin * kYScal, rightView_Width, self.scrollview.contentSize.height - CGRectGetMaxY(self.testResultListView.frame) - kLeftView_TopMargin * kYScal - kBottomButton_TopMargin * kYScal - kBottomButton_BottomMargin * kYScal - kBottomButton_Height * kYScal)];
    self.rightView.backgroundColor = [UIColor whiteColor];
    [self.scrollview addSubview:self.rightView];
    
    self.oldTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kUpdateTimeLbl_Width * kXScal, kUpdateTimeLbl_Height * kYScal)];
    self.oldTimeLbl.text = [NSString stringWithFormat:@"更新日期：%@",[self.olderInfoDict valueForKey:@"createTime"]];
    self.oldTimeLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.oldTimeLbl.font = [UIFont systemFontOfSize:kUpdateTimeLbl_FontSize * kYScal];
    [self.rightView addSubview:self.oldTimeLbl];
    
    self.oldDoctorLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, self.latestDoctorLbl.frame.origin.y, kUpdateTimeLbl_Width * kXScal, self.latestLbl.frame.size.height)];
    self.oldDoctorLbl.text = [NSString stringWithFormat:@"医       师：%@",self.user.name];
    self.oldDoctorLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.oldDoctorLbl.font = [UIFont systemFontOfSize:kUpdateTimeLbl_FontSize * kYScal];
    [self.rightView addSubview:self.oldDoctorLbl];
    
    self.rightContentView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.latestDoctorLbl.frame) + kContentView_TopMargin * kYScal, rightView_Width, self.leftView.frame.size.height - CGRectGetMaxY(self.latestDoctorLbl.frame) - kContentView_TopMargin * kYScal)];
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
    NSString *headUrl = [self.olderInfoDict valueForKey:@"headUrl"];
    [self.olderPatientImg sd_setImageWithURL:[NSURL URLWithString:headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
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
    self.olderNameTF.text = [self.olderInfoDict valueForKey:@"name"];
    self.olderNameTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderNameTF.enabled = NO;
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
    self.olderSexTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderSexTF.enabled = NO;
    NSInteger olderSex = [[self.olderInfoDict valueForKey:@"sex"] integerValue];
    NSString *sex = @"男";
    if (olderSex == 1) {
        sex = @"男";
    } else if (olderSex == 2) {
        sex = @"女";
    }
    self.olderSexTF.text = sex;
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
    self.olderPhoneTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderPhoneTF.enabled = NO;
    self.olderPhoneTF.text = [self.olderInfoDict valueForKey:@"mobile"];
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
    self.olderBirthTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderBirthTF.enabled = NO;
    self.olderBirthTF.text = [self.olderInfoDict valueForKey:@"birthdate"];
    [self.rightContentView addSubview:self.olderBirthTF];
    
    self.olderHeightLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderBirthLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.olderHeightLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderHeightLbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.olderHeightLbl.text = @"身       高";
    [self.rightContentView addSubview:self.olderHeightLbl];
    
    self.olderHeightStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.olderHeightStar.frame = CGRectMake(CGRectGetMaxX(self.olderHeightLbl.frame) + kRedStar_LeftMargin * kXScal, self.olderHeightLbl.frame.origin.y + 2, kRedStar_Width * kYScal, kRedStar_Width * kYScal);
    [self.rightContentView addSubview:self.olderHeightStar];
    
    self.olderHeightTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderNameStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.olderHeightTF.center = CGPointMake(CGRectGetMaxX(self.olderPhoneStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal / 2.0, self.olderHeightLbl.center.y);
    self.olderHeightTF.backgroundColor = [UIColor whiteColor];
    self.olderHeightTF.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.olderHeightTF.layer.borderWidth = 1;
    self.olderHeightTF.layer.cornerRadius = 2;
    self.olderHeightTF.unitLbl.text = @"cm";
    self.olderHeightTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderHeightTF.enabled = NO;
    CGFloat height = [[self.olderInfoDict valueForKey:@"height"] floatValue];
    self.olderHeightTF.text = [NSString stringWithFormat:@"%.1f",height];
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
    CGFloat weight = [[self.olderInfoDict valueForKey:@"weight"] floatValue];
    self.olderWeightTF.text = [NSString stringWithFormat:@"%.1f",weight];
    self.olderWeightTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderWeightTF.enabled = NO;
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
    self.olderWaistTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderWaistTF.enabled = NO;
    CGFloat waistline = [[self.olderInfoDict valueForKey:@"waistline"] floatValue];
    self.olderWaistTF.text = [NSString stringWithFormat:@"%.1f",waistline];
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
    self.olderKFXTHRTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderKFXTHRTF.enabled = NO;
    CGFloat fbg = [[self.olderInfoDict valueForKey:@"fbg"] floatValue];
    self.olderKFXTHRTF.text = [NSString stringWithFormat:@"%.1f",fbg];
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
    self.olderQuietHRTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderQuietHRTF.text = [NSString stringWithFormat:@"%d",[[self.olderInfoDict valueForKey:@"restHr"] integerValue]];
    self.olderQuietHRTF.enabled = NO;
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
    self.olderXLBYTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderXLBYTF.enabled = NO;
    CGFloat hrv = [[self.olderInfoDict valueForKey:@"hrv"] floatValue];
    self.olderXLBYTF.text = [NSString stringWithFormat:@"%.1f",hrv];
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
    self.olderSSYTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderSSYTF.enabled = NO;
    NSInteger sbp = [[self.olderInfoDict valueForKey:@"sbp"] integerValue];
    self.olderSSYTF.text = [NSString stringWithFormat:@"%d",sbp];
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
    self.olderSZYTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderSZYTF.enabled = NO;
    NSInteger dbp = [[self.olderInfoDict valueForKey:@"dbp"] integerValue];
    self.olderSZYTF.text = [NSString stringWithFormat:@"%d",dbp];
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
    self.olderGMDZDBTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderGMDZDBTF.enabled = NO;
    CGFloat hdl = [[self.olderInfoDict valueForKey:@"hdl"] floatValue];
    self.olderGMDZDBTF.text = [NSString stringWithFormat:@"%.1f",hdl];
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
    self.olderSTZLZSTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderSTZLZSTF.enabled = NO;
    CGFloat bmi = [[self.olderInfoDict valueForKey:@"bmi"] floatValue];
    self.olderSTZLZSTF.text = [NSString stringWithFormat:@"%.1f",bmi];
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
    self.olderMaxAlertTF.unitLbl.text = @"bpm";
    NSInteger olderMaxAlarmHr = [[self.olderInfoDict valueForKey:@"maxAlarmHr"] integerValue];
    self.olderMaxAlertTF.text = [NSString stringWithFormat:@"%d",olderMaxAlarmHr];
    self.olderMaxAlertTF.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.olderMaxAlertTF.enabled = NO;
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
    NSInteger sportFrequency = [[self.olderInfoDict valueForKey:@"sportFrequency"] integerValue];
    if (sportFrequency == 2) {
        self.olderAnswer1NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderAnswer1NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderAnswer1NoImg.frame = CGRectMake(self.olderQuestionLbl1.frame.origin.x + kRadioBtn_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestionLbl1.frame) + kRadioBtn_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderAnswer1NoImg];
    
    self.olderAnswer1NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderAnswer1NoImg.frame) + kRadioBtn_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestionLbl1.frame) + kAnswerLbl_TopMargin * kYScal, kAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderAnswer1NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderAnswer1NoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderAnswer1NoLbl.numberOfLines = 0;
    self.olderAnswer1NoLbl.text = @"一天做了不少运动或者非常多的运动（选择这个选项，如果每周您做了多于150分钟的中等强度的运动或者每周做的多于75分钟的高强度运动）";
    CGSize anser1NoTextSize = [self.olderAnswer1NoLbl sizeThatFits:CGSizeMake(kAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.olderAnswer1NoLbl.frame = CGRectMake(CGRectGetMaxX(self.olderAnswer1NoImg.frame) + kRadioBtn_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestionLbl1.frame) + kAnswerLbl_TopMargin * kYScal, anser1NoTextSize.width, anser1NoTextSize.height);
    [self.rightContentView addSubview:self.olderAnswer1NoLbl];
    CGFloat olderAnsweriNoImg_centerX = self.latestQuestionLbl1.frame.origin.x + kRadioBtn_LeftMargin * kXScal + kRadioBtn_Width * kXScal/2.0;
    self.olderAnswer1NoImg.center = CGPointMake(olderAnsweriNoImg_centerX, self.olderAnswer1NoLbl.center.y);
    
    if (sportFrequency == 1) {
        self.olderAnswer1YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderAnswer1YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
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
    self.olderAnswer1YesImg.center = CGPointMake(olderAnsweriNoImg_centerX, self.olderAnswer1YesLbl.center.y);
    
    self.olderQuestionImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderAnswer1YesLbl.frame) + kRadioBtn_TopMargin * kYScal,kQuestionLeftImg_Width * kXScal , kQuestionLeftImg_Height * kYScal)];
    self.olderQuestionImg2.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.rightContentView addSubview:self.olderQuestionImg2];
    
    self.olderQuestionLbl2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuestionImg2.frame) + kQuestionLbl_LeftMargin * kXScal, 0 ,self.leftView.frame.size.width - CGRectGetMaxX(self.olderQuestionImg1.frame) - kQuestionLbl_LeftMargin * kXScal, kNameLbl_Height * kYScal)];
    self.olderQuestionLbl2.text = @"有没有以下情况";
    self.olderQuestionLbl2.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    CGFloat question2_CenterX = CGRectGetMaxX(self.olderQuestionImg2.frame) + kQuestionLbl_LeftMargin * kXScal + (self.leftView.frame.size.width - CGRectGetMaxX(self.olderQuestionImg2.frame) - kQuestionLbl_LeftMargin * kXScal)/2.0;
    self.olderQuestionLbl2.center = CGPointMake(question2_CenterX, self.olderQuestionImg2.center.y);
    self.olderQuestionLbl2.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.rightContentView addSubview:self.olderQuestionLbl2];
    
    //高血压
    self.olderHbpLbl = [[UILabel alloc] initWithFrame:CGRectMake(kSecondeAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestionLbl2.frame) + kSecondAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Width * kXScal,kAnswerLbl_FontSize * kYScal)];
    self.olderHbpLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderHbpLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderHbpLbl.text = @"高血压";
    [self.rightContentView addSubview:self.olderHbpLbl];
    NSInteger hasHbp = [[self.olderInfoDict valueForKey:@"hasHbp"] integerValue];
    if (hasHbp == 1) {
        self.olderHbpYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderHbpYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderHbpYesImg.frame = CGRectMake(CGRectGetMaxX(self.olderHbpLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat olderHbpYesImg_centerX = CGRectGetMaxX(self.olderHbpLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal / 2.0;
    self.olderHbpYesImg.center = CGPointMake(olderHbpYesImg_centerX, self.olderHbpLbl.center.y);
    [self.rightContentView addSubview:self.olderHbpYesImg];
    
    self.olderHbpYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderHbpYesImg.frame) + kRadioBtn_RightMargin * kXScal, self.olderHbpLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderHbpYesLbl.text = @"有";
    self.olderHbpYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderHbpYesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderHbpYesLbl];
    
    if (hasHbp == 2) {
        self.olderHbpNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderHbpNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderHbpNoImg.frame = CGRectMake(CGRectGetMaxX(self.olderHbpYesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.olderHbpYesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderHbpNoImg];
    
    self.olderHbpNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderHbpNoImg.frame) + kRadioBtn_RightMargin * kXScal, self.olderHbpLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderHbpNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderHbpNoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderHbpNoLbl.text = @"无";
    [self.rightContentView addSubview:self.olderHbpNoLbl];
    
    //高血糖
    self.olderHbsLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderHbpLbl.frame.origin.x, CGRectGetMaxY(self.olderHbpLbl.frame) + kSecondAnserLbl_BottomMargin * kYScal, kSecondAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderHbsLbl.text = @"高血糖";
    self.olderHbsLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderHbsLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderHbsLbl];
    
    NSInteger hasHbs = [[self.olderInfoDict valueForKey:@"hasHbs"] integerValue];
    if (hasHbs == 1) {
        self.olderHbsYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderHbsYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderHbsYesImg.frame = CGRectMake(CGRectGetMaxX(self.olderHbsLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat olderHbsYesImg_CenterX = CGRectGetMaxX(self.olderHbsLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal/2.0;
    self.olderHbsYesImg.center = CGPointMake(olderHbsYesImg_CenterX, self.olderHbsLbl.center.y);
    [self.rightContentView addSubview:self.olderHbsYesImg];
    
    self.olderHbsYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderHbsYesImg.frame) + kRadioBtn_RightMargin * kXScal, self.olderHbsLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderHbsYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderHbsYesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderHbsYesLbl.text = @"有";
    [self.rightContentView addSubview:self.olderHbsYesLbl];
    
    if (hasHbs == 2) {
        self.olderHbsNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderHbsNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderHbsNoImg.frame = CGRectMake(CGRectGetMaxX(self.olderHbsYesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.olderHbsYesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderHbsNoImg];
    
    self.olderHbsNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderHbsNoImg.frame) + kRadioBtn_RightMargin * kXScal, self.olderHbsYesLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderHbsNoLbl.text = @"无";
    self.olderHbsNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderHbsNoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderHbsNoLbl];
    
    //高血脂
    self.olderHbfLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderHbpLbl.frame.origin.x, CGRectGetMaxY(self.olderHbsLbl.frame) + kSecondAnserLbl_BottomMargin * kYScal, kSecondAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderHbfLbl.text = @"高血脂";
    self.olderHbfLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderHbfLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderHbfLbl];
    
    NSInteger hasHbf = [[self.olderInfoDict valueForKey:@"hasHbf"] integerValue];
    if (hasHbf == 1) {
        self.olderHbfYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderHbfYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderHbfYesImg.frame = CGRectMake(CGRectGetMaxX(self.olderHbfLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat olderHbfYesImg_CenterX = CGRectGetMaxX(self.olderHbfLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal/2.0;
    self.olderHbfYesImg.center = CGPointMake(olderHbfYesImg_CenterX, self.olderHbfLbl.center.y);
    [self.rightContentView addSubview:self.olderHbfYesImg];
    
    self.olderHbfYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderHbfYesImg.frame) + kRadioBtn_RightMargin * kXScal, self.olderHbfLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderHbfYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderHbfYesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderHbfYesLbl.text = @"有";
    [self.rightContentView addSubview:self.olderHbfYesLbl];
    
    if (hasHbf == 2) {
        self.olderHbfNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderHbfNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderHbfNoImg.frame = CGRectMake(CGRectGetMaxX(self.olderHbfYesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.olderHbfYesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderHbfNoImg];
    
    self.olderHbfNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderHbfNoImg.frame) + kRadioBtn_RightMargin * kXScal, self.olderHbfYesLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderHbfNoLbl.text = @"无";
    self.olderHbfNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderHbfNoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderHbfNoLbl];
    
    //吸烟
    self.olderHighSmokeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderHbfLbl.frame.origin.x, CGRectGetMaxY(self.olderHbfLbl.frame) + kSecondAnserLbl_BottomMargin * kYScal, kSecondAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderHighSmokeLbl.text = @"吸   烟";
    self.olderHighSmokeLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderHighSmokeLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderHighSmokeLbl];
    
    NSInteger hasSmoking = [[self.olderInfoDict valueForKey:@"hasSmoking"] integerValue];
    if (hasSmoking == 1) {
        self.olderSmokeYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderSmokeYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderSmokeYesImg.frame = CGRectMake(CGRectGetMaxX(self.olderHighSmokeLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat olderSmokefYesImg_CenterX = CGRectGetMaxX(self.olderHighSmokeLbl.frame) + kSecondAnswerLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal/2.0;
    self.olderSmokeYesImg.center = CGPointMake(olderSmokefYesImg_CenterX, self.olderHighSmokeLbl.center.y);
    [self.rightContentView addSubview:self.olderSmokeYesImg];
    
    self.olderSmokeYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderSmokeYesImg.frame) + kRadioBtn_RightMargin * kXScal, self.olderHighSmokeLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderSmokeYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderSmokeYesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderSmokeYesLbl.text = @"有";
    [self.rightContentView addSubview:self.olderSmokeYesLbl];
    
    if (hasSmoking == 2) {
        self.olderSmokeNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderSmokeNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderSmokeNoImg.frame = CGRectMake(CGRectGetMaxX(self.olderSmokeYesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.olderSmokeYesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderSmokeNoImg];
    
    self.olderSmokeNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderSmokeNoImg.frame) + kRadioBtn_RightMargin * kXScal, self.olderSmokeYesLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderSmokeNoLbl.text = @"无";
    self.olderSmokeNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderSmokeNoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderSmokeNoLbl];
    
    //问题三
    self.olderQuestionImg3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderHighSmokeLbl.frame) + kRadioBtn_TopMargin * kYScal,kQuestionLeftImg_Width * kXScal , kQuestionLeftImg_Height * kYScal)];
    self.olderQuestionImg3.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.rightContentView addSubview:self.olderQuestionImg3];
    
    self.olderQuestionLbl3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuestionImg3.frame) + kQuestionLbl_LeftMargin * kXScal, 0 ,self.leftView.frame.size.width - CGRectGetMaxX(self.olderQuestionImg3.frame) - kQuestionLbl_LeftMargin * kXScal, kNameLbl_Height * kYScal)];
    self.olderQuestionLbl3.text = @"您家里有没有人患糖尿病？";
    self.olderQuestionLbl3.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    CGFloat question3_CenterX = CGRectGetMaxX(self.olderQuestionImg3.frame) + kQuestionLbl_LeftMargin * kXScal + (self.leftView.frame.size.width - CGRectGetMaxX(self.olderQuestionImg3.frame) - kQuestionLbl_LeftMargin * kXScal)/2.0;
    self.olderQuestionLbl3.center = CGPointMake(question3_CenterX, self.olderQuestionImg3.center.y);
    self.olderQuestionLbl3.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.rightContentView addSubview:self.olderQuestionLbl3];
    NSInteger familyDiabetes = [[self.olderInfoDict valueForKey:@"familyDiabetes"] integerValue];
    if (familyDiabetes == 1) {
        self.olderQuestion3YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderQuestion3YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderQuestion3YesImg.frame = CGRectMake(kThirdAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestionLbl3.frame) + kSecondQustionImg_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderQuestion3YesImg];
    
    self.olderQuestion3YesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuestion3YesImg.frame) + kRadioBtn_LeftMargin * kXScal, 0, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    CGFloat olderQuestion3YesLbl_CenterX = CGRectGetMaxX(self.olderQuestion3YesImg.frame) + kRadioBtn_LeftMargin * kXScal + kSecondAnswerLbl_Yes_Width /2.0;
    self.olderQuestion3YesLbl.center = CGPointMake(olderQuestion3YesLbl_CenterX, self.olderQuestion3YesImg.center.y);
    self.olderQuestion3YesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion3YesLbl.text = @"有";
    self.olderQuestion3YesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion3YesLbl];
    
    if (familyDiabetes == 2) {
        self.olderQuestion3NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderQuestion3NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderQuestion3NoImg.frame = CGRectMake(CGRectGetMaxX(self.olderQuestion3YesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.olderQuestion3YesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderQuestion3NoImg];
    
    self.olderQuestion3NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuestion3NoImg.frame) + kRadioBtn_LeftMargin, self.olderQuestion3YesLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion3NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion3NoLbl.text = @"无";
    self.olderQuestion3NoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion3NoLbl];
    
    //问题四
    self.olderQuestionImg4 = [[UIImageView alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderQuestion3YesImg.frame) + kSecondQustionImg_TopMargin * kYScal,kQuestionLeftImg_Width * kXScal , kQuestionLeftImg_Height * kYScal)];
    self.olderQuestionImg4.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.rightContentView addSubview:self.olderQuestionImg4];
    
    self.olderQuestionLbl4 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuestionImg4.frame) + kQuestionLbl_LeftMargin * kXScal, 0 ,self.leftView.frame.size.width - CGRectGetMaxX(self.olderQuestionImg4.frame) - kQuestionLbl_LeftMargin * kXScal, kNameLbl_Height * kYScal)];
    self.olderQuestionLbl4.text = @"您家里有没有人出现猝死的情况？";
    self.olderQuestionLbl4.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    CGFloat question4_CenterX = CGRectGetMaxX(self.olderQuestionImg4.frame) + kQuestionLbl_LeftMargin * kXScal + (self.leftView.frame.size.width - CGRectGetMaxX(self.olderQuestionImg4.frame) - kQuestionLbl_LeftMargin * kXScal)/2.0;
    self.olderQuestionLbl4.center = CGPointMake(question4_CenterX, self.olderQuestionImg4.center.y);
    self.olderQuestionLbl4.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.rightContentView addSubview:self.olderQuestionLbl4];
    NSInteger familySuddenDeath = [[self.olderInfoDict valueForKey:@"familySuddenDeath"] integerValue];
    if (familySuddenDeath == 1) {
        self.olderQuestion4YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderQuestion4YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderQuestion4YesImg.frame = CGRectMake(kThirdAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestionLbl4.frame) + kSecondQustionImg_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderQuestion4YesImg];
    
    self.olderQuestion4YesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuestion4YesImg.frame) + kRadioBtn_LeftMargin * kXScal, 0, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    CGFloat olderQuestion4YesLbl_CenterX = CGRectGetMaxX(self.olderQuestion4YesImg.frame) + kRadioBtn_LeftMargin * kXScal + kSecondAnswerLbl_Yes_Width /2.0;
    self.olderQuestion4YesLbl.center = CGPointMake(olderQuestion4YesLbl_CenterX, self.olderQuestion4YesImg.center.y);
    self.olderQuestion4YesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion4YesLbl.text = @"有";
    self.olderQuestion4YesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion4YesLbl];
    
    if (familySuddenDeath == 2) {
        self.olderQuestion4NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderQuestion4NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderQuestion4NoImg.frame = CGRectMake(CGRectGetMaxX(self.olderQuestion4YesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.olderQuestion4YesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderQuestion4NoImg];
    
    self.olderQuestion4NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuestion4NoImg.frame) + kRadioBtn_LeftMargin, self.olderQuestion4YesLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion4NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion4NoLbl.text = @"无";
    self.olderQuestion4NoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion4NoLbl];
    
    //问题五
    self.olderQuestionImg5 = [[UIImageView alloc] initWithFrame:CGRectMake(self.olderPatientImg.frame.origin.x, CGRectGetMaxY(self.olderQuestion4YesImg.frame) + kRadioBtn_TopMargin * kYScal,kQuestionLeftImg_Width * kXScal , kQuestionLeftImg_Height * kYScal)];
    self.olderQuestionImg5.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.rightContentView addSubview:self.olderQuestionImg5];
    
    self.olderQuestionLbl5 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuestionImg5.frame) + kQuestionLbl_LeftMargin * kXScal, 0 ,self.leftView.frame.size.width - CGRectGetMaxX(self.olderQuestionImg5.frame) - kQuestionLbl_LeftMargin * kXScal, kNameLbl_Height * kYScal)];
    self.olderQuestionLbl5.text = @"最近三个月有无以下状况出现？";
    self.olderQuestionLbl5.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    CGFloat question5_CenterX = CGRectGetMaxX(self.olderQuestionImg5.frame) + kQuestionLbl_LeftMargin * kXScal + (self.leftView.frame.size.width - CGRectGetMaxX(self.olderQuestionImg3.frame) - kQuestionLbl_LeftMargin * kXScal)/2.0;
    self.olderQuestionLbl5.center = CGPointMake(question5_CenterX, self.olderQuestionImg5.center.y);
    self.olderQuestionLbl5.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.rightContentView addSubview:self.olderQuestionLbl5];
    
    NSInteger threeMonthStatus = [[self.olderInfoDict valueForKey:@"threeMonthStatus"] integerValue];
    if (threeMonthStatus == 1) {
        self.olderQuestion5YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderQuestion5YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderQuestion5YesImg.frame = CGRectMake(kThirdAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestionLbl5.frame) + kSecondQustionImg_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderQuestion5YesImg];
    
    self.olderQuestion5YesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuestion5YesImg.frame) + kRadioBtn_LeftMargin * kXScal, 0, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    CGFloat olderQuestion5YesLbl_CenterX = CGRectGetMaxX(self.olderQuestion5YesImg.frame) + kRadioBtn_LeftMargin * kXScal + kSecondAnswerLbl_Yes_Width /2.0;
    self.olderQuestion5YesLbl.center = CGPointMake(olderQuestion5YesLbl_CenterX, self.olderQuestion5YesImg.center.y);
    self.olderQuestion5YesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5YesLbl.text = @"有";
    self.olderQuestion5YesLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion5YesLbl];
    
    if (threeMonthStatus == 2) {
        self.olderQuestion5NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderQuestion5NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.olderQuestion5NoImg.frame = CGRectMake(CGRectGetMaxX(self.olderQuestion5YesLbl.frame) + kSecondAnswerLbl_Yes_RightMargin * kXScal, self.olderQuestion5YesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.rightContentView addSubview:self.olderQuestion5NoImg];
    
    self.olderQuestion5NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuestion5NoImg.frame) + kRadioBtn_LeftMargin, self.olderQuestion5YesLbl.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5NoLbl.text = @"无";
    self.olderQuestion5NoLbl.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion5NoLbl];
    
    self.olderQuestion5Lbl11 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestion5YesLbl.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl11.text = @"1.";
    self.olderQuestion5Lbl11.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl11.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion5Lbl11];
    
    self.olderQuestion5Lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.olderQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestion5YesLbl.frame) + kFifthAnswerLbl_TopMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl1.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderQuestion5Lbl1.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl1.numberOfLines = 0;
    self.olderQuestion5Lbl1.text = @"可能是由于局部缺血造成的疼痛（感觉闷）或不适，在胸部、颈部、下颌、手臂或其他区域；";
    CGSize olderQuestion5Lbl1Size = [self.olderQuestion5Lbl1 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.olderQuestion5Lbl1.frame = CGRectMake(CGRectGetMaxX(self.olderQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestion5YesLbl.frame) + kFifthAnswerLbl_TopMargin * kYScal, olderQuestion5Lbl1Size.width, olderQuestion5Lbl1Size.height);
    [self.rightContentView addSubview:self.olderQuestion5Lbl1];
    self.olderQuestion5Lbl11.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.olderQuestion5Lbl1.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.olderQuestion5Lbl22 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl1.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl22.text = @"2.";
    self.olderQuestion5Lbl22.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl22.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion5Lbl22];
    
    self.olderQuestion5Lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(self.olderQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.olderQuestion5Lbl1.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl2.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderQuestion5Lbl2.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl2.text = @"呼吸急促，在休息或轻度用力时呼吸困难；";
    self.olderQuestion5Lbl2.numberOfLines = 0;
    CGSize olderQuestion5Lbl2Size = [self.olderQuestion5Lbl2 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.olderQuestion5Lbl2.frame = CGRectMake(CGRectGetMaxX(self.olderQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl1.frame) + kFifthAnswerLbl_BottomMargin * kYScal, olderQuestion5Lbl2Size.width, olderQuestion5Lbl2Size.height);
    [self.rightContentView addSubview:self.olderQuestion5Lbl2];
    self.olderQuestion5Lbl22.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.olderQuestion5Lbl2.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.olderQuestion5Lbl33 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl2.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl33.text = @"3.";
    self.olderQuestion5Lbl33.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl33.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion5Lbl33];
    
    self.olderQuestion5Lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(self.olderQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.olderQuestion5Lbl2.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl3.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderQuestion5Lbl3.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl3.text = @"端坐呼吸困难（坐着都感觉呼吸困难）；";
    self.olderQuestion5Lbl3.numberOfLines = 0;
    CGSize olderQuestion5Lbl3Size = [self.olderQuestion5Lbl3 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.olderQuestion5Lbl3.frame = CGRectMake(CGRectGetMaxX(self.olderQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl2.frame) + kFifthAnswerLbl_BottomMargin * kYScal, olderQuestion5Lbl3Size.width, olderQuestion5Lbl3Size.height);
    [self.rightContentView addSubview:self.olderQuestion5Lbl3];
    self.olderQuestion5Lbl33.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.olderQuestion5Lbl3.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.olderQuestion5Lbl44 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl3.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl44.text = @"4.";
    self.olderQuestion5Lbl44.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl44.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion5Lbl44];
    
    self.olderQuestion5Lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(self.olderQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.olderQuestion5Lbl3.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl4.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderQuestion5Lbl4.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl4.text = @"踝部水肿；";
    self.olderQuestion5Lbl4.numberOfLines = 0;
    CGSize olderQuestion5Lbl4Size = [self.olderQuestion5Lbl4 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.olderQuestion5Lbl4.frame = CGRectMake(CGRectGetMaxX(self.olderQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl3.frame) + kFifthAnswerLbl_BottomMargin * kYScal, olderQuestion5Lbl4Size.width, olderQuestion5Lbl4Size.height);
    [self.rightContentView addSubview:self.olderQuestion5Lbl4];
    self.olderQuestion5Lbl44.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.olderQuestion5Lbl4.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.olderQuestion5Lbl55 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl4.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl55.text = @"5.";
    self.olderQuestion5Lbl55.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl55.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion5Lbl55];
    
    self.olderQuestion5Lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(self.olderQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.olderQuestion5Lbl4.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl5.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderQuestion5Lbl5.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl5.text = @"心悸或心动过速；";
    self.olderQuestion5Lbl5.numberOfLines = 0;
    CGSize olderQuestion5Lbl5Size = [self.olderQuestion5Lbl5 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.olderQuestion5Lbl5.frame = CGRectMake(CGRectGetMaxX(self.olderQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl4.frame) + kFifthAnswerLbl_BottomMargin * kYScal, olderQuestion5Lbl5Size.width, olderQuestion5Lbl5Size.height);
    [self.rightContentView addSubview:self.olderQuestion5Lbl5];
    self.olderQuestion5Lbl55.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.olderQuestion5Lbl5.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.olderQuestion5Lbl66 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl5.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl66.text = @"6.";
    self.olderQuestion5Lbl66.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl66.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion5Lbl66];
    
    self.olderQuestion5Lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(self.olderQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.olderQuestion5Lbl5.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl6.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderQuestion5Lbl6.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl6.text = @"间歇性跛行（有疼痛感，或与供血不足有关的下肢痉挛）；";
    self.olderQuestion5Lbl6.numberOfLines = 0;
    CGSize olderQuestion5Lbl6Size = [self.olderQuestion5Lbl6 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.olderQuestion5Lbl6.frame = CGRectMake(CGRectGetMaxX(self.olderQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl5.frame) + kFifthAnswerLbl_BottomMargin * kYScal, olderQuestion5Lbl6Size.width, olderQuestion5Lbl6Size.height);
    [self.rightContentView addSubview:self.olderQuestion5Lbl6];
    self.olderQuestion5Lbl66.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.olderQuestion5Lbl6.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.olderQuestion5Lbl77 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl6.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl77.text = @"7.";
    self.olderQuestion5Lbl77.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl77.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion5Lbl77];
    
    self.olderQuestion5Lbl7 = [[UILabel alloc] initWithFrame:CGRectMake(self.olderQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.olderQuestion5Lbl6.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl7.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderQuestion5Lbl7.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl7.text = @"已知的心脏杂音；";
    self.olderQuestion5Lbl7.numberOfLines = 0;
    CGSize olderQuestion5Lbl7Size = [self.olderQuestion5Lbl7 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.olderQuestion5Lbl7.frame = CGRectMake(CGRectGetMaxX(self.olderQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl6.frame) + kFifthAnswerLbl_BottomMargin * kYScal, olderQuestion5Lbl7Size.width, olderQuestion5Lbl7Size.height);
    [self.rightContentView addSubview:self.olderQuestion5Lbl7];
    self.olderQuestion5Lbl77.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.olderQuestion5Lbl7.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.olderQuestion5Lbl88 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl7.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl88.text = @"8.";
    self.olderQuestion5Lbl88.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl88.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion5Lbl88];
    
    self.olderQuestion5Lbl8 = [[UILabel alloc] initWithFrame:CGRectMake(self.olderQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.olderQuestion5Lbl7.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl8.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderQuestion5Lbl8.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl8.text = @"异常疲劳或日常活动呼吸困难；";
    self.olderQuestion5Lbl8.numberOfLines = 0;
    CGSize olderQuestion5Lbl8Size = [self.olderQuestion5Lbl8 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.olderQuestion5Lbl8.frame = CGRectMake(CGRectGetMaxX(self.olderQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl7.frame) + kFifthAnswerLbl_BottomMargin * kYScal, olderQuestion5Lbl8Size.width, olderQuestion5Lbl8Size.height);
    [self.rightContentView addSubview:self.olderQuestion5Lbl8];
    self.olderQuestion5Lbl88.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.olderQuestion5Lbl8.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.olderQuestion5Lbl99 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl8.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl99.text = @"9.";
    self.olderQuestion5Lbl99.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl99.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    [self.rightContentView addSubview:self.olderQuestion5Lbl99];
    
    self.olderQuestion5Lbl9 = [[UILabel alloc] initWithFrame:CGRectMake(self.olderQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.olderQuestion5Lbl8.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
    self.olderQuestion5Lbl9.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
    self.olderQuestion5Lbl9.textColor = [UIColor colorWithHexString:@"#444444"];
    self.olderQuestion5Lbl9.text = @"由大脑供血不足引起的头晕或晕厥。";
    self.olderQuestion5Lbl9.numberOfLines = 0;
    CGSize olderQuestion5Lbl9Size = [self.olderQuestion5Lbl9 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
    self.olderQuestion5Lbl9.frame = CGRectMake(CGRectGetMaxX(self.olderQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.olderQuestion5Lbl8.frame) + kFifthAnswerLbl_BottomMargin * kYScal, olderQuestion5Lbl9Size.width, olderQuestion5Lbl9Size.height);
    [self.rightContentView addSubview:self.olderQuestion5Lbl9];
    self.olderQuestion5Lbl99.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.olderQuestion5Lbl9.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
    
    self.olderSummaryView = [[UIView alloc] initWithFrame:CGRectMake(self.olderQuestion5Lbl11.frame.origin.x, CGRectGetMaxY(self.olderQuestion5Lbl9.frame) + kSummaryView_TopMargin * kYScal, self.rightContentView.frame.size.width - 2 * self.olderQuestion5Lbl11.frame.origin.x, self.rightContentView.frame.size.height - CGRectGetMaxY(self.olderQuestion5Lbl9.frame) - 2 * kSummaryView_TopMargin * kYScal)];
    self.olderSummaryView.backgroundColor = [UIColor colorWithHexString:@"#fefefe"];
    self.olderSummaryView.layer.cornerRadius = 4;
    self.olderSummaryView.layer.masksToBounds = YES;
    [self.rightContentView addSubview:self.olderSummaryView];
    
    self.olderRiskLevelLbl = [[UILabel alloc] initWithFrame:CGRectMake(kSummaryView_LeftMargin * kXScal, kSummaryView_Lbl_TopMargin * kYScal, kSummaryView_Lbl_Width * kXScal, kSummaryView_Lbl_Height * kYScal)];
    self.olderRiskLevelLbl.text = @"风险等级：中";
    self.olderRiskLevelLbl.font = [UIFont systemFontOfSize:kSummaryView_Lbl_FontSize * kYScal];
    self.olderRiskLevelLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    [self.olderSummaryView addSubview:self.olderRiskLevelLbl];
    
    self.olderHRZoneLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.olderSummaryView.frame.size.width - kSummaryView_Lbl_Width * kXScal - kSummaryView_HRZoneLbl_RightMargin * kXScal, self.olderRiskLevelLbl.frame.origin.y, kSummaryView_Lbl_Width * kXScal, kSummaryView_Lbl_Height * kYScal)];
    self.olderHRZoneLbl.font = [UIFont systemFontOfSize:kSummaryView_Lbl_FontSize * kYScal];
    self.olderHRZoneLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    [self.olderSummaryView addSubview:self.olderHRZoneLbl];
    
    self.olderRPERangeLbll = [[UILabel alloc] initWithFrame:CGRectMake(self.olderRiskLevelLbl.frame.origin.x, self.olderSummaryView.frame.size.height - kSummaryView_Lbl_Height * kYScal - kSummaryView_Lbl_TopMargin * kYScal, kSummaryView_Lbl_Width * kXScal, kSummaryView_Lbl_Height * kYScal)];
    self.olderRPERangeLbll.textColor = [UIColor colorWithHexString:@"#333333"];
    self.olderRPERangeLbll.font = [UIFont systemFontOfSize:kSummaryView_Lbl_FontSize * kYScal];
    [self.olderSummaryView addSubview:self.olderRPERangeLbll];
    
    NSInteger riskLevel = [[self.olderInfoDict valueForKey:@"riskLevel"] integerValue];
    if (riskLevel > 0) {
        NSDictionary *riskDict = [self getHrRangeAndRPERange:riskLevel];
        self.olderRiskLevelLbl.text = [NSString stringWithFormat:@"风险等级：%@",[riskDict valueForKey:@"riskLevel"]];

        self.olderHRZoneLbl.text = [NSString stringWithFormat:@"心率区间：%@",[riskDict valueForKey:@"hrRange"]];

        self.olderRPERangeLbll.text = [NSString stringWithFormat:@"RPE范围：%@",[riskDict valueForKey:@"rpeRange"]];
    }
}

- (void)configOlderInfoViewData:(NSDictionary*)dict {
    self.oldTimeLbl.text = [NSString stringWithFormat:@"更新日期：%@",[dict valueForKey:@"createTime"]];
    NSString *headUrl = [dict valueForKey:@"headUrl"];
    [self.olderPatientImg sd_setImageWithURL:[NSURL URLWithString:headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
    self.olderNameTF.text = [dict valueForKey:@"name"];
    if (![self.latestNameTF.text isEqualToString:self.olderNameTF.text]) {
        self.latestNameTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestNameTF.textColor = [UIColor blackColor];
    }
    NSInteger olderSex = [[dict valueForKey:@"sex"] integerValue];
    NSString *sex = @"男";
    if (olderSex == 1) {
        sex = @"男";
    } else if (olderSex == 2) {
        sex = @"女";
    }
    self.olderSexTF.text = sex;
    if (![self.latestSexTF.text isEqualToString:self.olderSexTF.text]) {
        self.latestSexTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestSexTF.textColor = [UIColor blackColor];
    }
    
    self.olderPhoneTF.text = [dict valueForKey:@"mobile"];
    if (![self.latestPhoneTF.text isEqualToString:self.olderPhoneTF.text]) {
        self.latestPhoneTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestPhoneTF.textColor = [UIColor blackColor];
    }
    
    self.olderBirthTF.text = [dict valueForKey:@"birthdate"];
    if (![self.latestBirthTF.text isEqualToString:self.olderBirthTF.text]) {
        self.latestBirthTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestBirthTF.textColor = [UIColor blackColor];
    }
    
    CGFloat height = [[dict valueForKey:@"height"] floatValue];
    self.olderHeightTF.text = [NSString stringWithFormat:@"%.1f",height];
    if (![self.latestHeightTF.text isEqualToString:self.olderHeightTF.text]) {
        self.latestHeightTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestHeightTF.textColor = [UIColor blackColor];
    }
    
    CGFloat weight = [[dict valueForKey:@"weight"] floatValue];
    self.olderWeightTF.text = [NSString stringWithFormat:@"%.1f",weight];
    if (![self.latestWeightTF.text isEqualToString:self.olderWeightTF.text]) {
        self.latestWeightTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestWeightTF.textColor = [UIColor blackColor];
    }
    
    CGFloat waistline = [[dict valueForKey:@"waistline"] floatValue];
    self.olderWaistTF.text = [NSString stringWithFormat:@"%.1f",waistline];
    if (![self.latestWaistTF.text isEqualToString:self.olderWaistTF.text]) {
        self.latestWaistTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestWaistTF.textColor = [UIColor blackColor];
    }
    
    CGFloat fbg = [[dict valueForKey:@"fbg"] floatValue];
    self.olderKFXTHRTF.text = [NSString stringWithFormat:@"%.1f",fbg];
    if (![self.latestKFXTHRTF.text isEqualToString:self.olderKFXTHRTF.text]) {
        self.latestKFXTHRTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestKFXTHRTF.textColor = [UIColor blackColor];
    }
    
    self.olderQuietHRTF.text = [NSString stringWithFormat:@"%d",[[dict valueForKey:@"restHr"] integerValue]];
    if (![self.latestQuietHRTF.text isEqualToString:self.olderQuietHRTF.text]) {
        self.latestQuietHRTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestQuietHRTF.textColor = [UIColor blackColor];
    }
    
    CGFloat hrv = [[dict valueForKey:@"hrv"] floatValue];
    self.olderXLBYTF.text = [NSString stringWithFormat:@"%.1f",hrv];
    if (![self.latestXLBYTF.text isEqualToString:self.olderXLBYTF.text]) {
        self.latestXLBYTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestXLBYTF.textColor = [UIColor blackColor];
    }
    
    NSInteger sbp = [[dict valueForKey:@"sbp"] integerValue];
    self.olderSSYTF.text = [NSString stringWithFormat:@"%d",sbp];
    if (![self.latestSSYTF.text isEqualToString:self.olderSSYTF.text]) {
        self.latestSSYTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestSSYTF.textColor = [UIColor blackColor];
    }
    
    NSInteger dbp = [[dict valueForKey:@"dbp"] integerValue];
    self.olderSZYTF.text = [NSString stringWithFormat:@"%d",dbp];
    if (![self.latestSZYTF.text isEqualToString:self.olderSZYTF.text]) {
        self.latestSZYTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestSZYTF.textColor = [UIColor blackColor];
    }
    
    CGFloat hdl = [[dict valueForKey:@"hdl"] floatValue];
    self.olderGMDZDBTF.text = [NSString stringWithFormat:@"%.1f",hdl];
    if (![self.latestGMDZDBTF.text isEqualToString:self.olderGMDZDBTF.text]) {
        self.latestGMDZDBTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestGMDZDBTF.textColor = [UIColor blackColor];
    }
    
    CGFloat bmi = [[dict valueForKey:@"bmi"] floatValue];
    self.olderSTZLZSTF.text = [NSString stringWithFormat:@"%.1f",bmi];
    if (![self.latestSTZLZSTF.text isEqualToString:self.olderSTZLZSTF.text]) {
        self.latestSTZLZSTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestSTZLZSTF.textColor = [UIColor blackColor];
    }
    
    NSInteger olderMaxAlarmHr = [[dict valueForKey:@"maxAlarmHr"] integerValue];
    self.olderMaxAlertTF.text = [NSString stringWithFormat:@"%d",olderMaxAlarmHr];
    if (![self.latestMaxAlertTF.text isEqualToString:self.olderMaxAlertTF.text]) {
        self.latestMaxAlertTF.textColor = [UIColor colorWithHexString:@"#E85403"];
    } else {
        self.latestMaxAlertTF.textColor = [UIColor blackColor];
    }
    
    NSInteger sportFrequency = [[dict valueForKey:@"sportFrequency"] integerValue];
    if (sportFrequency == 2) {
        self.olderAnswer1NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderAnswer1NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    if (sportFrequency == 1) {
        self.olderAnswer1YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderAnswer1YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    NSInteger hasHbp = [[dict valueForKey:@"hasHbp"] integerValue];
    if (hasHbp == 1) {
        self.olderHbpYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderHbpYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    if (hasHbp == 2) {
        self.olderHbpNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderHbpNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    NSInteger hasHbs = [[dict valueForKey:@"hasHbs"] integerValue];
    if (hasHbs == 1) {
        self.olderHbsYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderHbsYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    if (hasHbs == 2) {
        self.olderHbsNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderHbsNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    NSInteger hasHbf = [[dict valueForKey:@"hasHbf"] integerValue];
    if (hasHbf == 1) {
        self.olderHbfYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderHbfYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    if (hasHbf == 2) {
        self.olderHbfNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderHbfNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    NSInteger hasSmoking = [[dict valueForKey:@"hasSmoking"] integerValue];
    if (hasSmoking == 1) {
        self.olderSmokeYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderSmokeYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    if (hasSmoking == 2) {
        self.olderSmokeNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderSmokeNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    NSInteger familyDiabetes = [[dict valueForKey:@"familyDiabetes"] integerValue];
    if (familyDiabetes == 1) {
        self.olderQuestion3YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderQuestion3YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    if (familyDiabetes == 2) {
        self.olderQuestion3NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderQuestion3NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    NSInteger familySuddenDeath = [[dict valueForKey:@"familySuddenDeath"] integerValue];
    if (familySuddenDeath == 1) {
        self.olderQuestion4YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderQuestion4YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    if (familySuddenDeath == 2) {
        self.olderQuestion4NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderQuestion4NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    NSInteger threeMonthStatus = [[dict valueForKey:@"threeMonthStatus"] integerValue];
    if (threeMonthStatus == 1) {
        self.olderQuestion5YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderQuestion5YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    if (threeMonthStatus == 2) {
        self.olderQuestion5NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.olderQuestion5NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    
    NSInteger riskLevel = [[dict valueForKey:@"riskLevel"] integerValue];
    if (riskLevel > 0) {
        NSDictionary *riskDict = [self getHrRangeAndRPERange:riskLevel];
        self.olderRiskLevelLbl.text = [NSString stringWithFormat:@"风险等级：%@",[riskDict valueForKey:@"riskLevel"]];
        
        self.olderHRZoneLbl.text = [NSString stringWithFormat:@"心率区间：%@",[riskDict valueForKey:@"hrRange"]];
        
        self.olderRPERangeLbll.text = [NSString stringWithFormat:@"RPE范围：%@",[riskDict valueForKey:@"rpeRange"]];
    }
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)leftBtnClick:(UIButton*)sender {
    if (self.leftOffset - 2 > 0) {
        if (self.infoArr.count > 2) {
            NSDictionary *dict = [self.infoArr objectAtIndex:(self.leftOffset - 2)];
            [self configOlderInfoViewData:dict];
            
            self.leftOffset --;
        }
    } else {
        [STTextHudTool showText:@"不能再向左滑了"];
    }
}

- (void)rightBtnClick:(UIButton*)sender {
    if (!self.hasEnded) {
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
        NSDictionary *dict = user.organ;
        NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
        NSString *orgCode = orgCodeArr[0];
        [parameter setValue:orgCode forKey:@"orgCode"];
        [parameter setValue:@(self.offset) forKey:@"offset"];
        [parameter setValue:@1 forKey:@"rows"];
        NSInteger userId = [[self.latestInfoDict valueForKey:@"userId"] integerValue];
        [parameter setValue:@(userId) forKey:@"userId"];
        [self checkMorePatientInfo:parameter];
    } else {
        if (self.leftOffset <self.offset) {
            self.leftOffset ++;
            NSDictionary *dict = [self.infoArr objectAtIndex:(self.leftOffset - 1)];
            [self configOlderInfoViewData:dict];
        } else {
            [STTextHudTool showText:@"已经到头了"];
        }
    }
}

//现实测试结果
- (void)showTestResults:(UIButton*)sender {
    if (self.testResults.count == 0) {
        NSMutableDictionary *para = [NSMutableDictionary dictionary];
        NSDictionary *dict = self.user.organ;
        NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
        NSString *orgCode = orgCodeArr[0];
        [para setValue:orgCode forKey:@"orgCode"];
        NSInteger userId = [[self.latestInfoDict valueForKey:@"userId"] integerValue];
        [para setValue:@(userId) forKey:@"userId"];
        [self getUserDeviceMeasure:para];
    }
    sender.selected = !sender.selected;
    CGFloat leftView_Width = (self.scrollview.frame.size.width - kMiddle_Space * kXScal)/2.0;
    if (sender.selected) {
        self.testResultListView.hidden = NO;
        self.testResultListView.frame = CGRectMake(0, CGRectGetMaxY(self.testResultBtn.frame), leftView_Width, kTopLbl_Height * kYScal);
    } else {
        self.testResultListView.hidden = YES;
        self.testResultListView.frame = CGRectMake(0, CGRectGetMaxY(self.navView.frame), leftView_Width, 0);
    }
}

- (void)updateInfoBtnClick:(UIButton*)sender {
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [para setValue:orgCode forKey:@"orgCode"];
    NSInteger userId = [[self.latestInfoDict valueForKey:@"userId"] integerValue];
    [para setValue:@(userId) forKey:@"userId"];
    [self doctorGetUserInfo:para];
}

- (void)createAerobicPrescription:(UIButton*)sender {
    CreateAerobicPrescriptionViewController *create = [[CreateAerobicPrescriptionViewController alloc] init];
    create.prescriptionDict = self.latestInfoDict;
    if (self.deviceTypeArr.count > 0) {
        for (NSDictionary *dict in self.deviceTypeArr) {
            NSString *name = [dict valueForKey:@"name"];
            if ([name isEqualToString:@"有氧设备"]) {
                create.deviceTypeArr = [dict valueForKey:@"children"];
            }
        }
    }
    [self.navigationController pushViewController:create animated:NO];
//    OpenAerobicPrescriptionVC *vc = [[OpenAerobicPrescriptionVC alloc] init];
//    vc.prescriptionDict = self.latestInfoDict;
//    [self.navigationController pushViewController:vc animated:YES];
}

//查看体能评估结果
- (void)checkEvaluateResult:(UIButton*)sender {
    CheckEvaluateReportViewController *report = [[CheckEvaluateReportViewController alloc] init];
    report.userInfo = self.latestInfoDict;
    [self.navigationController pushViewController:report animated:NO];
}

- (void)createPowerPrescription:(UIButton*)sender {
    CreatePowerPrescriptionViewController *create = [[CreatePowerPrescriptionViewController alloc] init];
    create.prescriptionDict = self.latestInfoDict;
    if (self.deviceTypeArr.count > 0) {
        for (NSDictionary *dict in self.deviceTypeArr) {
            NSString *name = [dict valueForKey:@"name"];
            if ([name isEqualToString:@"力量设备"]) {
                create.deviceTypeArr = [dict valueForKey:@"children"];
            }
        }
    }
    [self.navigationController pushViewController:create animated:NO];
}

- (void)checkAerobicReport:(UIButton*)sender {
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@0 forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    [parameter setValue:@1 forKey:@"type"];
    NSInteger userId = [[self.latestInfoDict valueForKey:@"userId"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@"-create_time" forKey:@"sort"];
    [self getUserPrescriptionList:parameter];
}

#pragma mark - UITableViewDelegate && UITableViewDateSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.testResults.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTopLbl_Height * kYScal;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseCellId = [NSString stringWithFormat:@"TestResultsCell%d%d",indexPath.section,indexPath.row];
    TestResultsCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellId];
    if (cell == nil) {
        cell = [[TestResultsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellId];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
    }
    NSDictionary *dict = [self.testResults objectAtIndex:indexPath.row];
    cell.deviceNameLbl.text = [dict valueForKey:@"deviceName"];
    cell.attributeNameLbl.text = [dict valueForKey:@"attrName"];
    NSInteger value = [[dict valueForKey:@"value"] integerValue];
    cell.attributeValLbl.text = [NSString stringWithFormat:@"%d",value];
    return cell;
}

#pragma mark - XXTGDropdownMenuDelegate

- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string
{
    if (menu == self.hrMenu) {
        if ([string isEqualToString:@"无"]) {
            self.selectedDeviceCode = @"";
        } else {
            self.selectedDeviceCode = string;
        }
    }
}

- (void)dropdownMenu:(KTDropDownMenus *)menu mainBtnClick:(UIButton *)sender {
    if (menu == self.hrMenu) {
        [self.hrMenu.mTableView reloadData];
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        NSDictionary *dict = self.user.organ;
        NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
        NSString *orgCode = orgCodeArr[0];
        [parameter setValue:orgCode forKey:@"orgCode"];
        [parameter setValue:@14 forKey:@"deviceType"];
        [self showAllHrDevices:parameter];
    }
}

#pragma mark - network Fuctions
- (void)getPrivateHrDevice:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USER_PRIVATE_DEVICE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSString *error = [responseObject valueForKey:@"error"];
        NSLog(@"bind device :%@ :%@",responseObject,error);
        if (code == 0) {
            NSArray *privateDevices = [responseObject valueForKey:@"data"];
            if (privateDevices.count > 0) {
                NSDictionary *dict = [privateDevices objectAtIndex:0];
                NSString *deviceCode = [dict valueForKey:@"deviceCode"];
                weakSelf.hrMenuTitle = deviceCode;
                [weakSelf.hrMenu.mainBtn setTitle:deviceCode forState:UIControlStateNormal];
            } else {
                [weakSelf.hrMenu.mainBtn setTitle:@"无" forState:UIControlStateNormal];
                weakSelf.hrMenuTitle = @"无";
            }
        } else if (code == 10011) {
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [self.navigationController popToRootViewControllerAnimated:NO];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)showAllHrDevices:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_AVAILABLE_DEVICE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSString *error = [responseObject valueForKey:@"error"];
        NSLog(@"private hr device :%@ :%@",responseObject,error);
        if (weakSelf.privateDeviceArr.count > 0) {
            [weakSelf.privateDeviceArr removeAllObjects];
        }
        [weakSelf.privateDeviceArr addObject:@"无"];
        if (code == 0) {
            NSArray *privateDevices = [responseObject valueForKey:@"data"];
            if (privateDevices.count > 0) {
                for (NSDictionary *device in privateDevices) {
                    NSString *deviceId = [device valueForKey:@"deviceCode"];
                    if (![weakSelf.privateDeviceArr containsObject:deviceId]) {
                        [weakSelf.privateDeviceArr addObject:deviceId];
                    }
                }
                weakSelf.hrMenu.titles = [weakSelf.privateDeviceArr copy];
                [weakSelf.hrMenu.mTableView reloadData];
            } else {
                [weakSelf.hrMenu.mainBtn setTitle:@"无" forState:UIControlStateNormal];
                [weakSelf.hrMenu.mainBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [weakSelf.hrMenu.mTableView reloadData];
            }
        } else if (code == 10011) {
            [weakSelf.hrMenu hiddenCityList];
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [self.navigationController popToRootViewControllerAnimated:NO];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)getUserPrescriptionList:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USER_PRESCRIPTION_LIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************%@**************",responseObject);
        if (code == 0) {
            NSArray *rows = [responseObject valueForKey:@"rows"];
            AerobicPrescriptionAndReportViewController *report = [[AerobicPrescriptionAndReportViewController alloc] init];
            report.precriptionsArr = [rows mutableCopy];
            report.patientInfo = self.latestInfoDict;
            if (self.deviceTypeArr.count > 0) {
                for (NSDictionary *dict in self.deviceTypeArr) {
                    NSString *name = [dict valueForKey:@"name"];
                    if ([name isEqualToString:@"有氧设备"]) {
                        report.deviceTypeArr = [dict valueForKey:@"children"];
                    }
                }
            }
            [weakSelf.navigationController pushViewController:report animated:NO];
        } else if (code == 10011) {
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [self.navigationController popToRootViewControllerAnimated:NO];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)updateHRDevice {
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@0 forKey:@"offset"];
    NSInteger userId = [[self.latestInfoDict valueForKey:@"userId"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:self.selectedDeviceCode forKey:@"deviceCode"];
    [self changePrivateHrDevice:parameter];
}

- (void)changePrivateHrDevice:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_CHANGE_HR_DEVICE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSString *error = [responseObject valueForKey:@"error"];
        NSLog(@"bind device :%@ :%@",responseObject,error);
        if (code == 0) {
            [STTextHudTool showText:@"成功"];
        } else if (code == 10011) {
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [weakSelf.navigationController popToRootViewControllerAnimated:NO];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)checkMorePatientInfo:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USERINFO_MORE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"************** 1:%@**************",responseObject);
        if (code == 0) {
            NSArray *data = [responseObject valueForKey:@"data"];
            if (data.count == 0) {
                [STTextHudTool showText:@"已经到头了"];
                weakSelf.hasEnded = YES;
            } else {
                weakSelf.offset+=1;
                weakSelf.leftOffset = self.offset;
                [weakSelf.infoArr addObjectsFromArray:data];
                if (weakSelf.infoArr.count > 1) {
                    weakSelf.latestInfoDict = [weakSelf.infoArr lastObject];
                    [weakSelf configOlderInfoViewData:weakSelf.latestInfoDict];
                }
                NSLog(@"weakSelf.infoArr count is %d",weakSelf.infoArr.count);
            }
        } else if (code == 10011) {
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [weakSelf.navigationController popToRootViewControllerAnimated:NO];
        }  else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

//医师获取用户信息
- (void)doctorGetUserInfo:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USERINFO_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        if (code == 0) {
            NSDictionary *data = [responseObject valueForKey:@"data"];
            NSLog(@"data is :%@",data);
            PatientBaseInfoViewController *info = [[PatientBaseInfoViewController alloc] init];
            info.userInfo = data;
            [weakSelf.navigationController pushViewController:info animated:NO];
        } else if (code == 10011) {
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [weakSelf.navigationController popToRootViewControllerAnimated:NO];
        } else {
            NSString *msg = [responseObject valueForKey:@"msg"];
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

//获取设备类型列表
- (void)getDeviceTypeList:(NSMutableDictionary *)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDEVICE_TYPE_LIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************%@**************",responseObject);
        if (code == 0) {
            NSArray *data = [responseObject valueForKey:@"data"];
            weakSelf.deviceTypeArr = data;
        } else if (code == 10011) {
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [weakSelf.navigationController popToRootViewControllerAnimated:NO];
        }  else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

//医生查看用户设备测试结果
- (void)getUserDeviceMeasure:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USER_DEVICE_MEASURE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"*************医生查看用户设备测试结果 %@**************",[weakSelf convertToJSONData:responseObject]);
        if (code == 0) {
            NSArray *data = [responseObject valueForKey:@"data"];
            weakSelf.testResults = [data mutableCopy];
            [weakSelf.testResultListView reloadData];
            NSLog(@"testResults is :%@",[weakSelf convertToJSONData:weakSelf.testResults]);
        } else if (code == 10011) {
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [weakSelf.navigationController popToRootViewControllerAnimated:NO];
        }  else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}
@end
