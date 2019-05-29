//
//  CreatePowerPrescriptionViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/5/8.
//  Copyright © 2019 dz. All rights reserved.
//

#import "CreatePowerPrescriptionViewController.h"
#import "UserModel.h"
#import "KTDropDownMenus.h"
#import "UnitTextField.h"
#import "UnitTextView.h"
#import "AerobicGroupCell.h"
#import "StrengthTemplateCell.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 150
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
#define kDropdownHeight 30
#define kDieaseTF_BottomMargin 15
#define kTemplateMenu_Width 356
#define kWeekMenu_Width 160
#define kWeekMenu_RightMargin 15
#define kWeekLbl_Width 15
#define kRiskLevelLbl_LeftMargin 62
#define kRiskLevelLbl_Width 68
#define kTrainingPositionMenu_Width 131
#define kTrainingDeviceLbl_RightMargin 11
#define kTrainingDeviceMenu_Width 211
#define kDataView_Height 98
#define kTrainingTimeLbl_LeftMargin 140
#define kTrainingTimeLbl_RightMargin 10
#define kTrainingTimeLbl_Width 80
#define kTrainingGroupLbl_Width 70
#define kTrainingGroupLbl_TopMargin 16
#define kTrainingTimeValLbl_Width 100
#define kTrainingTimeValLbl_Height 15
#define kTrainingTimeValLbl_FontSize 15.0
#define kTemplateButton_BottomMargin 15
#define kTemplateButton_Height 27
#define kTemplateButton_Width 144
#define kTemplateButton_FontSie 15.0
#define kPrescriptionLbl_Width 54
#define kPrescriptionLbl_Height 13
#define kPrescriptionLbl_FontSize 13.0
#define kPrescriptionLbl_TopMargin 20 //处方名称topmargin
#define kPrescriptionLbl_RightMargin 10
#define kPrescriptionTF_Width 276
#define kPrescriptionTF_Height 22
#define kPrescriptionTF_FontSize 12
#define kDoctorAdviceLbl_TopMargin 25 //医嘱topmargin
#define kDoctorAdviceTextview_TopMargin 15 //医嘱内容top margin
#define kDoctorAdviceTextview_Height 147
#define KPrescriptionBtn_Width 144
#define kPrescriptionBtn_Height 27
#define kPrescriptionBtn_TopMargin 30
#define kPrescriptionBtn_RightMargin 62
#define kPrescriptionBtn_FontSize 15
#define kFooterView_Height 368
#define kCell_Height 118

@interface CreatePowerPrescriptionViewController ()<UIScrollViewDelegate,XXTGDropdownMenuDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UIView *topBgView;//顶部视图蓝色背景
@property (nonatomic,strong)UIView *bottomView;//底部视图
@property (nonatomic,strong)UILabel *dieaseLbl;
@property (nonatomic,strong)UITextField *dieaseTF;
@property (nonatomic,strong)UILabel *riskLevelLbl;
@property (nonatomic,strong)UITextField *riskLevelTF;
@property (nonatomic,strong)UILabel *deviceTypeLbl;
@property (nonatomic,strong)UITextField *deviceTypeTF;
@property (nonatomic,strong)UILabel *trainingPositionLbl;
@property (nonatomic,strong)KTDropDownMenus *trainingPositionMenu;
@property (nonatomic,strong)UILabel *trainingDeviceLbl;
@property (nonatomic,strong)KTDropDownMenus *traingDeviceMenu;
@property (nonatomic,strong)UILabel *templateLbl;
@property (nonatomic,strong)KTDropDownMenus *templateMenu;
@property (nonatomic,strong)UILabel *treatmentLbl;
@property (nonatomic,strong)KTDropDownMenus *treatmentMenu;
@property (nonatomic,strong)UILabel *weekLbl;
@property (nonatomic,strong)UILabel *trainingFrequencyLbl;
@property (nonatomic,strong)KTDropDownMenus *trainingFrequencyMenu;
@property (nonatomic,strong)UILabel *dayLbl;
@property (nonatomic,strong)UILabel *sportTimePointLbl;
@property (nonatomic,strong)KTDropDownMenus *sportTimePointMenu;
@property (nonatomic,strong)UIView *listBgView;
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,strong)UIView *dataView;
@property (nonatomic,strong)UILabel *trainingGroupLbl;
@property (nonatomic,strong)UILabel *trainingGroupValLbl;
@property (nonatomic,strong)UILabel *trainingVolumeLbl;//训练总量
@property (nonatomic,strong)UILabel *trainingVolumeValLbl;
@property (nonatomic,strong)UIButton *templateBtn;
@property (nonatomic,strong)UIView *templateView;
@property (nonatomic,strong)UILabel *prescriptionLbl;
@property (nonatomic,strong)UnitTextField *prescriptionTF;
@property (nonatomic,strong)UILabel *doctorAdviceLbl;
@property (nonatomic,strong)UnitTextView *doctorAdviceView;
@property (nonatomic,strong)UIButton *createBtn;
@property (nonatomic,strong)UIButton *giveupBtn;
@property (nonatomic,strong)NSMutableArray *groups;
@property (nonatomic,strong)NSMutableArray *equipIds;
@property (nonatomic,assign)CGFloat targetDuration;
@property (nonatomic,strong)UserModel *user;
@property (nonatomic,strong)NSMutableArray *recommendArr;
@property (nonatomic,assign)NSInteger selectedTemplateIndex;
@property (nonatomic,assign)NSDictionary *selectedTemplateDict;
@property (nonatomic,strong)NSArray *totalTemplateArr;//获取到的所有的推荐模板
@property (nonatomic,strong)NSMutableArray *recommendTemplateArr;//满足条件的推荐模板
@property (nonatomic,assign)NSInteger type;
@property (nonatomic,strong)NSMutableArray *sections;
@property (nonatomic,assign)NSInteger treatmentPeriod;
@property (nonatomic,assign)NSInteger daysPerWeek;
@property (nonatomic,assign)NSInteger timing;
@end

