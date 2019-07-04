//
//  PrescriptionDetailViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/5/5.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PrescriptionDetailViewController.h"
#import "PrescriptionCell.h"
#import "UserModel.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 150
#define kLeftBtn_Width 21
#define kTopView_TopMargin 15
#define kTopView_BottomMargin 15
#define kTopView_LeftMargin 20
#define kTopView_Height 151
#define kNameLbl_LeftMargin 15
#define kNameLbl_TopMargin 18
#define kNameLbl_BottomMargin 22
#define kNameLbl_RightMargin 20
#define kNameLbl_FontSize 13.0
#define kNameLbl_Width 55
#define kNameLbl_Height 13
#define kDoctorLbl_Width 70
#define kDoctorLbl_Height 12
#define kDoctorLbl_RightMargin 16
#define kDoctorLbl_FontSize 13.0
#define kDoctorAdviceValLbl_LeftMargin 10
#define kDoctorAdviceValLbl_Height 13
#define kNameTF_Width 482
#define kNameTF_Height 19
#define kNameTF_FontSize 13.0
#define kNorMarlTF_Width 161
#define kNorMarlTF_RightMargin 65
#define kDiseaseTF_Width 301
#define kBottomHeight 209
#define kScrollview_Height 930
#define kListView_TopMargin 20
#define kListView_LeftMargin 16
#define kListView_BottomMargin 43
#define kTrainingGroupLbl_LeftMargin 140
#define kTrainingGroupLbl_RightMargin 9
#define kTrainingGroupLbl_TopMargin 16
#define kTrainingGroupLbl_Height 13
#define kTrainingGroupLbl_FontSize 13.0
#define kTrainingGroupValLbl_FontSize 15.0
#define kTrainingGroupValLbl_Width 30
#define kTrainingGroupValLbl_Height 12
#define kTrainingTimeLbl_RightMargin 10
#define kTrainingTimeValLbl_Width 55
#define kDoctorAdviceLbl_TopMargin 19
#define kDoctorAdviceView_Height 22
#define kFooterView_Height 100
#define kDataView_Height 43
#define kTrainingTimeLbl_LeftMargin 140
#define kTrainingTimeLbl_RightMargin 10
#define kTrainingTimeLbl_Width 120
#define kTrainingGroupLbl_Width 120
#define kTrainingGroupLbl_TopMargin 16
#define kDieaseLbl_FontSieze 13.0
#define kDieaseLbl_Width 54
#define kDieaseLbl_Height 13
#define kDieaseLbl_TopMargin 18
#define kDieaseLbl_LeftMargin 15
#define kDieaseLbl_FontSieze 13.0
#define kDieaseLbl_RightMargin 11
#define kDieaseLbl_BottomMargin 22
#define kTrainingTimeValLbl_Height 12
#define kTrainingTimeValLbl_FontSize 15.0
#define kCell_Height 118
#define kWeekMenu_RightMargin 15
#define kWeekLbl_Width 15

#define kTipsLbl_Height 44
#define kTipsLbl_Width kWidth - 2 * 150 * kXScal
#define kTipsLbl_FontSize 15.0
#define kTipsView_Height 48
#define kPrescriptionLbl_RightMargin 10

CGSize prescriptionListviewSize;

