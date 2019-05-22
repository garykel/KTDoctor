//
//  AddTemplateViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/17.
//  Copyright © 2019 dz. All rights reserved.
//

#import "AddTemplateViewController.h"
#import "KTDropDownMenus.h"
#import "CustomTemplateCell.h"
#import "SystemTemplateCell.h"
#import "UserModel.h"
#import "ChooseTemplateTypeView.h"
#import "CreateTemplateViewController.h"
#import "CheckTemplateInfoViewController.h"
#import "UpdateTemplateInfoViewController.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 250
#define kSearchView_TopMargin 39
#define kSearchView_LeftMargin 20
#define kSearchView_Height 46
#define kSearchView_BottomMargin 15
#define kBottomView_BottomMargin 20
#define kNameTF_LeftMargin 15
#define kNameTF_TopMargin 13
#define kNameTF_Width 134
#define kNameTF_Heihgt 20
#define kNameTF_FontSize 12.0
#define kNameTF_RightMargin 15
#define kDropdownHeight 30
#define kDieaseMenu_Width 133
#define kRiskLevelMenu_Width 108
#define kDeviceMenu_Width 133
#define kTrainingPositionMenu_Width 125
#define kTrainingDeviceMenu_Width 120
#define kSearchBtn_Width 110
#define kSearchBtn_Height 22
#define kSearchBtn_FontSize 12.0
#define kTemplateMenu_TopMargin 13
#define kTemplateMenu_LeftMargin 15
#define kTemplateMenu_Width 129
#define kTemplateMenu_Height 28
#define kTemplateMenu_FontSize 14.0
#define kDeleteBtn_Width 95
#define kDeleteBtn_Heihgt 22
#define kDeleteBtn_RightMargin 16
#define kDeleteBtn_FontSize 12.0
#define kBtn_Space 15
#define kPowerBtn_Width 115
#define kAerobicBtn_Width 120
#define kListBgView_TopMargin 12
#define kListBgView_BottomMargin 15
#define kCheck_LeftMargin 17
#define kCheck_RightMargin 13
#define kCheck_Width 16
#define kSystemHeader_LefttMargin 15
#define kHeaderView_RightMargin 130
#define kHeaderView_TopMargin 16
#define kHeaderView_Height 30
#define kMiddleLine_Width 1
#define kHeader_Btn_FontSize 13.0
#define kListview_TopMargin 10
#define kCell_Height 30
#define kView_Height 240
#define kView_LeftMargin 185

CGSize customListviewSize;
CGSize systemListviewSize;
@interface AddTemplateViewController ()<UITableViewDelegate,UITableViewDataSource,XXTGDropdownMenuDelegate>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIView *searchBgView;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UITextField *nameTf;
@property (nonatomic,strong)KTDropDownMenus *dieaseMenu;
@property (nonatomic,strong)KTDropDownMenus *riskLevelMenu;
@property (nonatomic,strong)KTDropDownMenus *deviceMenu;
@property (nonatomic,strong)KTDropDownMenus *trainingPositionMenu;
@property (nonatomic,strong)KTDropDownMenus *trainingDeviceMenu;
@property (nonatomic,strong)UIButton *searchBtn;
@property (nonatomic,strong)KTDropDownMenus *templateMenu;
@property (nonatomic,strong)UIButton *createAerobicTemplateBtn;
@property (nonatomic,strong)UIButton *createPowerTemplateBtn;
@property (nonatomic,strong)UIButton *deleteBtn;
@property (nonatomic,strong)UIView *listBgview;
@property (nonatomic,strong)UIView *customListviewBgView;
@property (nonatomic,strong)UIView *systemListviewBgView;
@property (nonatomic,strong)UITableView *customTemplateListView;
@property (nonatomic,strong)UITableView *systemTemplateListView;
@property (nonatomic,strong)UILabel *noDataLbl;
@property (nonatomic,copy)NSString *startTimeStr;
@property (nonatomic,assign)NSInteger offset;
@property (nonatomic,assign)BOOL isFooterClick;
@property (nonatomic,strong)UIButton *checkAllBtn;
@property (nonatomic,strong)NSMutableArray *customTemplateArr;
@property (nonatomic,strong)NSMutableArray *customeTemplateCheckArr;
@property (nonatomic,strong)NSMutableArray *systemTemplateArr;
@property (nonatomic,strong)NSMutableArray *customTemplateIdArr;
@property (nonatomic,strong)UserModel *user;
@property (nonatomic,assign)NSInteger type;
@property (nonatomic,strong)ChooseTemplateTypeView *template;
@property (nonatomic,strong)NSArray *deviceTypeArr;
@end

@implementation AddTemplateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshCustomTemplates) name:@"UpdateCustomTemplatesNotification" object:nil];
    self.user = [[UserModel sharedUserModel] getCurrentUser];
    self.type = 2;
    self.customTemplateArr = [NSMutableArray array];
    self.customeTemplateCheckArr = [NSMutableArray array];
    self.systemTemplateArr = [NSMutableArray array];
    self.customTemplateIdArr = [NSMutableArray array];
    
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [self getDeviceTypeList:parameter];
    
    [self showTemplateListWithType:self.type];
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
    self.titleLbl.text = @"自定义模板管理";
    [self.navView addSubview:self.titleLbl];
}

