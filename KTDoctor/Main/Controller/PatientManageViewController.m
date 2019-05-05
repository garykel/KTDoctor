//
//  PatientManageViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/17.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientManageViewController.h"
#import "PatientInfoViewController.h"
#import "LMJDropdownMenu.h"
#import "CustomTextField.h"
#import "UserModel.h"
#import "PatientListsCell.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 150
#define KSearchView_TopMargin 15
#define kSearchView_Height 46
#define kView_TopMargin 10
#define kView_BottomMargin 15
#define kView_LeftMargin 20
#define kNameTF_LeftMargin 15
#define KSearchContent_Space 15
#define kSearch_NameTF_Width 225
#define kSearch_DieaseDropview_Width 248
#define kSearch_RiskLevelDropview_Width 175
#define kSearch_AgeTF_Width 135
#define kSearch_Button_Width 110
#define kSearch_Button_RightMargin 16
#define kSearch_Button_Height 22
#define kSearch_Button_Font 11.0
#define kSearch_TF_Height 20
#define kSearch_TF_Font 13.0
#define kSearch_DropView_Font 12.0
#define kBottomView_TopMargin 15
#define kBottomView_BottomMargin 20
#define kPrescription_DropList_TopMargin 13
#define kPrescription_DropList_LeftMargin 15
#define kkPrescription_DropList_Width 130
#define kPrescription_DropList_Height 28
#define kDropMenu_Item_Height 40
#define kListBgView_TopMargin 10
#define kListBgView_LeftMargin 15
#define kListView_TopMargin 10
#define kListView_LeftMargin 15
#define kSortView_TopMargin 10
#define kSortView_RightMargin 140
#define kSortView_Height 30
#define kSortView_SeperateLine_Width 1
#define kSortView_Btn_Font 13.0
#define kCell_Height 30

@interface PatientManageViewController ()<UITableViewDelegate,UITableViewDataSource,LMJDropdownMenuDelegate,CustomTextFieldDelegate>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIView *searchBgView;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)CustomTextField *nameTF;
@property (nonatomic,strong)LMJDropdownMenu *diseaseDropMenu;
@property (nonatomic,strong)LMJDropdownMenu *riskLevelDropMenu;
@property (nonatomic,strong)CustomTextField *ageTF;
@property (nonatomic,strong)UIButton *searchBtn;
@property (nonatomic,strong)UIView *listBgView;
@property (nonatomic,strong)LMJDropdownMenu *prescriptionMenu;
@property (nonatomic,strong)UILabel *patientTitleLbl;
@property (nonatomic,strong)UIView *sortView;
@property (nonatomic,strong)UIButton *idBtn;
@property (nonatomic,assign)BOOL idBtnAsc;
@property (nonatomic,strong)UIView *seperateLine1;
@property (nonatomic,strong)UIButton *nameBtn;
@property (nonatomic,assign)BOOL nameBtnAsc;
@property (nonatomic,strong)UIView *seperateLine2;
@property (nonatomic,strong)UIButton *ageBtn;
@property (nonatomic,assign)BOOL ageBtnAsc;
@property (nonatomic,strong)UIView *seperateLine3;
@property (nonatomic,strong)UIButton *sexBtn;
@property (nonatomic,assign)BOOL sexBtnAsc;
@property (nonatomic,strong)UIView *seperateLine4;
@property (nonatomic,strong)UIButton *riskLevelBtn;
@property (nonatomic,assign)BOOL riskLevelBtnAsc;
@property (nonatomic,strong)UIView *seperateLine5;
@property (nonatomic,strong)UIButton *dieaseBtn;
@property (nonatomic,assign)BOOL dieaseBtnAsc;
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,assign)NSInteger offset;
@property (nonatomic,assign)BOOL isFooterClick;
@property (nonatomic,assign)NSInteger type;
@property (nonatomic,assign)NSInteger itemWidth;
@end

@implementation PatientManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.isFooterClick = NO;
    self.offset = 0;
    self.type = 1;
    self.idBtnAsc = NO;
    self.nameBtnAsc = NO;
    self.ageBtnAsc = NO;
    self.sexBtnAsc = NO;
    self.riskLevelBtnAsc = NO;
    self.dieaseBtnAsc = NO;
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
    self.titleLbl.text = @"患者管理";
    [self.navView addSubview:self.titleLbl];
}