@interface PrescriptionDetailViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UIView *topBgView;//顶部视图蓝色背景
@property (nonatomic,strong)UIView *bottomView;//底部视图
@property (nonatomic,strong)UIScrollView *scrollview;
@property (nonatomic,strong)UILabel *prescriptionLbl;
@property (nonatomic,strong)UITextField *prescriptionTF;
@property (nonatomic,strong)UILabel *dieaseLbl;
@property (nonatomic,strong)UITextField *dieaseTF;
@property (nonatomic,strong)UILabel *createTimeLbl;
@property (nonatomic,strong)UITextField *createTimeTF;
@property (nonatomic,strong)UILabel *doctorLbl;
@property (nonatomic,strong)UITextField *doctorTF;
@property (nonatomic,strong)UILabel *riskLevelLbl;
@property (nonatomic,strong)UITextField *riskLevelTF;
@property (nonatomic,strong)UILabel *deviceTypeLbl;
@property (nonatomic,strong)UITextField *deviceTypeTF;
@property (nonatomic,strong)UILabel *positionLbl;
@property (nonatomic,strong)UITextField *positionTF;
@property (nonatomic,strong)UILabel *equipmentLbl;
@property (nonatomic,strong)UITextField *equipmentTF;
@property (nonatomic,strong)UILabel *weekLbl;
@property (nonatomic,strong)UITextField *weekTF;
@property (nonatomic,strong)UILabel *weekUnitLbl;
@property (nonatomic,strong)UILabel *dayLbl;
@property (nonatomic,strong)UITextField *dayTF;
@property (nonatomic,strong)UILabel *dayUnitLbl;
@property (nonatomic,strong)UILabel *sportTimeLbl;
@property (nonatomic,strong)UITextField *sportTimeTF;
@property (nonatomic,strong)UIView *listBgView;
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,strong)UIView *dataView;
@property (nonatomic,strong)UILabel *trainingGroupLbl;
@property (nonatomic,strong)UILabel *trainingTimeLbl;
@property (nonatomic,strong)UILabel *avgDifficultyLbl;
@property (nonatomic,strong)UILabel *doctorAdviceLbl;
@property (nonatomic,strong)UIView *doctorAdviceView;
@property (nonatomic,strong)UILabel *doctorAdviceValLbl;
@property (nonatomic,strong)NSMutableArray *groups;
@property (nonatomic,assign)NSInteger type2;
@property (nonatomic,strong)UIView *tipsView;
@property (nonatomic,strong)UILabel *tipsLbl;
@end

@implementation PrescriptionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.groups = [NSMutableArray array];
    self.groups = [NSMutableArray arrayWithArray:[self.prescriptionDict valueForKey:@"sections"]];
    self.type2 = [[self.prescriptionDict valueForKey:@"type2"] integerValue];
    [self setNavBar];
    [self setupUI];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tipsView.hidden = YES;
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
    self.titleLbl.text = @"查看处方详情";
    [self.navView addSubview:self.titleLbl];
}

