//
//  LoginViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/3/12.
//  Copyright © 2019 dz. All rights reserved.
//

#import "LoginViewController.h"
#import "DashView.h"
#define kBlueView_LeftMargin 157
#define kBlueView_TopMargin 125
#define kWhiteView_LeftMargin 172
#define kWhiteView_TopMargin 112
#define kDash_LeftMargin 218
#define kDash_RightMargin 163
#define kDash_TopMargin 48
#define kDash_BottomMargin 25
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
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationController.navigationBar.hidden = YES;
    [self configUI];
}

- (void)configUI {
    UIImage *image = [UIImage imageNamed:@"login_bg"];
    image = [self imageCompressWithSimple:image scaledToSize:CGSizeMake(kWidth, kHeight)];
    self.bgImg = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:self.bgImg];
    
    CGFloat bgImgWidth = self.view.frame.size.width;
    CGFloat bgImgHeight = self.view.frame.size.height;
    self.blueView = [[UIView alloc] initWithFrame:CGRectMake(kBlueView_LeftMargin, kBlueView_TopMargin, bgImgWidth - 2 * kBlueView_LeftMargin, bgImgHeight - 2 * kBlueView_TopMargin)];
    self.blueView.backgroundColor = [UIColor colorWithHexString:@"#10aacb"];
    [self.view addSubview:self.blueView];
    
    self.whiteView = [[UIView alloc] initWithFrame:CGRectMake(kWhiteView_LeftMargin, kWhiteView_TopMargin, bgImgWidth - 2 * kWhiteView_LeftMargin, bgImgHeight - kWhiteView_TopMargin - (kBlueView_TopMargin + (kBlueView_TopMargin - kWhiteView_TopMargin)))];
    self.whiteView.backgroundColor = [UIColor whiteColor];
    self.whiteView.userInteractionEnabled = YES;
    [self.view addSubview:self.whiteView];
    self.dashView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dash"]];
    [self.whiteView addSubview:self.dashView];
    self.dashView.userInteractionEnabled = YES;
    [self.dashView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.whiteView.mas_left).offset(kDash_LeftMargin);
        make.right.equalTo(self.whiteView.mas_right).offset(-kDash_RightMargin);
        make.top.equalTo(self.whiteView.mas_top).offset(48);
        make.bottom.equalTo(self.whiteView.mas_bottom).offset(-25);
    }];
    
    UIImage *doctorImage = [UIImage imageNamed:@"doctor"];
    self.doctorImg = [[UIImageView alloc] initWithImage:doctorImage];
    [self.whiteView addSubview:self.doctorImg];
    [self.doctorImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.whiteView.mas_left).offset(60);
        make.right.equalTo(self.dashView.mas_left).offset(-18);
        make.top.equalTo(self.dashView.mas_top).offset(20);
        make.bottom.equalTo(self.dashView.mas_bottom).offset(-60);
    }];
    
    self.passwordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.passwordBtn.userInteractionEnabled = YES;
    self.passwordBtn.backgroundColor = [UIColor clearColor];
    [self.passwordBtn setTitleColor:[UIColor colorWithHexString:@"#12aac8"] forState:UIControlStateNormal];
    [self.passwordBtn.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
    [self.passwordBtn setTitle:@"密码登录" forState:UIControlStateNormal];
    [self.passwordBtn addTarget:self action:@selector(passwordBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.dashView addSubview:self.passwordBtn];
    [self.passwordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dashView.mas_top).offset(28);
        make.left.equalTo(self.dashView.mas_left).offset(19);
        make.width.equalTo(@80);
        make.height.equalTo(@15);
    }];
    
    
    
    self.seperateView = [[UIView alloc] init];
    self.seperateView.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
    [self.dashView addSubview:self.seperateView];
    [self.seperateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.passwordBtn.mas_centerY);
        make.width.equalTo(@10);
        make.height.equalTo(@30);
        make.left.equalTo(self.passwordBtn.mas_right).offset(13);
    }];
    
    self.codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.codeBtn setTitle:@"短信随机码登录" forState:UIControlStateNormal];
    [self.codeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.codeBtn addTarget:self action:@selector(codeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.dashView addSubview:self.codeBtn];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.passwordBtn.mas_centerY);
        make.width.equalTo(@150);
        make.height.equalTo(@15);
        make.left.equalTo(self.seperateView.mas_right).offset(13);
    }];
    
    self.seperateLine = [[UIView alloc] init];
    self.seperateLine.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
    [self.dashView addSubview:self.seperateLine];
    [self.seperateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordBtn.mas_bottom).offset(15);
        make.left.equalTo(self.passwordBtn.mas_left);
        make.right.equalTo(self.dashView.mas_right).offset(-13);
        make.height.equalTo(@2);
    }];
    
    self.middleLine = [[UIView alloc] init];
    self.middleLine.backgroundColor = [UIColor whiteColor];
    [self.dashView addSubview:self.middleLine];
    [self.middleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.dashView.mas_centerY);
        make.left.equalTo(self.dashView.mas_left).offset(0);
        make.right.equalTo(self.dashView.mas_right).offset(0);
        make.height.equalTo(@1);
    }];
    
    self.phoneLbl = [[UILabel alloc] init];
    self.phoneLbl.text = @"手机号码";
    self.phoneLbl.textColor = [UIColor blackColor];
    self.phoneLbl.textAlignment = NSTextAlignmentCenter;
    self.phoneLbl.font = [UIFont systemFontOfSize:13.0];
    
    [self.dashView addSubview:self.phoneLbl];
    [self.phoneLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.middleLine.mas_top).offset(11);
        make.left.equalTo(self.passwordBtn.mas_left);
        make.width.equalTo(@120);
        make.height.equalTo(@26);
    }];
    
    self.phoneTF = [[UITextField alloc] init];
    self.phoneTF.backgroundColor = [UIColor colorWithHexString:@"#cceef3"];
    [self.dashView addSubview:self.phoneTF];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@26);
        make.left.equalTo(self.phoneLbl.mas_right).offset(10);
        make.right.equalTo(self.dashView.mas_right).offset(-15);
        make.centerY.equalTo(self.phoneLbl.mas_centerY);
    }];
    
    self.passwordLbl = [[UILabel alloc] init];
    self.passwordLbl.text = @"密  码";
    self.passwordLbl.textColor = [UIColor blackColor];
    self.passwordLbl.textAlignment = NSTextAlignmentCenter;
    self.passwordLbl.font = [UIFont systemFontOfSize:13.0];
    
    [self.dashView addSubview:self.passwordLbl];
    [self.passwordLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTF.mas_bottom).offset(11);
        make.left.equalTo(self.passwordBtn.mas_left);
        make.width.equalTo(@120);
        make.height.equalTo(@26);
    }];
    
    self.passwordTF = [[UITextField alloc] init];
    self.passwordTF.backgroundColor = [UIColor colorWithHexString:@"#cceef3"];
    self.passwordTF.secureTextEntry = YES;
    [self.dashView addSubview:self.passwordTF];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@26);
        make.left.equalTo(self.passwordLbl.mas_right).offset(10);
        make.right.equalTo(self.dashView.mas_right).offset(-15);
        make.centerY.equalTo(self.passwordLbl.mas_centerY);
    }];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.whiteView addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.dashView.mas_centerX);
        make.bottom.equalTo(self.whiteView.mas_bottom).offset(-80);
        make.width.equalTo(@200);
        make.height.equalTo(@44);
    }];
    
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
    
    [self.registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.dashView.mas_bottom).offset(-20);
        make.left.equalTo(self.dashView.mas_right).offset(20);
        make.right.equalTo(self.whiteView.mas_right).offset(-20);
        make.height.equalTo(@26);
    }];
    
    [self.forgotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.registBtn.mas_top).offset(-30);
        make.left.equalTo(self.registBtn.mas_left);
        make.right.equalTo(self.registBtn.mas_right);
        make.height.equalTo(@26);
    }];
    
    self.versionLbl = [[UILabel alloc] init];
    self.versionLbl.textColor = [UIColor whiteColor];
    self.versionLbl.font = [UIFont systemFontOfSize:30.0];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    self.versionLbl.text = [NSString stringWithFormat:@"V%@",app_Version];
    [self.bgImg addSubview:self.versionLbl];
    [self.versionLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.blueView.mas_bottom).offset(10);
        make.left.equalTo(self.blueView.mas_right).offset(20);
        make.right.equalTo(self.bgImg.mas_right).offset(-20);
        make.height.equalTo(@30);
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
