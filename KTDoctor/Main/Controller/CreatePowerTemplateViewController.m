//
//  CreatePowerTemplateViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/5/24.
//  Copyright © 2019 dz. All rights reserved.
//

#import "CreatePowerTemplateViewController.h"
#import "AddTemplateViewController.h"
#import "KTDropDownMenus.h"
#import "StrengthTemplateCell.h"
#import "AerobicriptionModel.h"
#import "UserModel.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 250
#define kTopView_TopMargin 20
#define kTopView_BottomMargin 20
#define kTopView_LeftMargin 20
#define kTopView_Height 151
#define kTopView_Height 151
#define kNameTF_LeftMargin 10
#define kNameTF_RightMargin 16
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
#define kDropdownHeight 30
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
#define kTrainingTimeLbl_Width 120
#define kTrainingGroupLbl_Width 120
#define kTrainingGroupLbl_TopMargin 16
#define kTrainingTimeValLbl_Width 100
#define kTrainingTimeValLbl_Height 15
#define kTrainingTimeValLbl_FontSize 15.0
#define kSaveBtn_TopMargin 27
#define kSaveBtn_Width 80
#define kSaveBtn_Height 27
#define kSaveBtn_HSpace 15
#define kSaveBtn_FontSize 15.0
#define kFooterView_Height 155+98
#define kCell_Height 118

@interface CreatePowerTemplateViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,XXTGDropdownMenuDelegate>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UIView *topBgView;//顶部视图蓝色背景
@property (nonatomic,strong)UIView *bottomView;//底部视图
@property (nonatomic,strong)UILabel *templateNameLbl;//模板名称
@property (nonatomic,strong)UITextField *templateNameTF;
@property (nonatomic,strong)UILabel *dieaseLbl;//适应病症
@property (nonatomic,strong)KTDropDownMenus *dieaseMenu;
@property (nonatomic,strong)UILabel *riskLevelLbl;//风险等级
@property (nonatomic,strong)KTDropDownMenus *riskLevelMenu;
@property (nonatomic,strong)UILabel *deviceTypeLbl;//设备类型
@property (nonatomic,strong)UITextField *deviceTypeTF;
@property (nonatomic,strong)UILabel *trainingPositionLbl;//训练部位
@property (nonatomic,strong)KTDropDownMenus *trainingPositionMenu;
@property (nonatomic,strong)UILabel *trainingDeviceLbl;//训练设备
@property (nonatomic,strong)KTDropDownMenus *traingDeviceMenu;
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
@property (nonatomic,strong)UILabel *trainingVolumeLbl;//训练总量
@property (nonatomic,strong)UIButton *saveBtn;
@property (nonatomic,strong)UIButton *giveupBtn;
@property (nonatomic,assign)NSInteger type2;
@property (nonatomic,assign)CGFloat targetDuration;
@property (nonatomic,strong)NSMutableArray *sections;
@property (nonatomic,assign)NSInteger treatmentPeriod;
@property (nonatomic,assign)NSInteger daysPerWeek;
@property (nonatomic,assign)NSInteger timing;
@property (nonatomic,strong)NSMutableArray *groups;
@property (nonatomic,strong)UserModel *user;
@property (nonatomic,strong)NSMutableArray *positions;
@property (nonatomic,strong)NSMutableArray *equipIds;
@property (nonatomic,assign)NSInteger typeid;
@end

@implementation CreatePowerTemplateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.groups = [NSMutableArray array];
    self.positions = [NSMutableArray array];
    self.equipIds = [NSMutableArray array];
    self.user = [[UserModel sharedUserModel] getCurrentUser];
    AerobicriptionModel *model = [[AerobicriptionModel alloc] init];
    [self.groups addObject:model];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(computeWeight) name:@"ComputeWeightNotification" object:nil];
    [self setNavBar];
    [self setupUI];
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
    self.titleLbl.text = @"新建力量处方模板";
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
    [self computeWeight];
}