- (void)configHeaderview {
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, (kTopView_Height + kTopView_TopMargin + kTopView_BottomMargin) * kYScal)];
    self.topView.backgroundColor = [UIColor whiteColor];
    
    self.topBgView = [[UIView alloc] initWithFrame:CGRectMake(kTopView_LeftMargin * kXScal, kTopView_TopMargin * kYScal, kWidth - 2 * kTopView_LeftMargin * kXScal, kTopView_Height * kYScal)];
    self.topBgView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    [self.topView addSubview:self.topBgView];
    
    self.prescriptionLbl = [[UILabel alloc] initWithFrame:CGRectMake(kNameLbl_LeftMargin * kXScal, kNameLbl_TopMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.prescriptionLbl.text = @"处方名称";
    self.prescriptionLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.prescriptionLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.topBgView addSubview:self.prescriptionLbl];
    
    self.prescriptionTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.prescriptionLbl.frame) + kNameLbl_RightMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.prescriptionTF.enabled = NO;
    self.prescriptionTF.center = CGPointMake(CGRectGetMaxX(self.prescriptionLbl.frame) + kNameLbl_RightMargin * kXScal + kNameTF_Width * kXScal/2.0, self.prescriptionLbl.center.y);
    self.prescriptionTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.prescriptionTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.prescriptionTF.backgroundColor = [UIColor whiteColor];
    self.prescriptionTF.text = [self.prescriptionDict valueForKey:@"title"];
    [self.topBgView addSubview:self.prescriptionTF];
    
    CGFloat leftMargin = self.topView.frame.size.width - kNameLbl_Width * kXScal - kNameLbl_RightMargin * kXScal - kDiseaseTF_Width * kXScal - kNameLbl_LeftMargin * kXScal;
    self.dieaseLbl = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.prescriptionLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.dieaseLbl.text = @"适用病症";
    self.dieaseLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.dieaseLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topBgView addSubview:self.dieaseLbl];
    
    self.dieaseTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dieaseLbl.frame) + kNameLbl_RightMargin * kXScal, self.prescriptionTF.frame.origin.y, kDiseaseTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.dieaseTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.dieaseTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.dieaseTF.backgroundColor = [UIColor whiteColor];
    self.dieaseTF.text = [self.prescriptionDict valueForKey:@"disease"];
    self.dieaseTF.enabled = NO;
    [self.topBgView addSubview:self.dieaseTF];
    
    self.createTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.prescriptionLbl.frame.origin.x, CGRectGetMaxY(self.prescriptionLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.createTimeLbl.text = @"开具时间";
    self.createTimeLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.createTimeLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topBgView addSubview:self.createTimeLbl];
    
    CGFloat space = (self.topView.frame.size.width - (kNameLbl_Width + kNameLbl_RightMargin + kNorMarlTF_Width) * kXScal - (kDoctorLbl_Width + kNameLbl_RightMargin + kNorMarlTF_Width) * kXScal * 2 - kNameLbl_LeftMargin * kXScal - kNorMarlTF_RightMargin * kXScal)/2;
    self.createTimeTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.createTimeLbl.frame) + kNameLbl_RightMargin * kXScal, 0, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.createTimeTF.text = [self.prescriptionDict valueForKey:@"createTime"];
    self.createTimeTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.createTimeTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.createTimeTF.backgroundColor = [UIColor whiteColor];
    self.createTimeTF.center = CGPointMake(CGRectGetMaxX(self.createTimeLbl.frame) + kNameLbl_RightMargin * kXScal + kNorMarlTF_Width * kXScal/2.0, self.createTimeLbl.center.y);
    self.createTimeTF.enabled = NO;
    [self.topBgView addSubview:self.createTimeTF];
    
    self.doctorLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.createTimeTF.frame) + space, self.createTimeLbl.frame.origin.y, kDoctorLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.doctorLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.doctorLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.doctorLbl.text = @"开 具 医 师";
    [self.topBgView addSubview:self.doctorLbl];
    
    self.doctorTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.doctorLbl.frame) + kNameLbl_RightMargin *kXScal, self.createTimeTF.frame.origin.y, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.doctorTF.text = [self.prescriptionDict valueForKey:@"doctorName"];
    self.doctorTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.doctorTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.doctorTF.backgroundColor = [UIColor whiteColor];
    self.doctorTF.enabled = NO;
    [self.topBgView addSubview:self.doctorTF];
    
    self.riskLevelLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.doctorTF.frame) + space, self.createTimeLbl.frame.origin.y, kDoctorLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.riskLevelLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.riskLevelLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.riskLevelLbl.text = @"风 险 等 级";
    [self.topBgView addSubview:self.riskLevelLbl];
    
    self.riskLevelTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelLbl.frame) + kNameLbl_RightMargin *kXScal, self.createTimeTF.frame.origin.y, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
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
    self.riskLevelTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.riskLevelTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.riskLevelTF.backgroundColor = [UIColor whiteColor];
    self.riskLevelTF.enabled = NO;
    [self.topBgView addSubview:self.riskLevelTF];
    
    /////////////
    
    
    self.deviceTypeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.prescriptionLbl.frame.origin.x, CGRectGetMaxY(self.createTimeLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.deviceTypeLbl.text = @"设备类型";
    self.deviceTypeLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.deviceTypeLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topBgView addSubview:self.deviceTypeLbl];
    
    self.deviceTypeTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deviceTypeLbl.frame) + kNameLbl_RightMargin * kXScal, 0, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.deviceTypeTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.deviceTypeTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.deviceTypeTF.backgroundColor = [UIColor whiteColor];
    self.deviceTypeTF.center = CGPointMake(CGRectGetMaxX(self.deviceTypeLbl.frame) + kNameLbl_RightMargin * kXScal + kNorMarlTF_Width * kXScal/2.0, self.deviceTypeLbl.center.y);
    self.deviceTypeTF.enabled = NO;
    [self.topBgView addSubview:self.deviceTypeTF];
    
    self.positionLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deviceTypeTF.frame) + space, self.deviceTypeLbl.frame.origin.y, kDoctorLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.positionLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.positionLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.positionLbl.text = @"训 练 部 位";
    [self.topBgView addSubview:self.positionLbl];
    
    self.positionTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.positionLbl.frame) + kNameLbl_RightMargin *kXScal, self.deviceTypeTF.frame.origin.y, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.positionTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.positionTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.positionTF.backgroundColor = [UIColor whiteColor];
    self.positionTF.enabled = NO;
    [self.topBgView addSubview:self.positionTF];
    
    self.equipmentLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.positionTF.frame) + space, self.deviceTypeLbl.frame.origin.y, kDoctorLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.equipmentLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.equipmentLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.equipmentLbl.text = @"训 练 设 备";
    [self.topBgView addSubview:self.equipmentLbl];
    
    self.equipmentTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelLbl.frame) + kNameLbl_RightMargin *kXScal, self.deviceTypeTF.frame.origin.y, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.equipmentTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.equipmentTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.equipmentTF.backgroundColor = [UIColor whiteColor];
    self.equipmentTF.enabled = NO;
    [self.topBgView addSubview:self.equipmentTF];
    
    NSArray *typeList = [self.prescriptionDict valueForKey:@"typeList"];
    if (typeList.count > 2) {
        NSString *deviceTypeName = [typeList[0] valueForKey:@"name"];
        NSString *positionName = [typeList[1] valueForKey:@"name"];
        NSString *equipmentName = [typeList[2] valueForKey:@"name"];
        self.deviceTypeTF.text = deviceTypeName;
        self.positionTF.text = positionName;
        self.equipmentTF.text = equipmentName;
    }
    
    self.weekLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.prescriptionLbl.frame.origin.x, CGRectGetMaxY(self.deviceTypeLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.weekLbl.text = @"疗       程";
    self.weekLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.weekLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topBgView addSubview:self.weekLbl];
    
    self.weekTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.weekLbl.frame) + kNameLbl_RightMargin * kXScal, 0, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.weekTF.text = [NSString stringWithFormat:@"%d",[[self.prescriptionDict valueForKey:@"treatmentPeriod"] integerValue]];
    self.weekTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.weekTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.weekTF.backgroundColor = [UIColor whiteColor];
    self.weekTF.enabled = NO;
    self.weekTF.center = CGPointMake(CGRectGetMaxX(self.weekLbl.frame) + kNameLbl_RightMargin * kXScal + kNorMarlTF_Width * kXScal/2.0, self.weekLbl.center.y);
    [self.topBgView addSubview:self.weekTF];
    
    self.weekUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.weekTF.frame) + kWeekMenu_RightMargin * kXScal, self.weekLbl.frame.origin.y, kWeekLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.weekUnitLbl.text = @"周";
    self.weekUnitLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.weekUnitLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topBgView addSubview:self.weekUnitLbl];
    
    self.dayLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.weekTF.frame) + space, self.weekLbl.frame.origin.y, kDoctorLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.dayLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.dayLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.dayLbl.text = @"周训练频次";
    [self.topBgView addSubview:self.dayLbl];
    
    self.dayTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dayLbl.frame) + kNameLbl_RightMargin *kXScal, self.weekTF.frame.origin.y, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.dayTF.text = [NSString stringWithFormat:@"%d",[[self.prescriptionDict valueForKey:@"daysPerWeek"] integerValue]];
    self.dayTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.dayTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.dayTF.backgroundColor = [UIColor whiteColor];
    self.dayTF.enabled = NO;
    [self.topBgView addSubview:self.dayTF];
    
    self.dayUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dayTF.frame) + kWeekMenu_RightMargin * kXScal, self.dayLbl.frame.origin.y, kWeekLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.dayUnitLbl.text = @"天";
    self.dayUnitLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.dayUnitLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topBgView addSubview:self.dayUnitLbl];
    
    self.sportTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dayTF.frame) + space, self.weekLbl.frame.origin.y, kDoctorLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.sportTimeLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.sportTimeLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.sportTimeLbl.text = @"运动时间点";
    [self.topBgView addSubview:self.sportTimeLbl];
    
    self.sportTimeTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.sportTimeLbl.frame) + kNameLbl_RightMargin *kXScal, self.weekTF.frame.origin.y, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    NSInteger timing = [[self.prescriptionDict valueForKey:@"timing"] integerValue];
    NSString *sportTimestr = @"任意";
    if (timing == 1) {
        sportTimestr = @"三餐前半小时";
    } else if (timing == 2) {
        sportTimestr = @"三餐后半小时";
    }
    self.sportTimeTF.text = sportTimestr;
    self.sportTimeTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.sportTimeTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.sportTimeTF.backgroundColor = [UIColor whiteColor];
    self.sportTimeTF.enabled = NO;
    [self.topBgView addSubview:self.sportTimeTF];
}

