//
//  AddPatientViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/17.
//  Copyright © 2019 dz. All rights reserved.
//

#import "AddPatientViewController.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 30
#define kTitleLbl_Width 450
#define kTitleLbl_Height 29
#define kTitleLbl_TopMargin 120
#define kTitleLbl_BottomMargin 43
#define kLoginBgImg_LeftMargin 140
#define kLoginBgImg_BottomMargin 163
#define kDoctorImg_LeftMargin 102
#define kDoctorImg_RightMargin 17
#define kDoctorImg_TopMargin 86
#define kDoctorImg_BottomMargin 64
#define kDoctorImg_Width 161
#define kDoctorImg_Height 266
#define KDashView_TopMargin 58
#define KDashView_Width 242
#define kDashView_BottomMargin 63
#define kChangeBtn_TopMargin 19
#define kChangeBtn_Width 95
#define kChangeBtn_Height 19
#define kChangeBtn_RightMargin 35
#define kPasswordBtn_TopMargin 48
#define kPasswordBtn_LeftMargin 20
#define kPasswordBtn_Height 15
#define kPasswordBtn_RightMargin 12
#define kPasswordBtn_FontSize 15.0
#define kMiddleView_Width 3
#define kMiddleView_Height 15
#define kMiddleView_RightMargin 11
#define KCodeBtn_width 104
#define kCodeBtn_Height 15
#define kCodeBtn_FontSize 15.0
#define kMiddleLine_Heigh 1
#define kMiddleLine_LeftMargin 20
#define kPhoneLbl_Width 48
#define kPhoneLbl_Height 12
#define kPhoneLbl_FontSize 12.0
#define kPhoneLbl_TopMargin 32.0
#define kPhoneLbl_LeftMargin 21.0
#define kPhoneLbl_RightMargin 21.0
#define kPhoneLbl_BottomMargin 37.0
#define kPhoneTF_TopMargin 26
#define kPhoneTF_RightMargin 20
#define kPhoneTF_Width 134
#define kPhoneTF_Height 26
#define kPhoneTF_BottomMargin 23
#define kLoginBtn_TopMargin 29
#define kLoginBtn_Width 105
#define kLoginBtn_Height 25
#define kLoginBtn_FontSize 12.0
#define kVerify_Btn_LeftMargin  10
#define kVerify_Btn_Width 80
#define kVerify_Btn_FontSize 13.0
@interface AddPatientViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *loginBgImg;
@property (nonatomic,strong)UIImageView *doctorImg;
@property (nonatomic,strong)UIButton *wechatLoginBtn;
@property (nonatomic,strong)UIView *scanBgView;
@property (nonatomic,strong)UILabel *QRCodeLbl;
@property (nonatomic,strong)UILabel *scanLbl;
@property (nonatomic,strong)UIImageView *scanImg;
@property (nonatomic,strong)UILabel *refreshLbl;
@property (nonatomic,strong)UIImageView *dashView;
@property (nonatomic,strong)UIButton *userLoginBtn;//账号登录
@property (nonatomic,strong)UIButton *passwordBtn; //密码登录按钮
@property (nonatomic,strong)UIView *seperateView;//密码登录和短信随机码登录之间的视图
@property (nonatomic,strong)UIButton *codeBtn;//短信随机码登录按钮
@property (nonatomic,strong)UIView *seperateLine;//分割线
@property (nonatomic,strong)UILabel *phoneLbl;//手机号码
@property (nonatomic,strong)UITextField *phoneTF;
@property (nonatomic,strong)UILabel *verifyCodeLbl;//验证码
@property (nonatomic,strong)UITextField *verifyCodeTF;
@property (nonatomic,strong)UIButton *verifyCodeBtn;
@property (nonatomic,strong)UIView *middleLine;
@property (nonatomic,strong)UILabel *passwordLbl;//密码
@property (nonatomic,strong)UITextField *passwordTF;
@property (nonatomic,strong)UIButton *loginBtn;//登录
@end

@implementation AddPatientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self setupUI];
}

- (void)setupUI {
    UIImage *image = [UIImage imageNamed:@"login_bg"];
    image = [self imageCompressWithSimple:image scaledToSize:CGSizeMake(kWidth, kHeight)];
    self.bgImg = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:self.bgImg];
    
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, kNavView_TopMargin, kWidth, kNavView_Height)];
    self.navView.backgroundColor = [UIColor clearColor];
    [self.bgImg addSubview:self.navView];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    self.backButton.adjustsImageWhenHighlighted = NO;
    CGFloat backButtonTop = (kNavView_Height - kButton_Height)/2;
    self.backButton.frame = CGRectMake(kBackButton_LeftMargin, backButtonTop, kButton_Height, kButton_Height);
    self.backButton.layer.cornerRadius = kButton_Height / 2.0;
    self.backButton.layer.masksToBounds = YES;
    [self.backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.backButton];
    
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kTitleLbl_Width * kXScal, kTitleLbl_Height * kYScal)];
    self.titleLbl.font = [UIFont systemFontOfSize:kTitle_FontSize * kYScal];
    self.titleLbl.textColor = [UIColor whiteColor];
    self.titleLbl.text = @"以动健康Ⅱ型糖尿病运动康复系统";
    self.titleLbl.center = CGPointMake(kWidth/2.0, kTitleLbl_TopMargin * kYScal + kTitleLbl_Height * kYScal/2.0);
    [self.bgImg addSubview:self.titleLbl];
    
    self.loginBgImg = [[UIImageView alloc] initWithFrame:CGRectMake(kLoginBgImg_LeftMargin * kXScal, CGRectGetMaxY(self.titleLbl.frame) + kTitleLbl_BottomMargin * kYScal, kWidth - 2 * kLoginBgImg_LeftMargin * kXScal, kHeight - CGRectGetMaxY(self.titleLbl.frame) - kTitleLbl_BottomMargin * kYScal - kLoginBgImg_BottomMargin * kYScal)];
    self.loginBgImg.image = [UIImage imageNamed:@"loginBgImg"];
    [self.bgImg addSubview:self.loginBgImg];
    
    self.doctorImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"doctor1"]];
    self.doctorImg.frame = CGRectMake(kDoctorImg_LeftMargin * kXScal, kDoctorImg_TopMargin * kYScal, kDoctorImg_Width * kXScal, kDoctorImg_Height * kYScal);
    [self.loginBgImg addSubview:self.doctorImg];
    
    self.dashView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashView"]];
    self.dashView.frame = CGRectMake(kDoctorImg_RightMargin * kXScal, KDashView_TopMargin * kYScal, KDashView_Width * kXScal, self.loginBgImg.frame.size.height - KDashView_TopMargin * kYScal - kDashView_BottomMargin * kYScal);
    [self.loginBgImg addSubview:self.dashView];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