- (void)setupUI {
    UIImage *bgImg = [UIImage imageNamed:@"history_bg"];
    bgImg = [self imageCompressWithSimple:bgImg scaledToSize:CGSizeMake(kWidth, kHeight - CGRectGetMaxY(self.navView.frame))];
    self.bgImg = [[UIImageView alloc] initWithImage:bgImg];
    self.bgImg.frame = CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWidth, kHeight - CGRectGetMaxY(self.navView.frame));
    [self.view addSubview:self.bgImg];
    self.bgImg.userInteractionEnabled = YES;
    
    self.searchBgView = [[UIView alloc] initWithFrame:CGRectMake(kSearchView_LeftMargin * kXScal, kSearchView_TopMargin * kYScal, kWidth - 2 * kSearchView_LeftMargin * kXScal, kSearchView_Height * kYScal)];
    self.searchBgView.backgroundColor = [UIColor colorWithHexString:@"#D4EEF1"];
    self.searchBgView.layer.cornerRadius = 4;
    self.searchBgView.layer.masksToBounds = YES;
    [self.bgImg addSubview:self.searchBgView];
    
    self.nameTf = [[UITextField alloc] initWithFrame:CGRectMake(kNameTF_LeftMargin * kXScal, kNameTF_TopMargin * kYScal, kNameTF_Width * kXScal, kNameTF_Heihgt * kYScal)];
    self.nameTf.backgroundColor = [UIColor whiteColor];
    self.nameTf.placeholder = @"模板名称";
    self.nameTf.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    [self.searchBgView addSubview:self.nameTf];
    
    self.dieaseMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameTf.frame) + kNameTF_RightMargin * kXScal, self.nameTf.frame.origin.y, kDieaseMenu_Width * kXScal, kNameTF_Heihgt * kYScal)];
    [self.dieaseMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.dieaseMenu.defualtStr = @"适应病症";
    self.dieaseMenu.titles = @[@"II型糖尿病"];
    self.dieaseMenu.delegate = self;
    self.dieaseMenu.tag = 10;
    [self.searchBgView addSubview:self.dieaseMenu];
    
    self.riskLevelMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dieaseMenu.frame) + kNameTF_RightMargin * kXScal, self.nameTf.frame.origin.y, kRiskLevelMenu_Width * kXScal, kNameTF_Heihgt * kYScal)];
    [self.riskLevelMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.riskLevelMenu.defualtStr = @"风险等级";
    self.riskLevelMenu.titles = @[@"高",@"中",@"低"];
    self.riskLevelMenu.delegate = self;
    self.riskLevelMenu.tag = 20;
    [self.searchBgView addSubview:self.riskLevelMenu];
    
    self.deviceMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelMenu.frame) + kNameTF_RightMargin * kXScal, self.nameTf.frame.origin.y, kDeviceMenu_Width * kXScal, kNameTF_Heihgt * kYScal)];
    [self.deviceMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.deviceMenu.defualtStr = @"有氧设备";
    self.deviceMenu.titles = @[@"有氧设备",@"力量设备"];
    self.deviceMenu.delegate = self;
    self.deviceMenu.tag = 30;
    [self.searchBgView addSubview:self.deviceMenu];
    
    self.trainingPositionMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deviceMenu.frame) + kNameTF_RightMargin * kXScal, self.nameTf.frame.origin.y, kTrainingPositionMenu_Width * kXScal, kNameTF_Heihgt * kYScal)];
    [self.trainingPositionMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.trainingPositionMenu.defualtStr = @"训练部位";
    self.trainingPositionMenu.titles = @[@"心肺"];
    self.trainingPositionMenu.delegate = self;
    self.trainingPositionMenu.tag = 40;
    [self.searchBgView addSubview:self.trainingPositionMenu];
    
    self.trainingDeviceMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingPositionMenu.frame) + kNameTF_RightMargin * kXScal, self.nameTf.frame.origin.y, kTrainingDeviceMenu_Width * kXScal, kNameTF_Heihgt * kYScal)];
    [self.trainingDeviceMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.trainingDeviceMenu.defualtStr = @"训练设备";
    self.trainingDeviceMenu.titles = @[@"功率车",@"椭圆机"];
    self.trainingDeviceMenu.delegate = self;
    self.trainingDeviceMenu.tag = 50;
    [self.searchBgView addSubview:self.trainingDeviceMenu];
    
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.searchBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    self.searchBtn.frame = CGRectMake(CGRectGetMaxX(self.trainingDeviceMenu.frame) + kNameTF_RightMargin * kXScal, self.nameTf.frame.origin.y, kSearchBtn_Width * kXScal, kSearchBtn_Height * kYScal);
    self.searchBtn.center = CGPointMake(CGRectGetMaxX(self.trainingDeviceMenu.frame) + kNameTF_RightMargin * kXScal + kSearchBtn_Width * kXScal /2.0, self.trainingDeviceMenu.center.y);
    [self.searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [self.searchBtn.titleLabel setFont:[UIFont systemFontOfSize:kSearchBtn_FontSize * kYScal]];
    [self.searchBtn addTarget:self action:@selector(searchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.searchBtn.layer.cornerRadius = kSearchBtn_Height * kYScal/2.0;
    self.searchBtn.layer.masksToBounds = YES;
    [self.searchBgView addSubview:self.searchBtn];
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(self.searchBgView.frame.origin.x, CGRectGetMaxY(self.searchBgView.frame) + kSearchView_BottomMargin * kYScal, self.searchBgView.frame.size.width,kHeight - CGRectGetMaxY(self.navView.frame) - CGRectGetMaxY(self.searchBgView.frame) - kSearchView_BottomMargin * kYScal - kBottomView_BottomMargin * kYScal)];
    self.bottomView.backgroundColor = [UIColor colorWithHexString:@"#C7F0F9"];
    [self.bgImg addSubview:self.bottomView];
    
    self.templateMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(kTemplateMenu_LeftMargin * kXScal, kTemplateMenu_TopMargin * kYScal, kTemplateMenu_Width * kXScal, kTemplateMenu_Height * kYScal)];
    [self.templateMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.templateMenu.defualtStr = @"自定义模板";
    self.templateMenu.titles = @[@"自定义模板",@"系统模板"];
    self.templateMenu.delegate = self;
    self.templateMenu.tag = 60;
    [self.bottomView addSubview:self.templateMenu];
    
    CGFloat createBtn_LeftMargin = self.bottomView.frame.size.width - kAerobicBtn_Width * kXScal - kPowerBtn_Width * kXScal - kDeleteBtn_Width * kXScal - 2 * kBtn_Space * kXScal - kDeleteBtn_RightMargin * kXScal;
    self.createAerobicTemplateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.createAerobicTemplateBtn.frame = CGRectMake(createBtn_LeftMargin, 0, kAerobicBtn_Width * kXScal, kDeleteBtn_Heihgt * kYScal);
    self.createAerobicTemplateBtn.center = CGPointMake(createBtn_LeftMargin + kAerobicBtn_Width * kXScal/2.0, self.templateMenu.center.y);
    [self.createAerobicTemplateBtn setTitle:@"新建有氧模板" forState:UIControlStateNormal];
    self.createAerobicTemplateBtn.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.createAerobicTemplateBtn setImage:[UIImage imageNamed:@"createTemplate"] forState:UIControlStateNormal];
    [self.createAerobicTemplateBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.createAerobicTemplateBtn.titleLabel setFont:[UIFont systemFontOfSize:kDeleteBtn_FontSize * kYScal]];
    [self.createAerobicTemplateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.createAerobicTemplateBtn addTarget:self action:@selector(createAerobicTemplateBtnClick:)
                            forControlEvents:UIControlEventTouchUpInside];
    self.createAerobicTemplateBtn.layer.cornerRadius = kDeleteBtn_Heihgt * kYScal/2.0;
    self.createAerobicTemplateBtn.layer.masksToBounds = YES;
    [self.bottomView addSubview:self.createAerobicTemplateBtn];
    
    self.createPowerTemplateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.createPowerTemplateBtn.frame = CGRectMake(CGRectGetMaxX(self.createAerobicTemplateBtn.frame) + kBtn_Space * kXScal, self.createAerobicTemplateBtn.frame.origin.y, kPowerBtn_Width * kXScal, kDeleteBtn_Heihgt * kYScal);
    self.createPowerTemplateBtn.layer.cornerRadius = kDeleteBtn_Heihgt * kYScal/2.0;
    self.createPowerTemplateBtn.layer.masksToBounds = YES;
    self.createPowerTemplateBtn.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.createPowerTemplateBtn setImage:[UIImage imageNamed:@"createTemplate"] forState:UIControlStateNormal];
    [self.createPowerTemplateBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.createPowerTemplateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.createPowerTemplateBtn setTitle:@"新建力量模板" forState:UIControlStateNormal];
    [self.createPowerTemplateBtn.titleLabel setFont:[UIFont systemFontOfSize:kDeleteBtn_FontSize * kYScal]];
    [self.createPowerTemplateBtn addTarget:self action:@selector(createPowerTemplateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:self.createPowerTemplateBtn];
    
    self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deleteBtn.frame = CGRectMake(CGRectGetMaxX(self.createPowerTemplateBtn.frame) + kBtn_Space * kXScal, self.createAerobicTemplateBtn.frame.origin.y, kDeleteBtn_Width * kXScal, kDeleteBtn_Heihgt * kYScal);
    self.deleteBtn.layer.cornerRadius = kDeleteBtn_Heihgt * kYScal/2.0;
    self.deleteBtn.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    self.deleteBtn.layer.masksToBounds = YES;
    [self.deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [self.deleteBtn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [self.deleteBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.deleteBtn.titleLabel setFont:[UIFont systemFontOfSize:kDeleteBtn_FontSize * kYScal]];
    [self.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:self.deleteBtn];
    [self configCustomTemplateView];
    [self configSystemTemplateView];
}

- (void)configSystemTemplateView {
    self.systemListviewBgView = [[UIView alloc] initWithFrame:CGRectMake(self.templateMenu.frame.origin.x, CGRectGetMaxY(self.templateMenu.frame) + kListBgView_TopMargin * kYScal, self.bottomView.frame.size.width - 2 * kTemplateMenu_LeftMargin * kXScal, self.bottomView.frame.size.height - CGRectGetMaxY(self.templateMenu.frame)- kListBgView_TopMargin * kYScal - kListBgView_BottomMargin * kYScal)];
    self.systemListviewBgView.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    self.systemListviewBgView.layer.cornerRadius = 4;
    self.systemListviewBgView.layer.masksToBounds = YES;
    self.systemListviewBgView.hidden = YES;
    [self.bottomView addSubview:self.systemListviewBgView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, kHeaderView_TopMargin * kYScal, self.customListviewBgView.frame.size.width, kHeaderView_Height * kYScal)];
    headerView.backgroundColor = [UIColor clearColor];
    [self.systemListviewBgView addSubview:headerView];
    systemListviewSize = headerView.frame.size;
    
    CGFloat btnWidth = (headerView.frame.size.width - kSystemHeader_LefttMargin * kXScal - kHeaderView_RightMargin * kXScal - 7 * kMiddleLine_Width)/8;
    UIButton *nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nameBtn.frame = CGRectMake(kSystemHeader_LefttMargin *kXScal, 0, btnWidth, kHeaderView_Height * kYScal);
    [nameBtn setTitle:@"模板名称" forState:UIControlStateNormal];
    nameBtn.backgroundColor = [UIColor whiteColor];
    [nameBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    nameBtn.tag = 10;
    [nameBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [nameBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:nameBtn];
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nameBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line1.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line1];
    
    UIButton *dieaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dieaseBtn.frame = CGRectMake(CGRectGetMaxX(line1.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [dieaseBtn setTitle:@"适应病症" forState:UIControlStateNormal];
    dieaseBtn.backgroundColor = [UIColor whiteColor];
    [dieaseBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    dieaseBtn.tag = 20;
    [dieaseBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [dieaseBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:dieaseBtn];
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(dieaseBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line2.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line2];
    
    UIButton *riskLevelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    riskLevelBtn.frame = CGRectMake(CGRectGetMaxX(line2.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [riskLevelBtn setTitle:@"风险等级" forState:UIControlStateNormal];
    riskLevelBtn.backgroundColor = [UIColor whiteColor];
    [riskLevelBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    riskLevelBtn.tag = 30;
    [riskLevelBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [riskLevelBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:riskLevelBtn];
    
    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(riskLevelBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line3.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line3];
    
    UIButton *positionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    positionBtn.frame = CGRectMake(CGRectGetMaxX(line3.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [positionBtn setTitle:@"训练部位" forState:UIControlStateNormal];
    positionBtn.backgroundColor = [UIColor whiteColor];
    [positionBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    positionBtn.tag = 40;
    [positionBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [positionBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:positionBtn];
    
    UIView *line4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(positionBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line4.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line4];
    
    UIButton *equipmentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    equipmentBtn.frame = CGRectMake(CGRectGetMaxX(line4.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [equipmentBtn setTitle:@"训练设备" forState:UIControlStateNormal];
    equipmentBtn.backgroundColor = [UIColor whiteColor];
    [equipmentBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    equipmentBtn.tag = 50;
    [equipmentBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [equipmentBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:equipmentBtn];
    
    UIView *line5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(equipmentBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line1.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line1];
    
    UIButton *weekBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    weekBtn.frame = CGRectMake(CGRectGetMaxX(line5.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [weekBtn setTitle:@"疗程周期" forState:UIControlStateNormal];
    weekBtn.backgroundColor = [UIColor whiteColor];
    [weekBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    weekBtn.tag = 60;
    [weekBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [weekBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:weekBtn];
    
    UIView *line6 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(weekBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line1.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line1];
    
    UIButton *groupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    groupBtn.frame = CGRectMake(CGRectGetMaxX(line6.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [groupBtn setTitle:@"训练组数" forState:UIControlStateNormal];
    groupBtn.backgroundColor = [UIColor whiteColor];
    [groupBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    groupBtn.tag = 70;
    [groupBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [groupBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:groupBtn];
    
    UIView *line7 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(groupBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line7.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line7];
    
    UIButton *timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    timeBtn.frame = CGRectMake(CGRectGetMaxX(line7.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [timeBtn setTitle:@"运动时长" forState:UIControlStateNormal];
    timeBtn.backgroundColor = [UIColor whiteColor];
    [timeBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    timeBtn.tag = 80;
    [timeBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [timeBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:timeBtn];
    
    self.systemTemplateListView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame) + kListview_TopMargin * kYScal, self.customListviewBgView.frame.size.width, self.customListviewBgView.frame.size.height - CGRectGetMaxY(headerView.frame) - kListview_TopMargin * kYScal) style:UITableViewStylePlain];
    self.systemTemplateListView.dataSource = self;
    self.systemTemplateListView.delegate = self;
    self.systemTemplateListView.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    self.systemTemplateListView.tableFooterView = [[UIView alloc] init];
    self.systemTemplateListView.separatorColor = [UIColor clearColor];
    [self.systemListviewBgView addSubview:self.systemTemplateListView];
    
    //添加头部的下拉刷新
    MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc] init];
    [header setRefreshingTarget:self refreshingAction:@selector(headerClick)];
    self.systemTemplateListView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [[MJRefreshBackNormalFooter alloc] init];
    [footer setRefreshingTarget:self refreshingAction:@selector(footerClick)];
    self.systemTemplateListView.mj_footer = footer;
}

- (void)configCustomTemplateView {
    self.customListviewBgView = [[UIView alloc] initWithFrame:CGRectMake(self.templateMenu.frame.origin.x, CGRectGetMaxY(self.templateMenu.frame) + kListBgView_TopMargin * kYScal, self.bottomView.frame.size.width - 2 * kTemplateMenu_LeftMargin * kXScal, self.bottomView.frame.size.height - CGRectGetMaxY(self.templateMenu.frame)- kListBgView_TopMargin * kYScal - kListBgView_BottomMargin * kYScal)];
    self.customListviewBgView.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    self.customListviewBgView.layer.cornerRadius = 4;
    self.customListviewBgView.layer.masksToBounds = YES;
    [self.bottomView addSubview:self.customListviewBgView];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, kHeaderView_TopMargin * kYScal, self.customListviewBgView.frame.size.width, kHeaderView_Height * kYScal)];
    headerView.backgroundColor = [UIColor clearColor];
    [self.customListviewBgView addSubview:headerView];
    customListviewSize = headerView.frame.size;
    
    self.checkAllBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.checkAllBtn setImage:[UIImage imageNamed:@"template_unselected"] forState:UIControlStateNormal];
    self.checkAllBtn.frame = CGRectMake(kCheck_LeftMargin * kXScal, (headerView.frame.size.height - kCheck_Width * kYScal)/2.0, kCheck_Width * kYScal, kCheck_Width * kYScal);
    [self.checkAllBtn addTarget:self action:@selector(customTemplateSelectAll:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:self.checkAllBtn];
    
    CGFloat btnWidth = (headerView.frame.size.width - CGRectGetMaxX(self.checkAllBtn.frame) - kCheck_RightMargin * kXScal - kHeaderView_RightMargin * kXScal - 7 * kMiddleLine_Width)/8;
    UIButton *nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nameBtn.frame = CGRectMake(CGRectGetMaxX(self.checkAllBtn.frame) + kCheck_RightMargin *kXScal, 0, btnWidth, kHeaderView_Height * kYScal);
    [nameBtn setTitle:@"模板名称" forState:UIControlStateNormal];
    nameBtn.backgroundColor = [UIColor whiteColor];
    [nameBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    nameBtn.tag = 10;
    [nameBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [nameBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:nameBtn];
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nameBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line1.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line1];
    
    UIButton *dieaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dieaseBtn.frame = CGRectMake(CGRectGetMaxX(line1.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [dieaseBtn setTitle:@"适应病症" forState:UIControlStateNormal];
    dieaseBtn.backgroundColor = [UIColor whiteColor];
    [dieaseBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    dieaseBtn.tag = 20;
    [dieaseBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [dieaseBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:dieaseBtn];
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(dieaseBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line2.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line2];
    
    UIButton *riskLevelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    riskLevelBtn.frame = CGRectMake(CGRectGetMaxX(line2.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [riskLevelBtn setTitle:@"风险等级" forState:UIControlStateNormal];
    riskLevelBtn.backgroundColor = [UIColor whiteColor];
    [riskLevelBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    riskLevelBtn.tag = 30;
    [riskLevelBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [riskLevelBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:riskLevelBtn];
    
    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(riskLevelBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line3.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line3];
    
    UIButton *positionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    positionBtn.frame = CGRectMake(CGRectGetMaxX(line3.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [positionBtn setTitle:@"训练部位" forState:UIControlStateNormal];
    positionBtn.backgroundColor = [UIColor whiteColor];
    [positionBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    positionBtn.tag = 40;
    [positionBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [positionBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:positionBtn];
    
    UIView *line4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(positionBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line4.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line4];
    
    UIButton *equipmentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    equipmentBtn.frame = CGRectMake(CGRectGetMaxX(line4.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [equipmentBtn setTitle:@"训练设备" forState:UIControlStateNormal];
    equipmentBtn.backgroundColor = [UIColor whiteColor];
    [equipmentBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    equipmentBtn.tag = 50;
    [equipmentBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [equipmentBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:equipmentBtn];
    
    UIView *line5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(equipmentBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line1.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line1];
    
    UIButton *weekBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    weekBtn.frame = CGRectMake(CGRectGetMaxX(line5.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [weekBtn setTitle:@"疗程周期" forState:UIControlStateNormal];
    weekBtn.backgroundColor = [UIColor whiteColor];
    [weekBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    weekBtn.tag = 60;
    [weekBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [weekBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:weekBtn];
    
    UIView *line6 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(weekBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line1.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line1];
    
    UIButton *groupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    groupBtn.frame = CGRectMake(CGRectGetMaxX(line6.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [groupBtn setTitle:@"训练组数" forState:UIControlStateNormal];
    groupBtn.backgroundColor = [UIColor whiteColor];
    [groupBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    groupBtn.tag = 70;
    [groupBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [groupBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:groupBtn];
    
    UIView *line7 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(groupBtn.frame), 0, kMiddleLine_Width, kHeaderView_Height * kYScal)];
    line7.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [headerView addSubview:line7];
    
    UIButton *timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    timeBtn.frame = CGRectMake(CGRectGetMaxX(line7.frame), 0, btnWidth, kHeaderView_Height * kYScal);
    [timeBtn setTitle:@"运动时长" forState:UIControlStateNormal];
    timeBtn.backgroundColor = [UIColor whiteColor];
    [timeBtn.titleLabel setFont:[UIFont systemFontOfSize:kHeader_Btn_FontSize * kYScal]];
    timeBtn.tag = 80;
    [timeBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [timeBtn addTarget:self action:@selector(customTemplateItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:timeBtn];
    
    self.customTemplateListView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame) + kListview_TopMargin * kYScal, self.customListviewBgView.frame.size.width, self.customListviewBgView.frame.size.height - CGRectGetMaxY(headerView.frame) - kListview_TopMargin * kYScal) style:UITableViewStylePlain];
    self.customTemplateListView.dataSource = self;
    self.customTemplateListView.delegate = self;
    self.customTemplateListView.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    self.customTemplateListView.tableFooterView = [[UIView alloc] init];
    self.customTemplateListView.separatorColor = [UIColor clearColor];
    [self.customListviewBgView addSubview:self.customTemplateListView];
    //添加头部的下拉刷新
    MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc] init];
    [header setRefreshingTarget:self refreshingAction:@selector(headerClick)];
    self.customTemplateListView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [[MJRefreshBackNormalFooter alloc] init];
    [footer setRefreshingTarget:self refreshingAction:@selector(footerClick)];
    self.customTemplateListView.mj_footer = footer;
}

- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.customTemplateListView) {
        return self.customTemplateArr.count;
    } else {
        return self.systemTemplateArr.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCell_Height * kYScal;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.customTemplateListView) {
        NSString *reuselCellStr = [NSString stringWithFormat:@"customTemplatecellId%ld%ld",indexPath.section,indexPath.row];
        CustomTemplateCell *cell = [tableView dequeueReusableCellWithIdentifier:reuselCellStr];
        if (cell == nil) {
            cell = [[CustomTemplateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuselCellStr];
            cell.selectionStyle          = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
        }
        NSDictionary *dict = [self.customTemplateArr objectAtIndex:indexPath.row];
        cell.nameLbl.text = [dict valueForKey:@"title"];
        cell.dieaseLbl.text = [dict valueForKey:@"disease"];
        NSInteger trainPart = [[dict valueForKey:@"trainPart"] integerValue];
        if (trainPart == 0) {
            cell.positionLbl.text = @"心肺";
        }
        NSInteger riskLevel = [[dict valueForKey:@"riskLevel"] integerValue];
        NSString *riskLevelStr = @"低";
        if (riskLevel == 1) {
            riskLevelStr = @"低";
        } else if (riskLevel == 2) {
            riskLevelStr = @"中";
        } else if (riskLevel == 3) {
            riskLevelStr = @"高";
        }
        cell.riskLevelLbl.text = riskLevelStr;
        NSArray *typeList = [dict valueForKey:@"typeList"];
        if (typeList.count > 0) {
            NSInteger equipmentType = [[dict valueForKey:@"type"] integerValue];
            for (NSDictionary *typeDict in typeList) {
                NSInteger id = [[typeDict valueForKey:@"id"] integerValue];
                NSString *name = [typeDict valueForKey:@"name"];
                if (equipmentType == id) {
                    cell.equipmentLbl.text = name;
                }
            }
        }
        cell.weekLbl.text = [NSString stringWithFormat:@"%d",[[dict valueForKey:@"treatmentPeriod"] integerValue]];
        cell.groupLbl.text = [NSString stringWithFormat:@"%d",[[dict valueForKey:@"sectionNum"] integerValue]];
        NSInteger targetDuration = [[dict valueForKey:@"targetDuration"] integerValue];
        NSString *timeStr = [self getTimeString:targetDuration];
        cell.timeLbl.text = timeStr;
        if (self.customeTemplateCheckArr.count > 0) {
            BOOL hasSelect = [[self.customeTemplateCheckArr objectAtIndex:indexPath.row] boolValue];
            if (hasSelect) {
                [cell.checkBtn setImage:[UIImage imageNamed:@"template_selected"] forState:UIControlStateNormal];
            } else {
                [cell.checkBtn setImage:[UIImage imageNamed:@"template_unselected"] forState:UIControlStateNormal];
            }
        }
        cell.checkBtn.tag = indexPath.row + 10000;
        [cell.checkBtn addTarget:self action:@selector(customTemplateSelected:) forControlEvents:UIControlEventTouchUpInside];
        [cell.editBtn addTarget:self action:@selector(editTemplate:)
               forControlEvents:UIControlEventTouchUpInside];
        cell.editBtn.tag = indexPath.row + 20000;
        return cell;
    } else {
        NSString *reuselCellStr = [NSString stringWithFormat:@"systemTemplatecellId%ld%ld",indexPath.section,indexPath.row];
        SystemTemplateCell *cell = [tableView dequeueReusableCellWithIdentifier:reuselCellStr];
        if (cell == nil) {
            cell = [[SystemTemplateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuselCellStr];
            cell.selectionStyle          = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
        }
        NSDictionary *dict = [self.systemTemplateArr objectAtIndex:indexPath.row];
        cell.nameLbl.text = [dict valueForKey:@"title"];
        cell.dieaseLbl.text = [dict valueForKey:@"disease"];
        NSInteger trainPart = [[dict valueForKey:@"trainPart"] integerValue];
        if (trainPart == 0) {
            cell.positionLbl.text = @"心肺";
        }
        NSInteger riskLevel = [[dict valueForKey:@"riskLevel"] integerValue];
        NSString *riskLevelStr = @"低";
        if (riskLevel == 1) {
            riskLevelStr = @"低";
        } else if (riskLevel == 2) {
            riskLevelStr = @"中";
        } else if (riskLevel == 3) {
            riskLevelStr = @"高";
        }
        cell.riskLevelLbl.text = riskLevelStr;
        NSArray *typeList = [dict valueForKey:@"typeList"];
        if (typeList.count > 0) {
            NSInteger equipmentType = [[dict valueForKey:@"type"] integerValue];
            for (NSDictionary *typeDict in typeList) {
                NSInteger id = [[typeDict valueForKey:@"id"] integerValue];
                NSString *name = [typeDict valueForKey:@"name"];
                if (equipmentType == id) {
                    cell.equipmentLbl.text = name;
                }
            }
        }
        cell.weekLbl.text = [NSString stringWithFormat:@"%d",[[dict valueForKey:@"treatmentPeriod"] integerValue]];
        cell.groupLbl.text = [NSString stringWithFormat:@"%d",[[dict valueForKey:@"sectionNum"] integerValue]];
        NSInteger targetDuration = [[dict valueForKey:@"targetDuration"] integerValue];
        NSString *timeStr = [self getTimeString:targetDuration];
        cell.timeLbl.text = timeStr;
        [cell.editBtn addTarget:self action:@selector(editTemplate:)
               forControlEvents:UIControlEventTouchUpInside];
        cell.editBtn.tag = indexPath.row + 20000;
        return cell;
    }
}

- (NSString *)getTimeString:(NSInteger)seconds {
    NSString *timeStr = @"";
    NSInteger minute = seconds / 60;
    NSInteger second = seconds % 60;
    timeStr = [NSString stringWithFormat:@"%02ld:%02ld",(long)minute,(long)second];
    return timeStr;
}

- (void)headerClick {
    self.isFooterClick = NO;
    self.offset = 0;
    [self showTemplateListWithType:self.type];
}

- (void)footerClick {
    self.isFooterClick = YES;
    self.offset += 10;
    [self showTemplateListWithType:self.type];
}

#pragma mark - XXTGDropdownMenuDelegate

- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string
{
    if (menu == self.templateMenu) {
        if ([string isEqualToString:@"自定义模板"]) {
            self.systemListviewBgView.hidden = YES;
            self.customListviewBgView.hidden = NO;
            self.type = 2;
            [self showTemplateListWithType:self.type];
        } else if ([string isEqualToString:@"系统模板"]) {
            self.systemListviewBgView.hidden = NO;
            self.customListviewBgView.hidden = YES;
            self.type = 1;
            [self showTemplateListWithType:self.type];
        }
    }
}

- (void)dropdownMenu:(KTDropDownMenus *)menu mainBtnClick:(UIButton *)sender {
    
}

#pragma mark - button click events
//返回
- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

//搜索
- (void)searchBtnClick:(UIButton*)sender {
    NSLog(@"搜索");
}

//新建有氧模板
- (void)createAerobicTemplateBtnClick:(UIButton*)sender {
    NSLog(@"新建有氧模板");
    self.template = [[ChooseTemplateTypeView alloc] initWithFrame:CGRectMake(0, 0, kWidth - 2 * kView_LeftMargin * kXScal, kView_Height * kYScal)];
    [self.template.intensiteBtn addTarget:self action:@selector(createIntensiteTemplate:) forControlEvents:UIControlEventTouchUpInside];
    [self.template.powerBtn addTarget:self action:@selector(createPowerTemplate:) forControlEvents:UIControlEventTouchUpInside];
    [self.template show];
}

//新建强度模板
- (void)createIntensiteTemplate:(UIButton*)sender {
    [self.template dismiss];
    CreateTemplateViewController *template = [[CreateTemplateViewController alloc] init];
    template.type = 1;
    if (self.deviceTypeArr.count > 0) {
        for (NSDictionary *dict in self.deviceTypeArr) {
            NSString *name = [dict valueForKey:@"name"];
            if ([name isEqualToString:@"有氧设备"]) {
                template.deviceTypeArr = [dict valueForKey:@"children"];
            }
        }
    }
    [self.navigationController pushViewController:template animated:NO];
}

//新建功率模板
- (void)createPowerTemplate:(UIButton*)sender {
    [self.template dismiss];
    CreateTemplateViewController *template = [[CreateTemplateViewController alloc] init];
    template.type = 2;
    if (self.deviceTypeArr.count > 0) {
        for (NSDictionary *dict in self.deviceTypeArr) {
            NSString *name = [dict valueForKey:@"name"];
            if ([name isEqualToString:@"有氧设备"]) {
                template.deviceTypeArr = [dict valueForKey:@"children"];
            }
        }
    }
    [self.navigationController pushViewController:template animated:NO];
}

//新建力量模板
- (void)createPowerTemplateBtnClick:(UIButton*)sender {
    NSLog(@"新建力量模板");
}

//删除模板
- (void)deleteBtnClick:(UIButton*)sender {
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    if (self.customTemplateIdArr.count > 0) {
        NSString *ids = [self.customTemplateIdArr componentsJoinedByString:@","];
        [parameter setValue:ids forKey:@"id"];
        [self deleteCustomTemplate:parameter];
    }
}

//自定义模板全选
- (void)customTemplateSelectAll:(UIButton*)sender {
    NSLog(@"自定义模板全选");
    if (self.customeTemplateCheckArr.count > 0) {
        [self.customeTemplateCheckArr removeAllObjects];
    }
    if (sender.selected) {
        sender.selected = NO;
        [self.checkAllBtn setImage:[UIImage imageNamed:@"template_unselected"] forState:UIControlStateNormal];
        if (self.customTemplateIdArr.count > 0) {
            [self.customTemplateIdArr removeAllObjects];
        }
        if (self.customTemplateArr.count > 0) {
            for (NSInteger i = 0; i < self.customTemplateArr.count; i++) {
                [self.customeTemplateCheckArr addObject:[NSNumber numberWithBool:NO]];
            }
        }
    } else {
        sender.selected = YES;
        if (self.customTemplateIdArr.count > 0) {
            [self.customTemplateIdArr removeAllObjects];
        }
        for (NSDictionary *dict in self.customTemplateArr) {
            NSString *idStr = [NSString stringWithFormat:@"%d",[[dict valueForKey:@"id"] integerValue]];
            [self.customTemplateIdArr addObject:idStr];
        }
        [self.checkAllBtn setImage:[UIImage imageNamed:@"template_selected"] forState:UIControlStateNormal];
        if (self.customTemplateArr.count > 0) {
            for (NSInteger i = 0; i < self.customTemplateArr.count; i++) {
                [self.customeTemplateCheckArr addObject:[NSNumber numberWithBool:YES]];
            }
        }
        
    }
    [self.customTemplateListView reloadData];
    NSLog(@"customeTemplateids is :%@",self.customTemplateIdArr);
}

//单个选中某一个自定义模板
- (void)customTemplateSelected:(UIButton*)sender {
    NSInteger index = sender.tag - 10000;
    if (sender.selected) {
        sender.selected = NO;
        [sender setImage:[UIImage imageNamed:@"template_unselected"] forState:UIControlStateNormal];
        [self.customeTemplateCheckArr replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:NO]];
        NSDictionary *dict = [self.customTemplateArr objectAtIndex:index];
        NSMutableArray *tempArr = [NSMutableArray arrayWithArray:self.customTemplateIdArr];
        for (NSInteger i = 0; i < tempArr.count; i++) {
            NSString *idStr = [NSString stringWithFormat:@"%d",[[dict valueForKey:@"id"] integerValue]];
            NSString *str = [tempArr objectAtIndex:i];
            if ([idStr isEqualToString:str]) {
                [self.customTemplateIdArr removeObject:idStr];
            }
        }
    } else {
        sender.selected = YES;
        [sender setImage:[UIImage imageNamed:@"template_selected"] forState:UIControlStateNormal];
        [self.customeTemplateCheckArr replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:YES]];
        NSDictionary *dict = [self.customTemplateArr objectAtIndex:index];
        NSInteger id = [[dict valueForKey:@"id"] integerValue];
        NSString *idStr = [NSString stringWithFormat:@"%d",id];
        [self.customTemplateIdArr addObject:idStr];
    }
    BOOL check = [self checkHasSelectedAll];
    if (check) {
        [self.checkAllBtn setImage:[UIImage imageNamed:@"template_selected"] forState:UIControlStateNormal];
    } else {
        [self.checkAllBtn setImage:[UIImage imageNamed:@"template_unselected"] forState:UIControlStateNormal];
    }
    NSLog(@"self.customTemplateIdArr is :%@",self.customTemplateIdArr);
}

//检查是否全选
- (BOOL)checkHasSelectedAll {
    BOOL result = NO;
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSNumber *num in self.customeTemplateCheckArr) {
        BOOL check = [num boolValue];
        if (check) {
            [tempArr addObject:num];
        }
    }
    if (tempArr.count == self.customeTemplateCheckArr.count) {
        result = YES;
    } else {
        result = NO;
    }
    return result;
}

//编辑模板
- (void)editTemplate:(UIButton*)sender {
    NSInteger index = sender.tag - 20000;
    NSDictionary *templateDict;
    if (self.type == 1) {
        templateDict = [self.systemTemplateArr objectAtIndex:index];
    } else {
        templateDict = [self.customTemplateArr objectAtIndex:index];
    }
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    NSInteger id = [[templateDict valueForKey:@"id"] integerValue];
    [parameter setValue:@(id) forKey:@"id"];
    [self getTemplateDetailInfo:parameter];
}

//自定义模板列表头视图标签选中
- (void)customTemplateItemClick:(UIButton*)sender {
    
}

#pragma mark - network functions

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
                if (weakself.type == 1) {
                    CheckTemplateInfoViewController *info = [[CheckTemplateInfoViewController alloc] init];
                    info.templateInfo = data;
                    [self.navigationController pushViewController:info animated:NO];
                } else {
                    UpdateTemplateInfoViewController *update = [[UpdateTemplateInfoViewController alloc] init];
                    update.templateInfo = data;
                    [self.navigationController pushViewController:update animated:NO];
                }
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

- (void)deleteCustomTemplate:(NSMutableDictionary *)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_TEMPLATE_DELETE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************%@**************",responseObject);
        if (code == 0) {
            if (weakSelf.customeTemplateCheckArr.count > 0) {
                [weakSelf.customeTemplateCheckArr removeAllObjects];
            }
 
            if (weakSelf.customTemplateIdArr.count > 0) {
                [weakSelf.customTemplateIdArr removeAllObjects];
            }
            if (weakSelf.customTemplateArr.count > 0) {
                [weakSelf.customTemplateArr removeAllObjects];
            }
            [weakSelf refreshCustomTemplates];
            [STTextHudTool showText:@"删除成功"];
        } else if (code == 10011) {
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [self.navigationController popToRootViewControllerAnimated:NO];
        }  else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)showTemplateListWithType:(NSInteger)type{
    __weak typeof (self)weakSelf = self;
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@(self.offset) forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    [parameter setValue:@"" forKey:@"title"];
    [parameter setValue:@"" forKey:@"diease"];
    [parameter setValue:@"" forKey:@"difficulty"];
    [parameter setValue:@"-create_time" forKey:@"sort"];
    [parameter setValue:@(type) forKey:@"type"];
    [parameter setValue:@1 forKey:@"templateType"];
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_TEMPLATE_LIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************%@**************",responseObject);
        if (code == 0) {
            NSArray *rows = [responseObject valueForKey:@"rows"];
            if (weakSelf.isFooterClick) {
                if (type == 1) {
                    [weakSelf.systemTemplateArr addObjectsFromArray:rows];
                    [weakSelf.systemTemplateListView.mj_footer endRefreshing];
                } else {
                    [weakSelf.customTemplateArr addObjectsFromArray:rows];
                    [weakSelf.customTemplateListView.mj_footer endRefreshing];
                }
            } else {
                if (rows.count > 0) {
                    if (type == 1) {//系统模板
                        if (weakSelf.systemTemplateArr.count > 0) {
                            //替换前n个数据
                            NSMutableArray *tempArr = [NSMutableArray array];
                            [tempArr addObjectsFromArray:rows];
                            if (weakSelf.systemTemplateArr.count > rows.count) {
                                NSArray *afterArr = [weakSelf.systemTemplateArr subarrayWithRange:NSMakeRange(rows.count, weakSelf.systemTemplateArr.count - rows.count)];
                                [tempArr addObjectsFromArray:afterArr];
                            }
                            weakSelf.systemTemplateArr = [tempArr mutableCopy];
                        } else {
                            [weakSelf.systemTemplateArr addObjectsFromArray:rows];
                        }
                        [weakSelf.systemTemplateListView.mj_header endRefreshing];
                        [weakSelf.systemTemplateListView reloadData];
                    } else {//自定义模板
                        if (weakSelf.customTemplateArr.count > 0) {
                            //替换前n个数据
                            NSMutableArray *tempArr = [NSMutableArray array];
                            [tempArr addObjectsFromArray:rows];
                            if (weakSelf.customTemplateArr.count > rows.count) {
                                NSArray *afterArr = [weakSelf.customTemplateArr subarrayWithRange:NSMakeRange(rows.count, weakSelf.customTemplateArr.count - rows.count)];
                                [tempArr addObjectsFromArray:afterArr];
                            }
                            weakSelf.customTemplateArr = [tempArr mutableCopy];
                        } else {
                            [weakSelf.customTemplateArr addObjectsFromArray:rows];
                        }
                        [weakSelf.customTemplateListView.mj_header endRefreshing];
                        [weakSelf.customTemplateListView reloadData];
                    }
                } else {
                    if (type == 1) {//系统模板
                        [weakSelf.systemTemplateListView.mj_header endRefreshing];
                        [weakSelf.systemTemplateListView reloadData];
                    } else {//自定义模板
                        [weakSelf.customTemplateListView.mj_header endRefreshing];
                        [weakSelf.customTemplateListView reloadData];
                    }
                }
            }
            for (NSInteger i = 0; i < weakSelf.customTemplateArr.count; i++) {
                [weakSelf.customeTemplateCheckArr addObject:[NSNumber numberWithBool:NO]];
            }
        } else if (code == 10011) {
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [self.navigationController popToRootViewControllerAnimated:NO];
        }  else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

#pragma mark - UpdateCustomTemplatesNotification

- (void)refreshCustomTemplates{
    self.offset = 0;
    [self showTemplateListWithType:self.type];
}

@end