- (void)setupUI {
    UIImage *bgImg = [UIImage imageNamed:@"history_bg"];
    bgImg = [self imageCompressWithSimple:bgImg scaledToSize:CGSizeMake(kWidth, kHeight - CGRectGetMaxY(self.navView.frame))];
    self.bgImg = [[UIImageView alloc] initWithImage:bgImg];
    self.bgImg.frame = CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWidth, kHeight - CGRectGetMaxY(self.navView.frame));
    [self.view addSubview:self.bgImg];
    self.bgImg.userInteractionEnabled = YES;
    
    self.searchBgView = [[UIView alloc] initWithFrame:CGRectMake(kView_LeftMargin * kXScal, KSearchView_TopMargin * kYScal, kWidth - 2 * kView_LeftMargin * kXScal, kSearchView_Height * kYScal)];
    self.searchBgView.backgroundColor = [UIColor colorWithHexString:@"#e6f5f8"];
    self.searchBgView.layer.cornerRadius = 4;
    self.searchBgView.layer.masksToBounds = YES;
    [self.bgImg addSubview:self.searchBgView];
    
    CGFloat tfWidth = (self.searchBgView.frame.size.width - 2 * kNameTF_LeftMargin * kXScal - 4 * KSearchContent_Space * kXScal - kSearch_Button_Width * kXScal)/4;
    CGFloat TF_TopMargin = (self.searchBgView.frame.size.height - kSearch_TF_Height * kYScal)/2;
    self.nameTF = [[CustomTextField alloc] initWithFrame:CGRectMake(kNameTF_LeftMargin * kXScal, TF_TopMargin, tfWidth, kSearch_TF_Height * kYScal)];
    self.nameTF.layer.borderWidth = 1;
    self.nameTF.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.nameTF.backgroundColor = [UIColor whiteColor];
    self.nameTF.placeholderLbl.text = @"输入姓名/ID/手机号码";
    self.nameTF.placeholderLbl.font = [UIFont systemFontOfSize:kSearch_TF_Font * kYScal];
    self.nameTF.placeholderLbl.textColor = [UIColor colorWithHexString:@"#999999"];
    self.nameTF.delegate = self;
    [self.searchBgView addSubview:self.nameTF];
    
    self.diseaseDropMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(kNameTF_LeftMargin * kXScal + CGRectGetMaxX(self.nameTF.frame) + KSearchContent_Space * kXScal, self.searchBgView.frame.origin.y + TF_TopMargin, tfWidth, kSearch_TF_Height * kYScal)];
    [self.diseaseDropMenu setMenuTitles:@[@"II型糖尿病"] rowHeight:kDropMenu_Item_Height attr:@{@"title":@"病症",@"titleFont":[UIFont systemFontOfSize:kSearch_DropView_Font * kYScal],@"titleColor":[UIColor colorWithHexString:@"#999999"],@"itemColor":[UIColor colorWithHexString:@"#999999"],@"itemFont":[UIFont systemFontOfSize:kSearch_TF_Font * kYScal]}];
    self.diseaseDropMenu.delegate = self;
    self.diseaseDropMenu.tag = 10;
    [self.bgImg addSubview:self.diseaseDropMenu];
    
    self.riskLevelDropMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.diseaseDropMenu.frame) + KSearchContent_Space * kXScal, self.diseaseDropMenu.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    [self.riskLevelDropMenu setMenuTitles:@[@"高",@"中",@"低"] rowHeight:kDropMenu_Item_Height attr:@{@"title":@"风险等级",@"titleFont":[UIFont systemFontOfSize:kSearch_DropView_Font * kYScal],@"titleColor":[UIColor colorWithHexString:@"#999999"],@"itemColor":[UIColor colorWithHexString:@"#999999"],@"itemFont":[UIFont systemFontOfSize:kSearch_TF_Font * kYScal]}];
    self.riskLevelDropMenu.delegate = self;
    self.riskLevelDropMenu.tag = 20;
    [self.bgImg addSubview:self.riskLevelDropMenu];
    
    self.ageTF = [[CustomTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelDropMenu.frame) + KSearchContent_Space * kXScal - kNameTF_LeftMargin * kXScal, TF_TopMargin, tfWidth, kSearch_TF_Height * kYScal)];
    self.ageTF.layer.borderWidth = 1;
    self.ageTF.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.ageTF.backgroundColor = [UIColor whiteColor];
    self.ageTF.placeholderLbl.text = @"年龄";
    self.ageTF.placeholderLbl.font = [UIFont systemFontOfSize:kSearch_TF_Font * kYScal];
    self.ageTF.placeholderLbl.textColor = [UIColor colorWithHexString:@"#999999"];
    self.ageTF.delegate = self;
    [self.searchBgView addSubview:self.ageTF];
    
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat button_TopMargin = (self.searchBgView.frame.size.height - kSearch_Button_Height * kYScal)/2;
    self.searchBtn.frame = CGRectMake(CGRectGetMaxX(self.ageTF.frame) + KSearchContent_Space * kXScal, button_TopMargin, kSearch_Button_Width * kXScal, kSearch_Button_Height * kYScal);
    [self.searchBtn setBackgroundColor:[UIColor colorWithHexString:@"#10a9cc"]];
    [self.searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [self.searchBtn.titleLabel setFont:[UIFont systemFontOfSize:kSearch_Button_Font * kYScal]];
    [self.searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.searchBtn.layer.cornerRadius = kSearch_Button_Height * kYScal / 2.0;
    self.searchBtn.layer.masksToBounds = YES;
    [self.searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];    
    [self.searchBgView addSubview:self.searchBtn];
    
    CGFloat bottomView_Height = kHeight - CGRectGetMaxY(self.navView.frame) - CGRectGetMaxY(self.searchBgView.frame) - kBottomView_TopMargin * kYScal - kBottomView_BottomMargin * kYScal;
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(self.searchBgView.frame.origin.x, CGRectGetMaxY(self.searchBgView.frame) + kBottomView_TopMargin * kYScal, self.searchBgView.frame.size.width, bottomView_Height)];
    self.bottomView.backgroundColor = [UIColor colorWithHexString:@"#e7f6f9"];
    self.bottomView.layer.cornerRadius = 4;
    self.bottomView.layer.masksToBounds = YES;
    [self.bgImg addSubview:self.bottomView];
    
    self.prescriptionMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(self.bottomView.frame.origin.x + kPrescription_DropList_LeftMargin * kXScal, self.bottomView.frame.origin.y + kPrescription_DropList_TopMargin * kYScal, tfWidth, kPrescription_DropList_Height * kYScal)];
    [self.prescriptionMenu setMenuTitles:@[@"待开具处方",@"已开具处方"] rowHeight:kDropMenu_Item_Height attr:@{@"title":@"待开具处方",@"titleFont":[UIFont systemFontOfSize:kSearch_TF_Font * kYScal],@"titleColor":[UIColor blackColor],@"itemColor":[UIColor blackColor],@"itemFont":[UIFont systemFontOfSize:kSearch_DropView_Font * kYScal]}];
    self.prescriptionMenu.delegate = self;
    self.prescriptionMenu.tag = 30;
    [self.bgImg addSubview:self.prescriptionMenu];
    
    CGFloat patientLbl_LeftMargin = self.bottomView.frame.size.width/2 - kTitleLbl_Width/2;
    self.patientTitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(patientLbl_LeftMargin, self.titleLbl.frame.origin.y, kTitleLbl_Width, kButton_Height)];
    self.patientTitleLbl.font = [UIFont systemFontOfSize:kTitle_FontSize];
    self.patientTitleLbl.textColor = [UIColor blackColor];
    self.patientTitleLbl.textAlignment = NSTextAlignmentCenter;
    self.patientTitleLbl.text = @"患者信息";
    [self.bottomView addSubview:self.patientTitleLbl];
    
    CGFloat listBgView_Width = self.bottomView.frame.size.width - 2 * kListBgView_LeftMargin * kXScal;
    CGFloat lisgBgView_Height = self.bottomView.frame.size.height - kPrescription_DropList_TopMargin * kYScal - kPrescription_DropList_Height * kYScal - 2 * kListBgView_TopMargin * kYScal;
    self.listBgView = [[UIView alloc] initWithFrame:CGRectMake(kPrescription_DropList_LeftMargin * kXScal, kPrescription_DropList_TopMargin * kYScal + kPrescription_DropList_Height * kYScal + kListBgView_TopMargin * kYScal, listBgView_Width, lisgBgView_Height)];
    self.listBgView.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    self.listBgView.layer.cornerRadius = 4;
    self.listBgView.layer.masksToBounds = YES;
    [self.bottomView addSubview:self.listBgView];
    
    self.sortView = [[UIView alloc] initWithFrame:CGRectMake(kListView_LeftMargin * kXScal, kListView_TopMargin * kYScal, self.listBgView.frame.size.width - 2 * kListView_LeftMargin * kXScal - kSortView_RightMargin * kXScal, kSortView_Height * kYScal)];
    self.sortView.backgroundColor = [UIColor whiteColor];
    self.sortView.layer.cornerRadius = 4;
    self.sortView.layer.masksToBounds = YES;
    [self.listBgView addSubview:self.sortView];
    
    CGFloat btnWidht = (self.sortView.frame.size.width - 5 * kSortView_SeperateLine_Width)/6;
    self.itemWidth = btnWidht;
    self.idBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.idBtn.frame = CGRectMake(0, 0, btnWidht, self.sortView.frame.size.height);
    [self.idBtn setTitle:@"ID" forState:UIControlStateNormal];
    [self.idBtn setImage:[UIImage imageNamed:@"manage_sort"] forState:UIControlStateNormal];
    [self.idBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.idBtn.imageView.frame.size.width, 0, self.idBtn.imageView.frame.size.width)];
    [self.idBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.idBtn.titleLabel.bounds.size.width, 0, -self.idBtn.titleLabel.bounds.size.width)];
    [self.idBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.idBtn.tag = 10001;
    [self.idBtn.titleLabel setFont:[UIFont systemFontOfSize:kSortView_Btn_Font * kYScal]];
    [self.idBtn addTarget:self action:@selector(sort:) forControlEvents:UIControlEventTouchUpInside];
    [self.sortView addSubview:self.idBtn];
    
    self.seperateLine1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.idBtn.frame), 0, kSortView_SeperateLine_Width , self.sortView.frame.size.height)];
    self.seperateLine1.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.sortView addSubview:self.seperateLine1];
    
    self.nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nameBtn.frame = CGRectMake(CGRectGetMaxX(self.seperateLine1.frame), 0, btnWidht, self.sortView.frame.size.height);
    [self.nameBtn setTitle:@"姓名" forState:UIControlStateNormal];
    [self.nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.nameBtn setImage:[UIImage imageNamed:@"manage_sort"] forState:UIControlStateNormal];
    [self.nameBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.nameBtn.imageView.frame.size.width, 0, self.nameBtn.imageView.frame.size.width)];
    [self.nameBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.nameBtn.titleLabel.bounds.size.width, 0, -self.nameBtn.titleLabel.bounds.size.width)];
    self.nameBtn.tag = 10002;
    [self.nameBtn.titleLabel setFont:[UIFont systemFontOfSize:kSortView_Btn_Font * kYScal]];
    [self.nameBtn addTarget:self action:@selector(sort:) forControlEvents:UIControlEventTouchUpInside];
    [self.sortView addSubview:self.nameBtn];
    
    self.seperateLine2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameBtn.frame), 0, kSortView_SeperateLine_Width , self.sortView.frame.size.height)];
    self.seperateLine2.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.sortView addSubview:self.seperateLine2];
    
    self.ageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ageBtn.frame = CGRectMake(CGRectGetMaxX(self.seperateLine2.frame), 0, btnWidht, self.sortView.frame.size.height);
    [self.ageBtn setTitle:@"年龄" forState:UIControlStateNormal];
    [self.ageBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.ageBtn setImage:[UIImage imageNamed:@"manage_sort"] forState:UIControlStateNormal];
    [self.ageBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.ageBtn.imageView.frame.size.width, 0, self.ageBtn.imageView.frame.size.width)];
    [self.ageBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.ageBtn.titleLabel.bounds.size.width, 0, -self.ageBtn.titleLabel.bounds.size.width)];
    self.ageBtn.tag = 10003;
    [self.ageBtn.titleLabel setFont:[UIFont systemFontOfSize:kSortView_Btn_Font * kYScal]];
    [self.ageBtn addTarget:self action:@selector(sort:) forControlEvents:UIControlEventTouchUpInside];
    [self.sortView addSubview:self.ageBtn];
    
    self.seperateLine3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.ageBtn.frame), 0, kSortView_SeperateLine_Width , self.sortView.frame.size.height)];
    self.seperateLine3.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.sortView addSubview:self.seperateLine3];
    
    self.sexBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sexBtn.frame = CGRectMake(CGRectGetMaxX(self.seperateLine3.frame), 0, btnWidht, self.sortView.frame.size.height);
    [self.sexBtn setTitle:@"性别" forState:UIControlStateNormal];
    [self.sexBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.sexBtn setImage:[UIImage imageNamed:@"manage_sort"] forState:UIControlStateNormal];
    [self.sexBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.sexBtn.imageView.frame.size.width, 0, self.sexBtn.imageView.frame.size.width)];
    [self.sexBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.sexBtn.titleLabel.bounds.size.width, 0, -self.sexBtn.titleLabel.bounds.size.width)];
    self.sexBtn.tag = 10004;
    [self.sexBtn.titleLabel setFont:[UIFont systemFontOfSize:kSortView_Btn_Font * kYScal]];
    [self.sexBtn addTarget:self action:@selector(sort:) forControlEvents:UIControlEventTouchUpInside];
    [self.sortView addSubview:self.sexBtn];
    
    self.seperateLine4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.sexBtn.frame), 0, kSortView_SeperateLine_Width , self.sortView.frame.size.height)];
    self.seperateLine4.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.sortView addSubview:self.seperateLine4];
    
    self.riskLevelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.riskLevelBtn.frame = CGRectMake(CGRectGetMaxX(self.seperateLine4.frame), 0, btnWidht, self.sortView.frame.size.height);
    [self.riskLevelBtn setTitle:@"风险等级" forState:UIControlStateNormal];
    [self.riskLevelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.riskLevelBtn setImage:[UIImage imageNamed:@"manage_sort"] forState:UIControlStateNormal];
    [self.riskLevelBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.riskLevelBtn.imageView.frame.size.width, 0, self.riskLevelBtn.imageView.frame.size.width)];
    [self.riskLevelBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.riskLevelBtn.titleLabel.bounds.size.width, 0, -self.riskLevelBtn.titleLabel.bounds.size.width)];
    self.riskLevelBtn.tag = 10005;
    [self.riskLevelBtn.titleLabel setFont:[UIFont systemFontOfSize:kSortView_Btn_Font * kYScal]];
    [self.riskLevelBtn addTarget:self action:@selector(sort:) forControlEvents:UIControlEventTouchUpInside];
    [self.sortView addSubview:self.riskLevelBtn];
    
    self.seperateLine5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelBtn.frame), 0, kSortView_SeperateLine_Width , self.sortView.frame.size.height)];
    self.seperateLine5.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.sortView addSubview:self.seperateLine5];
    
    self.dieaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.dieaseBtn.frame = CGRectMake(CGRectGetMaxX(self.seperateLine5.frame), 0, btnWidht, self.sortView.frame.size.height);
    [self.dieaseBtn setTitle:@"病症" forState:UIControlStateNormal];
    [self.dieaseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.dieaseBtn setImage:[UIImage imageNamed:@"manage_sort"] forState:UIControlStateNormal];
    [self.dieaseBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.dieaseBtn.imageView.frame.size.width, 0, self.dieaseBtn.imageView.frame.size.width)];
    [self.dieaseBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.dieaseBtn.titleLabel.bounds.size.width, 0, -self.dieaseBtn.titleLabel.bounds.size.width)];
    self.dieaseBtn.tag = 10006;
    [self.dieaseBtn.titleLabel setFont:[UIFont systemFontOfSize:kSortView_Btn_Font * kYScal]];
    [self.dieaseBtn addTarget:self action:@selector(sort:) forControlEvents:UIControlEventTouchUpInside];
    [self.sortView addSubview:self.dieaseBtn];
    
    self.listView = [[UITableView alloc] initWithFrame:CGRectMake(self.sortView.frame.origin.x, CGRectGetMaxY(self.sortView.frame) + kListView_TopMargin * kYScal, self.listBgView.frame.size.width - 2 * kListView_LeftMargin * kXScal, self.listBgView.frame.size.height - CGRectGetMaxY(self.sortView.frame) - 2 * kListView_TopMargin * kYScal) style:UITableViewStylePlain];
    self.listView.delegate = self;
    self.listView.dataSource = self;
    self.listView.tableFooterView = [[UIView alloc] init];
    self.listView.backgroundColor = [UIColor clearColor];
    [self.listBgView addSubview:self.listView];
    
    //添加头部的下拉刷新
    MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc] init];
    [header setRefreshingTarget:self refreshingAction:@selector(headerClick)];
    self.listView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [[MJRefreshBackNormalFooter alloc] init];
    [footer setRefreshingTarget:self refreshingAction:@selector(footerClick)];
    self.listView.mj_footer = footer;
}

