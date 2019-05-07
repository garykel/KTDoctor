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
#import "AerobicGroupCell.h"

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
#define kDoctorLbl_Width 65
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
#define kTrainingGroupLbl_Width 65
#define kTrainingGroupLbl_Height 13
#define kTrainingGroupLbl_FontSize 13.0
#define kTrainingGroupValLbl_FontSize 15.0
#define kTrainingGroupValLbl_Width 30
#define kTrainingGroupValLbl_Height 12
#define kTrainingTimeLbl_RightMargin 10
#define kTrainingTimeLbl_Width 80
#define kTrainingTimeValLbl_Width 45
#define kDoctorAdviceLbl_TopMargin 19
#define kDoctorAdviceView_Height 22
#define kCell_Height 118

CGSize prescriptionListviewSize;

@interface PrescriptionDetailViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIScrollView *scrollview;
@property (nonatomic,strong)UIView *topView;
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
@property (nonatomic,strong)UILabel *dayLbl;
@property (nonatomic,strong)UITextField *dayTF;
@property (nonatomic,strong)UILabel *sportTimeLbl;
@property (nonatomic,strong)UITextField *sportTimeTF;
@property (nonatomic,strong)UIView *listBgView;
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,strong)UIView *dataView;
@property (nonatomic,strong)UILabel *trainingGroupLbl;
@property (nonatomic,strong)UILabel *trainingGroupValLbl;
@property (nonatomic,strong)UILabel *trainingTimeLbl;
@property (nonatomic,strong)UILabel *trainingTimeValLbl;
@property (nonatomic,strong)UILabel *avgDifficultyLbl;
@property (nonatomic,strong)UILabel *avgDifficultyValLbl;
@property (nonatomic,strong)UILabel *doctorAdviceLbl;
@property (nonatomic,strong)UIView *doctorAdviceView;
@property (nonatomic,strong)UILabel *doctorAdviceValLbl;
@property (nonatomic,strong)NSMutableArray *groups;
@end

