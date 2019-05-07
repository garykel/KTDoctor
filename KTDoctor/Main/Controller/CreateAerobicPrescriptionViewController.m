//
//  CreateAerobicPrescriptionViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/23.
//  Copyright © 2019 dz. All rights reserved.
//

#import "CreateAerobicPrescriptionViewController.h"
#import "UserModel.h"
#import "LMJDropdownMenu.h"
#import "UnitTextField.h"
#import "UnitTextView.h"
#import "AerobicGroupCell.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 150
#define kLeftBtn_Width 21
#define kTopView_TopMargin 20
#define kTopView_BottomMargin 20
#define kTopView_LeftMargin 20
#define kTopView_Height 151
#define kDieaseLbl_Width 54
#define kDieaseLbl_Height 13
#define kDieaseLbl_TopMargin 18
#define kDieaseLbl_LeftMargin 15
#define kDieaseLbl_FontSieze 13.0
#define kDieaseLbl_RightMargin 11
#define kDieaseLbl_BottomMargin 22
#define kDieaseTF_Width 211
#define kDieaseTF_Height 19
#define kDieaseTF_BottomMargin 15
#define kTemplateMenu_Width 356
#define kWeekMenu_Width 160
#define kWeekMenu_RightMargin 15
#define kWeekLbl_Width 15
#define kRiskLevelLbl_LeftMargin 62
#define kRiskLevelLbl_Width 68
#define kTrainingPositionMenu_Width 131
#define kTrainingDeviceLbl_LeftMargin 131
#define kTrainingDeviceLbl_RightMargin 11
#define kTrainingDeviceMenu_Width 211
#define kDataView_TopMargin 1
#define kTrainingTimeLbl_LeftMargin 125
#define kTrainingTimeLbl_RightMargin 10
#define kTrainingTimeLbl_Width 80
#define kTrainingGroupLbl_Width 70
#define kTrainingTimeLbl_Height 13
#define kTrainingTimeLbl_FontSize 13.0
#define kTrainingTimeValLbl_Width 50
#define kTrainingTimeValLbl_Height 12
#define kTrainingTimeValLbl_FontSize 15.0
#define kTemplateButton_BottomMargin 15
#define kTemplateButton_Height 27
#define kTemplateButton_Width 144
#define kTemplateButton_FontSie 15.0
#define kPrescriptionLbl_Width 54
#define kPrescriptionLbl_Height 13
#define kPrescriptionLbl_FontSize 13.0
#define kPrescriptionLbl_TopMargin 20
#define kPrescriptionLbl_RightMargin 10
#define kPrescriptionTF_Width 276
#define kPrescriptionTF_Height 22
#define kPrescriptionTF_FontSize 12
#define kDoctorAdviceLbl_TopMargin 25
#define kDoctorAdviceTextview_TopMargin 15
#define kDoctorAdviceTextview_RightMargin 20
#define kDoctorAdviceTextview_Height 147
#define KPrescriptionBtn_Width 144
#define kPrescriptionBtn_Height 27
#define kPrescriptionBtn_TopMargin 30
#define kPrescriptionBtn_RightMargin 62
#define kPrescriptionBtn_FontSize 15
#define kBottomHeight 270
#define kScrollview_Height 930
#define kListView_TopMargin 20
#define kListView_LeftMargin 16
#define kListView_BottomMargin 83
#define kCell_Height 118