- (void)headerClick {
    self.isFooterClick = NO;
    self.offset = 0;
    [self showUserListWithKeyword:@""];
}

- (void)footerClick {
    self.isFooterClick = YES;
    self.offset += 10;
    [self showUserListWithKeyword:@""];
}

- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCell_Height * kYScal;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseCellIdStr = [NSString stringWithFormat:@"PatientListsCellId%ld%ld",(long)indexPath.section,(long)indexPath.row];
    PatientListsCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellIdStr];
    if (cell == nil) {
        cell = [[PatientListsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellIdStr itemWidth:self.itemWidth];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    }
    NSDictionary *dict = [self.datas objectAtIndex:indexPath.section];
    cell.idLbl.text = [NSString stringWithFormat:@"%@",[dict valueForKey:@"id"]];
    cell.nameLbl.text = [NSString stringWithFormat:@"%@",[dict valueForKey:@"name"]];
    cell.ageLbl.text = [NSString stringWithFormat:@"%@",[dict valueForKey:@"age"]];
    NSString *sexStr = @"男";
    NSInteger sex = [[dict valueForKey:@"sex"] integerValue];
    if (sex == 1) {
        sexStr = @"男";
    } else {
        sexStr = @"女";
    }
    cell.sexLbl.text = sexStr;
    NSString *ristStr = @"低";
    NSInteger risk = [[dict valueForKey:@"risk"] integerValue];
    if (risk == 1) {
        ristStr = @"低";
    } else if (risk == 2) {
        ristStr = @"中";
    } else if (risk == 3) {
        ristStr = @"高";
    }
    cell.riskLevelLbl.text = ristStr;
    cell.dieaseLbl.text = @"II型糖尿病";
    [cell.checkBtn addTarget:self action:@selector(checkInfo:) forControlEvents:UIControlEventTouchUpInside];
    cell.checkBtn.tag = 1000 + indexPath.section;
    return cell;
}
#pragma mark - LMJDropdownMenu Delegate

