//
//  CreateAerobicPrescriptionViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/23.
//  Copyright © 2019 dz. All rights reserved.
//

#import "CreateAerobicPrescriptionViewController.h"
#import "LMJDropdownMenu.h"
#import "UnitTextField.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 150
#define kLeftBtn_Width 21

@interface CreateAerobicPrescriptionViewController ()
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIScrollView *scrollview;
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UIView *templateView;
@property (nonatomic,strong)UILabel *prescriptionLbl;
@property (nonatomic,strong)UnitTextField *prescriptionTF;
@property (nonatomic,strong)UILabel *doctorAdviceLbl;
@property (nonatomic,strong)UITextView *doctorAdviceView;
@property (nonatomic,strong)UIButton *createBtn;
@property (nonatomic,strong)UIButton *giveupBtn;
@end

@implementation CreateAerobicPrescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    [self setNavBar];
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
    self.titleLbl.text = @"开具有氧处方";
    [self.navView addSubview:self.titleLbl];
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

@end
