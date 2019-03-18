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
#define kAlertView_ExitBtn_RightMargin 30
#define kAlertView_TitleLbl_FontSize 40.0
#import "RegistOrResetView.h"
@interface RegistOrResetView()
@property (nonatomic,assign)CGRect contentFrame;
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *endTitle;
@end

@implementation RegistOrResetView

- (instancetype)initWithFrame:(CGRect) frame title:(NSString*)title endTitle:(NSString*)endTitle; {
    if (self = [super init]) {
        self.contentFrame = frame;
        self.title = title;
        self.endTitle = endTitle;
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.85];
    [UIView animateWithDuration:0.5 animations:^{
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
    
    UITextField *phoneTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(phoneLbl.frame) + 10 * kXScal, phoneLbl.frame.origin.y, self.contentFrame.size.width - 2 * 50 * kXScal - 100 * kXScal - 20 * kXScal, 50 * kYScal)];
    phoneTF.placeholder = @"请输入手机号";
    phoneTF.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    [self.contentView addSubview:phoneTF];
    
    UILabel *codeLbl = [[UILabel alloc] initWithFrame:CGRectMake(phoneLbl.frame.origin.x, CGRectGetMaxY(phoneLbl.frame) + 20 * kYScal, 100 * kXScal, 50 * kYScal)];
    codeLbl.font = [UIFont systemFontOfSize:18.0 * kYScal];
    codeLbl.textColor = [UIColor blackColor];
    codeLbl.textAlignment = NSTextAlignmentCenter;
    codeLbl.text = @"验  证  码";
    [self.contentView addSubview:codeLbl];
    
    UITextField *codeTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(codeLbl.frame) + 10 * kXScal, codeLbl.frame.origin.y, self.contentFrame.size.width - 2 * 50 * kXScal - 100 * kXScal - 20 * kXScal - 90 * kXScal - 10 * kXScal, 50 * kYScal)];
    codeTF.placeholder = @"请输入收到的验证码";
    codeTF.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    [self.contentView addSubview:codeTF];
    
    UIButton *requestCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    requestCodeBtn.backgroundColor = [UIColor colorWithHexString:@"#0fa8cb"];
    requestCodeBtn.frame = CGRectMake(CGRectGetMaxX(codeTF.frame) + 10 * kXScal, codeLbl.frame.origin.y, 90 * kXScal, 50 * kYScal);
    [requestCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [requestCodeBtn.titleLabel setFont:[UIFont systemFontOfSize:14.0 * kYScal]];
    requestCodeBtn.layer.cornerRadius = 2;
    requestCodeBtn.layer.masksToBounds = YES;
    [requestCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [requestCodeBtn addTarget:self action:@selector(requestCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:requestCodeBtn];
    
    UILabel *passwordLbl = [[UILabel alloc] initWithFrame:CGRectMake(phoneLbl.frame.origin.x, CGRectGetMaxY(codeLbl.frame) + 20 * kYScal, 100 * kXScal, 50 * kYScal)];
    passwordLbl.font = [UIFont systemFontOfSize:18.0 * kYScal];
    passwordLbl.textColor = [UIColor blackColor];
    passwordLbl.textAlignment = NSTextAlignmentCenter;
    passwordLbl.text = @"设置密码";
    [self.contentView addSubview:passwordLbl];
    
    UITextField *passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(passwordLbl.frame) + 10 * kXScal, passwordLbl.frame.origin.y, self.contentFrame.size.width - (2 * 50 + 100 + 20) * kXScal, 50 * kYScal)];
    passwordTF.placeholder = @"包含字母数字（6-12位）的密码";
    passwordTF.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    [self.contentView addSubview:passwordTF];
    
    UILabel *conformPwdLbl = [[UILabel alloc] initWithFrame:CGRectMake(phoneLbl.frame.origin.x, CGRectGetMaxY(passwordLbl.frame) + 20 * kYScal, 100 * kXScal, 50 * kYScal)];
    conformPwdLbl.font = [UIFont systemFontOfSize:18.0 * kYScal];
    conformPwdLbl.textColor = [UIColor blackColor];
    conformPwdLbl.textAlignment = NSTextAlignmentCenter;
    conformPwdLbl.text = @"确认密码";
    [self.contentView addSubview:conformPwdLbl];
    
    UITextField *conformPwdTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(conformPwdLbl.frame) + 10 * kXScal, conformPwdLbl.frame.origin.y, (self.contentFrame.size.width - (2 * 50 + 100 + 20) * kXScal), 50 * kYScal)];
    conformPwdTF.placeholder = @"请再确认密码";
    conformPwdTF.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    [self.contentView addSubview:conformPwdTF];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.layer.cornerRadius = 25 * kYScal;
    nextBtn.layer.masksToBounds = YES;
    CGFloat nextBtnY = self.contentView.frame.size.height - 50 * kYScal - 40 * kYScal;
    CGFloat nextBtnX = (self.contentView.frame.size.width - 150 * kXScal)/2;
    nextBtn.frame = CGRectMake(nextBtnX, nextBtnY, 150 * kXScal, 50 * kYScal);
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
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

- (void)requestCode:(UIButton*)sender {
    NSLog(@"发送验证码");
}

- (void)next:(UIButton*)sender {
    NSLog(@"下一步");
}

@end