@implementation CreatePowerPrescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(computeWeight) name:@"ComputeWeightNotification" object:nil];
    self.recommendArr = [NSMutableArray array];
    self.recommendTemplateArr = [NSMutableArray array];
    self.selectedTemplateIndex = -1;
    self.user = [[UserModel sharedUserModel] getCurrentUser];
    self.groups = [NSMutableArray array];
    self.equipIds = [NSMutableArray array];
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

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    self.titleLbl.text = @"开具力量处方";
    [self.navView addSubview:self.titleLbl];
}

- (void)setupUI {
    self.listView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWidth, kHeight - CGRectGetMaxY(self.navView.frame)) style:UITableViewStylePlain];
    self.listView.backgroundColor = [UIColor clearColor];
    self.listView.delegate = self;
    self.listView.dataSource = self;
    self.listView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.listView];
    
    self.listView.estimatedRowHeight = 0;
    self.listView.estimatedSectionHeaderHeight = 0;
    self.listView.estimatedSectionFooterHeight = 0;
    
    if (@available(iOS 11.0, *)) {
        self.listView.contentInsetAdjustmentBehavior= UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }if (@available(iOS 11.0, *)) {
        self.listView.contentInsetAdjustmentBehavior= UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    [self configHeaderview];
    [self configFooterview];
    self.listView.tableHeaderView = self.topView;
    self.listView.tableFooterView = self.bottomView;
}

