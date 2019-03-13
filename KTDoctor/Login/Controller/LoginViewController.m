//
//  LoginViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/3/12.
//  Copyright © 2019 dz. All rights reserved.
//

#import "LoginViewController.h"
#import "DashView.h"
#import <sys/utsname.h>
#define kBlueView_LeftMargin 157
#define kBlueView_TopMargin 125
#define kWhiteView_LeftMargin 172
#define kWhiteView_TopMargin 112
#define kDash_LeftMargin 218
#define kDash_RightMargin 163
#define kDash_TopMargin 48
#define kDash_BottomMargin 25
#define kDoctor_LeftMargin 60
#define kDoctor_RightMargin 18
#define kDoctor_TopMargin 20
#define kDoctor_BottomMargin 60
#define kPassword_Btn_TopMargin 28
#define kPassword_Btn_LeftMargin 19
#define kPassword_Btn_Width 80
#define kPassword_Btn_Height 15
#define kSeperateView_Width 5
#define kSeperateView_Height 30
#define kSeperateView_LeftMargin 13
#define kCode_Btn_Width 150
#define kSeperate_Line_TopMargin 15
#define kSeperate_Line_RightMargin 13
#define kSeperate_Line_Height 2
#define kMiddle_Line_Height 1
#define kPhoneLbl_Font_Size 13.0
#define kPhone_Lbl_BottomMargin 30
#define kPhone_Lbl_Width 80
#define kPhone_Lbl_Heigh 26
#define kPhone_Textfield_LeftMargin 10
#define kPhone_Textfield_RightMargin 15
#define kPassword_Lbl_TopMargin 30
#define kLogin_Btn_BottomMargin 80
#define kLogin_Btn_Width 200
#define kLogin_Btn_Height 44
#define kRegist_Btn_Bottom 20
#define kRegist_Btn_LeftMargin 20
#define kRegist_Btn_Height 26
#define kForgot_Btn_BottomMargin 30
#define kVersion_Lbl_FontSize 30.0
#define kVersion_Lbl_TopMargin 10
#define kVersion_Lbl_LeftMargin 20
#define kVersion_Lbl_Height 30

@interface LoginViewController ()
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
@property (nonatomic,strong)UIView *middleLine;
@property (nonatomic,strong)UILabel *passwordLbl;//密码
@property (nonatomic,strong)UITextField *passwordTF;
@property (nonatomic,strong)UIButton *loginBtn;
@property (nonatomic,strong)UIButton *forgotBtn;
@property (nonatomic,strong)UIButton *registBtn;
@property (nonatomic,strong)UILabel *versionLbl;
@property (nonatomic,assign)CGFloat xscale;
@property (nonatomic,assign)CGFloat yscale;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationController.navigationBar.hidden = YES;
    self.xscale = kWidth / kIpadMiniSize.width;
    self.yscale = kHeight / kIpadMiniSize.height;
    [self configUI];
    NSString *deviceStr = [self deviceVersion];
    NSLog(@"设备型号:%@ 宽:%lf  高:%lf",deviceStr,kWidth,kHeight);
}