@implementation PrescriptionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.groups = [NSMutableArray array];
    self.groups = [NSMutableArray arrayWithArray:[self.prescriptionDict valueForKey:@"sections"]];
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
    self.titleLbl.text = @"查看处方详情";
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
    
    self.prescriptionLbl = [[UILabel alloc] initWithFrame:CGRectMake(kNameLbl_LeftMargin * kXScal, kNameLbl_TopMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.prescriptionLbl.text = @"处方名称";
    self.prescriptionLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.prescriptionLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.topView addSubview:self.prescriptionLbl];
    
    self.prescriptionTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.prescriptionLbl.frame) + kNameLbl_RightMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.prescriptionTF.enabled = NO;
    self.prescriptionTF.center = CGPointMake(CGRectGetMaxX(self.prescriptionLbl.frame) + kNameLbl_RightMargin * kXScal + kNameTF_Width * kXScal/2.0, self.prescriptionLbl.center.y);
    self.prescriptionTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.prescriptionTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.prescriptionTF.backgroundColor = [UIColor whiteColor];
    self.prescriptionTF.text = [self.prescriptionDict valueForKey:@"title"];
    [self.topView addSubview:self.prescriptionTF];
    
    CGFloat leftMargin = self.topView.frame.size.width - kNameLbl_Width * kXScal - kNameLbl_RightMargin * kXScal - kDiseaseTF_Width * kXScal - kNameLbl_LeftMargin * kXScal;
    self.dieaseLbl = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, self.prescriptionLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.dieaseLbl.text = @"适用病症";
    self.dieaseLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.dieaseLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topView addSubview:self.dieaseLbl];
    
    self.dieaseTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dieaseLbl.frame) + kNameLbl_RightMargin * kXScal, self.prescriptionTF.frame.origin.y, kDiseaseTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.dieaseTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.dieaseTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.dieaseTF.backgroundColor = [UIColor whiteColor];
    self.dieaseTF.text = [self.prescriptionDict valueForKey:@"disease"];
    [self.topView addSubview:self.dieaseTF];
    
    self.createTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.prescriptionLbl.frame.origin.x, CGRectGetMaxY(self.prescriptionLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.createTimeLbl.text = @"开具时间";
    self.createTimeLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.createTimeLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topView addSubview:self.createTimeLbl];
    
    CGFloat space = (self.topView.frame.size.width - (kNameLbl_Width + kNameLbl_RightMargin + kNorMarlTF_Width) * kXScal - (kDoctorLbl_Width + kNameLbl_RightMargin + kNorMarlTF_Width) * kXScal * 2 - kNameLbl_LeftMargin * kXScal - kNorMarlTF_RightMargin * kXScal)/2;
    self.createTimeTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.createTimeLbl.frame) + kNameLbl_RightMargin * kXScal, 0, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.createTimeTF.text = [self.prescriptionDict valueForKey:@"createTime"];
    self.createTimeTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.createTimeTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.createTimeTF.backgroundColor = [UIColor whiteColor];
    self.createTimeTF.center = CGPointMake(CGRectGetMaxX(self.createTimeLbl.frame) + kNameLbl_RightMargin * kXScal + kNorMarlTF_Width * kXScal/2.0, self.createTimeLbl.center.y);
    [self.topView addSubview:self.createTimeTF];
    
    self.doctorLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.createTimeTF.frame) + space, self.createTimeLbl.frame.origin.y, kDoctorLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.doctorLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.doctorLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.doctorLbl.text = @"开 具 医 师";
    [self.topView addSubview:self.doctorLbl];
    
    self.doctorTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.doctorLbl.frame) + kNameLbl_RightMargin *kXScal, self.createTimeTF.frame.origin.y, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.doctorTF.text = [self.prescriptionDict valueForKey:@"doctorName"];
    self.doctorTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.doctorTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.doctorTF.backgroundColor = [UIColor whiteColor];
    [self.topView addSubview:self.doctorTF];
    
    self.riskLevelLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.doctorTF.frame) + space, self.createTimeLbl.frame.origin.y, kDoctorLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.riskLevelLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.riskLevelLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.riskLevelLbl.text = @"风 险 等 级";
    [self.topView addSubview:self.riskLevelLbl];
    
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
    [self.topView addSubview:self.riskLevelTF];
    
    /////////////
    NSArray *typeList = [self.prescriptionDict valueForKey:@"typeList"];
    NSString *deviceTypeName = [typeList[0] valueForKey:@"name"];
    NSString *positionName = [typeList[1] valueForKey:@"name"];
    NSString *equipmentName = [typeList[2] valueForKey:@"name"];
    self.deviceTypeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.prescriptionLbl.frame.origin.x, CGRectGetMaxY(self.createTimeLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.deviceTypeLbl.text = @"设备类型";
    self.deviceTypeLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.deviceTypeLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topView addSubview:self.deviceTypeLbl];
    
    self.deviceTypeTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deviceTypeLbl.frame) + kNameLbl_RightMargin * kXScal, 0, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.deviceTypeTF.text = deviceTypeName;
    self.deviceTypeTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.deviceTypeTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.deviceTypeTF.backgroundColor = [UIColor whiteColor];
    self.deviceTypeTF.center = CGPointMake(CGRectGetMaxX(self.deviceTypeLbl.frame) + kNameLbl_RightMargin * kXScal + kNorMarlTF_Width * kXScal/2.0, self.deviceTypeLbl.center.y);
    [self.topView addSubview:self.deviceTypeTF];
    
    self.positionLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deviceTypeTF.frame) + space, self.deviceTypeLbl.frame.origin.y, kDoctorLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.positionLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.positionLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.positionLbl.text = @"训 练 部 位";
    [self.topView addSubview:self.positionLbl];
    
    self.positionTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.positionLbl.frame) + kNameLbl_RightMargin *kXScal, self.deviceTypeTF.frame.origin.y, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.positionTF.text = positionName;
    self.positionTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.positionTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.positionTF.backgroundColor = [UIColor whiteColor];
    [self.topView addSubview:self.positionTF];
    
    self.equipmentLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.positionTF.frame) + space, self.deviceTypeLbl.frame.origin.y, kDoctorLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.equipmentLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.equipmentLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.equipmentLbl.text = @"训 练 设 备";
    [self.topView addSubview:self.equipmentLbl];
    
    self.equipmentTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelLbl.frame) + kNameLbl_RightMargin *kXScal, self.deviceTypeTF.frame.origin.y, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.equipmentTF.text = equipmentName;
    self.equipmentTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.equipmentTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.equipmentTF.backgroundColor = [UIColor whiteColor];
    [self.topView addSubview:self.equipmentTF];
    
    self.weekLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.prescriptionLbl.frame.origin.x, CGRectGetMaxY(self.deviceTypeLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.weekLbl.text = @"疗       程";
    self.weekLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.weekLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.topView addSubview:self.weekLbl];
    
    self.weekTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.weekLbl.frame) + kNameLbl_RightMargin * kXScal, 0, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.weekTF.text = [NSString stringWithFormat:@"%d",[[self.prescriptionDict valueForKey:@"treatmentPeriod"] integerValue]];
    self.weekTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.weekTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.weekTF.backgroundColor = [UIColor whiteColor];
    self.weekTF.center = CGPointMake(CGRectGetMaxX(self.weekLbl.frame) + kNameLbl_RightMargin * kXScal + kNorMarlTF_Width * kXScal/2.0, self.weekLbl.center.y);
    [self.topView addSubview:self.weekTF];
    
    self.dayLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.weekTF.frame) + space, self.weekLbl.frame.origin.y, kDoctorLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.dayLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.dayLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.dayLbl.text = @"周训练频次";
    [self.topView addSubview:self.dayLbl];
    
    self.dayTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dayLbl.frame) + kNameLbl_RightMargin *kXScal, self.weekTF.frame.origin.y, kNorMarlTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.dayTF.text = [NSString stringWithFormat:@"%d",[[self.prescriptionDict valueForKey:@"daysPerWeek"] integerValue]];
    self.dayTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.dayTF.textColor = [UIColor colorWithHexString:@"#333333"];
    self.dayTF.backgroundColor = [UIColor whiteColor];
    [self.topView addSubview:self.dayTF];
    
    self.sportTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dayTF.frame) + space, self.weekLbl.frame.origin.y, kDoctorLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.sportTimeLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.sportTimeLbl.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.sportTimeLbl.text = @"运动时间点";
    [self.topView addSubview:self.sportTimeLbl];
    
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
    [self.topView addSubview:self.sportTimeTF];
    
    self.listBgView = [[UIView alloc] initWithFrame:CGRectMake(self.topView.frame.origin.x, CGRectGetMaxY(self.topView.frame) + kTopView_BottomMargin * kYScal, self.topView.frame.size.width, self.scrollview.contentSize.height - CGRectGetMaxY(self.topView.frame) - kTopView_BottomMargin * kYScal - kBottomHeight * kYScal)];
    self.listBgView.layer.cornerRadius = 4;
    self.listBgView.layer.masksToBounds = YES;
    self.listBgView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    [self.scrollview addSubview:self.listBgView];
    
    self.listView = [[UITableView alloc] initWithFrame:CGRectMake(kListView_LeftMargin * kXScal, kListView_TopMargin * kYScal, self.listBgView.frame.size.width - 2 * kListView_LeftMargin * kXScal, self.listBgView.frame.size.height - kListView_TopMargin * kYScal - kListView_BottomMargin * kYScal) style:UITableViewStylePlain];
    self.listView.delegate = self;
    self.listView.dataSource = self;
    self.listView.backgroundColor = [UIColor clearColor];
    self.listView.showsVerticalScrollIndicator = NO;
    [self.listBgView addSubview:self.listView];
    prescriptionListviewSize = self.listView.frame.size;
    
    self.dataView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.listView.frame), self.listView.frame.size.width, kListView_BottomMargin * kYScal)];
    self.dataView.backgroundColor = [UIColor clearColor];
    [self.listBgView addSubview:self.dataView];
    
    self.trainingGroupLbl = [[UILabel alloc] initWithFrame:CGRectMake(kTrainingGroupLbl_LeftMargin * kXScal, kTrainingGroupLbl_TopMargin * kYScal, kTrainingGroupLbl_Width * kXScal, kTrainingGroupLbl_Height * kYScal)];
    self.trainingGroupLbl.text = @"训练组数：";
    self.trainingGroupLbl.font = [UIFont systemFontOfSize:kTrainingGroupLbl_FontSize * kYScal];
    self.trainingGroupLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    [self.dataView addSubview:self.trainingGroupLbl];
    
    self.trainingGroupValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingGroupLbl.frame) + kTrainingGroupLbl_RightMargin * kXScal, 0, kTrainingGroupValLbl_Width, kTrainingGroupValLbl_Height * kYScal)];
    self.trainingGroupValLbl.center = CGPointMake(CGRectGetMaxX(self.trainingGroupLbl.frame) + kTrainingGroupLbl_RightMargin * kXScal + kTrainingGroupValLbl_Width * kXScal/2.0, self.trainingGroupLbl.center.y);
    self.trainingGroupValLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.trainingGroupValLbl.font = [UIFont systemFontOfSize:kTrainingGroupValLbl_FontSize * kYScal];
    self.trainingGroupValLbl.text = @"4";
    [self.dataView addSubview:self.trainingGroupValLbl];
    
    CGFloat hspace = (self.dataView.frame.size.width - 2 * kTrainingGroupLbl_LeftMargin * kXScal - 2 * (kTrainingGroupLbl_Width + kTrainingGroupLbl_RightMargin + kTrainingGroupValLbl_Width) * kXScal - (kTrainingTimeLbl_Width + kTrainingTimeLbl_RightMargin + kTrainingGroupValLbl_Width) * kXScal)/2;
    
    self.trainingTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingGroupValLbl.frame) + hspace, self.trainingGroupLbl.frame.origin.y, kTrainingTimeLbl_Width * kXScal, kTrainingGroupValLbl_Height * kYScal)];
    self.trainingTimeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.trainingTimeLbl.font = [UIFont systemFontOfSize:kTrainingGroupLbl_FontSize * kYScal];
    self.trainingTimeLbl.text = @"训练总时长：";
    [self.dataView addSubview:self.trainingTimeLbl];
    
    self.trainingTimeValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingTimeLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal, 0, kTrainingTimeValLbl_Width, kTrainingGroupValLbl_Height * kYScal)];
    self.trainingTimeValLbl.center = CGPointMake(CGRectGetMaxX(self.trainingTimeLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal + kTrainingTimeValLbl_Width * kXScal/2.0, self.trainingTimeLbl.center.y);
    self.trainingTimeValLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.trainingTimeValLbl.font = [UIFont systemFontOfSize:kTrainingGroupValLbl_FontSize * kYScal];
    self.trainingTimeValLbl.text = @"24:24";
    [self.dataView addSubview:self.trainingTimeValLbl];
    
    self.avgDifficultyLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingTimeValLbl.frame) + hspace, self.trainingGroupLbl.frame.origin.y, kTrainingGroupLbl_Width * kXScal, kTrainingGroupValLbl_Height * kYScal)];
    self.avgDifficultyLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.avgDifficultyLbl.font = [UIFont systemFontOfSize:kTrainingGroupLbl_FontSize * kYScal];
    self.avgDifficultyLbl.text = @"平均强度：";
    [self.dataView addSubview:self.avgDifficultyLbl];
    
    self.avgDifficultyValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgDifficultyLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal, 0, kTrainingTimeValLbl_Width, kTrainingGroupValLbl_Height * kYScal)];
    self.avgDifficultyValLbl.center = CGPointMake(CGRectGetMaxX(self.avgDifficultyLbl.frame) + kTrainingTimeLbl_RightMargin * kXScal + kTrainingTimeValLbl_Width * kXScal/2.0, self.avgDifficultyLbl.center.y);
    self.avgDifficultyValLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.avgDifficultyValLbl.font = [UIFont systemFontOfSize:kTrainingGroupValLbl_FontSize * kYScal];
    self.avgDifficultyValLbl.text = @"4";
    [self.dataView addSubview:self.avgDifficultyValLbl];
    
    self.doctorLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.listBgView.frame.origin.x, CGRectGetMaxY(self.listBgView.frame) + kDoctorAdviceLbl_TopMargin * kYScal, kDoctorLbl_Width * kXScal, kDoctorLbl_Height * kYScal)];
    self.doctorLbl.font = [UIFont systemFontOfSize:kDoctorLbl_FontSize * kYScal];
    self.doctorLbl.textColor = [UIColor colorWithHexString:@"#5F5F5F"];
    self.doctorLbl.text = @"医      嘱";
    [self.scrollview addSubview:self.doctorLbl];
    
    self.doctorAdviceView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.doctorLbl.frame) + kDoctorLbl_RightMargin * kXScal, 0, self.scrollview.frame.size.width - CGRectGetMaxX(self.doctorLbl.frame) - kDoctorLbl_RightMargin * kXScal, kDoctorAdviceView_Height * kYScal)];
    self.doctorAdviceView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    self.doctorAdviceView.center = CGPointMake(CGRectGetMaxX(self.doctorLbl.frame) + kDoctorLbl_RightMargin * kXScal + (self.scrollview.frame.size.width - CGRectGetMaxX(self.doctorLbl.frame) - kDoctorLbl_RightMargin * kXScal)/2.0, self.doctorLbl.center.y);
    [self.scrollview addSubview:self.doctorAdviceView];
    
    self.doctorAdviceValLbl = [[UILabel alloc] initWithFrame:CGRectMake(kDoctorAdviceValLbl_LeftMargin * kXScal, (self.doctorAdviceView.frame.size.height - kDoctorAdviceValLbl_Height * kYScal)/2.0, self.doctorAdviceView.frame.size.width - kDoctorAdviceValLbl_LeftMargin * kXScal, kDoctorAdviceValLbl_Height * kYScal)];
    self.doctorAdviceValLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.doctorAdviceValLbl.font = [UIFont systemFontOfSize:kDoctorLbl_FontSize * kYScal];
    self.doctorAdviceValLbl.text = [self.prescriptionDict valueForKey:@"doctorAdvice"];
    [self.doctorAdviceView addSubview:self.doctorAdviceValLbl];
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
    if (section == self.groups.count - 1) {
        return 0;
    } else {
        return 15;
    }
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseCellIdStr = [NSString stringWithFormat:@"AerobicGroupCell%ld%ld",(long)indexPath.section,(long)indexPath.row];
    PrescriptionCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellIdStr];
    if (cell == nil) {
        cell = [[PrescriptionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellIdStr];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    }
    cell.groupNameLbl.text = [NSString stringWithFormat:@"第%d组",indexPath.section + 1];
    NSDictionary *dict = [self.groups objectAtIndex:indexPath.section];
    NSLog(@"dict is :%@",dict);
    NSString *rpeRange = [dict valueForKey:@"rpeRange"];
    NSArray *rpeRangeArr = [rpeRange componentsSeparatedByString:@"-"];
    if (rpeRangeArr.count > 0) {
        cell.rpeLeftTF.text = rpeRangeArr[0];
        cell.rpeRightTF.text = rpeRangeArr[1];
    }
    cell.difficultyTF.text = [NSString stringWithFormat:@"%d",[[dict valueForKey:@"difficulty"] integerValue]];
    return cell;
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
