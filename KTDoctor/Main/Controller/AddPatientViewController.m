//
//  AddPatientViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/17.
//  Copyright © 2019 dz. All rights reserved.
//

#import "AddPatientViewController.h"
#import <CoreImage/CoreImage.h>
#import "UserModel.h"

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
#define kChangeBtn_TopMargin 21
#define kChangeBtn_Width 95
#define kChangeBtn_Height 19
#define kChangeBtn_FontSize 15.0
#define kChangeBtn_RightMargin 35
#define kPasswordBtn_TopMargin 48
#define kPasswordBtn_LeftMargin 20
#define kPasswordBtn_Height 15
#define kPasswordBtn_RightMargin 12
#define kPasswordBtn_Width 60
#define kPasswordBtn_FontSize 15.0
#define kPasswordBtn_BottomMargin 18.0
#define kMiddleView_Width 3
#define kMiddleView_Height 15
#define kMiddleView_RightMargin 11
#define KCodeBtn_width 105
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
#define kPhoneTF_RightMargin 20
#define kLoginBtn_TopMargin 29
#define kLoginBtn_Width 105
#define kLoginBtn_Height 25
#define kLoginBtn_FontSize 12.0
#define kVerify_Btn_LeftMargin  9
#define kVerify_Btn_Width 60
#define kVerify_Btn_FontSize 10.0

#define kWechatTitleLbl_TopMargin 19
#define kWechatTitleLbl_BottomMargin 13
#define kWechatTitleLbl_Width 72
#define kWechatTitleLbl_Height 17
#define kWechatTitleLbl_FontSize 18
#define kScanLbl_Width 144
#define kScanLbl_Height 12
#define kScanLbl_FontSize 12.0
#define kRefreshLbl_BottomMargin 9
#define kRefreshLbl_Width 90
#define kRefreshLbl_Height 10
#define kRefreshLbl_FontSize 10
#define kScanImg_TopMargin 42
#define kScanImg_Width 163
#define kScanImg_Height 150

@interface AddPatientViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *loginBgImg;
@property (nonatomic,strong)UIImageView *doctorImg;
@property (nonatomic,strong)UIButton *wechatLoginBtn;
@property (nonatomic,strong)UIView *loginBgView;
@property (nonatomic,strong)UIView *scanBgView;
@property (nonatomic,strong)UILabel *QRCodeLbl;//微信扫码
@property (nonatomic,strong)UILabel *scanLbl;//请使用微信扫描二维码
@property (nonatomic,strong)UIImageView *scanImg;
@property (nonatomic,strong)UILabel *refreshLbl;//点击二维码进行刷新
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
@property (nonatomic,strong)NSTimer *verifyCodeTimer;
@property (nonatomic,assign)NSInteger seconds;
@property (nonatomic,copy)NSString *smsCode;
@property (nonatomic,assign)BOOL isPasswordLogin;//是否是密码登录
@property (nonatomic,strong)UserModel *user;
@end

@implementation AddPatientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.isPasswordLogin = YES;
    self.user = [[UserModel sharedUserModel] getCurrentUser];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@2 forKey:@"type"];
    [self getWXQRCode:parameter];
    [self setupUI];
}