@interface CreateAerobicPrescriptionViewController ()<UIScrollViewDelegate,LMJDropdownMenuDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIScrollView *scrollview;
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UILabel *dieaseLbl;
@property (nonatomic,strong)UITextField *dieaseTF;
@property (nonatomic,strong)UILabel *riskLevelLbl;
@property (nonatomic,strong)UITextField *riskLevelTF;
@property (nonatomic,strong)UILabel *deviceTypeLbl;
@property (nonatomic,strong)UITextField *deviceTypeTF;
@property (nonatomic,strong)UILabel *trainingPositionLbl;
@property (nonatomic,strong)LMJDropdownMenu *trainingPositionMenu;
@property (nonatomic,strong)UILabel *trainingDeviceLbl;
@property (nonatomic,strong)LMJDropdownMenu *traingDeviceMenu;
@property (nonatomic,strong)UILabel *templateLbl;
@property (nonatomic,strong)LMJDropdownMenu *templateMenu;
@property (nonatomic,strong)UILabel *treatmentLbl;
@property (nonatomic,strong)LMJDropdownMenu *treatmentMenu;
@property (nonatomic,strong)UILabel *weekLbl;
@property (nonatomic,strong)UILabel *trainingFrequencyLbl;
@property (nonatomic,strong)LMJDropdownMenu *trainingFrequencyMenu;
@property (nonatomic,strong)UILabel *dayLbl;
@property (nonatomic,strong)UILabel *sportTimePointLbl;
@property (nonatomic,strong)LMJDropdownMenu *sportTimePointMenu;
@property (nonatomic,strong)UIView *listBgView;
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,strong)UIView *dataView;
@property (nonatomic,strong)UILabel *trainingGroupLbl;
@property (nonatomic,strong)UILabel *trainingGroupValLbl;
@property (nonatomic,strong)UILabel *trainingTimeLbl;
@property (nonatomic,strong)UILabel *trainingTimeValLbl;
@property (nonatomic,strong)UILabel *avgDifficultyLbl;
@property (nonatomic,strong)UILabel *avgDifficultyValLbl;
@property (nonatomic,strong)UIButton *templateBtn;
@property (nonatomic,strong)UIView *templateView;
@property (nonatomic,strong)UILabel *prescriptionLbl;
@property (nonatomic,strong)UnitTextField *prescriptionTF;
@property (nonatomic,strong)UILabel *doctorAdviceLbl;
@property (nonatomic,strong)UnitTextView *doctorAdviceView;
@property (nonatomic,strong)UIButton *createBtn;
@property (nonatomic,strong)UIButton *giveupBtn;
@property (nonatomic,strong)NSMutableArray *groups;
@property (nonatomic,strong)UserModel *user;
@property (nonatomic,strong)NSMutableArray *recommendArr;
@end

@implementation CreateAerobicPrescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    
    self.recommendArr = [NSMutableArray array];
    self.user = [[UserModel sharedUserModel] getCurrentUser];
    self.groups = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    
    
    [self setNavBar];
    [self setupUI];
    
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@0 forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    NSString *disease = [self.prescriptionDict valueForKey:@"disease"];
    [parameter setValue:disease forKey:@"disease"];
    [parameter setValue:@"" forKey:@"difficulty"];
    NSInteger riskLevel = [[self.prescriptionDict valueForKey:@"riskLevel"] integerValue];
    [parameter setValue:@(riskLevel) forKey:@"risk"];
    [parameter setValue:@1 forKey:@"type"];
    
    [self getRecommendTemplateList:parameter];
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
    self.titleLbl.text = @"开具有氧处方";
    [self.navView addSubview:self.titleLbl];
}

