//
//  LoginViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/3/12.
//  Copyright © 2019 dz. All rights reserved.
//

#define kBlueView_LeftMargin 107
#define kBlueView_TopMargin 155
#define kWhiteView_LeftMargin 122
#define kWhiteView_TopMargin 142
#define kDash_LeftMargin 218
#define kDash_RightMargin 163
#define kDash_TopMargin 48
#define kDash_BottomMargin 25
#define kDoctor_LeftMargin 50
#define kDoctor_RightMargin 8
#define kDoctor_Width 188
#define kDoctor_Height 312
#define kDoctor_TopMargin 40
#define kDoctor_BottomMargin 60
#define kPassword_Btn_TopMargin 28
#define kPassword_Btn_LeftMargin 19
#define kPassword_Btn_Width 100
#define kPassword_Btn_Height 30
#define kSeperateView_Width 5
#define kSeperateView_Height 25
#define kSeperateView_LeftMargin 13
#define kCode_Btn_Width 150
#define kSeperate_Line_TopMargin 25
#define kSeperate_Line_RightMargin 13
#define kSeperate_Line_Height 1
#define kMiddle_Line_Height 1
#define kPhoneLbl_Font_Size 15.0
#define kPhone_Lbl_BottomMargin 30
#define kPhone_Lbl_Width 80
#define kPhone_Lbl_Heigh 30
#define kPhone_Textfield_LeftMargin 8
#define kPhone_Textfield_RightMargin 15
#define kVerify_Btn_LeftMargin  10
#define kVerify_Btn_Width 80
#define kVerify_Btn_FontSize 13.0
#define kPassword_Lbl_TopMargin 30
#define kLogin_Btn_BottomMargin 80
#define kLogin_Btn_Width 200
#define kLogin_Btn_Height 44
#define kRegist_Btn_Bottom 20
#define kRegist_Btn_LeftMargin 20
#define kRegist_Btn_Height 26
#define kForgot_Btn_BottomMargin 10
#define kVersion_Lbl_FontSize 30.0
#define kVersion_Lbl_TopMargin 10
#define kVersion_Lbl_LeftMargin 20
#define kVersion_Lbl_Height 30
#define kButton_CornerRadius 2
#define kRegistOrRestView_LeftMargin 100

