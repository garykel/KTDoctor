//
//  AddTemplateViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/17.
//  Copyright © 2019 dz. All rights reserved.
//

#import "AddTemplateViewController.h"
#import "LMJDropdownMenu.h"
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
@interface AddTemplateViewController ()<UITableViewDelegate,UITableViewDataSource,LMJDropdownMenuDelegate>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIView *searchBgView;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UITextField *nameTf;
@property (nonatomic,strong)LMJDropdownMenu *dieaseMenu;
@property (nonatomic,strong)LMJDropdownMenu *riskLevelMenu;
@property (nonatomic,strong)LMJDropdownMenu *deviceMenu;
@property (nonatomic,strong)LMJDropdownMenu *trainingPositionMenu;
@property (nonatomic,strong)LMJDropdownMenu *trainingDeviceMenu;
@property (nonatomic,strong)UIButton *searchBtn;
@property (nonatomic,strong)LMJDropdownMenu *templateMenu;
@property (nonatomic,strong)UIButton *createAerobicTemplateBtn;
@property (nonatomic,strong)UIButton *createPowerTemplateBtn;
@property (nonatomic,strong)UIButton *deleteBtn;
@property (nonatomic,strong)UIView *listBgview;
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,strong)UILabel *noDataLbl;
@property (nonatomic,copy)NSString *startTimeStr;
@property (nonatomic,assign)NSInteger offset;
@property (nonatomic,assign)BOOL isFooterClick;
@end