- (void)setupUI {
    self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(kTopView_LeftMargin * kXScal, CGRectGetMaxY(self.navView.frame), kWidth - 2 * kTopView_LeftMargin * kXScal, kHeight - CGRectGetMaxY(self.navView.frame))];
    self.scrollview.delegate = self;
    self.scrollview.contentSize = CGSizeMake(kWidth - 2 * kTopView_LeftMargin * kXScal, kScrollview_Height);
    self.scrollview.backgroundColor = [UIColor clearColor];
    self.scrollview.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollview];
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0,kTopView_TopMargin * kYScal, self.scrollview.frame.size.width, kTopView_Height * kYScal)];
    self.topView.layer.cornerRadius = 2;
    self.topView.layer.masksToBounds = YES;
    self.topView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    [self.scrollview addSubview:self.topView];
    
    self.dieaseLbl = [[UILabel alloc] initWithFrame:CGRectMake(kDieaseLbl_LeftMargin * kXScal, kDieaseLbl_TopMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.dieaseLbl.text = @"适用病症";
    self.dieaseLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.dieaseLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topView addSubview:self.dieaseLbl];
    
    self.dieaseTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, kDieaseTF_Width * kXScal, kDieaseTF_Height * kYScal)];
    self.dieaseTF.text = [self.prescriptionDict valueForKey:@"disease"];
    self.dieaseTF.backgroundColor = [UIColor whiteColor];
    self.dieaseTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.dieaseTF.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze];
    self.dieaseTF.center = CGPointMake(CGRectGetMaxX(self.dieaseLbl.frame) + kDieaseLbl_RightMargin * kXScal + kDieaseTF_Width * kXScal/2.0, self.dieaseLbl.center.y);
    self.deviceTypeTF.enabled = NO;
    [self.topView addSubview:self.dieaseTF];
    
    self.riskLevelLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dieaseTF.frame) + kRiskLevelLbl_LeftMargin * kXScal, self.dieaseLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.riskLevelLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.riskLevelLbl.text = @"风险等级";
    self.riskLevelLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topView addSubview:self.riskLevelLbl];
    
    self.riskLevelTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelLbl.frame) + kDieaseLbl_RightMargin * kXScal, self.dieaseTF.frame.origin.y, kDieaseTF_Width * kXScal, kDieaseTF_Height * kYScal)];
    NSInteger riskLevel = [[self.prescriptionDict valueForKey:@"riskLevel"] integerValue];
    NSString *riskLevelStr = @"低";
    if (riskLevel == 1) {
        riskLevelStr = @"低";
    } else if (riskLevel == 2) {
        riskLevelStr = @"中";
    } else if (riskLevel == 3) {
        riskLevelStr = @"高";
    }
    self.riskLevelTF.text = riskLevelStr;
    self.riskLevelTF.backgroundColor = [UIColor whiteColor];
    self.riskLevelTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.riskLevelTF.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.riskLevelTF.enabled = NO;
    [self.topView addSubview:self.riskLevelTF];
    
    self.deviceTypeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.dieaseLbl.frame.origin.x, CGRectGetMaxY(self.dieaseLbl.frame) + kDieaseLbl_BottomMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.deviceTypeLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.deviceTypeLbl.text = @"设备类型";
    self.deviceTypeLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topView addSubview:self.deviceTypeLbl];
    
    self.deviceTypeTF = [[UITextField alloc] initWithFrame:CGRectMake(self.dieaseTF.frame.origin.x, 0, kDieaseTF_Width * kXScal, kDieaseTF_Height * kYScal)];
    self.deviceTypeTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.deviceTypeTF.text = @"有氧设备";
    self.deviceTypeTF.backgroundColor = [UIColor whiteColor];
    self.deviceTypeTF.center = CGPointMake(CGRectGetMaxX(self.deviceTypeLbl.frame) + kDieaseLbl_RightMargin * kXScal + kDieaseTF_Width * kXScal/2.0, self.deviceTypeLbl.center.y);
    self.deviceTypeTF.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.deviceTypeTF.enabled = NO;
    [self.topView addSubview:self.deviceTypeTF];
    
    self.trainingPositionLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.riskLevelLbl.frame.origin.x, self.deviceTypeLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.trainingPositionLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.trainingPositionLbl.text = @"训练部位";
    self.trainingPositionLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topView addSubview:self.trainingPositionLbl];
    
    self.trainingPositionMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(kTopView_LeftMargin * kXScal + self.riskLevelTF.frame.origin.x,CGRectGetMaxY(self.navView.frame) + kTopView_TopMargin * kYScal + self.deviceTypeTF.frame.origin.y, kTrainingPositionMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.trainingPositionMenu setMenuTitles:@[@"心肺"] rowHeight:kDieaseTF_Height * kYScal attr:@{@"title":@"请选择",@"titleFont":[UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal],@"titleColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemFont":[UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal]}];
    self.trainingPositionMenu.delegate = self;
    self.trainingPositionMenu.tag = 10;
    [self.view addSubview:self.trainingPositionMenu];
    
    CGFloat trainingDeviceLbl_LeftMargin = self.topView.frame.size.width - kRiskLevelLbl_Width * kXScal - kDieaseLbl_RightMargin * kXScal -  kTrainingDeviceMenu_Width * kXScal - kTrainingDeviceLbl_RightMargin * kXScal;
    self.trainingDeviceLbl = [[UILabel alloc] initWithFrame:CGRectMake(trainingDeviceLbl_LeftMargin, self.deviceTypeLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.trainingDeviceLbl.text = @"训 练 设 备";
    self.trainingDeviceLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.trainingDeviceLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topView addSubview:self.trainingDeviceLbl];
    
    self.traingDeviceMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(kTopView_LeftMargin * kXScal + CGRectGetMaxX(self.trainingDeviceLbl.frame) + kTrainingDeviceLbl_RightMargin * kXScal, self.trainingPositionMenu.frame.origin.y, kTrainingDeviceMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.traingDeviceMenu setMenuTitles:@[@"功率车",@"椭圆机"] rowHeight:kDieaseTF_Height * kYScal attr:@{@"title":@"请选择",@"titleFone":[UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal],@"titleColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemFont":[UIFont systemFontOfSize:kDieaseLbl_FontSieze *kYScal]}];
    self.traingDeviceMenu.delegate = self;
    self.traingDeviceMenu.tag = 20;
    [self.view addSubview:self.traingDeviceMenu];
    
    self.templateLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.dieaseLbl.frame.origin.x, CGRectGetMaxY(self.deviceTypeLbl.frame) + kDieaseLbl_BottomMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.templateLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.templateLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.templateLbl.text = @"推荐模板";
    [self.topView addSubview:self.templateLbl];
    
    self.templateMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(kTopView_LeftMargin * kXScal + CGRectGetMaxX(self.templateLbl.frame) + kDieaseLbl_RightMargin * kXScal, CGRectGetMaxY(self.navView.frame) + kTopView_TopMargin * kYScal + CGRectGetMaxY(self.deviceTypeTF.frame) + kDieaseTF_BottomMargin * kYScal, kTemplateMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.templateMenu setMenuTitles:self.recommendArr rowHeight:kDieaseLbl_FontSieze * kYScal attr:@{@"title":@"请选择",@"titleFone":[UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal],@"titleColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemFont":[UIFont systemFontOfSize:kDieaseLbl_FontSieze *kYScal]}];
    self.templateMenu.delegate = self;
    self.templateMenu.tag = 30;
    [self.view addSubview:self.templateMenu];
    
    self.treatmentLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.dieaseLbl.frame.origin.x, CGRectGetMaxY(self.templateLbl.frame) + kDieaseLbl_BottomMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.treatmentLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.treatmentLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.treatmentLbl.text = @"疗程";
    [self.topView addSubview:self.treatmentLbl];
    
    self.treatmentMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(self.templateMenu.frame.origin.x, CGRectGetMaxY(self.templateMenu.frame) + kDieaseTF_BottomMargin * kYScal, kWeekMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.treatmentMenu setMenuTitles:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"] rowHeight:kDieaseLbl_FontSieze * kYScal attr:@{@"title":@"",@"titleFone":[UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal],@"titleColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemFont":[UIFont systemFontOfSize:kDieaseLbl_FontSieze *kYScal]}];
    self.treatmentMenu.delegate = self;
    self.treatmentMenu.tag = 40;
    [self.view addSubview:self.treatmentMenu];
    
    self.weekLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.treatmentLbl.frame) + kDieaseLbl_RightMargin * kXScal + kWeekMenu_Width + kWeekMenu_RightMargin * kXScal, self.treatmentLbl.frame.origin.y, kWeekLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.weekLbl.text = @"周";
    self.weekLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.weekLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topView addSubview:self.weekLbl];
    
    self.trainingFrequencyLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.riskLevelLbl.frame.origin.x, self.treatmentLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.trainingFrequencyLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.trainingFrequencyLbl.text = @"周训练频次";
    self.trainingFrequencyLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topView addSubview:self.trainingFrequencyLbl];
    
    self.dayLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingFrequencyLbl.frame) + kDieaseLbl_RightMargin * kXScal + kTrainingPositionMenu_Width * kXScal + kWeekMenu_RightMargin * kXScal, self.weekLbl.frame.origin.y, kWeekLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.dayLbl.text = @"周";
    self.dayLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.dayLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topView addSubview:self.dayLbl];
    
    self.trainingFrequencyMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(self.trainingPositionMenu.frame.origin.x, self.treatmentMenu.frame.origin.y, kTrainingPositionMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.trainingFrequencyMenu setMenuTitles:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7"] rowHeight:kDieaseLbl_FontSieze * kYScal attr:@{@"title":@"",@"titleFone":[UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal],@"titleColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemFont":[UIFont systemFontOfSize:kDieaseLbl_FontSieze *kYScal]}];
    self.trainingFrequencyMenu.delegate = self;
    self.trainingFrequencyMenu.tag = 50;
    [self.view addSubview:self.trainingFrequencyMenu];
    
    self.sportTimePointLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.trainingDeviceLbl.frame.origin.x, self.treatmentLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.sportTimePointLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.sportTimePointLbl.text = @"运动时间点";
    self.sportTimePointLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topView addSubview:self.sportTimePointLbl];
    
    self.sportTimePointMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(self.traingDeviceMenu.frame.origin.x, self.treatmentMenu.frame.origin.y, kTrainingDeviceMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.sportTimePointMenu setMenuTitles:@[@"任意",@"三餐前半小时",@"三餐后一小时"] rowHeight:kDieaseLbl_FontSieze * kYScal attr:@{@"title":@"",@"titleFone":[UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal],@"titleColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemFont":[UIFont systemFontOfSize:kDieaseLbl_FontSieze *kYScal]}];
    self.sportTimePointMenu.delegate = self;
    self.sportTimePointMenu.tag = 60;
    [self.view addSubview:self.sportTimePointMenu];
    