- (void)dropdownMenu:(LMJDropdownMenu *)menu selectedCellNumber:(NSInteger)number{
    NSLog(@"你选择了：%ld",(long)number);
    self.offset = 0;
    if (menu == self.prescriptionMenu) {
        if (self.datas.count > 0) {
            [self.datas removeAllObjects];
        }
        if (number == 0) {
            self.type = 1;
        } else if (number == 1) {
            self.type = 2;
        }
        [self showUserListWithKeyword:@""];
    }
}

- (void)dropdownMenuWillShow:(LMJDropdownMenu *)menu{
    NSLog(@"--将要显示--");
}

- (void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{
    NSLog(@"--已经显示--");
}

- (void)dropdownMenuWillHidden:(LMJDropdownMenu *)menu{
    NSLog(@"--将要隐藏--");
}
- (void)dropdownMenuDidHidden:(LMJDropdownMenu *)menu{
    NSLog(@"--已经隐藏--");
}

#pragma mark CustomTextFieldDelegate
- (void)textFieldDidBeginEditing:(CustomTextField *)textField{
    if (textField.text.length > 0) {
        textField.placeholderLbl.hidden = YES;
    } else {
        textField.placeholderLbl.hidden = NO;
    }
}

- (void)textFieldDidEndEditing:(CustomTextField *)textField {
    if (textField.text.length > 0) {
        textField.placeholderLbl.hidden = YES;
    } else {
        textField.placeholderLbl.hidden = NO;
    }
}
#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)search:(UIButton*)sender {
    NSLog(@"搜索");
}