- (NSString*)deviceVersion
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    
    //iPod
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    //iPad
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    if ([deviceString isEqualToString:@"iPad4,4"]
        ||[deviceString isEqualToString:@"iPad4,5"]
        ||[deviceString isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
    
    if ([deviceString isEqualToString:@"iPad4,7"]
        ||[deviceString isEqualToString:@"iPad4,8"]
        ||[deviceString isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
    
    return deviceString;
}

- (void)configUI {
    UIImage *image = [UIImage imageNamed:@"login_bg"];
    image = [self imageCompressWithSimple:image scaledToSize:CGSizeMake(kWidth, kHeight)];
    self.bgImg = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:self.bgImg];
    
    CGFloat bgImgWidth = self.view.frame.size.width;
    CGFloat bgImgHeight = self.view.frame.size.height;
    self.blueView = [[UIView alloc] initWithFrame:CGRectMake(kBlueView_LeftMargin * self.xscale, kBlueView_TopMargin * self.yscale, bgImgWidth - 2 * kBlueView_LeftMargin * self.xscale, bgImgHeight - 2 * kBlueView_TopMargin * self.yscale)];
    self.blueView.backgroundColor = [UIColor colorWithHexString:@"#10aacb"];
    [self.view addSubview:self.blueView];
    
    self.whiteView = [[UIView alloc] initWithFrame:CGRectMake(kWhiteView_LeftMargin * self.xscale, kWhiteView_TopMargin * self.yscale, bgImgWidth - 2 * kWhiteView_LeftMargin * self.xscale, bgImgHeight - kWhiteView_TopMargin * self.yscale - (kBlueView_TopMargin * self.yscale + (kBlueView_TopMargin * self.yscale - kWhiteView_TopMargin * self.yscale)))];
    self.whiteView.backgroundColor = [UIColor whiteColor];
    self.whiteView.userInteractionEnabled = YES;
    [self.view addSubview:self.whiteView];
    self.dashView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dash"]];
    [self.whiteView addSubview:self.dashView];
    self.dashView.userInteractionEnabled = YES;
    [self.dashView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.whiteView.mas_left).offset(kDash_LeftMargin * self.xscale);
        make.right.equalTo(self.whiteView.mas_right).offset(-kDash_RightMargin * self.yscale);
        make.top.equalTo(self.whiteView.mas_top).offset(kDash_TopMargin * self.yscale);
        make.bottom.equalTo(self.whiteView.mas_bottom).offset(-kDash_BottomMargin * self.yscale);
    }];
    
    UIImage *doctorImage = [UIImage imageNamed:@"doctor"];
    self.doctorImg = [[UIImageView alloc] initWithImage:doctorImage];
    [self.whiteView addSubview:self.doctorImg];
    [self.doctorImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.whiteView.mas_left).offset(kDoctor_LeftMargin * self.xscale);
        make.right.equalTo(self.dashView.mas_left).offset(-kDoctor_RightMargin * self.xscale);
        make.top.equalTo(self.dashView.mas_top).offset(kDoctor_TopMargin * self.yscale);
        make.bottom.equalTo(self.dashView.mas_bottom).offset(-kDoctor_BottomMargin * self.yscale);
    }];
    
    //密码登录按钮
    self.passwordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.passwordBtn.userInteractionEnabled = YES;
    self.passwordBtn.backgroundColor = [UIColor clearColor];
    [self.passwordBtn setTitleColor:[UIColor colorWithHexString:@"#12aac8"] forState:UIControlStateNormal];
    [self.passwordBtn.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
    [self.passwordBtn setTitle:@"密码登录" forState:UIControlStateNormal];
    [self.passwordBtn addTarget:self action:@selector(passwordBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.dashView addSubview:self.passwordBtn];
    [self.passwordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dashView.mas_top).offset(kPassword_Btn_TopMargin * self.yscale);
        make.left.equalTo(self.dashView.mas_left).offset(kPassword_Btn_LeftMargin * self.xscale);
        make.width.equalTo(@(kPassword_Btn_Width * self.xscale));
        make.height.equalTo(@(kPassword_Btn_Height * self.yscale));
    }];
    
    //分割视图
    self.seperateView = [[UIView alloc] init];
    self.seperateView.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
    [self.dashView addSubview:self.seperateView];
    [self.seperateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.passwordBtn.mas_centerY);
        make.width.equalTo(@(kSeperateView_Width * self.xscale));
        make.height.equalTo(@(kSeperateView_Height * self.yscale));
        make.left.equalTo(self.passwordBtn.mas_right).offset(kSeperateView_LeftMargin * self.xscale);
    }];
    
    //短信随机码登录按钮
    self.codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.codeBtn setTitle:@"短信随机码登录" forState:UIControlStateNormal];
    [self.codeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.codeBtn addTarget:self action:@selector(codeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.dashView addSubview:self.codeBtn];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.passwordBtn.mas_centerY);
        make.width.equalTo(@(kCode_Btn_Width * self.xscale));
        make.height.equalTo(@(kPassword_Btn_Height * self.yscale));
        make.left.equalTo(self.seperateView.mas_right).offset(kSeperateView_LeftMargin * self.xscale);
    }];
    
    //分割线
    self.seperateLine = [[UIView alloc] init];
    self.seperateLine.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
    [self.dashView addSubview:self.seperateLine];
    [self.seperateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordBtn.mas_bottom).offset(kSeperate_Line_TopMargin * self.yscale);
        make.left.equalTo(self.passwordBtn.mas_left);
        make.right.equalTo(self.dashView.mas_right).offset(-kSeperate_Line_RightMargin * self.xscale);
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
    self.phoneLbl.font = [UIFont systemFontOfSize:kPhoneLbl_Font_Size * self.yscale];
    
    [self.dashView addSubview:self.phoneLbl];
    [self.phoneLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.middleLine.mas_top).offset(-kPhone_Lbl_BottomMargin * self.yscale);
        make.left.equalTo(self.passwordBtn.mas_left);
        make.width.equalTo(@(kPhone_Lbl_Width * self.xscale));
        make.height.equalTo(@(kPhone_Lbl_Heigh * self.yscale));
    }];
    
    self.phoneTF = [[UITextField alloc] init];
    self.phoneTF.backgroundColor = [UIColor colorWithHexString:@"#cceef3"];
    [self.dashView addSubview:self.phoneTF];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(kPhone_Lbl_Heigh * self.yscale));
        make.left.equalTo(self.phoneLbl.mas_right).offset(kPhone_Textfield_LeftMargin * self.xscale);
        make.right.equalTo(self.dashView.mas_right).offset(-kPhone_Textfield_RightMargin * self.xscale);
        make.centerY.equalTo(self.phoneLbl.mas_centerY);
    }];
    
    //密码输入框
    self.passwordLbl = [[UILabel alloc] init];
    self.passwordLbl.text = @"密       码";
    self.passwordLbl.textColor = [UIColor blackColor];
    self.passwordLbl.textAlignment = NSTextAlignmentCenter;
    self.passwordLbl.font = [UIFont systemFontOfSize:kPhoneLbl_Font_Size * self.yscale];
    
    [self.dashView addSubview:self.passwordLbl];
    [self.passwordLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTF.mas_bottom).offset(kPassword_Lbl_TopMargin * self.yscale);
        make.left.equalTo(self.passwordBtn.mas_left);
        make.width.equalTo(@(kPhone_Lbl_Width * self.xscale));
        make.height.equalTo(@(kPhone_Lbl_Heigh * self.yscale));
    }];
    
    self.passwordTF = [[UITextField alloc] init];
    self.passwordTF.backgroundColor = [UIColor colorWithHexString:@"#cceef3"];
    self.passwordTF.secureTextEntry = YES;
    [self.dashView addSubview:self.passwordTF];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(kPhone_Lbl_Heigh * self.yscale));
        make.left.equalTo(self.passwordLbl.mas_right).offset(kPhone_Textfield_LeftMargin * self.xscale);
        make.right.equalTo(self.dashView.mas_right).offset(-kPhone_Textfield_RightMargin * self.xscale);
        make.centerY.equalTo(self.passwordLbl.mas_centerY);
    }];
    
    //登录按钮
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.whiteView addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.dashView.mas_centerX);
        make.bottom.equalTo(self.whiteView.mas_bottom).offset(-kLogin_Btn_BottomMargin * self.yscale);
        make.width.equalTo(@(kLogin_Btn_Width * self.xscale));
        make.height.equalTo(@(kLogin_Btn_Height * self.yscale));
    }];
    
    //忘记密码按钮
    self.forgotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.forgotBtn.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
    [self.forgotBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.forgotBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [self.forgotBtn addTarget:self action:@selector(forgot:) forControlEvents:UIControlEventTouchUpInside];
    [self.whiteView addSubview:self.forgotBtn];

    self.registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registBtn.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
    [self.registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.registBtn setTitle:@"新医师注册" forState:UIControlStateNormal];
    [self.registBtn addTarget:self action:@selector(regist:) forControlEvents:UIControlEventTouchUpInside];
    [self.whiteView addSubview:self.registBtn];
    
    //注册按钮
    [self.registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.dashView.mas_bottom).offset(-kRegist_Btn_Bottom * self.yscale);
        make.left.equalTo(self.dashView.mas_right).offset(kRegist_Btn_LeftMargin * self.xscale);
        make.right.equalTo(self.whiteView.mas_right).offset(-kRegist_Btn_LeftMargin * self.xscale);
        make.height.equalTo(@(kRegist_Btn_Height * self.yscale));
    }];
    
    [self.forgotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.registBtn.mas_top).offset(-kForgot_Btn_BottomMargin * self.yscale);
        make.left.equalTo(self.registBtn.mas_left);
        make.right.equalTo(self.registBtn.mas_right);
        make.height.equalTo(@(kRegist_Btn_Height * self.yscale));
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
        make.top.equalTo(self.blueView.mas_bottom).offset(kVersion_Lbl_TopMargin * self.yscale);
        make.left.equalTo(self.blueView.mas_right).offset(kVersion_Lbl_LeftMargin * self.xscale);
        make.right.equalTo(self.bgImg.mas_right).offset(-kVersion_Lbl_LeftMargin * self.xscale);
        make.height.equalTo(@(kVersion_Lbl_Height * self.yscale));
    }];
    [self.bgImg addSubview:self.versionLbl];
}

#pragma mark - Button click events

- (void)passwordBtnClick:(UIButton*)sender {
    [self.passwordBtn setTitleColor:[UIColor colorWithHexString:@"12aac8"] forState:UIControlStateNormal];
    [self.codeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void)codeBtnClick:(UIButton*)sender {
    [self.passwordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.codeBtn setTitleColor:[UIColor colorWithHexString:@"12aac8"] forState:UIControlStateNormal];
}

- (void)login:(UIButton*)sender {
    NSString *username = self.phoneTF.text;
    NSString *password = self.passwordTF.text;
    if (username.length > 0 && password.length > 0) {
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        [parameter setValue:username forKey:@"username"];
        [parameter setValue:password forKey:@"password"];
        [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_LOGIN_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
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
}

- (void)forgot:(UIButton*)sender {
    NSLog(@"忘记密码");
}

- (void)regist:(UIButton*)sender {
    NSLog(@"注册新医师");
}

- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
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