#import "LoginViewController.h"
#import "DashView.h"
#import "MainViewController.h"
#import "RegistOrResetView.h"
#import "UserModel.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIView *blueView;
@property (nonatomic,strong)UIView *whiteView;
@property (nonatomic,strong)UIImageView *doctorImg;
@property (nonatomic,strong)UIImageView *dashView;
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
@property (nonatomic,strong)UIButton *forgotBtn;//忘记密码
@property (nonatomic,strong)UIButton *registBtn;//新医师注册
@property (nonatomic,strong)UILabel *versionLbl;//版本号
@property (nonatomic,strong)NSTimer *verifyCodeTimer;
@property (nonatomic,assign)NSInteger seconds;
@property (nonatomic,copy)NSString *smsCode;
@property (nonatomic,assign)BOOL isPasswordLogin;//是否是密码登录
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationController.navigationBar.hidden = YES;
    self.isPasswordLogin = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearLoginInfo:) name:@"ClearLonginInfoNotification" object:nil];
    [self configUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)configUI {
    UIImage *image = [UIImage imageNamed:@"login_bg"];
    image = [self imageCompressWithSimple:image scaledToSize:CGSizeMake(kWidth, kHeight)];
    self.bgImg = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:self.bgImg];
    
    CGFloat bgImgWidth = self.view.frame.size.width;
    CGFloat bgImgHeight = self.view.frame.size.height;
    self.blueView = [[UIView alloc] initWithFrame:CGRectMake(kBlueView_LeftMargin * kXScal, kBlueView_TopMargin * kYScal, bgImgWidth - 2 * kBlueView_LeftMargin * kXScal, bgImgHeight - 2 * kBlueView_TopMargin * kYScal)];
    self.blueView.backgroundColor = [UIColor colorWithHexString:@"#10aacb"];
    self.blueView.layer.cornerRadius = 2;
    self.blueView.layer.masksToBounds = YES;
    [self.view addSubview:self.blueView];
    
    self.whiteView = [[UIView alloc] initWithFrame:CGRectMake(kWhiteView_LeftMargin * kXScal, kWhiteView_TopMargin * kYScal, bgImgWidth - 2 * kWhiteView_LeftMargin * kXScal, bgImgHeight - kWhiteView_TopMargin * kYScal - (kBlueView_TopMargin * kYScal + (kBlueView_TopMargin * kYScal - kWhiteView_TopMargin * kYScal)))];
    self.whiteView.backgroundColor = [UIColor whiteColor];
    self.whiteView.userInteractionEnabled = YES;
    self.whiteView.layer.cornerRadius = 2;
    self.whiteView.layer.masksToBounds = YES;
    [self.view addSubview:self.whiteView];
    self.dashView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dash"]];
    [self.whiteView addSubview:self.dashView];
    self.dashView.userInteractionEnabled = YES;
    [self.dashView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.whiteView.mas_left).offset(kDash_LeftMargin * kXScal);
        make.right.equalTo(self.whiteView.mas_right).offset(-kDash_RightMargin * kYScal);
        make.top.equalTo(self.whiteView.mas_top).offset(kDash_TopMargin * kYScal);
        make.bottom.equalTo(self.whiteView.mas_bottom).offset(-kDash_BottomMargin * kYScal);
    }];

    UIImage *doctorImage = [UIImage imageNamed:@"doctor"];
    self.doctorImg = [[UIImageView alloc] initWithImage:doctorImage];
    [self.whiteView addSubview:self.doctorImg];
    [self.doctorImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.dashView.mas_left).offset(-kDoctor_RightMargin * kXScal);
        make.bottom.equalTo(self.dashView.mas_bottom).offset(-kDoctor_BottomMargin * kYScal);
        make.width.equalTo(@(kDoctor_Width * kXScal));
        make.height.equalTo(@(kDoctor_Height * kYScal));
    }];
    
    //密码登录按钮
    self.passwordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.passwordBtn.userInteractionEnabled = YES;
    self.passwordBtn.backgroundColor = [UIColor clearColor];
    [self.passwordBtn setTitleColor:[UIColor colorWithHexString:@"#12aac8"] forState:UIControlStateNormal];
    [self.passwordBtn.titleLabel setFont:[UIFont systemFontOfSize:18.0]];
    [self.passwordBtn setTitle:@"密码登录" forState:UIControlStateNormal];
    [self.passwordBtn addTarget:self action:@selector(passwordBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.dashView addSubview:self.passwordBtn];
    [self.passwordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dashView.mas_top).offset(kPassword_Btn_TopMargin * kYScal);
        make.left.equalTo(self.dashView.mas_left).offset(kPassword_Btn_LeftMargin * kXScal);
        make.width.equalTo(@(kPassword_Btn_Width * kXScal));
        make.height.equalTo(@(kPassword_Btn_Height * kYScal));
    }];
    
    //分割视图
    self.seperateView = [[UIView alloc] init];
    self.seperateView.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
    [self.dashView addSubview:self.seperateView];
    [self.seperateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.passwordBtn.mas_centerY);
        make.width.equalTo(@(kSeperateView_Width * kXScal));
        make.height.equalTo(@(kSeperateView_Height * kYScal));
        make.left.equalTo(self.passwordBtn.mas_right).offset(kSeperateView_LeftMargin * kXScal);
    }];
    
    //短信随机码登录按钮
    self.codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.codeBtn setTitle:@"短信随机码登录" forState:UIControlStateNormal];
    [self.codeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.codeBtn.titleLabel setFont:[UIFont systemFontOfSize:18.0]];
    [self.codeBtn addTarget:self action:@selector(codeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.dashView addSubview:self.codeBtn];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.passwordBtn.mas_centerY);
        make.width.equalTo(@(kCode_Btn_Width * kXScal));
        make.height.equalTo(@(kPassword_Btn_Height * kYScal));
        make.left.equalTo(self.seperateView.mas_right).offset(kSeperateView_LeftMargin * kXScal);
    }];
    
    //分割线
    self.seperateLine = [[UIView alloc] init];
    self.seperateLine.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
    [self.dashView addSubview:self.seperateLine];
    [self.seperateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordBtn.mas_bottom).offset(kSeperate_Line_TopMargin * kYScal);
        make.left.equalTo(self.passwordBtn.mas_left);
        make.right.equalTo(self.dashView.mas_right).offset(-kSeperate_Line_RightMargin * kXScal);
        make.height.equalTo(@(kSeperate_Line_Height));
    }];
    
    self.middleLine = [[UIView alloc] init];
    self.middleLine.backgroundColor = [UIColor whiteColor];
    [self.dashView addSubview:self.middleLine];
    [self.middleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.dashView.mas_centerY);
        make.left.equalTo(self.dashView.mas_left).offset(0);
        make.right.equalTo(self.dashView.mas_right).offset(0);
        make.height.equalTo(@(kMiddle_Line_Height));
    }];
    
    //手机号码输入框
    self.phoneLbl = [[UILabel alloc] init];
    self.phoneLbl.text = @"手机号码";
    self.phoneLbl.textColor = [UIColor blackColor];
    self.phoneLbl.textAlignment = NSTextAlignmentCenter;
    self.phoneLbl.font = [UIFont systemFontOfSize:kPhoneLbl_Font_Size * kYScal];
    
    [self.dashView addSubview:self.phoneLbl];
    [self.phoneLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.middleLine.mas_top).offset(-kPhone_Lbl_BottomMargin * kYScal);
        make.left.equalTo(self.passwordBtn.mas_left);
        make.width.equalTo(@(kPhone_Lbl_Width * kXScal));
        make.height.equalTo(@(kPhone_Lbl_Heigh * kYScal));
    }];
    
    self.phoneTF = [[UITextField alloc] init];
    self.phoneTF.backgroundColor = [UIColor colorWithHexString:@"#cceef3"];
    self.phoneTF.placeholder = @"请输入手机号";
    self.phoneTF.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneTF.delegate = self;
    [self.dashView addSubview:self.phoneTF];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(kPhone_Lbl_Heigh * kYScal));
        make.left.equalTo(self.phoneLbl.mas_right).offset(kPhone_Textfield_LeftMargin * kXScal);
        make.right.equalTo(self.dashView.mas_right).offset(-kPhone_Textfield_RightMargin * kXScal);
        make.centerY.equalTo(self.phoneLbl.mas_centerY);
    }];
    
    //密码输入框
    self.passwordLbl = [[UILabel alloc] init];
    self.passwordLbl.text = @"密       码";
    self.passwordLbl.textColor = [UIColor blackColor];
    self.passwordLbl.textAlignment = NSTextAlignmentCenter;
    self.passwordLbl.font = [UIFont systemFontOfSize:kPhoneLbl_Font_Size * kYScal];
    
    [self.dashView addSubview:self.passwordLbl];
    [self.passwordLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTF.mas_bottom).offset(kPassword_Lbl_TopMargin * kYScal);
        make.left.equalTo(self.passwordBtn.mas_left);
        make.width.equalTo(@(kPhone_Lbl_Width * kXScal));
        make.height.equalTo(@(kPhone_Lbl_Heigh * kYScal));
    }];
    
    self.passwordTF = [[UITextField alloc] init];
    self.passwordTF.backgroundColor = [UIColor colorWithHexString:@"#cceef3"];
    self.passwordTF.secureTextEntry = YES;
    self.passwordTF.placeholder = @"请输入密码";
    [self.dashView addSubview:self.passwordTF];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(kPhone_Lbl_Heigh * kYScal));
        make.left.equalTo(self.passwordLbl.mas_right).offset(kPhone_Textfield_LeftMargin * kXScal);
        make.right.equalTo(self.dashView.mas_right).offset(-kPhone_Textfield_RightMargin * kXScal);
        make.centerY.equalTo(self.passwordLbl.mas_centerY);
    }];
    
    //验证码
    self.verifyCodeLbl = [[UILabel alloc] init];
    self.verifyCodeLbl.text = @"验  证  码 ";
    self.verifyCodeLbl.textColor = [UIColor blackColor];
    self.verifyCodeLbl.textAlignment = NSTextAlignmentCenter;
    self.verifyCodeLbl.font = [UIFont systemFontOfSize:kPhoneLbl_Font_Size * kYScal];
    [self.dashView addSubview:self.verifyCodeLbl];
    self.verifyCodeLbl.hidden = YES;
    [self.verifyCodeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordLbl.mas_top);
        make.left.equalTo(self.passwordLbl.mas_left);
        make.width.equalTo(@(kPhone_Lbl_Width * kXScal));
        make.height.equalTo(@(kPhone_Lbl_Heigh * kYScal));
    }];
    
    self.verifyCodeTF = [[UITextField alloc] init];
    self.verifyCodeTF.backgroundColor = [UIColor colorWithHexString:@"#cceef3"];
    self.verifyCodeTF.placeholder = @"请输入验证码";
    self.verifyCodeTF.hidden = YES;
    self.verifyCodeTF.delegate = self;
    self.verifyCodeTF.keyboardType = UIKeyboardTypeNumberPad;
    self.verifyCodeTF.font = [UIFont systemFontOfSize:kVerify_Btn_FontSize];
    [self.dashView addSubview:self.verifyCodeTF];
    
    self.verifyCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.verifyCodeBtn.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
    [self.verifyCodeBtn.titleLabel setFont:[UIFont systemFontOfSize:kVerify_Btn_FontSize]];
    [self.verifyCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.verifyCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.verifyCodeBtn addTarget:self action:@selector(sendVerifyCode:) forControlEvents:UIControlEventTouchUpInside];
    self.verifyCodeBtn.layer.cornerRadius = kButton_CornerRadius;
    self.verifyCodeBtn.layer.masksToBounds = YES;
    self.verifyCodeBtn.hidden = YES;
    [self.dashView addSubview:self.verifyCodeBtn];
    
    [self.verifyCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.verifyCodeLbl.mas_centerY);
        make.right.equalTo(self.phoneTF.mas_right);
        make.height.equalTo(@(kPhone_Lbl_Heigh * kYScal));
        make.width.equalTo(@(kVerify_Btn_Width));
    }];
    
    [self.verifyCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(kPhone_Lbl_Heigh * kYScal));
        make.left.equalTo(self.passwordLbl.mas_right).offset(kPhone_Textfield_LeftMargin * kXScal);
        make.right.equalTo(self.verifyCodeBtn.mas_left).offset(-kVerify_Btn_LeftMargin * kXScal);
        make.centerY.equalTo(self.verifyCodeLbl.mas_centerY);
    }];
    
    //登录按钮
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    self.loginBtn.layer.cornerRadius = kLogin_Btn_Height * kYScal / 2;
    self.loginBtn.layer.masksToBounds = YES;
    [self.whiteView addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.dashView.mas_centerX);
        make.bottom.equalTo(self.whiteView.mas_bottom).offset(-kLogin_Btn_BottomMargin * kYScal);
        make.width.equalTo(@(kLogin_Btn_Width * kXScal));
        make.height.equalTo(@(kLogin_Btn_Height * kYScal));
    }];
    
    //忘记密码按钮
    self.forgotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.forgotBtn setTitleColor:[UIColor colorWithHexString:@"#12aac8"] forState:UIControlStateNormal];
    [self.forgotBtn setTitle:@"忘 记 密 码" forState:UIControlStateNormal];
    self.forgotBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.forgotBtn addTarget:self action:@selector(forgot:) forControlEvents:UIControlEventTouchUpInside];
    self.forgotBtn.layer.cornerRadius = kButton_CornerRadius;
    self.forgotBtn.layer.masksToBounds = YES;
    [self.whiteView addSubview:self.forgotBtn];

    self.registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.registBtn setTitleColor:[UIColor colorWithHexString:@"#12aac8"] forState:UIControlStateNormal];
    [self.registBtn setTitle:@"新医师注册" forState:UIControlStateNormal];
    self.registBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.registBtn addTarget:self action:@selector(regist:) forControlEvents:UIControlEventTouchUpInside];
    self.registBtn.layer.cornerRadius = kButton_CornerRadius;
    self.registBtn.layer.masksToBounds = YES;
    [self.whiteView addSubview:self.registBtn];
    
    //注册按钮
    [self.registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.dashView.mas_bottom).offset(-kRegist_Btn_Bottom * kYScal);
        make.left.equalTo(self.dashView.mas_right).offset(kRegist_Btn_LeftMargin * kXScal);
        make.right.equalTo(self.whiteView.mas_right).offset(-kRegist_Btn_LeftMargin * kXScal);
        make.height.equalTo(@(kRegist_Btn_Height * kYScal));
    }];
    
    [self.forgotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.registBtn.mas_top).offset(-kForgot_Btn_BottomMargin * kYScal);
        make.left.equalTo(self.registBtn.mas_left);
        make.right.equalTo(self.registBtn.mas_right);
        make.height.equalTo(@(kRegist_Btn_Height * kYScal));
    }];
    
    //版本按钮
    self.versionLbl = [[UILabel alloc] init];
    self.versionLbl.textColor = [UIColor whiteColor];
    self.versionLbl.font = [UIFont systemFontOfSize:kVersion_Lbl_FontSize];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    self.versionLbl.text = [NSString stringWithFormat:@"V%@",app_Version];
    [self.bgImg addSubview:self.versionLbl];
    [self.versionLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.blueView.mas_bottom).offset(kVersion_Lbl_TopMargin * kYScal);
        make.left.equalTo(self.blueView.mas_right).offset(kVersion_Lbl_LeftMargin * kXScal);
        make.right.equalTo(self.bgImg.mas_right).offset(-kVersion_Lbl_LeftMargin * kXScal);
        make.height.equalTo(@(kVersion_Lbl_Height * kYScal));
    }];
    [self.bgImg addSubview:self.versionLbl];
}