- (void)sort:(UIButton*)sender {
    NSInteger tag = sender.tag;
    if (tag == 10001) {
        self.idBtnAsc = !self.idBtnAsc;
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"id" ascending:self.idBtnAsc];
        self.datas = [[self.datas sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]] mutableCopy];
        [self.listView reloadData];
    } else if (tag == 10002) {
        self.nameBtnAsc = !self.nameBtnAsc;
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:self.nameBtnAsc];
        self.datas = [[self.datas sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]] mutableCopy];
        [self.listView reloadData];
    } else if (tag == 10003) {
        self.ageBtnAsc = !self.ageBtnAsc;
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:self.ageBtnAsc];
        self.datas = [[self.datas sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]] mutableCopy];
        [self.listView reloadData];
    } else if (tag == 10004) {
        self.sexBtnAsc = !self.sexBtnAsc;
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"sex" ascending:self.sexBtnAsc];
        self.datas = [[self.datas sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]] mutableCopy];
        [self.listView reloadData];
    } else if (tag == 10005) {
        self.riskLevelBtnAsc = !self.riskLevelBtnAsc;
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"risk" ascending:self.riskLevelBtnAsc];
        self.datas = [[self.datas sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]] mutableCopy];
        [self.listView reloadData];
    } else if (tag == 10006) {
        
    }
}