- (void)configHeaderview {
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, (kTopView_Height + kTopView_TopMargin + kTopView_BottomMargin) * kYScal)];
    self.topView.backgroundColor = [UIColor whiteColor];
    
    self.topBgView = [[UIView alloc] initWithFrame:CGRectMake(kTopView_LeftMargin * kXScal, kTopView_TopMargin * kYScal, kWidth - 2 * kTopView_LeftMargin * kXScal, kTopView_Height * kYScal)];
    self.topBgView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    [self.topView addSubview:self.topBgView];
    
    self.dieaseLbl = [[UILabel alloc] initWithFrame:CGRectMake(kDieaseLbl_LeftMargin * kXScal, kDieaseLbl_TopMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.dieaseLbl.text = @"适用病症";
    self.dieaseLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.dieaseLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.dieaseLbl];
    
    self.dieaseTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, kDieaseTF_Width * kXScal, kDieaseTF_Height * kYScal)];
    self.dieaseTF.text = [self.prescriptionDict valueForKey:@"disease"];
    self.dieaseTF.backgroundColor = [UIColor whiteColor];
    self.dieaseTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.dieaseTF.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze];
    self.dieaseTF.center = CGPointMake(CGRectGetMaxX(self.dieaseLbl.frame) + kDieaseLbl_RightMargin * kXScal + kDieaseTF_Width * kXScal/2.0, self.dieaseLbl.center.y);
    self.deviceTypeTF.enabled = NO;
    [self.topBgView addSubview:self.dieaseTF];
    
    self.riskLevelLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dieaseTF.frame) + kRiskLevelLbl_LeftMargin * kXScal, self.dieaseLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.riskLevelLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.riskLevelLbl.text = @"风险等级";
    self.riskLevelLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.riskLevelLbl];
    
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
    [self.topBgView addSubview:self.riskLevelTF];
    
    self.deviceTypeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.dieaseLbl.frame.origin.x, CGRectGetMaxY(self.dieaseLbl.frame) + kDieaseLbl_BottomMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.deviceTypeLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.deviceTypeLbl.text = @"设备类型";
    self.deviceTypeLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.deviceTypeLbl];
    
    self.deviceTypeTF = [[UITextField alloc] initWithFrame:CGRectMake(self.dieaseTF.frame.origin.x, 0, kDieaseTF_Width * kXScal, kDieaseTF_Height * kYScal)];
    self.deviceTypeTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.deviceTypeTF.text = @"力量设备";
    self.deviceTypeTF.backgroundColor = [UIColor whiteColor];
    self.deviceTypeTF.center = CGPointMake(CGRectGetMaxX(self.deviceTypeLbl.frame) + kDieaseLbl_RightMargin * kXScal + kDieaseTF_Width * kXScal/2.0, self.deviceTypeLbl.center.y);
    self.deviceTypeTF.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.deviceTypeTF.enabled = NO;
    [self.topBgView addSubview:self.deviceTypeTF];
    
    self.trainingPositionLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.riskLevelLbl.frame.origin.x, self.deviceTypeLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.trainingPositionLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.trainingPositionLbl.text = @"训练部位";
    self.trainingPositionLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.trainingPositionLbl];
    
    self.trainingPositionMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake( self.riskLevelTF.frame.origin.x,self.deviceTypeTF.frame.origin.y, kTrainingPositionMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.trainingPositionMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.trainingPositionMenu.defualtStr = @"请选择";
    NSMutableArray *positions = [NSMutableArray array];
    if (self.deviceTypeArr.count > 0) {
        for (NSDictionary *dict in self.deviceTypeArr) {
            [positions addObject:[dict valueForKey:@"name"]];
        }
    }
    self.trainingPositionMenu.titles = [positions copy];
    self.trainingPositionMenu.delegate = self;
    self.trainingPositionMenu.tag = 10;
    [self.topBgView addSubview:self.trainingPositionMenu];
    
    CGFloat trainingDeviceLbl_LeftMargin = self.topBgView.frame.size.width - kRiskLevelLbl_Width * kXScal - kDieaseLbl_RightMargin * kXScal -  kTrainingDeviceMenu_Width * kXScal - kTrainingDeviceLbl_RightMargin * kXScal;
    self.trainingDeviceLbl = [[UILabel alloc] initWithFrame:CGRectMake(trainingDeviceLbl_LeftMargin, self.deviceTypeLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.trainingDeviceLbl.text = @"训 练 设 备";
    self.trainingDeviceLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.trainingDeviceLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topBgView addSubview:self.trainingDeviceLbl];
    
    self.traingDeviceMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingDeviceLbl.frame) + kTrainingDeviceLbl_RightMargin * kXScal, self.trainingPositionMenu.frame.origin.y, kTrainingDeviceMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.traingDeviceMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.traingDeviceMenu.defualtStr = @"请选择";
    self.traingDeviceMenu.delegate = self;
    NSMutableArray *trainingEquipMentArr = [NSMutableArray array];
    if (self.deviceTypeArr.count > 0) {
        for (NSDictionary *dict1 in self.deviceTypeArr) {
            NSArray *children = [dict1 valueForKey:@"children"];
            if (children.count > 0) {
                for (NSDictionary *child in children) {
                    [trainingEquipMentArr addObject:[child valueForKey:@"name"]];
                }
            }
        }
    }
    self.traingDeviceMenu.titles = [trainingEquipMentArr copy];
    self.traingDeviceMenu.delegate = self;
    self.traingDeviceMenu.tag = 20;
    [self.topBgView addSubview:self.traingDeviceMenu];
    
    self.templateLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.dieaseLbl.frame.origin.x, CGRectGetMaxY(self.deviceTypeLbl.frame) + kDieaseLbl_BottomMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.templateLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.templateLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.templateLbl.text = @"推荐模板";
    [self.topBgView addSubview:self.templateLbl];
    
    self.templateMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.templateLbl.frame) + kDieaseLbl_RightMargin * kXScal, 0, kTemplateMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.templateMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.templateMenu.defualtStr = @"请选择";
    self.templateMenu.delegate = self;
    self.templateMenu.titles = self.recommendArr;
    self.templateMenu.center = CGPointMake(CGRectGetMaxX(self.templateLbl.frame) + kDieaseLbl_RightMargin * kXScal + kTemplateMenu_Width * kXScal/2.0, self.templateLbl.center.y);
    self.templateMenu.delegate = self;
    self.templateMenu.tag = 30;
    [self.topBgView addSubview:self.templateMenu];
    
    self.treatmentLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.dieaseLbl.frame.origin.x, CGRectGetMaxY(self.templateLbl.frame) + kDieaseLbl_BottomMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.treatmentLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.treatmentLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.treatmentLbl.text = @"疗程";
    [self.topBgView addSubview:self.treatmentLbl];
    
    self.treatmentMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.templateMenu.frame.origin.x, CGRectGetMaxY(self.templateMenu.frame) + kDieaseTF_BottomMargin * kYScal, kWeekMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.treatmentMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.treatmentMenu.defualtStr = @"请选择";
    self.treatmentMenu.delegate = self;
    self.treatmentMenu.titles = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    self.treatmentMenu.delegate = self;
    self.treatmentMenu.tag = 40;
    [self.topBgView addSubview:self.treatmentMenu];
    
    self.weekLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.treatmentLbl.frame) + kDieaseLbl_RightMargin * kXScal + kWeekMenu_Width * kXScal + kWeekMenu_RightMargin * kXScal, self.treatmentLbl.frame.origin.y, kWeekLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.weekLbl.text = @"周";
    self.weekLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.weekLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topBgView addSubview:self.weekLbl];
    
    self.trainingFrequencyLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.riskLevelLbl.frame.origin.x, self.treatmentLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.trainingFrequencyLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.trainingFrequencyLbl.text = @"周训练频次";
    self.trainingFrequencyLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.trainingFrequencyLbl];
    
    self.dayLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingFrequencyLbl.frame) + kDieaseLbl_RightMargin * kXScal + kTrainingPositionMenu_Width * kXScal + kWeekMenu_RightMargin * kXScal, self.weekLbl.frame.origin.y, kWeekLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.dayLbl.text = @"天";
    self.dayLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.dayLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topBgView addSubview:self.dayLbl];
    
    self.trainingFrequencyMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.trainingPositionMenu.frame.origin.x, self.treatmentMenu.frame.origin.y, kTrainingPositionMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.trainingFrequencyMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.trainingFrequencyMenu.defualtStr = @"请选择";
    self.trainingFrequencyMenu.delegate = self;
    self.trainingFrequencyMenu.titles = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    self.trainingFrequencyMenu.delegate = self;
    self.trainingFrequencyMenu.tag = 50;
    [self.topBgView addSubview:self.trainingFrequencyMenu];
    
    self.sportTimePointLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.trainingDeviceLbl.frame.origin.x, self.treatmentLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.sportTimePointLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.sportTimePointLbl.text = @"运动时间点";
    self.sportTimePointLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.sportTimePointLbl];
    
    self.sportTimePointMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.traingDeviceMenu.frame.origin.x, self.treatmentMenu.frame.origin.y, kTrainingDeviceMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.sportTimePointMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.sportTimePointMenu.defualtStr = @"请选择";
    self.sportTimePointMenu.delegate = self;
    self.sportTimePointMenu.titles = @[@"任意",@"三餐前半小时",@"三餐后一小时"];
    self.sportTimePointMenu.delegate = self;
    self.sportTimePointMenu.tag = 60;
    [self.topBgView addSubview:self.sportTimePointMenu];
}

