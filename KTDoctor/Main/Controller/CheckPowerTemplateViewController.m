//
//  CheckPowerTemplateViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/5/28.
//  Copyright © 2019 dz. All rights reserved.
//

#import "CheckPowerTemplateViewController.h"
#import "CheckPowerTemplateCell.h"
#import "AerobicriptionModel.h"

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
#define kDataView_Height 49
#define kTrainingTimeLbl_LeftMargin 140
#define kTrainingTimeLbl_RightMargin 10
#define kTrainingTimeLbl_Width 80
#define kTrainingGroupLbl_Width 70
#define kTrainingGroupLbl_TopMargin 16
#define kTrainingTimeValLbl_Width 100
#define kTrainingTimeValLbl_Height 15
#define kTrainingTimeValLbl_FontSize 15.0
#define kSaveBtn_TopMargin 27
#define kSaveBtn_Width 80
#define kSaveBtn_Height 27
#define kSaveBtn_HSpace 15
#define kSaveBtn_FontSize 15.0
#define kFooterView_Height 155+49
#define kCell_Height 118

@interface CheckPowerTemplateViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,XXTGDropdownMenuDelegate>
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
@property (nonatomic,strong)UILabel *trainingGroupValLbl;
@property (nonatomic,strong)UILabel *trainingVolumeLbl;//训练总量
@property (nonatomic,strong)UILabel *trainingVolumeValLbl;
@property (nonatomic,assign)NSInteger type2;
@property (nonatomic,assign)NSInteger targetDuration;
@property (nonatomic,strong)NSMutableArray *sections;
@property (nonatomic,assign)NSInteger treatmentPeriod;
@property (nonatomic,assign)NSInteger daysPerWeek;
@property (nonatomic,assign)NSInteger timing;
@property (nonatomic,strong)NSMutableArray *groups;
@end

