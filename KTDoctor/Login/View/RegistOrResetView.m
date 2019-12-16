//
//  RegistOrResetView.m
//  KTDoctor
//
//  Created by garychen on 2019/3/14.
//  Copyright © 2019年 dz. All rights reserved.
//

#define kAlertView_LeftMargin 200
#define kAlertView_TopView_Height 80
#define kAlertViewTopMargin 150
#define kAlertView_ExitBtn_Width 50
#define kAlertView_ExitBtn_RightMargin 20
#define kAlertView_TitleLbl_FontSize 40.0
#define kDoctor_RegistView_LeftMargin 100
#define kBlueView_LeftMargin 157
#define kBlueView_TopMargin 125
#define kWhiteView_LeftMargin 172
#define kWhiteView_TopMargin 112

#import "RegistOrResetView.h"
#import "DoctorRegistView.h"
@interface RegistOrResetView()<UITextFieldDelegate>
@property (nonatomic,assign)CGRect contentFrame;
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *endTitle;
@property (nonatomic,assign)CustomAlertPopViewType type;
@property (nonatomic,strong)NSTimer *verifyCodeTimer;
@property (nonatomic,assign)NSInteger seconds;
@property (nonatomic,copy)NSString *smsCode;
@property (nonatomic,strong)UITextField *phoneTF;
@property (nonatomic,strong)UITextField *codeTF;
@property (nonatomic,strong)UITextField *passwordTF;
@property (nonatomic,strong)UITextField *conformPwdTF;
@property (nonatomic,strong)UIButton *requestCodeBtn;
@end

@implementation RegistOrResetView