- (void)setupUI {
    UIImage *image = [UIImage imageNamed:@"login_bg"];
    image = [self imageCompressWithSimple:image scaledToSize:CGSizeMake(kWidth, kHeight)];
    self.bgImg = [[UIImageView alloc] initWithImage:image];
    self.bgImg.userInteractionEnabled = YES;
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
    
    self.wechatLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.wechatLoginBtn.frame = CGRectMake(self.loginBgImg.frame.size.width - kChangeBtn_Width * kXScal - kChangeBtn_RightMargin * kXScal, kChangeBtn_TopMargin * kYScal, kChangeBtn_Width * kXScal, kChangeBtn_Height * kYScal);
    [self.wechatLoginBtn setImage:[UIImage imageNamed:@"code"] forState:UIControlStateNormal];
    [self.wechatLoginBtn setTitle:@"账号登录" forState:UIControlStateNormal];
    [self.wechatLoginBtn setTitleColor:[UIColor colorWithHexString:@"#10A7C9"] forState:UIControlStateNormal];
    [self.wechatLoginBtn.titleLabel setFont:[UIFont systemFontOfSize:kChangeBtn_FontSize * kYScal]];
    [self.wechatLoginBtn addTarget:self action:@selector(changeLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.wechatLoginBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.loginBgImg addSubview:self.wechatLoginBtn];
    self.loginBgImg.userInteractionEnabled = YES;
    
    self.doctorImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"doctor1"]];
    self.doctorImg.frame = CGRectMake(kDoctorImg_LeftMargin * kXScal, kDoctorImg_TopMargin * kYScal, kDoctorImg_Width * kXScal, kDoctorImg_Height * kYScal);
    [self.loginBgImg addSubview:self.doctorImg];
    
    self.dashView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashView"]];
    self.dashView.frame = CGRectMake(CGRectGetMaxX(self.doctorImg.frame) + kDoctorImg_RightMargin * kXScal, KDashView_TopMargin * kYScal, KDashView_Width * kXScal, self.loginBgImg.frame.size.height - KDashView_TopMargin * kYScal - kDashView_BottomMargin * kYScal);
    [self.loginBgImg addSubview:self.dashView];
    self.dashView.userInteractionEnabled = YES;
    [self configLoginview];
    [self configScanview];
    self.scanBgView.hidden = YES;
}