#pragma mark - Button click events

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

- (void)forgot:(UIButton*)sender {
    NSLog(@"忘记密码");
    RegistOrResetView *registView = [[RegistOrResetView alloc] initWithFrame:CGRectMake(0, 0, self.whiteView.frame.size.width - 2 * kRegistOrRestView_LeftMargin, self.whiteView.frame.size.height) title:@"设置新密码" endTitle:@"确定" type:ResetPopView];
    [registView show];
}

- (void)regist:(UIButton*)sender {
    NSLog(@"注册新医师");
    RegistOrResetView *registView = [[RegistOrResetView alloc] initWithFrame:CGRectMake(0, 0, self.whiteView.frame.size.width - 2 * kRegistOrRestView_LeftMargin, self.whiteView.frame.size.height) title:@"医师注册" endTitle:@"下一步" type:RegistPopView];
    [registView show];
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

- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - net functions
//密码登录
- (void)loginWithPassword:(NSMutableDictionary*)parameter {
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_LOGIN_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        if (code != 0) {
            NSString *msg = [responseObject valueForKey:@"msg"];
            [STTextHudTool showText:msg];
        } else {
            [STTextHudTool showText:@"登录成功"];
            NSDictionary *dict = [responseObject valueForKey:@"data"];
            UserModel *user = [[UserModel alloc] init];
            user.birthdate = [dict valueForKey:@"birthdate"];
            user.email = [dict valueForKey:@"email"];
            user.headUrl = [dict valueForKey:@"headUrl"];
            user.mobile = [dict valueForKey:@"mobile"];
            user.name = [dict valueForKey:@"name"];
            user.organ = [dict valueForKey:@"organ"];
            user.sex = [dict valueForKey:@"sex"];
            user.speciality = [dict valueForKey:@"speciality"];
            user.token = [dict valueForKey:@"token"];
            user.userId = [dict valueForKey:@"userId"];
            user.bg_tableName = @"tb_user";
            [user bg_saveOrUpdate];
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setValue:user.userId forKey:@"currentUserId"];
            NSLog(@"user :%@",user);
            MainViewController *main = [[MainViewController alloc] init];
            [self.navigationController pushViewController:main animated:YES];
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
            MainViewController *main = [[MainViewController alloc] init];
            [self.navigationController pushViewController:main animated:YES];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
        [STTextHudTool showText:@"error"];
    }];
}

#pragma mark - UITextField

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [self validateNumber:string];
}

- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

#pragma mark - ClearLonginInfoNotification

- (void)clearLoginInfo:(NSNotification*)noti {
    self.phoneTF.text = @"";
    self.passwordTF.text = @"";
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