- (void)configFooterview {
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kFooterView_Height * kYScal)];
    self.bottomView.backgroundColor = [UIColor clearColor];
    
    self.dataView = [[UIView alloc] initWithFrame:CGRectMake(kTopView_LeftMargin * kXScal, 0, self.topBgView.frame.size.width, kDataView_Height * kYScal)];
    self.dataView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    [self.bottomView addSubview:self.dataView];

    self.trainingGroupLbl = [[UILabel alloc] initWithFrame:CGRectMake(kTrainingGroupLbl_LeftMargin * kXScal, kTrainingGroupLbl_TopMargin * kYScal, kTrainingGroupLbl_Width * kXScal, kTrainingGroupLbl_Height * kYScal)];
    self.trainingGroupLbl.text = @"训练组数：1";
    self.trainingGroupLbl.font = [UIFont systemFontOfSize:kTrainingGroupLbl_FontSize * kYScal];
    self.trainingGroupLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.dataView addSubview:self.trainingGroupLbl];

    CGFloat hspace = (self.dataView.frame.size.width - 2 * kTrainingGroupLbl_LeftMargin * kXScal - 2 * kTrainingGroupLbl_Width * kXScal - kTrainingTimeLbl_Width * kXScal)/2;

    self.trainingTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingGroupLbl.frame) + hspace, self.trainingGroupLbl.frame.origin.y, kTrainingTimeLbl_Width * kXScal, kTrainingGroupValLbl_Height * kYScal)];
    self.trainingTimeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.trainingTimeLbl.font = [UIFont systemFontOfSize:kTrainingGroupLbl_FontSize * kYScal];
    self.trainingTimeLbl.text = @"训练总时长：00:00";
    [self.dataView addSubview:self.trainingTimeLbl];

    self.avgDifficultyLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingTimeLbl.frame) + hspace, self.trainingGroupLbl.frame.origin.y, kTrainingGroupLbl_Width * kXScal, kTrainingGroupValLbl_Height * kYScal)];
    self.avgDifficultyLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.avgDifficultyLbl.font = [UIFont systemFontOfSize:kTrainingGroupLbl_FontSize * kYScal];
    if (self.type2 == 1) {
        self.avgDifficultyLbl.text = @"平均强度：0";
    } else {
        self.avgDifficultyLbl.text = @"平均功率：0w";
    }
    NSInteger avgDifficulty = [self computerAvgDifficulty];
    if (self.type2 == 1) {
        self.avgDifficultyLbl.text = [NSString stringWithFormat:@"平均强度：%d",avgDifficulty];
    } else {
        self.avgDifficultyLbl.text = [NSString stringWithFormat:@"平均功率：%d w",avgDifficulty];
    }
    [self.dataView addSubview:self.avgDifficultyLbl];

    self.doctorLbl = [[UILabel alloc] initWithFrame:CGRectMake(kTopView_LeftMargin * kXScal, CGRectGetMaxY(self.dataView.frame) + kDoctorAdviceLbl_TopMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.doctorLbl.font = [UIFont systemFontOfSize:kDoctorLbl_FontSize * kYScal];
    self.doctorLbl.textColor = [UIColor blackColor];
    self.doctorLbl.text = @"医      嘱";
    [self.bottomView addSubview:self.doctorLbl];

    self.doctorAdviceView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.doctorLbl.frame) + kDoctorLbl_RightMargin * kXScal, 0, kWidth - 2 * kTopView_LeftMargin * kXScal - kNameLbl_Width * kXScal - kPrescriptionLbl_RightMargin * kXScal, kDoctorAdviceView_Height * kYScal)];
    self.doctorAdviceView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    self.doctorAdviceView.center = CGPointMake(CGRectGetMaxX(self.doctorLbl.frame) + kDoctorLbl_RightMargin * kXScal + (kWidth - 2 * kTopView_LeftMargin * kXScal - kNameLbl_Width * kXScal - kPrescriptionLbl_RightMargin * kXScal)/2.0, self.doctorLbl.center.y);
    [self.bottomView addSubview:self.doctorAdviceView];

    self.doctorAdviceValLbl = [[UILabel alloc] initWithFrame:CGRectMake(kDoctorAdviceValLbl_LeftMargin * kXScal, (self.doctorAdviceView.frame.size.height - kDoctorAdviceValLbl_Height * kYScal)/2.0, self.doctorAdviceView.frame.size.width - kDoctorAdviceValLbl_LeftMargin * kXScal, kDoctorAdviceValLbl_Height * kYScal)];
    self.doctorAdviceValLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.doctorAdviceValLbl.font = [UIFont systemFontOfSize:kDoctorLbl_FontSize * kYScal];
    self.doctorAdviceValLbl.text = [self.prescriptionDict valueForKey:@"doctorAdvice"];
    [self.doctorAdviceView addSubview:self.doctorAdviceValLbl];
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
    
    self.tipsLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, kTipsLbl_Height * kYScal)];
    self.tipsLbl.textColor = [UIColor whiteColor];
    self.tipsLbl.backgroundColor = [UIColor clearColor];
    self.tipsLbl.text = @"强度百分比将在处方中用来计算患者的运动目标心率。计算公式如下：目标心率=（最大心率-安静心率）x 强度百分比+安静心率。";
    self.tipsLbl.numberOfLines = 2;
    self.tipsLbl.font = [UIFont systemFontOfSize:kTipsLbl_FontSize * kYScal];
    CGSize size = [self.tipsLbl sizeThatFits:CGSizeMake(kTipsLbl_Width, kTipsLbl_Height * kYScal)];
    self.tipsLbl.frame = CGRectMake(0, 0, size.width, size.height);
    
    self.tipsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width + 30, size.height + 20)];
    self.tipsView.center = CGPointMake(kWidth/2.0, kHeight/2.0);
    self.tipsView.backgroundColor = [UIColor blackColor];
    self.tipsView.layer.cornerRadius = 8;
    self.tipsView.layer.masksToBounds = YES;
    self.tipsView.hidden = YES;
    [self.view addSubview:self.tipsView];
    
    self.tipsLbl.center = CGPointMake(self.tipsView.frame.size.width/2.0, self.tipsView.frame.size.height/2.0);
    [self.tipsView addSubview:self.tipsLbl];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handletapGesture:)];
    [self.view addGestureRecognizer:tap];
}

