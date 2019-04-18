//
//  PatientInfoViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/18.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientInfoViewController.h"
#import "LMJDropdownMenu.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 150

@interface PatientInfoViewController ()
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIScrollView *scrollview;
@property (nonatomic,strong)UILabel *statusLbl;
@property (nonatomic,strong)UIView *testView;
@property (nonatomic,strong)UILabel *deviceLbl;
@property (nonatomic,strong)UILabel *attributeLbl;
@property (nonatomic,strong)LMJDropdownMenu *testResultMenu;
@property (nonatomic,strong)UITableView *testResultListView;
@property (nonatomic,strong)UILabel *hrLbl;
@property (nonatomic,strong)LMJDropdownMenu *hrMenu;
@property (nonatomic,strong)UIButton *icCardBtn;
@property (nonatomic,strong)UIButton *updateInfoBtn;
@property (nonatomic,strong)UIButton *changeBtn;
@property (nonatomic,strong)UILabel *latestUpdateTimeLbl;
@property (nonatomic,strong)UILabel *latestDoctorLbl;
@property (nonatomic,strong)UILabel *oldTimeLbl;
@property (nonatomic,strong)UILabel *oldDoctorLbl;
@property (nonatomic,strong)UIButton *leftBtn;
@property (nonatomic,strong)UIButton *rightBtn;
@property (nonatomic,strong)UIView *latestContentView;
@property (nonatomic,strong)UIView *oldContentView;
@property (nonatomic,strong)UILabel *latestLbl;
@property (nonatomic,strong)UIImageView *latestPatientImg;
@property (nonatomic,strong)UILabel *latestNameLbl;
@property (nonatomic,strong)UIImageView *latestNameStar;
@property (nonatomic,strong)UITextField *latestNameTF;
@property (nonatomic,strong)UILabel *latestSexLbl;
@property (nonatomic,strong)UIImageView *latestSexStar;
@property (nonatomic,strong)UITextField *latestSexTF;
@property (nonatomic,strong)UILabel *latestPhoneLbl;
@property (nonatomic,strong)UIImageView *latestPhoneStar;
@property (nonatomic,strong)UITextField *latestPhoneTF;
@property (nonatomic,strong)UILabel *latestBirthLbl;
@property (nonatomic,strong)UIImageView *latestBirthStar;
@property (nonatomic,strong)UITextField *latestBirthTF;
@property (nonatomic,strong)UILabel *latestHeightLbl;
@property (nonatomic,strong)UIImageView *latestHeightStar;
@property (nonatomic,strong)UITextField *latestHeightTF;
@property (nonatomic,strong)UILabel *latestWeightLbl;
@property (nonatomic,strong)UIImageView *latestWeightStar;
@property (nonatomic,strong)UITextField *latestWeightTF;
@property (nonatomic,strong)UILabel *latestWaistLbl;
@property (nonatomic,strong)UIImageView *latestWaistStar;
@property (nonatomic,strong)UITextField *latestWaistTF;
@property (nonatomic,strong)UILabel *latestKFXTLbl;//空腹血糖
@property (nonatomic,strong)UIImageView *latestKFXTStar;
@property (nonatomic,strong)UITextField *latestKFXTHRTF;
@property (nonatomic,strong)UILabel *latestQuietHRLbl;
@property (nonatomic,strong)UIImageView *latestQuietHRStar;
@property (nonatomic,strong)UITextField *latestQuietHRTF;
@property (nonatomic,strong)UILabel *latestXLBYLbl;//心率变异
@property (nonatomic,strong)UIImageView *latestXLBYStar;
@property (nonatomic,strong)UITextField *latestXLBYTF;
@property (nonatomic,strong)UILabel *latestSSYLbl;//收缩压
@property (nonatomic,strong)UIImageView *latestSSYStar;
@property (nonatomic,strong)UITextField *latestSSYTF;
@property (nonatomic,strong)UILabel *latestJZYLbl;//紧张压
@property (nonatomic,strong)UIImageView *latestJZYStar;
@property (nonatomic,strong)UITextField *latestJZYTF;
@property (nonatomic,strong)UILabel *latestGMDZDBLbl;//高密度脂蛋白
@property (nonatomic,strong)UIImageView *latestGMDZDBStar;
@property (nonatomic,strong)UITextField *latestGMDZDBTF;
@property (nonatomic,strong)UILabel *latestSTZLZSLbl;//身体质量指数
@property (nonatomic,strong)UIImageView *latestSTZLZSStar;
@property (nonatomic,strong)UITextField *latestSTZLZSTF;
@property (nonatomic,strong)UIImageView *latestQuestionImg1;
@property (nonatomic,strong)UILabel *latestQuestionLbl1;
@property (nonatomic,strong)UIImageView *latestQuestionImg2;
@property (nonatomic,strong)UILabel *latestQuestionLbl2;
@property (nonatomic,strong)UIImageView *latestQuestionImg3;
@property (nonatomic,strong)UILabel *latestQuestionLbl3;
@property (nonatomic,strong)UIImageView *latestQuestionImg4;
@property (nonatomic,strong)UILabel *latestQuestionLbl4;
@property (nonatomic,strong)UIImageView *latestQuestionImg5;
@property (nonatomic,strong)UILabel *latestQuestionLbl5;
@end

@implementation PatientInfoViewController

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
    self.titleLbl.text = @"患者管理";
    [self.navView addSubview:self.titleLbl];
}

- (void)setupUI {

}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

@end