- (instancetype)initWithFrame:(CGRect) frame title:(NSString*)title endTitle:(NSString*)endTitle type:(CustomAlertPopViewType)type; {
    if (self = [super init]) {
        self.contentFrame = frame;
        self.title = title;
        self.endTitle = endTitle;
        self.type = type;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideRegist:) name:@"HideRegistViewNotification" object:nil];
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.85];
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 1;
    }];
    
    //弹窗主体内容
    self.contentView = [[UIView alloc] init];
    self.contentView.frame = CGRectMake(0, 0, kWidth - 2 * kAlertView_LeftMargin, kHeight - 2 * kAlertViewTopMargin);
    self.contentView.frame = self.contentFrame;
    self.contentView.layer.cornerRadius = 2;
    self.contentView.layer.masksToBounds = YES;
    CGPoint center = self.center;
    CGFloat x = center.x;
    CGFloat y = center.y;
    self.contentView.center = CGPointMake(x, y - 50);
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 6;
    [self addSubview:self.contentView];
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, kAlertView_TopView_Height)];
    topView.backgroundColor = [UIColor colorWithHexString:@"#d0dce3"];
    [self.contentView addSubview:topView];
    
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, topView.frame.size.width, kAlertView_TitleLbl_FontSize)];
    titleLbl.center = topView.center;
    titleLbl.text = self.title;
    titleLbl.font = [UIFont systemFontOfSize:kAlertView_TitleLbl_FontSize];
    titleLbl.textColor = [UIColor blackColor];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:titleLbl];
    
    UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [exitBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    exitBtn.layer.cornerRadius = kAlertView_ExitBtn_Width / 2.0;
    exitBtn.layer.masksToBounds = YES;
    CGFloat exitBtnTop = (topView.frame.size.height - kAlertView_ExitBtn_Width)/2;
    exitBtn.frame = CGRectMake(topView.frame.size.width - kAlertView_ExitBtn_RightMargin - kAlertView_ExitBtn_Width, exitBtnTop, kAlertView_ExitBtn_Width, kAlertView_ExitBtn_Width);
    
    [exitBtn addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:exitBtn];
    
    UILabel *phoneLbl = [[UILabel alloc] initWithFrame:CGRectMake(50 * kXScal, CGRectGetMaxY(topView.frame) + 30 * kYScal, 100 * kXScal, 50 * kYScal)];
    phoneLbl.font = [UIFont systemFontOfSize:18.0 * kYScal];
    phoneLbl.textColor = [UIColor blackColor];
    phoneLbl.textAlignment = NSTextAlignmentCenter;
    phoneLbl.text = @"手机号码";
    [self.contentView addSubview:phoneLbl];
    
    self.phoneTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(phoneLbl.frame) + 10 * kXScal, phoneLbl.frame.origin.y, self.contentFrame.size.width - 2 * 50 * kXScal - 100 * kXScal - 20 * kXScal, 50 * kYScal)];
    self.phoneTF.placeholder = @"请输入手机号";
    self.phoneTF.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneTF.delegate = self;
    self.phoneTF.tag = 10;
    self.phoneTF.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    [self.phoneTF becomeFirstResponder];
    [self.contentView addSubview:self.phoneTF];
    
    UILabel *codeLbl = [[UILabel alloc] initWithFrame:CGRectMake(phoneLbl.frame.origin.x, CGRectGetMaxY(phoneLbl.frame) + 20 * kYScal, 100 * kXScal, 50 * kYScal)];
    codeLbl.font = [UIFont systemFontOfSize:18.0 * kYScal];
    codeLbl.textColor = [UIColor blackColor];
    codeLbl.textAlignment = NSTextAlignmentCenter;
    codeLbl.text = @"验  证  码";
    [self.contentView addSubview:codeLbl];
    
    self.codeTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(codeLbl.frame) + 10 * kXScal, codeLbl.frame.origin.y, self.contentFrame.size.width - 2 * 50 * kXScal - 100 * kXScal - 20 * kXScal - 90 * kXScal - 10 * kXScal, 50 * kYScal)];
    self.codeTF.placeholder = @"请输入收到的验证码";
    self.codeTF.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    self.codeTF.delegate = self;
    self.codeTF.keyboardType = UIKeyboardTypeNumberPad;
    self.codeTF.tag = 20;
    [self.contentView addSubview:self.codeTF];
    
    self.requestCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.requestCodeBtn.backgroundColor = [UIColor colorWithHexString:@"#0fa8cb"];
    self.requestCodeBtn.frame = CGRectMake(CGRectGetMaxX(self.codeTF.frame) + 10 * kXScal, codeLbl.frame.origin.y, 90 * kXScal, 50 * kYScal);
    [self.requestCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.requestCodeBtn.titleLabel setFont:[UIFont systemFontOfSize:14.0 * kYScal]];
    self.requestCodeBtn.layer.cornerRadius = 2;
    self.requestCodeBtn.layer.masksToBounds = YES;
    [self.requestCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.requestCodeBtn addTarget:self action:@selector(requestCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.requestCodeBtn];
    
    UILabel *passwordLbl = [[UILabel alloc] initWithFrame:CGRectMake(phoneLbl.frame.origin.x, CGRectGetMaxY(codeLbl.frame) + 20 * kYScal, 100 * kXScal, 50 * kYScal)];
    passwordLbl.font = [UIFont systemFontOfSize:18.0 * kYScal];
    passwordLbl.textColor = [UIColor blackColor];
    passwordLbl.textAlignment = NSTextAlignmentCenter;
    passwordLbl.text = @"设置密码";
    [self.contentView addSubview:passwordLbl];
    
    self.passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(passwordLbl.frame) + 10 * kXScal, passwordLbl.frame.origin.y, self.contentFrame.size.width - (2 * 50 + 100 + 20) * kXScal, 50 * kYScal)];
    self.passwordTF.secureTextEntry = YES;
    self.passwordTF.delegate = self;
    self.passwordTF.tag = 30;
    self.passwordTF.placeholder = @"包含字母数字（6-12位）的密码";
    self.passwordTF.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    [self.contentView addSubview:self.passwordTF];
    
    UILabel *conformPwdLbl = [[UILabel alloc] initWithFrame:CGRectMake(phoneLbl.frame.origin.x, CGRectGetMaxY(passwordLbl.frame) + 20 * kYScal, 100 * kXScal, 50 * kYScal)];
    conformPwdLbl.font = [UIFont systemFontOfSize:18.0 * kYScal];
    conformPwdLbl.textColor = [UIColor blackColor];
    conformPwdLbl.textAlignment = NSTextAlignmentCenter;
    conformPwdLbl.text = @"确认密码";
    [self.contentView addSubview:conformPwdLbl];
    
    self.conformPwdTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(conformPwdLbl.frame) + 10 * kXScal, conformPwdLbl.frame.origin.y, (self.contentFrame.size.width - (2 * 50 + 100 + 20) * kXScal), 50 * kYScal)];
    self.conformPwdTF.placeholder = @"请再确认密码";
    self.conformPwdTF.secureTextEntry = YES;
    self.conformPwdTF.delegate = self;
    self.conformPwdTF.tag = 40;
    self.conformPwdTF.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    [self.contentView addSubview:self.conformPwdTF];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.layer.cornerRadius = 25 * kYScal;
    nextBtn.layer.masksToBounds = YES;
    CGFloat nextBtnY = self.contentView.frame.size.height - 50 * kYScal - 40 * kYScal;
    CGFloat nextBtnX = (self.contentView.frame.size.width - 150 * kXScal)/2;
    nextBtn.frame = CGRectMake(nextBtnX, nextBtnY, 150 * kXScal, 50 * kYScal);
    [nextBtn setTitle:self.endTitle forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn.titleLabel setFont:[UIFont systemFontOfSize:22]];
    nextBtn.backgroundColor = [UIColor colorWithHexString:@"#0fa8cb"];
    [nextBtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:nextBtn];
}

- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
}

- (void)exit:(UIButton*)sender {
    [self dismiss];
}

- (void)dismiss {
    [self removeFromSuperview];
}

