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
#define kDeleteBtn_Width 95
#define kDeleteBtn_Heihgt 22
#define kDeleteBtn_RightMargin 16
#define kBtn_Space 15
#define kPowerBtn_Width 115
#define kAerobicBtn_Width 120
#define kListBgView_TopMargin 12
@interface AddTemplateViewController ()<UITableViewDelegate,UITableViewDataSource>
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
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(self.searchBgView.frame.origin.x, CGRectGetMaxY(self.searchBgView.frame) + kSearchView_BottomMargin * kYScal, self.searchBgView.frame.size.width,kHeight - CGRectGetMaxY(self.navView.frame) - CGRectGetMaxY(self.searchBgView.frame) - kSearchView_BottomMargin * kYScal - kBottomView_BottomMargin * kYScal)];
    self.bottomView.backgroundColor = [UIColor colorWithHexString:@"#C7F0F9"];
    [self.bgImg addSubview:self.bottomView];
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

@end