//    self.scrollview.contentSize = CGSizeMake(kWidth - 2 * kTopView_LeftMargin * kXScal, kScrollview_Height * kYScal);
    self.listBgView = [[UIView alloc] initWithFrame:CGRectMake(self.topView.frame.origin.x, CGRectGetMaxY(self.topView.frame) + kTopView_BottomMargin * kYScal, self.topView.frame.size.width, self.scrollview.contentSize.height - CGRectGetMaxY(self.topView.frame) - kTopView_BottomMargin * kYScal - kBottomHeight * kYScal)];
    self.listBgView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    [self.scrollview addSubview:self.listBgView];
    
    self.listView = [[UITableView alloc] initWithFrame:CGRectMake(kListView_LeftMargin * kXScal, kListView_TopMargin * kXScal, self.listBgView.frame.size.width - 2 * kListView_LeftMargin * kXScal, self.listBgView.frame.size.height - kListView_TopMargin * kYScal - kListView_BottomMargin * kYScal) style:UITableViewStylePlain];
    self.listView.dataSource = self;
    self.listView.delegate = self;
    self.listView.backgroundColor = [UIColor clearColor];
    self.listView.showsVerticalScrollIndicator = NO;
    [self.listBgView addSubview:self.listView];
    
    self.dataView = [[UIView alloc] initWithFrame:CGRectMake(self.listView.frame.origin.x, CGRectGetMaxY(self.listView.frame), self.listView.frame.size.width, kListView_BottomMargin * kYScal)];
    self.dataView.backgroundColor = [UIColor clearColor];
    [self.listBgView addSubview:self.dataView];
    
    self.trainingGroupLbl = [[UILabel alloc] initWithFrame:CGRectMake(kTrainingTimeLbl_LeftMargin * kXScal, kDataView_TopMargin * kYScal, kTrainingGroupLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.trainingGroupLbl.text = @"训练组数：";
    self.trainingGroupLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.trainingGroupLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.dataView addSubview:self.trainingGroupLbl];
    
    self.trainingGroupValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingGroupLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal, 0, kTrainingTimeValLbl_Width, kTrainingTimeValLbl_Height * kYScal)];
    self.trainingGroupValLbl.center = CGPointMake(CGRectGetMaxX(self.trainingGroupLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal + kTrainingTimeValLbl_Width * kXScal/2.0, self.trainingGroupLbl.center.y);
    self.trainingGroupValLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.trainingGroupValLbl.font = [UIFont systemFontOfSize:kTrainingTimeValLbl_FontSize * kYScal];
    self.trainingGroupValLbl.text = @"4";
    [self.dataView addSubview:self.trainingGroupValLbl];
    
    CGFloat space = (self.dataView.frame.size.width - 2 * kTrainingTimeLbl_LeftMargin * kXScal - 2 * kTrainingGroupLbl_Width * kXScal - kTrainingTimeLbl_Width * kXScal - 3 * kTrainingTimeLbl_RightMargin - 3 * kTrainingTimeValLbl_Width * kXScal)/2;
    
    self.trainingTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingGroupValLbl.frame) + space, 0, kTrainingTimeLbl_Width * kXScal, kTrainingTimeValLbl_Height * kYScal)];
    self.trainingTimeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.trainingTimeLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.trainingTimeLbl.text = @"训练总时长：";
    [self.dataView addSubview:self.trainingTimeLbl];
    
    self.trainingTimeValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingTimeLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal, 0, kTrainingTimeValLbl_Width, kTrainingTimeValLbl_Height * kYScal)];
    self.trainingTimeValLbl.center = CGPointMake(CGRectGetMaxX(self.trainingTimeLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal + kTrainingTimeValLbl_Width * kXScal/2.0, self.trainingTimeLbl.center.y);
    self.trainingTimeValLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.trainingTimeValLbl.font = [UIFont systemFontOfSize:kTrainingTimeValLbl_FontSize * kYScal];
    self.trainingTimeValLbl.text = @"24:24";
    [self.dataView addSubview:self.trainingTimeValLbl];
    
    self.avgDifficultyLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingTimeValLbl.frame) + space, 0, kTrainingGroupLbl_Width * kXScal, kTrainingTimeValLbl_Height * kYScal)];
    self.avgDifficultyLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.avgDifficultyLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.avgDifficultyLbl.text = @"平均强度：";
    [self.dataView addSubview:self.avgDifficultyLbl];
    
    self.avgDifficultyValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgDifficultyLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal, 0, kTrainingTimeValLbl_Width, kTrainingTimeValLbl_Height * kYScal)];
    self.avgDifficultyValLbl.center = CGPointMake(CGRectGetMaxX(self.avgDifficultyLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal + kTrainingTimeValLbl_Width * kXScal/2.0, self.avgDifficultyLbl.center.y);
    self.avgDifficultyValLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.avgDifficultyValLbl.font = [UIFont systemFontOfSize:kTrainingTimeValLbl_FontSize * kYScal];
    self.avgDifficultyValLbl.text = @"4";
    [self.dataView addSubview:self.avgDifficultyValLbl];
    
    self.templateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.templateBtn.frame = CGRectMake((self.dataView.frame.size.width - kTemplateButton_Width * kXScal)/2, self.dataView.frame.size.height - kTemplateButton_Height * kYScal - kTemplateButton_BottomMargin * kYScal, kTemplateButton_Width * kXScal, kTemplateButton_Height * kYScal);
    [self.templateBtn setTitle:@"保存为自定义模板" forState:UIControlStateNormal];
    [self.templateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.templateBtn.titleLabel setFont:[UIFont systemFontOfSize:kTemplateButton_FontSie]];
    self.templateBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.templateBtn addTarget:self action:@selector(saveAsCustomTemplate:) forControlEvents:UIControlEventTouchUpInside];
    [self.dataView addSubview:self.templateBtn];
    
    self.templateView = [[UIView alloc] initWithFrame:CGRectMake(self.listBgView.frame.origin.x, CGRectGetMaxY(self.listBgView.frame), self.listBgView.frame.size.width, kBottomHeight * kYScal)];
    self.templateView.backgroundColor = [UIColor clearColor];
    [self.scrollview addSubview:self.templateView];
    
    self.prescriptionLbl = [[UILabel alloc] initWithFrame:CGRectMake(0,kPrescriptionLbl_TopMargin * kYScal, kPrescriptionLbl_Width * kXScal, kPrescriptionLbl_Height * kYScal)];
    self.prescriptionLbl.text = @"处方名称";
    self.prescriptionLbl.font = [UIFont systemFontOfSize:kPrescriptionLbl_FontSize * kYScal];
    self.prescriptionLbl.textColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.templateView addSubview:self.prescriptionLbl];
    
    self.prescriptionTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.prescriptionLbl.frame) + kPrescriptionLbl_RightMargin * kXScal, 0, kPrescriptionTF_Width * kXScal, kPrescriptionTF_Height * kYScal)];
    self.prescriptionTF.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    self.prescriptionTF.font = [UIFont systemFontOfSize:kPrescriptionTF_FontSize * kYScal];
    self.prescriptionTF.unitLbl.text = @"0/20";
    self.prescriptionTF.center = CGPointMake(CGRectGetMaxX(self.prescriptionLbl.frame) + kPrescriptionLbl_RightMargin * kXScal + kPrescriptionTF_Width * kXScal/2.0, self.prescriptionLbl.center.y);
    [self.templateView addSubview:self.prescriptionTF];
    
    self.doctorAdviceLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.prescriptionLbl.frame.origin.x, CGRectGetMaxY(self.prescriptionLbl.frame) + kDoctorAdviceLbl_TopMargin * kYScal, kPrescriptionLbl_Width * kXScal, kPrescriptionLbl_Height * kYScal)];
    self.doctorAdviceLbl.text = @"医       嘱";
    self.doctorAdviceLbl.font = [UIFont systemFontOfSize:kPrescriptionLbl_FontSize * kYScal];
    self.doctorAdviceLbl.textColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.templateView addSubview:self.doctorAdviceLbl];
    
    self.doctorAdviceView = [[UnitTextView alloc] initWithFrame:CGRectMake(self.prescriptionTF.frame.origin.x, CGRectGetMaxY(self.prescriptionTF.frame) + kDoctorAdviceTextview_TopMargin * kYScal, self.scrollview.frame.size.width - CGRectGetMaxX(self.doctorAdviceLbl.frame) - kPrescriptionLbl_RightMargin * kXScal, kDoctorAdviceTextview_Height * kYScal) textContainer:nil];
    self.doctorAdviceView.backgroundColor = [UIColor colorWithHexString:@"DBF2F7"];
    self.doctorAdviceView.textColor = [UIColor blackColor];
    self.doctorAdviceView.unitLbl.text = @"0/200";
    self.doctorAdviceView.font = [UIFont systemFontOfSize:kPrescriptionTF_FontSize * kYScal];
    [self.templateView addSubview:self.doctorAdviceView];
    
    CGFloat left = (self.scrollview.frame.size.width - 2 * KPrescriptionBtn_Width * kXScal - kPrescriptionBtn_RightMargin * kXScal)/2.0;
    self.createBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.createBtn.frame = CGRectMake(left, CGRectGetMaxY(self.doctorAdviceView.frame) + kPrescriptionBtn_TopMargin * kYScal, KPrescriptionBtn_Width * kXScal, kPrescriptionBtn_Height * kYScal);
    [self.createBtn setTitle:@"开具处方" forState:UIControlStateNormal];
    [self.createBtn.titleLabel setFont:[UIFont systemFontOfSize:kPrescriptionBtn_FontSize * kYScal]];
    [self.createBtn addTarget:self action:@selector(createPrescription:) forControlEvents:UIControlEventTouchUpInside];
    self.createBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.templateView addSubview:self.createBtn];
    
    self.giveupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.giveupBtn.frame = CGRectMake(CGRectGetMaxX(self.createBtn.frame) + kPrescriptionBtn_RightMargin * kXScal, self.createBtn.frame.origin.y, KPrescriptionBtn_Width * kXScal, kPrescriptionBtn_Height * kYScal);
    self.giveupBtn.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.giveupBtn setTitle:@"放弃" forState:UIControlStateNormal];
    [self.giveupBtn.titleLabel setFont:[UIFont systemFontOfSize:kPrescriptionBtn_FontSize * kYScal]];
    [self.giveupBtn addTarget:self action:@selector(giveup:) forControlEvents:UIControlEventTouchUpInside];
    [self.giveupBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.templateView addSubview:self.giveupBtn];
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)saveAsCustomTemplate:(UIButton*)sender {
    NSLog(@"保存为自定义模板");
}