- (void)hideRegist:(NSNotification*)noti {
    [self dismiss];
}

- (void)requestCode:(UIButton*)sender {
    NSLog(@"发送验证码");
    self.smsCode = @"";
    BOOL isMobile = [NSString isPhoneNumber:self.phoneTF.text];
    if (self.phoneTF.text.length == 0 || !isMobile) {
        [STTextHudTool showText:@"您输入的用户名错误"];
    } else {
        self.requestCodeBtn.enabled = NO;
        self.requestCodeBtn.backgroundColor = [UIColor lightGrayColor];
        self.seconds = 60;
        self.verifyCodeTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(verifyTimerRepeat) userInfo:nil repeats:YES];
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        if (self.type == RegistPopView) {
            [parameter setValue:@1 forKey:@"type"];
        } else {
           [parameter setValue:@0 forKey:@"type"];
        }
        [parameter setValue:self.phoneTF.text forKey:@"mobile"];
        [self sendSMS:parameter];
    }
}

#pragma mark - netFunctions

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

- (void)modifyPassword:(NSMutableDictionary*)parameter {
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kMODIFY_PASSWORD_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        if (code == 0) {
            [self dismiss];
            [STTextHudTool showText:@"成功"];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)verifyTimerRepeat {
    if (self.seconds == 0) {
        [self.verifyCodeTimer invalidate];
        self.requestCodeBtn.enabled = YES;
        self.requestCodeBtn.backgroundColor = [UIColor colorWithHexString:@"#12aac8"];
        [self.requestCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    } else {
        [self.requestCodeBtn setTitle:[NSString stringWithFormat:@"%ld",(long)self.seconds] forState:UIControlStateNormal];
    }
    self.seconds --;
}

- (void)next:(UIButton*)sender {
    NSString *username = self.phoneTF.text;
    NSString *password = self.passwordTF.text;
    NSString *conformPwd = self.conformPwdTF.text;
    NSString *smsCode = self.codeTF.text;
    BOOL hasConformPwd = NO;//两次密码是否一致
    if ([password isEqualToString:conformPwd]) {
        hasConformPwd = YES;
    }
    BOOL hasConformPwdLength = NO;
    if (password.length >= 6 && password.length <=12) {
        hasConformPwdLength = YES;
    }
    BOOL isMobile = [NSString isPhoneNumber:self.phoneTF.text];
    NSLog(@"isMobile  :%d hasConformPwdLength :%d",isMobile,hasConformPwdLength);
    if (username.length > 0 && password.length > 0 && smsCode.length > 0 && conformPwd.length > 0 && isMobile && hasConformPwdLength && hasConformPwd) {
        if (self.type == RegistPopView ) {
            CGRect frame = CGRectMake(kWhiteView_LeftMargin * kXScal, kWhiteView_TopMargin * kYScal, kWidth - 2 * kWhiteView_LeftMargin * kXScal, kHeight - kWhiteView_TopMargin * kYScal - (kBlueView_TopMargin * kYScal + (kBlueView_TopMargin * kYScal - kWhiteView_TopMargin * kYScal)));
            NSDictionary *dict = @{@"smsCode":self.codeTF.text,@"mobile":self.phoneTF.text,@"password":self.passwordTF.text};
            DoctorRegistView *registView = [[DoctorRegistView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width - 2 * kDoctor_RegistView_LeftMargin, frame.size.height) basicInfo:dict userInfo:nil type:DoctorRegistPopView];
            [registView show];
        } else {
            //重置密码
            NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
            [parameter setValue:username forKey:@"mobile"];
            [parameter setValue:smsCode forKey:@"smsCode"];
            [parameter setValue:password forKey:@"password"];
            [self modifyPassword:parameter];
        }
    } else if (username.length == 0 || !isMobile){
        [STTextHudTool showText:@"您输入正确的手机号"];
    } else if(smsCode.length == 0) {
        [STTextHudTool showText:@"请输入验证码"];
    } else if(password.length == 0) {
        [STTextHudTool showText:@"请输入密码"];
    } else if(!hasConformPwdLength) {
        [STTextHudTool showText:@"请输入包含字母数字（6-12位）的密码"];
    } else if (!hasConformPwd) {
        [STTextHudTool showText:@"两次密码不一致"];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (range.length == 1 && string.length == 0) {
        return YES;
    }
    if (textField.tag == 10 || textField.tag == 20) {
        if (textField.tag == 10) {
            if (self.phoneTF.text.length >= 11) {//限制手机号长度
                self.phoneTF.text = [textField.text substringToIndex:11];
                return NO;
            }
        } else if (textField.tag == 20) {
            if (self.codeTF.text.length >= 6) {
                self.codeTF.text = [textField.text substringToIndex:6];
                return NO;
            }
        }
        return [self validateNumber:string];
    } else {
        return YES;
    }
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

@end