- (void)configLoginview {
    self.loginBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.dashView.frame.size.width, self.dashView.frame.size.height)];
    self.loginBgView.backgroundColor = [UIColor clearColor];
    [self.dashView addSubview:self.loginBgView];
    
    self.passwordBtn = [[UIButton alloc] initWithFrame:CGRectMake(kPasswordBtn_LeftMargin * kXScal, kPasswordBtn_TopMargin * kYScal, kPasswordBtn_Width * kXScal, kPasswordBtn_Height * kYScal)];
    [self.passwordBtn setTitle:@"密码登录" forState:UIControlStateNormal];
    [self.passwordBtn setTitleColor:[UIColor colorWithHexString:@"#099FC1"] forState:UIControlStateNormal];
    [self.passwordBtn.titleLabel setFont:[UIFont systemFontOfSize:kPasswordBtn_FontSize * kYScal]];
    [self.passwordBtn addTarget:self action:@selector(passwordBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.passwordBtn.userInteractionEnabled = YES;
    [self.loginBgView addSubview:self.passwordBtn];
    
    self.seperateView = [[UIView alloc] initWithFrame:CGRectMake(kMiddleView_RightMargin * kXScal, 0, kMiddleView_Width * kXScal, kMiddleView_Height * kYScal)];
    self.seperateView.backgroundColor = [UIColor colorWithHexString:@"#099FC1"];
    self.seperateView.center = CGPointMake(CGRectGetMaxX(self.passwordBtn.frame) + kMiddleView_RightMargin * kXScal + kMiddleView_Width * kXScal / 2.0, self.passwordBtn.center.y);
    [self.loginBgView addSubview:self.seperateView];
    
    self.codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.codeBtn setTitleColor:[UIColor colorWithHexString:@"#000033"] forState:UIControlStateNormal];
    [self.codeBtn setTitle:@"短信随机码登录" forState:UIControlStateNormal];
    [self.codeBtn addTarget:self action:@selector(codeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.codeBtn.frame = CGRectMake(CGRectGetMaxX(self.seperateView.frame) + kMiddleView_RightMargin * kXScal, self.passwordBtn.frame.origin.y, KCodeBtn_width * kXScal, kCodeBtn_Height * kYScal);
    self.codeBtn.userInteractionEnabled = YES;
    [self.codeBtn.titleLabel setFont:[UIFont systemFontOfSize:kPasswordBtn_FontSize * kYScal]];
    [self.loginBgView addSubview:self.codeBtn];
    
    self.middleLine = [[UIView alloc] initWithFrame:CGRectMake(self.passwordBtn.frame.origin.x, CGRectGetMaxY(self.passwordBtn.frame) + kPasswordBtn_BottomMargin * kYScal, self.dashView.frame.size.width - 2 * self.passwordBtn.frame.origin.x, kMiddleLine_Heigh * kYScal)];
    self.middleLine.backgroundColor = [UIColor colorWithHexString:@"#099FC1"];
    [self.loginBgView addSubview:self.middleLine];
    
    self.phoneLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.passwordBtn.frame.origin.x,CGRectGetMaxY(self.middleLine.frame) + kPhoneLbl_TopMargin * kYScal, kPhoneLbl_Width * kXScal, kPhoneLbl_Height * kYScal)];
    self.phoneLbl.text = @"手机号码";
    self.phoneLbl.textColor = [UIColor colorWithHexString:@"#011945"];
    self.phoneLbl.font = [UIFont systemFontOfSize:kPhoneLbl_FontSize * kYScal];
    [self.loginBgView addSubview:self.phoneLbl];
    
    self.phoneTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.phoneLbl.frame) + kPhoneLbl_RightMargin * kXScal, 0, kPhoneTF_Width * kXScal, kPhoneTF_Height * kYScal)];
    self.phoneTF.backgroundColor = [UIColor colorWithHexString:@"#68C9DE"];
    self.phoneTF.layer.cornerRadius = 2;
    self.phoneTF.layer.masksToBounds = YES;
    self.phoneTF.center = CGPointMake(CGRectGetMaxX(self.phoneLbl.frame) + kPhoneLbl_RightMargin * kXScal + kPhoneTF_Width * kXScal/2.0, self.phoneLbl.center.y);
    [self.loginBgView addSubview:self.phoneTF];
    
    self.passwordLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.phoneLbl.frame.origin.x, CGRectGetMaxY(self.phoneLbl.frame) + kPhoneLbl_BottomMargin * kYScal, kPhoneLbl_Width * kXScal, kPhoneLbl_Height * kYScal)];
    self.passwordLbl.textColor = [UIColor colorWithHexString:@"#011945"];
    self.passwordLbl.text = @"密       码";
    self.passwordLbl.font = [UIFont systemFontOfSize:kPhoneLbl_FontSize * kYScal];
    [self.loginBgView addSubview:self.passwordLbl];
    
    self.passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(self.passwordTF.frame.origin.x, 0, self.phoneTF.frame.size.width, self.phoneTF.frame.size.height)];
    self.passwordTF.backgroundColor = [UIColor colorWithHexString:@"#68C9DE"];
    self.passwordTF.layer.cornerRadius = 2;
    self.passwordTF.layer.masksToBounds = YES;
    self.passwordTF.secureTextEntry = YES;
    self.passwordTF.center = CGPointMake(CGRectGetMaxX(self.passwordLbl.frame) + kPhoneLbl_RightMargin * kXScal + kPhoneTF_Width * kXScal/2.0, self.passwordLbl.center.y);
    [self.loginBgView addSubview:self.passwordTF];
    
    self.verifyCodeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.passwordLbl.frame.origin.x, self.passwordLbl.frame.origin.y, kPhoneLbl_Width * kXScal, kPhoneLbl_Height * kYScal)];
    self.verifyCodeLbl.textColor = [UIColor colorWithHexString:@"#011945"];
    self.verifyCodeLbl.text = @"验 证 码";
    self.verifyCodeLbl.font = [UIFont systemFontOfSize:kPhoneLbl_FontSize * kYScal];
    [self.loginBgView addSubview:self.verifyCodeLbl];
    self.verifyCodeLbl.hidden = YES;
    
    CGFloat verifyCodeTF_Width = self.dashView.frame.size.width - CGRectGetMaxX(self.verifyCodeLbl.frame) - kPhoneLbl_RightMargin * kXScal - kVerify_Btn_LeftMargin * kXScal - kVerify_Btn_Width * kXScal - kPhoneTF_RightMargin * kXScal;
    self.verifyCodeTF = [[UITextField alloc] initWithFrame:CGRectMake(self.passwordTF.frame.origin.x, self.passwordTF.frame.origin.y, verifyCodeTF_Width, self.phoneTF.frame.size.height)];
    self.verifyCodeTF.placeholder = @"请输入验证码";
    self.verifyCodeTF.font = [UIFont systemFontOfSize:kVerify_Btn_FontSize * kYScal];
    self.verifyCodeTF.backgroundColor = [UIColor colorWithHexString:@"#68C9DE"];
    [self.loginBgView addSubview:self.verifyCodeTF];
    self.verifyCodeTF.hidden = YES;
    
    self.verifyCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.verifyCodeBtn.frame = CGRectMake(CGRectGetMaxX(self.verifyCodeTF.frame) + kVerify_Btn_LeftMargin * kXScal, self.verifyCodeTF.frame.origin.y, kVerify_Btn_Width * kXScal, self.verifyCodeTF.frame.size.height);
    [self.verifyCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.verifyCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.verifyCodeBtn.titleLabel setFont:[UIFont systemFontOfSize:kVerify_Btn_FontSize * kYScal]];
    [self.verifyCodeBtn addTarget:self action:@selector(sendVerifyCode:) forControlEvents:UIControlEventTouchUpInside];
    self.verifyCodeBtn.backgroundColor = [UIColor colorWithHexString:@"#68C9DE"];
    [self.loginBgView addSubview:self.verifyCodeBtn];
    self.verifyCodeBtn.userInteractionEnabled = YES;
    self.verifyCodeBtn.hidden = YES;
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginBtn.titleLabel setFont:[UIFont systemFontOfSize:kLoginBtn_FontSize * kYScal]];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = [UIColor colorWithHexString:@"#0FB2D7"];
    self.loginBtn.frame = CGRectMake(0, CGRectGetMaxY(self.passwordTF.frame) + kLoginBtn_TopMargin * kYScal, kLoginBtn_Width * kXScal, kLoginBtn_Height * kYScal);
    self.loginBtn.center = CGPointMake(self.dashView.frame.size.width/2.0, CGRectGetMaxY(self.passwordTF.frame) + kLoginBtn_TopMargin * kYScal + kLoginBtn_Height * kYScal / 2.0);
    [self.loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    self.loginBtn.layer.cornerRadius = 2;
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.userInteractionEnabled = YES;
    [self.loginBgView addSubview:self.loginBtn];
}
- (void)configScanview {
    self.scanBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.dashView.frame.size.width, self.dashView.frame.size.height)];
    self.scanBgView.backgroundColor = [UIColor clearColor];
    [self.dashView addSubview:self.scanBgView];
    
    self.QRCodeLbl = [[UILabel alloc] initWithFrame:CGRectMake((self.scanBgView.frame.size.width - kWechatTitleLbl_Width * kXScal)/2.0, kWechatTitleLbl_TopMargin * kYScal, kWechatTitleLbl_Width * kXScal, kWechatTitleLbl_Height * kYScal)];
    self.QRCodeLbl.text = @"微信扫码";
    self.QRCodeLbl.textColor = [UIColor colorWithHexString:@"#011945"];
    self.QRCodeLbl.font = [UIFont systemFontOfSize:kWechatTitleLbl_FontSize * kYScal];
    self.QRCodeLbl.textAlignment = NSTextAlignmentCenter;
    [self.scanBgView addSubview:self.QRCodeLbl];
    
    self.scanLbl = [[UILabel alloc] initWithFrame:CGRectMake((self.scanBgView.frame.size.width - kScanLbl_Width)/2.0, CGRectGetMaxY(self.QRCodeLbl.frame) + kWechatTitleLbl_BottomMargin * kYScal, kScanLbl_Width * kXScal, kScanLbl_Height * kYScal)];
    self.scanLbl.font = [UIFont systemFontOfSize:kScanLbl_FontSize * kYScal];
    self.scanLbl.textAlignment = NSTextAlignmentCenter;
    self.scanLbl.textColor = [UIColor colorWithHexString:@"#011945"];
    self.scanLbl.text = @"请使用微信扫描二维码登录";
    [self.scanBgView addSubview:self.scanLbl];
    
    self.scanImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    self.scanImg.frame = CGRectMake((self.scanBgView.frame.size.width - kScanImg_Width)/2.0, CGRectGetMaxY(self.scanLbl.frame) + kScanImg_TopMargin * kYScal, kScanImg_Width * kXScal, kScanImg_Height * kYScal);
    [self.scanBgView addSubview:self.scanImg];
    
    self.refreshLbl = [[UILabel alloc] initWithFrame:CGRectMake((self.scanBgView.frame.size.width - kRefreshLbl_Width)/2.0, self.scanBgView.frame.size.height - kRefreshLbl_Height * kYScal - kRefreshLbl_BottomMargin * kYScal, kRefreshLbl_Width * kXScal, kRefreshLbl_Height * kYScal)];
    self.refreshLbl.font = [UIFont systemFontOfSize:kRefreshLbl_FontSize * kYScal];
    self.refreshLbl.textColor = [UIColor colorWithHexString:@"#011945"];
    self.refreshLbl.text = @"点击二维码进行刷新";
    self.refreshLbl.textAlignment = NSTextAlignmentCenter;
    [self.scanBgView addSubview:self.refreshLbl];
    self.scanBgView.hidden = YES;
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