- (void)configFooterview {
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kFooterView_Height * kYScal)];
    self.bottomView.backgroundColor = [UIColor whiteColor];
    
    self.dataView = [[UIView alloc] initWithFrame:CGRectMake(kTopView_LeftMargin * kXScal, 0, self.topBgView.frame.size.width, kDataView_Height * kYScal)];
    self.dataView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    [self.bottomView addSubview:self.dataView];
    
    self.trainingGroupLbl = [[UILabel alloc] initWithFrame:CGRectMake(kTrainingTimeLbl_LeftMargin * kXScal, kTrainingGroupLbl_TopMargin * kYScal, kTrainingGroupLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.trainingGroupLbl.text = @"训练组数：";
    self.trainingGroupLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.trainingGroupLbl.textColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.dataView addSubview:self.trainingGroupLbl];
    
    self.trainingGroupValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingGroupLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal, 0, kTrainingTimeValLbl_Width, kTrainingTimeValLbl_Height * kYScal)];
    self.trainingGroupValLbl.center = CGPointMake(CGRectGetMaxX(self.trainingGroupLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal + kTrainingTimeValLbl_Width * kXScal/2.0, self.trainingGroupLbl.center.y);
    self.trainingGroupValLbl.textColor = [UIColor colorWithHexString:@"#0FAAC9"];
    self.trainingGroupValLbl.font = [UIFont systemFontOfSize:kTrainingTimeValLbl_FontSize * kYScal];
    self.trainingGroupValLbl.text = @"0";
    [self.dataView addSubview:self.trainingGroupValLbl];
    
    CGFloat space = (self.dataView.frame.size.width - 2 * kTrainingTimeLbl_LeftMargin * kXScal - 2 * kTrainingGroupLbl_Width * kXScal - kTrainingTimeLbl_Width * kXScal - 3 * kTrainingTimeLbl_RightMargin - 3 * kTrainingTimeValLbl_Width * kXScal)/2;
    
    self.trainingVolumeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingGroupValLbl.frame) + space, self.trainingGroupLbl.frame.origin.y, kTrainingTimeLbl_Width * kXScal, kTrainingTimeValLbl_Height * kYScal)];
    self.trainingVolumeLbl.textColor = [UIColor colorWithHexString:@"#0FAAC9"];
    self.trainingVolumeLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.trainingVolumeLbl.text = @"训练总量：";
    [self.dataView addSubview:self.trainingVolumeLbl];
    
    self.trainingVolumeValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingVolumeLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal, 0, kTrainingTimeValLbl_Width, kTrainingTimeValLbl_Height * kYScal)];
    self.trainingVolumeValLbl.center = CGPointMake(CGRectGetMaxX(self.trainingVolumeLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal + kTrainingTimeValLbl_Width * kXScal/2.0, self.trainingVolumeLbl.center.y);
    self.trainingVolumeValLbl.textColor = [UIColor colorWithHexString:@"#0FAAC9"];
    self.trainingVolumeValLbl.font = [UIFont systemFontOfSize:kTrainingTimeValLbl_FontSize * kYScal];
    self.trainingVolumeValLbl.text = @"0.00 kg";
    [self.dataView addSubview:self.trainingVolumeValLbl];
    
    self.templateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.templateBtn.frame = CGRectMake((self.dataView.frame.size.width - kTemplateButton_Width * kXScal)/2, self.dataView.frame.size.height - kTemplateButton_Height * kYScal - kTemplateButton_BottomMargin * kYScal, kTemplateButton_Width * kXScal, kTemplateButton_Height * kYScal);
    [self.templateBtn setTitle:@"保存为自定义模板" forState:UIControlStateNormal];
    [self.templateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.templateBtn.titleLabel setFont:[UIFont systemFontOfSize:kTemplateButton_FontSie]];
    self.templateBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.templateBtn addTarget:self action:@selector(saveAsCustomTemplate:) forControlEvents:UIControlEventTouchUpInside];
    [self.dataView addSubview:self.templateBtn];
    
    //处方名称
    self.prescriptionLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.dataView.frame.origin.x,CGRectGetMaxY(self.dataView.frame) + kPrescriptionLbl_TopMargin * kYScal, kPrescriptionLbl_Width * kXScal, kPrescriptionLbl_Height * kYScal)];
    self.prescriptionLbl.text = @"处方名称";
    self.prescriptionLbl.font = [UIFont systemFontOfSize:kPrescriptionLbl_FontSize * kYScal];
    self.prescriptionLbl.textColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.bottomView addSubview:self.prescriptionLbl];
    
    self.prescriptionTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.prescriptionLbl.frame) + kPrescriptionLbl_RightMargin * kXScal, 0, kPrescriptionTF_Width * kXScal, kPrescriptionTF_Height * kYScal)];
    self.prescriptionTF.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    self.prescriptionTF.font = [UIFont systemFontOfSize:kPrescriptionTF_FontSize * kYScal];
    self.prescriptionTF.unitLbl.text = @"0/20";
    self.prescriptionTF.center = CGPointMake(CGRectGetMaxX(self.prescriptionLbl.frame) + kPrescriptionLbl_RightMargin * kXScal + kPrescriptionTF_Width * kXScal/2.0, self.prescriptionLbl.center.y);
    [self.bottomView addSubview:self.prescriptionTF];
    
    self.doctorAdviceLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.prescriptionLbl.frame.origin.x, CGRectGetMaxY(self.prescriptionLbl.frame) + kDoctorAdviceLbl_TopMargin * kYScal, kPrescriptionLbl_Width * kXScal, kPrescriptionLbl_Height * kYScal)];
    self.doctorAdviceLbl.text = @"医       嘱";
    self.doctorAdviceLbl.font = [UIFont systemFontOfSize:kPrescriptionLbl_FontSize * kYScal];
    self.doctorAdviceLbl.textColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.bottomView addSubview:self.doctorAdviceLbl];
    
    self.doctorAdviceView = [[UnitTextView alloc] initWithFrame:CGRectMake(self.prescriptionTF.frame.origin.x, CGRectGetMaxY(self.prescriptionTF.frame) + kDoctorAdviceTextview_TopMargin * kYScal, kWidth - CGRectGetMaxX(self.doctorAdviceLbl.frame) - kPrescriptionLbl_RightMargin * kXScal - kTopView_LeftMargin * kXScal, kDoctorAdviceTextview_Height * kYScal) textContainer:nil];
    self.doctorAdviceView.backgroundColor = [UIColor colorWithHexString:@"DBF2F7"];
    self.doctorAdviceView.textColor = [UIColor blackColor];
    self.doctorAdviceView.unitLbl.text = @"0/200";
    self.doctorAdviceView.font = [UIFont systemFontOfSize:kPrescriptionTF_FontSize * kYScal];
    [self.bottomView addSubview:self.doctorAdviceView];
    
    CGFloat left = (kWidth - 2 * KPrescriptionBtn_Width * kXScal - kPrescriptionBtn_RightMargin * kXScal)/2.0;
    self.createBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.createBtn.frame = CGRectMake(left, CGRectGetMaxY(self.doctorAdviceView.frame) + kPrescriptionBtn_TopMargin * kYScal, KPrescriptionBtn_Width * kXScal, kPrescriptionBtn_Height * kYScal);
    [self.createBtn setTitle:@"开具处方" forState:UIControlStateNormal];
    [self.createBtn.titleLabel setFont:[UIFont systemFontOfSize:kPrescriptionBtn_FontSize * kYScal]];
    [self.createBtn addTarget:self action:@selector(createPrescription:) forControlEvents:UIControlEventTouchUpInside];
    self.createBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.bottomView addSubview:self.createBtn];
    
    self.giveupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.giveupBtn.frame = CGRectMake(CGRectGetMaxX(self.createBtn.frame) + kPrescriptionBtn_RightMargin * kXScal, self.createBtn.frame.origin.y, KPrescriptionBtn_Width * kXScal, kPrescriptionBtn_Height * kYScal);
    self.giveupBtn.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.giveupBtn setTitle:@"放弃" forState:UIControlStateNormal];
    [self.giveupBtn.titleLabel setFont:[UIFont systemFontOfSize:kPrescriptionBtn_FontSize * kYScal]];
    [self.giveupBtn addTarget:self action:@selector(giveup:) forControlEvents:UIControlEventTouchUpInside];
    [self.giveupBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.bottomView addSubview:self.giveupBtn];
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
    NSString *reuseCellIdStr = [NSString stringWithFormat:@"StrengthTemplateCell%ld%ld",(long)indexPath.section,(long)indexPath.row];
    StrengthTemplateCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellIdStr];
    if (cell == nil) {
        cell = [[StrengthTemplateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellIdStr];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.groupNameLbl.text = [NSString stringWithFormat:@"第%d组",indexPath.section + 1];
    [cell.addBtn addTarget:self action:@selector(addGroup:) forControlEvents:UIControlEventTouchUpInside];
    cell.addBtn.tag = 10000 + indexPath.section;
    cell.removeBtn.tag = 20000 + indexPath.section;
    [cell.removeBtn addTarget:self action:@selector(removeGroup:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)saveAsCustomTemplate:(UIButton*)sender {
    __weak typeof (self)weakself = self;
    if([self.trainingPositionMenu.mainBtn.titleLabel.text isEqualToString:@""] ||[self.trainingPositionMenu.mainBtn.titleLabel.text isEqualToString:@"请选择"]) {
        [STTextHudTool showText:@"请选择训练部位"];
    }else if([self.traingDeviceMenu.mainBtn.titleLabel.text isEqualToString:@""] ||[self.traingDeviceMenu.mainBtn.titleLabel.text isEqualToString:@"请选择"]) {
        [STTextHudTool showText:@"请选择训练设备"];
    }else if(self.trainingFrequencyMenu.mainBtn.titleLabel.text.length == 0 ||[self.trainingFrequencyMenu.mainBtn.titleLabel.text isEqualToString:@"请选择"]) {
        [STTextHudTool showText:@"请选择每周训练几天"];
    }else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"自定义模板名称" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UITextField *nameTF = alertController.textFields.firstObject;
            if (nameTF.text.length == 0) {
                [STTextHudTool showText:@"名字不能为空"];
                [weakself presentViewController:alertController animated:YES completion:nil];
            } else {
                NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
                NSDictionary *dict = self.user.organ;
                NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
                NSString *orgCode = orgCodeArr[0];
                [parameter setValue:orgCode forKey:@"orgCode"];
                [parameter setValue:@(weakself.type) forKey:@"type"]; //类型
                [parameter setValue:nameTF.text forKey:@"title"];
                NSString *disease = [self.prescriptionDict valueForKey:@"disease"];
                [parameter setValue:disease forKey:@"disease"];
                [parameter setValue:weakself.treatmentMenu.mainBtn.titleLabel.text forKey:@"treatmentPeriod"];
                [parameter setValue:weakself.trainingFrequencyMenu.mainBtn.titleLabel.text forKey:@"daysPerWeek"];
                NSString *timingStr = weakself.sportTimePointMenu.mainBtn.titleLabel.text;
                NSInteger timing = 0;
                if ([timingStr isEqualToString:@"任意"]) {
                    timing = 3;
                } else if ([timingStr isEqualToString:@"三餐前半小时"]) {
                    timing = 1;
                } else if ([timingStr isEqualToString:@"三餐后一小时"]) {
                    timing = 2;
                }
                [parameter setValue:@(timing) forKey:@"timing"];
                NSInteger riskLevel = [[weakself.prescriptionDict valueForKey:@"riskLevel"] integerValue];
                [parameter setValue:@(riskLevel) forKey:@"riskLevel"];
                [parameter setValue:@(self.targetDuration) forKey:@"targetDuration"];
                if (self.groups.count > 0) {
                    NSMutableArray *groups = [NSMutableArray array];
                    for (AerobicriptionModel *model in self.groups) {
                        NSMutableDictionary *group = [NSMutableDictionary dictionary];
                        [group setValue:model.title forKey:@"title"];
                        [group setValue:model.hrRange forKey:@"hrRange"];
                        [group setValue:model.rpeRange forKey:@"rpeRange"];
                        [group setValue:model.difficulty forKey:@"difficulty"];
                        [group setValue:@(model.calorie) forKey:@"calorie"];
                        [group setValue:@(model.duration) forKey:@"duration"];
                        [group setValue:@(model.restDuration) forKey:@"restDuration"];
                        [group setValue:@(model.speed) forKey:@"speed"];
                        [group setValue:@(model.weight) forKey:@"weight"];
                        [group setValue:@(model.times) forKey:@"times"];
                        [group setValue:model.rotationAngle forKey:@"rotationAngle"];
                        [groups addObject:group];
                    }
                    [parameter setValue:groups forKey:@"sections"];
                } else {
                    [parameter setValue:@[] forKey:@"sections"];
                }
                [weakself createCustomTemplate:parameter];
            }
        }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"放弃" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField*_Nonnull textField) {
            textField.placeholder=@"请输入名称";
        }];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)createPrescription:(UIButton*)sender {
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@1 forKey:@"type"]; //类型
    [parameter setValue:@1 forKey:@"type2"]; //类型2，1=强度，2=功率
    NSInteger userId = [[self.prescriptionDict valueForKey:@"userId"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    [parameter setValue:@"自定义处方测试" forKey:@"title"];
    NSString *disease = [self.prescriptionDict valueForKey:@"disease"];
    [parameter setValue:disease forKey:@"disease"];
    [parameter setValue:@3 forKey:@"treatmentPeriod"];
    [parameter setValue:@4 forKey:@"daysPerWeek"];
    [parameter setValue:@2 forKey:@"timing"];
    [parameter setValue:@"14-16" forKey:@"difficultyLevel"];
    NSInteger riskLevel = [[self.prescriptionDict valueForKey:@"riskLevel"] integerValue];
    [parameter setValue:@(riskLevel) forKey:@"riskLevel"];
    [parameter setValue:@500 forKey:@"targetCalorie"];
    [parameter setValue:@300 forKey:@"targetDuration"];
    [parameter setValue:@"多运动" forKey:@"doctorAdvice"];
    NSArray *sections = @[@{@"title":@"第1小节",@"hrRange":@"60-80",@"rpeRange":@"10-25",@"difficulty":@"06",@"calorie":@50,@"duration":@130,@"restDuration":@60,@"speed":@20,@"weight":@60,@"times":@0,@"rotationAngle":@"0-180"},@{@"title":@"第2小节",@"hrRange":@"60-80",@"rpeRange":@"10-25",@"difficulty":@"06",@"calorie":@50,@"duration":@130,@"restDuration":@60,@"speed":@20,@"weight":@60,@"times":@0,@"rotationAngle":@"0-180"},@{@"title":@"第3小节",@"hrRange":@"60-80",@"rpeRange":@"10-25",@"difficulty":@"06",@"calorie":@50,@"duration":@130,@"restDuration":@60,@"speed":@20,@"weight":@60,@"times":@0,@"rotationAngle":@"0-180"}];
    [parameter setValue:sections forKey:@"sections"];
    [self createPrescriptions:parameter];
}

- (void)giveup:(UIButton*)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"确定放弃吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:NO];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:NO completion:nil];
}