- (void)createPrescription:(UIButton*)sender {
    NSLog(@"开具处方");
}

- (void)giveup:(UIButton*)sender {
    NSLog(@"放弃");
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCell_Height * kYScal;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseCellIdStr = [NSString stringWithFormat:@"AerobicGroupCell%ld%ld",(long)indexPath.section,(long)indexPath.row];
    AerobicGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellIdStr];
    if (cell == nil) {
        cell = [[AerobicGroupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellIdStr];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    }
    cell.groupNameLbl.text = [NSString stringWithFormat:@"第%d组",indexPath.section + 1];
    [cell.addBtn addTarget:self action:@selector(addGroup:) forControlEvents:UIControlEventTouchUpInside];
    cell.addBtn.tag = 10000 + indexPath.section;
    cell.removeBtn.tag = 20000 + indexPath.section;
    [cell.removeBtn addTarget:self action:@selector(removeGroup:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark - button click events
- (void)addGroup:(UIButton*)sender {
    NSLog(@"增加行");
}

- (void)removeGroup:(UIButton*)sender {
    NSLog(@"移除行");
}

#pragma mark - network functions
- (void)getTemplateList:(NSMutableDictionary*)parameter {
    
}

- (void)getRecommendTemplateList:(NSMutableDictionary*)parameter{
    
    kWeakSelf(self);
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_TEMPLATE_RECOMMEND_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"*********获取推荐处方模板*****%@**************",responseObject);
        if (code == 0) {
            NSArray *rows = [responseObject valueForKey:@"rows"];
            NSLog(@"rows is :%@",rows);
            if (rows.count > 0) {
                for (NSDictionary *dict in rows) {
                    NSInteger type = [[dict valueForKey:@"type"] integerValue];
                    NSArray *typeList = [dict valueForKey:@"typeList"];
                    if (typeList.count > 0) {
                        for (NSDictionary *typeDict in typeList) {
                            NSInteger id = [[typeDict valueForKey:@"id"] integerValue];
                            NSString *name = [typeDict valueForKey:@"name"];
                            if ([name isEqualToString:self.traingDeviceMenu.mainBtn.titleLabel.text]) {
                                [weakself.recommendArr addObject:[dict valueForKey:@"title"]];
                            }
                        }
                    }
                }
            }
            [weakself.templateMenu setMenuTitles:self.recommendArr rowHeight:kDieaseLbl_FontSieze * kYScal attr:@{@"title":@"请选择",@"titleFone":[UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal],@"titleColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemColor":[UIColor colorWithHexString:@"#A5A5A5"],@"itemFont":[UIFont systemFontOfSize:kDieaseLbl_FontSieze *kYScal]}];
        } else if (code == 10011) {
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [weakself.navigationController popToRootViewControllerAnimated:NO];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)createPrescriptions:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_PRESCRIPTION_CREATE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************%@**************",responseObject);
        if (code == 0) {
            [STTextHudTool showText:@"开具处方成功"];
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
@end