- (void)configHeaderview {
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, (kTopView_Height + kTopView_TopMargin + kTopView_BottomMargin) * kYScal)];
    self.topView.backgroundColor = [UIColor whiteColor];
    
    self.topBgView = [[UIView alloc] initWithFrame:CGRectMake(kTopView_LeftMargin * kXScal, kTopView_TopMargin * kYScal, kWidth - 2 * kTopView_LeftMargin * kXScal, kTopView_Height * kYScal)];
    self.topBgView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    [self.topView addSubview:self.topBgView];
    
    self.templateNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(kDieaseLbl_LeftMargin * kXScal, kDieaseLbl_TopMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.templateNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(kDieaseLbl_LeftMargin * kXScal, kDieaseLbl_TopMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.templateNameLbl.text = @"模板名称";
    self.templateNameLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.templateNameLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.templateNameLbl];
    
    CGFloat templateNameTF_Width = self.topBgView.frame.size.width - CGRectGetMaxX(self.templateNameLbl.frame) - kNameTF_LeftMargin * kXScal - kNameTF_RightMargin * kXScal;
    self.templateNameTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, templateNameTF_Width, kDieaseTF_Height * kYScal)];
    self.templateNameTF.backgroundColor = [UIColor whiteColor];
    self.templateNameTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.templateNameTF.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze];
    self.templateNameTF.center = CGPointMake(CGRectGetMaxX(self.templateNameLbl.frame) + kNameTF_LeftMargin * kXScal + templateNameTF_Width/2.0, self.templateNameLbl.center.y);
    self.templateNameTF.placeholder = @"模板名称";
    [self.topBgView addSubview:self.templateNameTF];
    
    self.dieaseLbl = [[UILabel alloc] initWithFrame:CGRectMake(kDieaseLbl_LeftMargin * kXScal,CGRectGetMaxY(self.templateNameLbl.frame) + kDieaseLbl_BottomMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.dieaseLbl.text = @"适用病症";
    self.dieaseLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.dieaseLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.dieaseLbl];
    
    self.dieaseMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(0, 0, kDieaseTF_Width * kXScal, kDieaseTF_Height * kYScal)];
    self.dieaseMenu.backgroundColor = [UIColor whiteColor];
    self.dieaseMenu.center = CGPointMake(CGRectGetMaxX(self.dieaseLbl.frame) + kDieaseLbl_RightMargin * kXScal + kDieaseTF_Width * kXScal/2.0, self.dieaseLbl.center.y);
    [self.dieaseMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.dieaseMenu.defualtStr = @"II型糖尿病";
    self.dieaseMenu.delegate = self;
    self.dieaseMenu.titles = @[@"II型糖尿病"];
    [self.topBgView addSubview:self.dieaseMenu];
    
    self.riskLevelLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dieaseMenu.frame) + kRiskLevelLbl_LeftMargin * kXScal, self.dieaseLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.riskLevelLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.riskLevelLbl.text = @"风险等级";
    self.riskLevelLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.riskLevelLbl];
    
    self.riskLevelMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelLbl.frame) + kDieaseLbl_RightMargin * kXScal, self.dieaseMenu.frame.origin.y, kDieaseTF_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.riskLevelMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.riskLevelMenu.defualtStr = @"请选择";
    self.riskLevelMenu.delegate = self;
    self.riskLevelMenu.titles = @[@"高",@"中",@"低"];
    self.riskLevelMenu.backgroundColor = [UIColor whiteColor];
    [self.topBgView addSubview:self.riskLevelMenu];
    
    self.deviceTypeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.dieaseLbl.frame.origin.x, CGRectGetMaxY(self.dieaseLbl.frame) + kDieaseLbl_BottomMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.deviceTypeLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.deviceTypeLbl.text = @"设备类型";
    self.deviceTypeLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.deviceTypeLbl];
    
    self.deviceTypeTF = [[UITextField alloc] initWithFrame:CGRectMake(self.dieaseMenu.frame.origin.x, 0, kDieaseTF_Width * kXScal, kDieaseTF_Height * kYScal)];
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
    
    self.trainingPositionMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake( self.riskLevelMenu.frame.origin.x,self.deviceTypeTF.frame.origin.y, kTrainingPositionMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.trainingPositionMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.trainingPositionMenu.defualtStr = @"请选择";
    self.trainingPositionMenu.delegate = self;
    if (self.deviceTypeArr.count > 0) {
        for (NSDictionary *dict in self.deviceTypeArr) {
            [self.positions addObject:[dict valueForKey:@"name"]];
        }
    }
    self.trainingPositionMenu.titles = [self.positions copy];
    self.trainingPositionMenu.backgroundColor = [UIColor whiteColor];
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
    self.traingDeviceMenu.backgroundColor = [UIColor whiteColor];
    self.traingDeviceMenu.delegate = self;
    self.traingDeviceMenu.tag = 10;
    [self.topBgView addSubview:self.traingDeviceMenu];
    
    self.treatmentLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.dieaseLbl.frame.origin.x, CGRectGetMaxY(self.deviceTypeLbl.frame) + kDieaseLbl_BottomMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.treatmentLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.treatmentLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.treatmentLbl.text = @"疗程";
    [self.topBgView addSubview:self.treatmentLbl];
    
    self.treatmentMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.deviceTypeTF.frame.origin.x, CGRectGetMaxY(self.deviceTypeTF.frame) + kDieaseTF_BottomMargin * kYScal, kWeekMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.treatmentMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.treatmentMenu.defualtStr = @"6";
    self.treatmentMenu.delegate = self;
    self.treatmentMenu.titles = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    self.treatmentMenu.backgroundColor = [UIColor whiteColor];
    self.treatmentMenu.tag = 40;
    [self.topBgView addSubview:self.treatmentMenu];
    
    self.weekLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.treatmentLbl.frame) + kDieaseLbl_RightMargin * kXScal + kWeekMenu_Width *kXScal + kWeekMenu_RightMargin * kXScal, self.treatmentLbl.frame.origin.y, kWeekLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
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
    self.trainingFrequencyMenu.defualtStr = @"";
    self.trainingFrequencyMenu.delegate = self;
    self.trainingFrequencyMenu.titles = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    self.trainingFrequencyMenu.backgroundColor = [UIColor whiteColor];
    self.trainingFrequencyMenu.tag = 50;
    [self.topBgView addSubview:self.trainingFrequencyMenu];
    
    self.sportTimePointLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.trainingDeviceLbl.frame.origin.x, self.treatmentLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.sportTimePointLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.sportTimePointLbl.text = @"运动时间点";
    self.sportTimePointLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.sportTimePointLbl];
    
    self.sportTimePointMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.traingDeviceMenu.frame.origin.x, self.treatmentMenu.frame.origin.y, kTrainingDeviceMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.sportTimePointMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.sportTimePointMenu.defualtStr = @"三餐前半小时";
    self.sportTimePointMenu.delegate = self;
    self.sportTimePointMenu.titles = @[@"任意",@"三餐前半小时",@"三餐后一小时"];
    self.sportTimePointMenu.delegate = self;
    self.sportTimePointMenu.backgroundColor = [UIColor whiteColor];
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
    self.trainingGroupLbl.text = @"训练组数：1";
    self.trainingGroupLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.trainingGroupLbl.textColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.dataView addSubview:self.trainingGroupLbl];
    
    CGFloat space = (self.dataView.frame.size.width - 2 * kTrainingTimeLbl_LeftMargin * kXScal - 2 * kTrainingGroupLbl_Width * kXScal - kTrainingTimeLbl_Width * kXScal)/2;
    
    self.trainingVolumeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingGroupLbl.frame) + space, self.trainingGroupLbl.frame.origin.y, kTrainingTimeLbl_Width * kXScal, kTrainingTimeValLbl_Height * kYScal)];
    self.trainingVolumeLbl.textColor = [UIColor colorWithHexString:@"#0FAAC9"];
    self.trainingVolumeLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.trainingVolumeLbl.text = @"训练总量：0.00 kg";
    [self.dataView addSubview:self.trainingVolumeLbl];
    
    CGFloat btn_LeftMargin = (self.dataView.frame.size.width - 2 * kSaveBtn_Width * kXScal - kSaveBtn_HSpace * kXScal)/2;
    self.saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.saveBtn.frame = CGRectMake(btn_LeftMargin, CGRectGetMaxY(self.trainingVolumeLbl.frame) + kSaveBtn_TopMargin * kYScal, kSaveBtn_Width * kXScal, kSaveBtn_Height * kYScal);
    [self.saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [self.saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.saveBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.saveBtn addTarget:self action:@selector(saveOrCreate:) forControlEvents:UIControlEventTouchUpInside];
    [self.dataView addSubview:self.saveBtn];
    
    self.giveupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.giveupBtn.frame = CGRectMake(CGRectGetMaxX(self.saveBtn.frame) + kSaveBtn_HSpace * kXScal, self.saveBtn.frame.origin.y, kSaveBtn_Width * kXScal, kSaveBtn_Height * kYScal);
    [self.giveupBtn setTitle:@"放弃" forState:UIControlStateNormal];
    [self.giveupBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.giveupBtn addTarget:self action:@selector(giveup:) forControlEvents:UIControlEventTouchUpInside];
    self.giveupBtn.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.dataView addSubview:self.giveupBtn];
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
    AerobicriptionModel *dict = [self.groups objectAtIndex:indexPath.section];
    cell.groupNameLbl.text = [NSString stringWithFormat:@"第%d组",indexPath.section + 1];
    CGFloat weight = [[dict valueForKey:@"weight"] floatValue];
    [cell.weightMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [cell.weightMenu.mainBtn setTitle:[NSString stringWithFormat:@"%.1f",weight] forState:UIControlStateNormal];
    NSInteger times = [[dict valueForKey:@"times"] integerValue];
    [cell.timesMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [cell.timesMenu.mainBtn setTitle:[NSString stringWithFormat:@"%d",times] forState:UIControlStateNormal];
    NSArray *rotationAngleArr = [[dict valueForKey:@"rotationAngle"] componentsSeparatedByString:@"-"];
    if (rotationAngleArr.count > 0) {
        NSString *leftAngle = rotationAngleArr[0];
        NSString *rightAngle = rotationAngleArr[1];
        [cell.rotationAngleLeftMenu.mainBtn setTitle:[NSString stringWithFormat:@"%@°",leftAngle] forState:UIControlStateNormal];
        [cell.rotationAngleLeftMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [cell.rotationAngleRightMenu.mainBtn setTitle:[NSString stringWithFormat:@"%@°",rightAngle] forState:UIControlStateNormal];
        [cell.rotationAngleRightMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    }
    NSArray *rpeRangeArr = [[dict valueForKey:@"rpeRange"] componentsSeparatedByString:@"-"];
    if (rpeRangeArr.count > 0) {
        NSString *leftRpe = [NSString stringWithFormat:@"%.1f",[rpeRangeArr[0] floatValue]];
        NSString *rightRpe = [NSString stringWithFormat:@"%.1f",[rpeRangeArr[1] floatValue]];
        [cell.rpeLeftMenu.mainBtn setTitle:leftRpe forState:UIControlStateNormal];
        [cell.rpeLeftMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [cell.rpeRightMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [cell.rpeRightMenu.mainBtn setTitle:rightRpe forState:UIControlStateNormal];
        NSInteger restDuration = [[dict valueForKey:@"restDuration"] integerValue];
        [cell.restLeftMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [cell.restLeftMenu.mainBtn setTitle:[NSString stringWithFormat:@"%d",restDuration/60] forState:UIControlStateNormal];
        [cell.restRightMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [cell.restRightMenu.mainBtn setTitle:[NSString stringWithFormat:@"%d",restDuration%60] forState:UIControlStateNormal];
    }
    cell.model = dict;
    [cell.addBtn addTarget:self action:@selector(addGroup:) forControlEvents:UIControlEventTouchUpInside];
    cell.addBtn.tag = 10000 + indexPath.section;
    cell.removeBtn.tag = 20000 + indexPath.section;
    [cell.removeBtn addTarget:self action:@selector(removeGroup:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
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
        self.trainingVolumeLbl.text = [NSString stringWithFormat:@"训练总量：%@",[self getTrainingVolumeString:sumWeight]];
    }
    self.trainingGroupLbl.text = [NSString stringWithFormat:@"训练组数：%d",self.groups.count];
}

#pragma mark - XXTGDropdownMenuDelegate
- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellNumber:(NSInteger)number {
    
}

- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string
{
    if (menu == self.trainingPositionMenu) {
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
    } else if (menu == self.traingDeviceMenu) {
        if (self.equipIds.count > 0) {
            for (NSDictionary *dict in self.equipIds) {
                NSString *name = [dict valueForKey:@"name"];
                if ([string isEqualToString:name]) {
                    NSInteger id = [[dict valueForKey:@"id"] integerValue];
                    self.typeid = id;
                    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
                    NSDictionary *dict = self.user.organ;
                    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
                    NSString *orgCode = orgCodeArr[0];
                    [parameter setValue:orgCode forKey:@"orgCode"];
                    [parameter setValue:@(id) forKey:@"id"];
                    [self getDeviceTypeInfo:parameter];
                }
            }
        }
    }
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

- (void)dropdownMenu:(KTDropDownMenus *)menu mainBtnClick:(UIButton *)sender {
    [self hideOtherMenuExcept:menu];
    if (menu == self.traingDeviceMenu) {
        [self.traingDeviceMenu.mainBtn setTitle:@"" forState:UIControlStateNormal];
        if ([self.trainingPositionMenu.mainBtn.titleLabel.text isEqualToString:@""] ||[self.trainingPositionMenu.mainBtn.titleLabel.text isEqualToString:@"请选择"]) {
            [menu hiddenCityList];
            [STTextHudTool showText:@"请先选择训练部位"];
        }
    }
}

- (void)hideOtherMenuExcept:(KTDropDownMenus*)menu {
    for (UIView *view in self.topBgView.subviews) {
        if ([view isKindOfClass:[KTDropDownMenus class]]) {
            KTDropDownMenus *ktMenu = (KTDropDownMenus*)view;
            if (ktMenu != menu) {
                [ktMenu hiddenCityList];
            }
        }
    }
}

#pragma mark - button click events
- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)saveOrCreate:(UIButton*)sender {
    __weak typeof (self)weakSelf = self;
    if (self.templateNameTF.text.length == 0) {
        [STTextHudTool showText:@"请填写模板名称"];
    } else if([self.riskLevelMenu.mainBtn.titleLabel.text isEqualToString:@""] ||[self.riskLevelMenu.mainBtn.titleLabel.text isEqualToString:@"请选择"]) {
        [STTextHudTool showText:@"请选择风险等级"];
    } else if([self.trainingPositionMenu.mainBtn.titleLabel.text isEqualToString:@""] ||[self.trainingPositionMenu.mainBtn.titleLabel.text isEqualToString:@"请选择"]) {
        [STTextHudTool showText:@"请选择训练部位"];
    }else if([self.traingDeviceMenu.mainBtn.titleLabel.text isEqualToString:@""] ||[self.traingDeviceMenu.mainBtn.titleLabel.text isEqualToString:@"请选择"]) {
        [STTextHudTool showText:@"请选择训练设备"];
    }else if(self.trainingFrequencyMenu.mainBtn.titleLabel.text.length == 0 ||[self.trainingFrequencyMenu.mainBtn.titleLabel.text isEqualToString:@"请选择"]) {
        [STTextHudTool showText:@"请选择每周训练几天"];
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"确定保存吗？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
            NSDictionary *dict = weakSelf.user.organ;
            NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
            NSString *orgCode = orgCodeArr[0];
            [parameter setValue:orgCode forKey:@"orgCode"];
            [parameter setValue:@(weakSelf.typeid) forKey:@"type"]; //类型
//            [parameter setValue:@(weakSelf.type) forKey:@"type2"]; //类型2，1=强度，2=功率
            [parameter setValue:weakSelf.templateNameTF.text forKey:@"title"];
            NSString *disease = weakSelf.dieaseMenu.mainBtn.titleLabel.text;
            [parameter setValue:disease forKey:@"disease"];
            [parameter setValue:weakSelf.treatmentMenu.mainBtn.titleLabel.text forKey:@"treatmentPeriod"];
            [parameter setValue:weakSelf.trainingFrequencyMenu.mainBtn.titleLabel.text forKey:@"daysPerWeek"];
            NSString *timingStr = weakSelf.sportTimePointMenu.mainBtn.titleLabel.text;
            NSInteger timing = 0;
            if ([timingStr isEqualToString:@"任意"]) {
                timing = 3;
            } else if ([timingStr isEqualToString:@"三餐前半小时"]) {
                timing = 1;
            } else if ([timingStr isEqualToString:@"三餐后一小时"]) {
                timing = 2;
            }
            [parameter setValue:@(timing) forKey:@"timing"];
            NSString *riskLevelStr = weakSelf.riskLevelMenu.mainBtn.titleLabel.text;
            NSInteger riskLevel = 1;
            if ([riskLevelStr isEqualToString:@"低"]) {
                riskLevel = 1;
            } else if ([riskLevelStr isEqualToString:@"中"]) {
                riskLevel = 2;
            } else if ([riskLevelStr isEqualToString:@"高"]) {
                riskLevel = 3;
            }
            [parameter setValue:@(riskLevel) forKey:@"riskLevel"];
            [parameter setValue:@(self.targetDuration) forKey:@"targetDuration"];
            if (self.groups.count > 0) {
                NSMutableArray *groups = [NSMutableArray array];
                for (NSInteger i = 0; i < weakSelf.groups.count; i++) {
                    AerobicriptionModel *model = (AerobicriptionModel*)[weakSelf.groups objectAtIndex:i];
                    NSMutableDictionary *group = [NSMutableDictionary dictionary];
                    [group setValue:[NSString stringWithFormat:@"第%ld组",i] forKey:@"title"];
                    [group setValue:model.hrRange forKey:@"hrRange"];
                    [group setValue:model.rpeRange forKey:@"rpeRange"];
                    NSString *difficultyStr = @"";
                    if ([model.difficulty integerValue] > 9) {
                        difficultyStr = model.difficulty;
                    } else {
                        difficultyStr = [NSString stringWithFormat:@"0%@",model.difficulty];
                    }
                    [group setValue:difficultyStr forKey:@"difficulty"];
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
            [self createCustomTemplate:parameter];
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:okAction];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:NO completion:nil];
    }
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
    NSLog(@"增加行");
    NSInteger index = sender.tag - 10000;
    AerobicriptionModel *model = [self.groups objectAtIndex:index];
    AerobicriptionModel *dict = [[AerobicriptionModel alloc] init];
    dict.title = model.title;
    dict.hrRange = model.hrRange;
    dict.rpeRange = model.rpeRange;
    dict.difficulty = model.difficulty;
    dict.calorie = model.calorie;
    dict.duration = model.duration;
    dict.restDuration = model.restDuration;
    dict.speed = model.speed;
    dict.weight = model.weight;
    dict.times = model.times;
    dict.rotationAngle = model.rotationAngle;
    [self.groups insertObject:dict atIndex:index];
    [self.listView insertSection:index withRowAnimation:UITableViewRowAnimationNone];
    [self.listView reloadData];
    [self computeWeight];
    self.trainingGroupLbl.text = [NSString stringWithFormat:@"训练组数：%d",self.groups.count];
}

- (void)removeGroup:(UIButton*)sender {
    if (self.groups.count > 1) {
        NSInteger index = sender.tag - 20000;
        [self.groups removeObjectAtIndex:index];
        [self.listView deleteSection:index withRowAnimation:UITableViewRowAnimationNone];
        [self.listView reloadData];
        [self computeWeight];
    }
    self.trainingGroupLbl.text = [NSString stringWithFormat:@"训练组数：%d",self.groups.count];
}

#pragma mark - network functions

- (void)createCustomTemplate:(NSMutableDictionary *)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_TEMPLATE_CREATE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************新建模板%@**************",responseObject);
        NSString *error = [weakSelf convertToJSONData:responseObject];
        NSLog(@"error is :%@",error);
        if (code == 0) {
            [STTextHudTool showText:@"保存成功"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateCustomTemplatesNotification" object:nil];
            for (UIViewController *view in weakSelf.navigationController.viewControllers) {
                if ([view isKindOfClass:[AddTemplateViewController class]]) {
                    [weakSelf.navigationController popToViewController:view animated:NO];
                }
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