@implementation CheckPowerTemplateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.groups = [NSMutableArray array];
    NSArray *sections = [self.templateInfo valueForKey:@"sections"];
    NSMutableArray *templates = [NSMutableArray array];
    if (sections.count > 0) {
        for (NSDictionary *dict in sections) {
            AerobicriptionModel *model = [AerobicriptionModel cp_objWithDict:dict];
            [templates addObject:model];
        }
    }
    self.groups = [templates mutableCopy];
    self.type2 = [[self.templateInfo valueForKey:@"type2"] integerValue];
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
    self.titleLbl.text = @"查看系统力量模板";
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
    NSString *title = [self.templateInfo valueForKey:@"title"];
    self.templateNameTF.text = title;
    self.templateNameTF.enabled = NO;
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
    self.dieaseMenu.delegate = self;
    self.dieaseMenu.dropDownImage.hidden = YES;
    self.dieaseMenu.mainBtn.enabled = NO;
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
    self.riskLevelMenu.delegate = self;
    self.riskLevelMenu.backgroundColor = [UIColor whiteColor];
    NSInteger riskLevel = [[self.templateInfo valueForKey:@"riskLevel"] integerValue];
    if (riskLevel == 3) {
        [self.riskLevelMenu.mainBtn setTitle:@"高" forState:UIControlStateNormal];
    } else if (riskLevel == 2) {
        [self.riskLevelMenu.mainBtn setTitle:@"中" forState:UIControlStateNormal];
    } else if (riskLevel == 1) {
        [self.riskLevelMenu.mainBtn setTitle:@"低" forState:UIControlStateNormal];
    }
    self.riskLevelMenu.dropDownImage.hidden = YES;
    self.riskLevelMenu.mainBtn.enabled = NO;
    [self.topBgView addSubview:self.riskLevelMenu];
    
    self.deviceTypeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.dieaseLbl.frame.origin.x, CGRectGetMaxY(self.dieaseLbl.frame) + kDieaseLbl_BottomMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.deviceTypeLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.deviceTypeLbl.text = @"设备类型";
    self.deviceTypeLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.deviceTypeLbl];
    
    self.deviceTypeTF = [[UITextField alloc] initWithFrame:CGRectMake(self.dieaseMenu.frame.origin.x, 0, kDieaseTF_Width * kXScal, kDieaseTF_Height * kYScal)];
    self.deviceTypeTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.deviceTypeTF.text = @"有氧设备";
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
    self.trainingPositionMenu.titles = @[@"心肺"];
    self.trainingPositionMenu.delegate = self;
    self.trainingPositionMenu.backgroundColor = [UIColor whiteColor];
    self.trainingPositionMenu.delegate = self;
    self.trainingPositionMenu.tag = 10;
    [self.trainingPositionMenu.mainBtn setTitle:@"心肺" forState:UIControlStateNormal];
    self.trainingPositionMenu.dropDownImage.hidden = YES;
    self.trainingPositionMenu.mainBtn.enabled = NO;
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
    self.traingDeviceMenu.titles = @[@"功率车",@"椭圆机",@"卧式功率车"];
    self.traingDeviceMenu.delegate = self;
    NSInteger type = [[self.templateInfo valueForKey:@"type"] integerValue];
    NSArray *typeList = [self.templateInfo valueForKey:@"typeList"];
    if (typeList.count > 0) {
        for (NSDictionary *dictonary in typeList) {
            NSInteger id = [[dictonary valueForKey:@"id"] integerValue];
            if (type == id) {
                NSString *name = [dictonary valueForKey:@"name"];
                [self.traingDeviceMenu.mainBtn setTitle:name forState:UIControlStateNormal];
            }
        }
    }
    self.traingDeviceMenu.backgroundColor = [UIColor whiteColor];
    self.traingDeviceMenu.delegate = self;
    self.traingDeviceMenu.tag = 10;
    self.traingDeviceMenu.dropDownImage.hidden = YES;
    self.traingDeviceMenu.mainBtn.enabled = NO;
    [self.topBgView addSubview:self.traingDeviceMenu];
    
    self.treatmentLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.dieaseLbl.frame.origin.x, CGRectGetMaxY(self.deviceTypeLbl.frame) + kDieaseLbl_BottomMargin * kYScal, kDieaseLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.treatmentLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    self.treatmentLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.treatmentLbl.text = @"疗程";
    [self.topBgView addSubview:self.treatmentLbl];
    
    self.treatmentMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.deviceTypeTF.frame.origin.x, CGRectGetMaxY(self.deviceTypeTF.frame) + kDieaseTF_BottomMargin * kYScal, kWeekMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.treatmentMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.treatmentMenu.defualtStr = @"";
    self.treatmentMenu.delegate = self;
    self.treatmentMenu.titles = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    self.treatmentMenu.delegate = self;
    self.treatmentMenu.backgroundColor = [UIColor whiteColor];
    self.treatmentMenu.delegate = self;
    NSInteger treatmentPeriod = [[self.templateInfo valueForKey:@"treatmentPeriod"] integerValue];
    [self.treatmentMenu.mainBtn setTitle:[NSString stringWithFormat:@"%d",treatmentPeriod] forState:UIControlStateNormal];
    self.treatmentMenu.tag = 40;
    self.treatmentMenu.dropDownImage.hidden = YES;
    self.treatmentMenu.mainBtn.enabled = NO;
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
    self.trainingFrequencyMenu.defualtStr = @"";
    self.trainingFrequencyMenu.delegate = self;
    self.trainingFrequencyMenu.titles = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    self.trainingFrequencyMenu.delegate = self;
    self.trainingFrequencyMenu.backgroundColor = [UIColor whiteColor];
    self.trainingFrequencyMenu.delegate = self;
    NSInteger daysPerWeek = [[self.templateInfo valueForKey:@"daysPerWeek"] integerValue];
    [self.trainingFrequencyMenu.mainBtn setTitle:[NSString stringWithFormat:@"%d",daysPerWeek] forState:UIControlStateNormal];
    self.trainingFrequencyMenu.tag = 50;
    self.trainingFrequencyMenu.dropDownImage.hidden = YES;
    self.trainingFrequencyMenu.mainBtn.enabled = NO;
    [self.topBgView addSubview:self.trainingFrequencyMenu];
    
    self.sportTimePointLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.trainingDeviceLbl.frame.origin.x, self.treatmentLbl.frame.origin.y, kRiskLevelLbl_Width * kXScal, kDieaseLbl_Height * kYScal)];
    self.sportTimePointLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.sportTimePointLbl.text = @"运动时间点";
    self.sportTimePointLbl.font = [UIFont systemFontOfSize:kDieaseLbl_FontSieze * kYScal];
    [self.topBgView addSubview:self.sportTimePointLbl];
    
    self.sportTimePointMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.traingDeviceMenu.frame.origin.x, self.treatmentMenu.frame.origin.y, kTrainingDeviceMenu_Width * kXScal, kDieaseTF_Height * kYScal)];
    [self.sportTimePointMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.sportTimePointMenu.defualtStr = @"";
    self.sportTimePointMenu.delegate = self;
    self.sportTimePointMenu.titles = @[@"任意",@"三餐前半小时",@"三餐后一小时"];
    self.sportTimePointMenu.delegate = self;
    self.sportTimePointMenu.backgroundColor = [UIColor whiteColor];
    self.sportTimePointMenu.delegate = self;
    NSInteger timing = [[self.templateInfo valueForKey:@"timing"] integerValue];
    if (timing == 3) {
        [self.sportTimePointMenu.mainBtn setTitle:@"任意" forState:UIControlStateNormal];
    } else if(timing == 1) {
        [self.sportTimePointMenu.mainBtn setTitle:@"三餐前半小时" forState:UIControlStateNormal];
    } else if (timing == 2) {
        [self.sportTimePointMenu.mainBtn setTitle:@"三餐后一小时" forState:UIControlStateNormal];
    }
    self.sportTimePointMenu.tag = 60;
    self.sportTimePointMenu.dropDownImage.hidden = YES;
    self.sportTimePointMenu.mainBtn.enabled = NO;
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
    self.trainingGroupValLbl.text = @"1";
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
    self.trainingVolumeValLbl.text = @"0.00kg";
    [self.dataView addSubview:self.trainingVolumeValLbl];
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

- (NSString *)getTimeString:(NSInteger)seconds {
    NSString *timeStr = @"";
    NSInteger minute = seconds / 60;
    NSInteger second = seconds % 60;
    timeStr = [NSString stringWithFormat:@"%02ld:%02ld",(long)minute,(long)second];
    return timeStr;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseCellIdStr = [NSString stringWithFormat:@"CheckPowerTemplateCell%ld%ld",(long)indexPath.section,(long)indexPath.row];
    CheckPowerTemplateCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellIdStr];
    if (cell == nil) {
        cell = [[CheckPowerTemplateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellIdStr];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
    }
    AerobicriptionModel *dict = [self.groups objectAtIndex:indexPath.section];
    cell.groupNameLbl.text = [NSString stringWithFormat:@"第%d组",indexPath.section + 1];
    CGFloat weight = [[dict valueForKey:@"weight"] floatValue];
    [cell.weightMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [cell.weightMenu.mainBtn setTitle:[NSString stringWithFormat:@"%.1f",weight] forState:UIControlStateNormal];
    NSInteger times = [[dict valueForKey:@"times"] integerValue];
    [cell.timesMenu.mainBtn setTitle:[NSString stringWithFormat:@"%d",times] forState:UIControlStateNormal];
    [cell.timesMenu.mainBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
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

- (NSString *)getTrainingVolumeString:(CGFloat)weight {
    NSString *result = @"0.00 kg";
    result = [NSString stringWithFormat:@"%.2f kg",weight];
    return result;
}

#pragma mark - XXTGDropdownMenuDelegate
- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellNumber:(NSInteger)number {
    
}

- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string
{
    
}

- (void)dropdownMenu:(KTDropDownMenus *)menu mainBtnClick:(UIButton *)sender {
    
}

#pragma mark - button click events
- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

@end