@implementation AddTemplateViewController

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
    
    self.dieaseMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameTf.frame) + kNameTF_RightMargin * kXScal, self.nameTf.frame.origin.y, kDieaseMenu_Width * kXScal, kNameTF_Heihgt * kYScal)];
    [self.dieaseMenu setMenuTitles:@[] rowHeight:kNameTF_Heihgt attr:@{@"title":@"适用病症",@"titleFont":[UIFont systemFontOfSize:kNameTF_FontSize * kYScal],@"titleColor":[UIColor colorWithHexString:@"#999999"],@"itemColor":[UIColor colorWithHexString:@"#2e2e2e"],@"itemFont":[UIFont systemFontOfSize:kNameTF_FontSize * kYScal]}];
    self.dieaseMenu.delegate = self;
    self.dieaseMenu.tag = 10;
    [self.searchBgView addSubview:self.dieaseMenu];
    
    self.riskLevelMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dieaseMenu.frame) + kNameTF_RightMargin * kXScal, self.nameTf.frame.origin.y, kRiskLevelMenu_Width * kXScal, kNameTF_Heihgt * kYScal)];
    [self.riskLevelMenu setMenuTitles:@[] rowHeight:kNameTF_Heihgt attr:@{@"title":@"风险等级",@"titleFont":[UIFont systemFontOfSize:kNameTF_FontSize * kYScal],@"titleColor":[UIColor colorWithHexString:@"#999999"],@"itemColor":[UIColor colorWithHexString:@"#2e2e2e"],@"itemFont":[UIFont systemFontOfSize:kNameTF_FontSize * kYScal]}];
    self.riskLevelMenu.delegate = self;
    self.riskLevelMenu.tag = 20;
    [self.searchBgView addSubview:self.riskLevelMenu];
    
    self.deviceMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelMenu.frame) + kNameTF_RightMargin * kXScal, self.nameTf.frame.origin.y, kDeviceMenu_Width * kXScal, kNameTF_Heihgt * kYScal)];
    [self.deviceMenu setMenuTitles:@[] rowHeight:kNameTF_Heihgt attr:@{@"title":@"有氧设备",@"titleFont":[UIFont systemFontOfSize:kNameTF_FontSize * kYScal],@"titleColor":[UIColor colorWithHexString:@"#999999"],@"itemColor":[UIColor colorWithHexString:@"#2e2e2e"],@"itemFont":[UIFont systemFontOfSize:kNameTF_FontSize * kYScal]}];
    self.deviceMenu.delegate = self;
    self.deviceMenu.tag = 30;
    [self.searchBgView addSubview:self.deviceMenu];
    
    self.trainingPositionMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deviceMenu.frame) + kNameTF_RightMargin * kXScal, self.nameTf.frame.origin.y, kTrainingPositionMenu_Width * kXScal, kNameTF_Heihgt * kYScal)];
    [self.trainingPositionMenu setMenuTitles:@[] rowHeight:kNameTF_Heihgt attr:@{@"title":@"训练部位",@"titleFont":[UIFont systemFontOfSize:kNameTF_FontSize * kYScal],@"titleColor":[UIColor colorWithHexString:@"#999999"],@"itemColor":[UIColor colorWithHexString:@"#2e2e2e"],@"itemFont":[UIFont systemFontOfSize:kNameTF_FontSize * kYScal]}];
    self.trainingPositionMenu.delegate = self;
    self.trainingPositionMenu.tag = 40;
    [self.searchBgView addSubview:self.trainingPositionMenu];
    
    self.trainingDeviceMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingPositionMenu.frame) + kNameTF_RightMargin * kXScal, self.nameTf.frame.origin.y, kTrainingDeviceMenu_Width * kXScal, kNameTF_Heihgt * kYScal)];
    [self.trainingDeviceMenu setMenuTitles:@[] rowHeight:kNameTF_Heihgt attr:@{@"title":@"训练设备",@"titleFont":[UIFont systemFontOfSize:kNameTF_FontSize * kYScal],@"titleColor":[UIColor colorWithHexString:@"#999999"],@"itemColor":[UIColor colorWithHexString:@"#2e2e2e"],@"itemFont":[UIFont systemFontOfSize:kNameTF_FontSize * kYScal]}];
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
    
    self.templateMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(kTemplateMenu_LeftMargin * kXScal, kTemplateMenu_TopMargin * kYScal, kTemplateMenu_Width * kXScal, kTemplateMenu_Height * kYScal)];
    [self.templateMenu setMenuTitles:@[@"自定义模板",@"系统模板"] rowHeight:kNameTF_Heihgt attr:@{@"title":@"自定义模板",@"titleFont":[UIFont systemFontOfSize:kTemplateMenu_FontSize * kYScal],@"titleColor":[UIColor colorWithHexString:@"#999999"],@"itemColor":[UIColor colorWithHexString:@"#2e2e2e"],@"itemFont":[UIFont systemFontOfSize:kTemplateMenu_FontSize * kYScal]}];
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
    [self.deleteBtn setImage:[UIImage imageNamed:@"createTemplate"] forState:UIControlStateNormal];
    [self.deleteBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.deleteBtn.titleLabel setFont:[UIFont systemFontOfSize:kDeleteBtn_FontSize * kYScal]];
    [self.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:self.deleteBtn];
    
    self.listBgview = [[UIView alloc] initWithFrame:CGRectMake(self.templateMenu.frame.origin.x, CGRectGetMaxY(self.templateMenu.frame) + kListBgView_TopMargin * kYScal, self.bottomView.frame.size.width - 2 * kTemplateMenu_LeftMargin * kXScal, self.bottomView.frame.size.height - CGRectGetMaxY(self.templateMenu.frame)- kListBgView_TopMargin * kYScal - kListBgView_BottomMargin * kYScal)];
    self.listBgview.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    self.listBgview.layer.cornerRadius = 4;
    self.listBgview.layer.masksToBounds = YES;
    [self.bottomView addSubview:self.listBgview];
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
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)searchBtnClick:(UIButton*)sender {
    NSLog(@"搜索");
}

- (void)createAerobicTemplateBtnClick:(UIButton*)sender {
    NSLog(@"新建有氧模板");
}

- (void)createPowerTemplateBtnClick:(UIButton*)sender {
    NSLog(@"新建力量模板");
}

- (void)deleteBtnClick:(UIButton*)sender {
    NSLog(@"删除模板");
}

@end