- (void)checkInfo:(UIButton*)sender {
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
    NSDictionary *dict = user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@0 forKey:@"offset"];
    [parameter setValue:@2 forKey:@"rows"];
    NSInteger index = sender.tag - 1000;
    NSDictionary *info = [self.datas objectAtIndex:index];
    NSInteger userId = [[info valueForKey:@"id"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    [self checkPatientInfo:parameter];
}

#pragma mark - netFunctions

- (void)checkPatientInfo:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USERINFO_MORE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"************** 1:%@**************",responseObject);
        if (code == 0) {
            NSArray *data = [responseObject valueForKey:@"data"];
            PatientInfoViewController *info = [[PatientInfoViewController alloc] init];
            info.infoArr = [data mutableCopy];
            NSString *statusStr = @"已开具处方";
            if (weakSelf.type == 1) {
                statusStr = @"待开具处方";
            } else if (weakSelf.type == 2) {
                statusStr = @"已开具处方";
            }
            info.statusStr = statusStr;
            [weakSelf.navigationController pushViewController:info animated:NO];
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

- (void)showUserListWithKeyword:(NSString *)keyword{
    __weak typeof (self)weakSelf = self;
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
    NSDictionary *dict = user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@(self.offset) forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    [parameter setValue:@"" forKey:@"keyword"];
    [parameter setValue:@"" forKey:@"disease"];
    [parameter setValue:@0 forKey:@"risk"];
    [parameter setValue:@0 forKey:@"age"];
    [parameter setValue:@(self.type) forKey:@"type"];
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USERLIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"************** 1:%@**************",responseObject);
        if (code == 0) {
            NSArray *rows = [responseObject valueForKey:@"rows"];
            if (weakSelf.isFooterClick) {
                [weakSelf.datas addObjectsFromArray:rows];
                [weakSelf.listView.mj_footer endRefreshing];
            } else {
                if (rows.count > 0) {
                    if (weakSelf.datas.count > 0) {
                        //替换前n个数据
                        NSMutableArray *tempArr = [NSMutableArray array];
                        [tempArr addObjectsFromArray:rows];
                        if (weakSelf.datas.count > rows.count) {
                            NSArray *afterArr = [weakSelf.datas subarrayWithRange:NSMakeRange(rows.count, weakSelf.datas.count - rows.count)];
                            [tempArr addObjectsFromArray:afterArr];
                        }
                        weakSelf.datas = [tempArr mutableCopy];
                    } else {
                        [weakSelf.datas addObjectsFromArray:rows];
                    }
                }
                [weakSelf.listView.mj_header endRefreshing];
            }
            [weakSelf.listView reloadData];
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

@end
