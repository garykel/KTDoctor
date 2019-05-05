//
//  PrescriptionDetailViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/5/5.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PrescriptionDetailViewController.h"
#import "UnitTextView.h"

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
#define kNameLbl_Width 51
#define kNameLbl_Height 13
#define kNameTF_Width 482
#define kNameTF_Height 19
#define kNameTF_FontSize 13.0
#define kDiseaseTF_Width 301
#define kBottomHeight 209
#define kScrollview_Height 930
#define kListView_TopMargin 20
#define kListView_LeftMargin 16
#define kListView_BottomMargin 33
#define kTrainingGroupLbl_LeftMargin 140
#define kTrainingGroupLbl_RightMargin 9
#define kTrainingGroupLbl_Width 55
#define kTrainingGroupLbl_Height 13
#define kTrainingGroupLbl_FontSize 13.0
#define kTrainingGroupValLbl_FontSize 15.0
#define kTrainingTimeLbl_RightMargin 10
#define kTrainingTimeLbl_Width 68
#define kTrainingTimeValLbl_Width 36
#define kTrainingTimeValLbl_Height 12
#define kDoctorAdviceView_TopMargin 14

@interface PrescriptionDetailViewController ()<UIScrollViewDelegate>
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
@property (nonatomic,strong)UnitTextView *doctorAdviceView;
@end

@implementation PrescriptionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    [self.topView addSubview:self.dieaseLbl];
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