// 点击其他区域关闭弹窗
- (void)handletapGesture:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded){
        CGPoint location = [sender locationInView:self.tipsView];
        NSLog(@"location :%@",NSStringFromCGPoint(location));
        if (!CGRectContainsPoint(self.view.frame, location)) {
            self.tipsView.hidden = YES;
        }
    }
}

//计算训练总时长
- (NSString*)computeTotalTrainingTime {
    NSString *resultStr = @"00:00";
    if (self.groups.count > 0) {
        NSInteger sumDuration = 0;
        for (NSDictionary *dict in self.groups) {
            sumDuration += [[dict valueForKey:@"duration"] integerValue];
            sumDuration += [[dict valueForKey:@"restDuration"] integerValue];
        }
        resultStr = [self getTimeString:sumDuration];
    }
    return resultStr;
}

- (NSString *)getTimeString:(NSInteger)seconds {
    NSString *timeStr = @"";
    NSInteger minute = seconds / 60;
    NSInteger second = seconds % 60;
    timeStr = [NSString stringWithFormat:@"%02ld:%02ld",(long)minute,(long)second];
    return timeStr;
}

//计算平均强度
- (NSInteger)computerAvgDifficulty {
    NSInteger avgDifficulty = 0;
    if (self.groups.count > 0) {
        NSInteger sumDifficulty = 0;
        for (NSDictionary *dict in self.groups) {
            sumDifficulty += [[dict valueForKey:@"difficulty"] integerValue];
        }
        avgDifficulty = sumDifficulty / self.groups.count;
    }
    return avgDifficulty;
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
    NSString *reuseCellIdStr = [NSString stringWithFormat:@"PrescriptionCell%ld%ld",(long)indexPath.section,(long)indexPath.row];
    PrescriptionCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellIdStr];
    if (cell == nil) {
        cell = [[PrescriptionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellIdStr];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
    }
    [cell.difficultyImg addTarget:self action:@selector(showTips:) forControlEvents:UIControlEventTouchUpInside];
    cell.groupNameLbl.text = [NSString stringWithFormat:@"第%d组",indexPath.section + 1];
    NSDictionary *dict = [self.groups objectAtIndex:indexPath.section];
    NSLog(@"dict is :%@",dict);
    NSString *rpeRange = [dict valueForKey:@"rpeRange"];
    NSArray *rpeRangeArr = [rpeRange componentsSeparatedByString:@"-"];
    if (rpeRangeArr.count > 0) {
        cell.rpeLeftTF.text = rpeRangeArr[0];
        cell.rpeRightTF.text = rpeRangeArr[1];
    }
    NSString *hrRange = [dict valueForKey:@"hrRange"];
    NSArray *hrRangeArr = [hrRange componentsSeparatedByString:@"-"];
    if (hrRangeArr.count > 0) {
        cell.difficultyLeftTF.text = [NSString stringWithFormat:@"%@%%",hrRangeArr[0]];
        cell.difficultyRightTF.text = [NSString stringWithFormat:@"%@%%",hrRangeArr[1]];
    }
    NSInteger duration = [[dict valueForKey:@"duration"] integerValue];
    NSInteger trainingMin = duration / 60;
    NSInteger trainingSec = duration % 60;
    cell.traingingTimeLeftTF.text = [NSString stringWithFormat:@"%d",trainingMin];
    cell.traingingTimeRightTF.text = [NSString stringWithFormat:@"%d",trainingSec];
    NSInteger restDuration = [[dict valueForKey:@"restDuration"] integerValue];
    NSInteger restMin = restDuration / 60;
    NSInteger restSec = restDuration % 60;
    cell.restLeftTF.text = [NSString stringWithFormat:@"%d",restMin];
    cell.restRightTF.text = [NSString stringWithFormat:@"%d",restSec];
    if (self.type2 == 1) {
        cell.difficultyTF.text = [NSString stringWithFormat:@"%d",[[dict valueForKey:@"difficulty"] integerValue]];
        cell.difficultyLbl.text = @"强      度";
    } else {
        cell.difficultyTF.text = [NSString stringWithFormat:@"%d w",[[dict valueForKey:@"difficulty"] integerValue]];
        cell.difficultyLbl.text = @"功      率";
    }
    return cell;
}

- (void)showTips:(UIButton*)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:kHideDropDownNotification object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:kHideCellDropDownNotification object:nil];
    if (sender.selected) {
        sender.selected = NO;
        if (self.tipsView.hidden) {
            self.tipsView.hidden = NO;
        } else {
            self.tipsView.hidden = YES;
        }
    } else {
        sender.selected = YES;
        self.tipsView.hidden = YES;
    }
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