- (void)changeLogin:(UIButton*)sender {
    if (sender.selected) {
        sender.selected = NO;
        [self.wechatLoginBtn setImage:[UIImage imageNamed:@"code"] forState:UIControlStateNormal];
        self.scanBgView.hidden = YES;
        self.loginBgView.hidden = NO;
    } else {
        sender.selected = YES;
        [self.wechatLoginBtn setImage:[UIImage imageNamed:@"wechat"] forState:UIControlStateNormal];
        self.scanBgView.hidden = NO;
        self.loginBgView.hidden = YES;
    }
}

- (void)passwordBtnClick:(UIButton*)sender {
    [self.passwordBtn setTitleColor:[UIColor colorWithHexString:@"12aac8"] forState:UIControlStateNormal];
    [self.codeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.passwordLbl.hidden = NO;
    self.passwordTF.hidden = NO;
    self.verifyCodeLbl.hidden = YES;
    self.verifyCodeTF.hidden = YES;
    self.verifyCodeBtn.hidden = YES;
    self.isPasswordLogin = YES;
}

- (void)codeBtnClick:(UIButton*)sender {
    [self.passwordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.codeBtn setTitleColor:[UIColor colorWithHexString:@"12aac8"] forState:UIControlStateNormal];
    self.passwordLbl.hidden = YES;
    self.passwordTF.hidden = YES;
    self.verifyCodeLbl.hidden = NO;
    self.verifyCodeTF.hidden = NO;
    self.verifyCodeBtn.hidden = NO;
    self.isPasswordLogin = NO;
}

- (void)verifyTimerRepeat {
    if (self.seconds == 0) {
        [self.verifyCodeTimer invalidate];
        self.verifyCodeBtn.enabled = YES;
        self.verifyCodeBtn.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
        [self.verifyCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    } else {
        [self.verifyCodeBtn setTitle:[NSString stringWithFormat:@"%ld",(long)self.seconds] forState:UIControlStateNormal];
    }
    self.seconds --;
}

- (void)sendVerifyCode:(UIButton*)sender {
    NSLog(@"发送验证码");
    self.smsCode = @"";
    if (self.phoneTF.text.length == 0) {
        [STTextHudTool showText:@"您输入的用户名错误"];
    } else {
        self.verifyCodeBtn.enabled = NO;
        self.verifyCodeBtn.backgroundColor = [UIColor lightGrayColor];
        self.seconds = 60;
        self.verifyCodeTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(verifyTimerRepeat) userInfo:nil repeats:YES];
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        [parameter setValue:@0 forKey:@"type"];
        [parameter setValue:self.phoneTF.text forKey:@"mobile"];
        [self sendSMS:parameter];
    }
}

- (void)login:(UIButton*)sender {
    BOOL isMobile = [NSString isPhoneNumber:self.phoneTF.text];
    if (self.isPasswordLogin) {
        NSString *username = self.phoneTF.text;
        NSString *password = self.passwordTF.text;
        if (username.length > 0 && password.length > 0) {
            NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
            [parameter setValue:username forKey:@"username"];
            [parameter setValue:password forKey:@"password"];
            NSDictionary *dict = self.user.organ;
            NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
            NSString *orgCode = orgCodeArr[0];
            [parameter setValue:orgCode forKey:@"orgCode"];
            [self loginWithPassword:parameter];
        } else if (username.length == 0 || !isMobile){
            [STTextHudTool showText:@"您输入的用户名错误"];
        } else {
            [STTextHudTool showText:@"请输入密码"];
        }
    } else {
        NSString *mobile = self.phoneTF.text;
        NSString *smsCode = self.verifyCodeTF.text;
        if (mobile.length > 0 && smsCode.length > 0) {
            NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
            [parameter setValue:smsCode forKey:@"smsCode"];
            [parameter setValue:mobile forKey:@"mobile"];
            [self loginWithSMS:parameter];
        } else if (mobile.length == 0 || !isMobile) {
            [STTextHudTool showText:@"您输入的用户名错误"];
        } else {
            [STTextHudTool showText:@"请输入验证码"];
        }
    }
}

#pragma mark - netFunctions

//获取扫码地址
- (void)getWXQRCode:(NSMutableDictionary*)parameter {
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kWX_GET_QR_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        if (code == 0) {
            NSDictionary *dict = [responseObject valueForKey:@"data"];
            NSString *url = [dict valueForKey:@"url"];
            NSLog(@"qr data is :%@",url);
            // 1.创建过滤器 -- 苹果没有将这个字符封装成常量
            CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
            // 2.过滤器恢复默认设置
            [filter setDefaults];
            // 3.给过滤器添加数据(正则表达式/帐号和密码) -- 通过KVC设置过滤器,只能设置NSData类型
            NSData *data = [url dataUsingEncoding:NSUTF8StringEncoding];
            [filter setValue:data forKeyPath:@"inputMessage"];
            // 4.获取输出的二维码
            CIImage *outputImage = [filter outputImage];
            // 5.显示二维码
            self.scanImg.image = [UIImage imageWithCIImage:outputImage];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}
//密码登录
- (void)loginWithPassword:(NSMutableDictionary*)parameter {
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kUSER_LOGIN_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        if (code != 0) {
            NSString *msg = [responseObject valueForKey:@"msg"];
            [STTextHudTool showText:msg];
        } else {
            [STTextHudTool showText:@"登录成功"];
        }
        NSLog(@"dict :%@",responseObject);
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

//发送验证码
- (void)sendSMS:(NSMutableDictionary*)parameter {
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kSEND_SMS_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        if (code == 0) {
            NSString *code = [responseObject valueForKey:@"code"];
            self.smsCode = code;
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

//短信验证啊登录
- (void)loginWithSMS:(NSMutableDictionary *)parameter {
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kSMS_LOGIN_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        if (code == 0) {
            [STTextHudTool showText:@"登录成功"];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
        [STTextHudTool showText:@"error"];
    }];
}

@end
