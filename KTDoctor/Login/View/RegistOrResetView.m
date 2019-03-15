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
    self.contentView.center = self.center;
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
    exitBtn.backgroundColor = [UIColor colorWithHexString:@"#8d8f94"];
    exitBtn.layer.cornerRadius = kAlertView_ExitBtn_Width / 2.0;
    exitBtn.layer.masksToBounds = YES;
    CGFloat exitBtnTop = (topView.frame.size.height - kAlertView_ExitBtn_Width)/2;
    exitBtn.frame = CGRectMake(topView.frame.size.width - kAlertView_ExitBtn_RightMargin - kAlertView_ExitBtn_Width, exitBtnTop, kAlertView_ExitBtn_Width, kAlertView_ExitBtn_Width);
    
    [exitBtn addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:exitBtn];
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

@end