- (void)addGroup:(UIButton*)sender {

}

- (void)removeGroup:(UIButton*)sender {

}

- (NSString *)getTrainingVolumeString:(CGFloat)weight {
    NSString *result = @"0.00 kg";
    result = [NSString stringWithFormat:@"%.2f kg",weight];
    return result;
}

//计算训练总量
- (void)computeWeight {
    if (self.groups.count > 0) {
        CGFloat sumWeight = 0;
        for (AerobicriptionModel *dict in self.groups) {
            CGFloat times = [[dict valueForKey:@"times"] floatValue];
            CGFloat weight = [[dict valueForKey:@"weight"] floatValue];
            sumWeight += times * weight;
        }
        self.targetDuration = sumWeight;
        self.trainingVolumeValLbl.text = [self getTrainingVolumeString:sumWeight];
    }
    self.trainingGroupValLbl.text = [NSString stringWithFormat:@"%d",self.groups.count];
}

#pragma mark - XXTGDropdownMenuDelegate
- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellNumber:(NSInteger)number {
    if (menu == self.trainingPositionMenu) { //训练部位
        
    }else if (menu == self.traingDeviceMenu){ //训练设备
        if (self.totalTemplateArr.count > 0) {
            
        }
    }else if (menu == self.templateMenu){ //推荐模版
        self.selectedTemplateDict = [self.recommendTemplateArr objectAtIndex:number];
        NSLog(@"self.selectedTemplateDict is :%@",self.selectedTemplateDict);
    }else if (menu == self.treatmentMenu){ //疗程
        
    }else if (menu == self.trainingFrequencyMenu){ //周训练频次
        
        
    }else if (menu == self.sportTimePointMenu){ //运动时间点
        
    }
}

- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string
{
    if (menu == self.trainingPositionMenu) { //训练部位
        if (self.deviceTypeArr.count > 0) {
            for (NSDictionary *dict in self.deviceTypeArr) {
                NSString *name = [dict valueForKey:@"name"];
                if ([string isEqualToString:name]) {
                    NSArray *children = [dict valueForKey:@"children"];
                    self.equipIds = [children mutableCopy];
                    NSMutableArray *equipments = [NSMutableArray array];
                    if (children.count > 0) {
                        for (NSDictionary *dict1 in children) {
                            [equipments addObject:[dict1 valueForKey:@"name"]];
                        }
                    }
                    self.traingDeviceMenu.titles = [equipments copy];
                    [self.traingDeviceMenu.mTableView reloadData];
                }
            }
        }
    }else if (menu == self.traingDeviceMenu){ //训练设备
        if (![self isBlankString:string]) {
            if (self.recommendTemplateArr.count > 0) {
                [self.recommendTemplateArr removeAllObjects];
            }
            if (self.totalTemplateArr.count > 0) {
                NSMutableArray *templateNames = [NSMutableArray array];
                for (NSDictionary *dict in self.totalTemplateArr) {
                    NSArray *typeList = [dict valueForKey:@"typeList"];
                    if (typeList.count > 0) {
                        for (NSDictionary *typeDict in typeList) {
                            NSString *name = [typeDict valueForKey:@"name"];
                            if ([string isEqualToString:name]) {
                                self.type = [[typeDict valueForKey:@"id"] integerValue];
                                [templateNames addObject:[dict valueForKey:@"title"]];
                                [self.recommendTemplateArr addObject:dict];
                            }
                        }
                    }
                }
                self.recommendArr = [templateNames mutableCopy];
                self.templateMenu.titles = self.recommendArr;
                [self.templateMenu.mTableView reloadData];
            }
        }
    }else if (menu == self.templateMenu){ //推荐模版
        
        if (![self isBlankString:string]) {
            for (NSDictionary *dict in self.recommendTemplateArr) {
                NSString *title = [dict valueForKey:@"title"];
                if ([string isEqualToString:title]) {
                    self.selectedTemplateDict = dict;
                }
            }
        }
        NSLog(@"当前选择的模板是:%@",self.selectedTemplateDict);
        NSInteger treatmentPeriod = [[self.selectedTemplateDict valueForKey:@"treatmentPeriod"] integerValue];
        [self.treatmentMenu.mainBtn setTitle:[NSString stringWithFormat:@"%d",treatmentPeriod] forState:UIControlStateNormal];
        self.treatmentPeriod = treatmentPeriod;
        [self.treatmentMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        NSInteger daysPerWeek = [[self.selectedTemplateDict valueForKey:@"daysPerWeek"] integerValue];
        [self.trainingFrequencyMenu.mainBtn setTitle:[NSString stringWithFormat:@"%d",daysPerWeek] forState:UIControlStateNormal];
        self.daysPerWeek = daysPerWeek;
        [self.trainingFrequencyMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        NSInteger timing = [[self.selectedTemplateDict valueForKey:@"timing"] integerValue];
        NSString *timingStr = @"任意";
        if (timing == 1) {
            timingStr = @"三餐前半小时";
        } else if(timing == 2) {
            timingStr = @"三餐后一小时";
        }
        self.timing = timing;
        [self.sportTimePointMenu.mainBtn setTitle:timingStr forState:UIControlStateNormal];
        [self.sportTimePointMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        NSDictionary *dict = self.user.organ;
        NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
        NSString *orgCode = orgCodeArr[0];
        [parameter setValue:orgCode forKey:@"orgCode"];
        NSInteger id = [[self.selectedTemplateDict valueForKey:@"id"] integerValue];
        [parameter setValue:@(id) forKey:@"id"];
        [self getTemplateDetailInfo:parameter];
    }else if (menu == self.treatmentMenu){ //疗程
        
        if (![self isBlankString:string]) {
            self.treatmentPeriod = [string integerValue];
        }
        
    }else if (menu == self.trainingFrequencyMenu){ //周训练频次
        
        if (![self isBlankString:string]) {
            self.daysPerWeek = [string integerValue];
        }
        
    }else if (menu == self.sportTimePointMenu){ //运动时间点
        
        if (![self isBlankString:string]) {
            if ([string isEqualToString:@"任意"]) {
                self.timing = 3;
            } else if ([string isEqualToString:@"三餐前半小时"]) {
                self.timing = 1;
            } else if ([string isEqualToString:@"三餐后一小时"]) {
                self.timing = 2;
            }
        }
    }
}

- (void)dropdownMenu:(KTDropDownMenus *)menu mainBtnClick:(UIButton *)sender {
    if (menu == self.trainingPositionMenu) { //训练部位
        
    }else if (menu == self.traingDeviceMenu){ //训练设备
        if ([self.trainingPositionMenu.mainBtn.titleLabel.text isEqualToString:@"请选择"]) {
            [STTextHudTool showText:@"请先选择训练部位"];
            [menu hiddenCityList];
        } else {
            [self.traingDeviceMenu.mainBtn setTitle:@"" forState:UIControlStateNormal];
        }
    }else if (menu == self.templateMenu){ //推荐模版
        if ([self.trainingPositionMenu.mainBtn.titleLabel.text isEqualToString:@"请选择"]) {
            [STTextHudTool showText:@"请先选择训练部位"];
            [menu hiddenCityList];
        } else if ([self.traingDeviceMenu.mainBtn.titleLabel.text isEqualToString:@"请选择"]) {
            [STTextHudTool showText:@"请先选择训练设备"];
            [menu hiddenCityList];
        } else {
            if ([self.recommendTemplateArr count] == 0) {
                [STTextHudTool showText:@"没有推荐处方"];
                menu.defualtStr = @"请选择推荐模板";
                [menu hiddenCityList];
                menu.titles = nil;
                if (self.groups.count > 0) {
                    [self.groups removeAllObjects];
                }
                [self.treatmentMenu.mainBtn setTitle:@"6" forState:UIControlStateNormal];
                [self.trainingFrequencyMenu.mainBtn setTitle:@"" forState:UIControlStateNormal];
                [self.sportTimePointMenu.mainBtn setTitle:@"" forState:UIControlStateNormal];
                self.trainingGroupValLbl.text = @"0";
                self.trainingVolumeValLbl.text = @"0.00kg";
                [self.listView reloadData];
            }
        }
    }else if (menu == self.treatmentMenu){ //疗程
        
    }else if (menu == self.trainingFrequencyMenu){ //周训练频次
        
    }else if (menu == self.sportTimePointMenu){ //运动时间点
        
    }
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
            NSDictionary *data = [responseObject valueForKey:@"data"];
            NSLog(@"rows is :%@",data);
            if (data.count > 0) {
                NSArray *sections = [data valueForKey:@"sections"];
                NSMutableArray *templates = [NSMutableArray array];
                if (sections.count > 0) {
                    for (NSDictionary *dict in sections) {
                        AerobicriptionModel *model = [AerobicriptionModel cp_objWithDict:dict];
                        [templates addObject:model];
                    }
                }
                weakself.groups = [templates mutableCopy];
                [weakself.listView reloadData];
                weakself.trainingGroupValLbl.text = [NSString stringWithFormat:@"%d",weakself.groups.count];
                [weakself computeWeight];
            }
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

- (void)createCustomTemplate:(NSMutableDictionary *)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_TEMPLATE_CREATE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************新建模板%@**************",[weakSelf convertToJSONData:responseObject]);
        if (code == 0) {
            
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

- (void)createPrescriptions:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_PRESCRIPTION_CREATE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************%@**************",responseObject);
        if (code == 0) {
            [STTextHudTool showText:@"开具处方成功"];
            [weakSelf.navigationController popViewControllerAnimated:NO];
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

//获取处方模板详细信息
- (void)getTemplateDetailInfo:(NSMutableDictionary*)parameter {
    kWeakSelf(self);
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_TEMPLATE_INFO_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"*********获取推荐处方模板详细信息*****%@**************",responseObject);
        if (code == 0) {
            NSDictionary *data = [responseObject valueForKey:@"data"];
            NSLog(@"rows is :%@",data);
            if (data.count > 0) {
                NSArray *sections = [data valueForKey:@"sections"];
                NSMutableArray *templates = [NSMutableArray array];
                if (sections.count > 0) {
                    for (NSDictionary *dict in sections) {
                        AerobicriptionModel *model = [AerobicriptionModel cp_objWithDict:dict];
                        [templates addObject:model];
                    }
                }
                weakself.groups = [templates mutableCopy];
                [weakself.listView reloadData];
                weakself.trainingGroupValLbl.text = [NSString stringWithFormat:@"%d",weakself.groups.count];
                [weakself computeWeight];
            }
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


- (void)getDeviceTypeInfo:(NSMutableDictionary *)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDEVICE_TYPE_INFO_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************获取设备类型信息%@**************",responseObject);
        if (code == 0) {
            NSDictionary *data = [responseObject valueForKey:@"data"];
            NSArray *attr = [data valueForKey:@"attrs"];
            if (attr.count > 0) {
                NSDictionary *dict = attr[0];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateDifficultLevelNotification" object:nil userInfo:dict];
            }
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
