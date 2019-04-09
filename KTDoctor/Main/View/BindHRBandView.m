//
//  BindHRBandView.m
//  KTDoctor
//
//  Created by garychen on 2019/4/9.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "BindHRBandView.h"
#import "SearchAndSelectView.h"

#define kTitleLbl_TopMargin 17
#define kTitleLbl_FontSize 18
#define kTitleLbl_Width 100
#define kTitleLbl_Height 20
#define kDoctorImg_TopMargin 42
#define kDoctorImg_LeftMargin 65
#define kDoctorImg_RightMargin 27
#define kDoctorImg_Width 67
#define kDoctorImg_Height 141
#define kLeftLbl_RightMargin 12
#define kLeftLbl_FontSize 13
#define kLeftLbl_Width 55
#define KRight_CustomView_TopMargin 126
#define kRight_CustomView_RightMargin 45
#define kRight_CustomView_Height 25
#define kRight_CustomView_BottomMargin 24
#define kBindBtn_RightMargin 16
#define kBindBtn_Title_FontSize 12
#define kBindBtn_TopMargin 40
#define kBindBtn_Width 70
#define kBindBtn_Height 24
#define kCancelBtn_RightMargin 53
#define kBindBtn_BottomMargin 34

#define kBindView_TopMargin 138
#define kBindView_LeftMargin 263
#define kBindView_BottomMargin 152

@interface BindHRBandView()
@property (nonatomic,assign)CGRect contentFrame;
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *doctorImg;
@property (nonatomic,strong)UILabel *nameTitleLbl;
@property (nonatomic,strong)SearchAndSelectView *nameView;
@property (nonatomic,strong)UILabel *hrDeviceTitleLbl;
@property (nonatomic,strong)SearchAndSelectView *hrDeviceView;
@property (nonatomic,strong)UIButton *bindBtn;
@property (nonatomic,strong)UIButton *cancelBtn;
@end

@implementation BindHRBandView

- (instancetype)initWithFrame:(CGRect) frame {
    if (self = [super initWithFrame:frame]) {
        self.contentFrame = frame;
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
    self.contentView.frame = CGRectMake(0, 0, kWidth - 2 * kBindView_LeftMargin * kXScal, kHeight -  kBindView_TopMargin * kYScal - kBindView_BottomMargin * kYScal);
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
    
    CGFloat titleLbl_LeftMargin = (self.contentFrame.size.width - kTitleLbl_Width * kXScal)/2;
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(titleLbl_LeftMargin, kTitleLbl_TopMargin * kYScal, kTitleLbl_Width * kXScal, kTitleLbl_Height * kYScal)];
    self.titleLbl.textColor = [UIColor blackColor];
    self.titleLbl.font = [UIFont systemFontOfSize:kTitleLbl_FontSize * kYScal];
    self.titleLbl.text = @"绑定心率带";
    [self.contentView addSubview:self.titleLbl];
    
    CGFloat doctorImg_TopMargin = (self.contentFrame.size.height - kDoctorImg_Height * kYScal)/2;
    self.doctorImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"doctor1"]];
    self.doctorImg.frame = CGRectMake(kDoctorImg_LeftMargin * kXScal, doctorImg_TopMargin, kDoctorImg_Width * kXScal, kDoctorImg_Height * kYScal);
    [self.contentView addSubview:self.doctorImg];
    
    self.nameTitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.doctorImg.frame) + kDoctorImg_RightMargin * kXScal, KRight_CustomView_TopMargin * kYScal, kLeftLbl_Width * kXScal, kRight_CustomView_Height * kYScal)];
    self.nameTitleLbl.text = @"姓名/ID";
    self.nameTitleLbl.textColor = [UIColor blackColor];
    self.nameTitleLbl.font = [UIFont systemFontOfSize:kLeftLbl_FontSize * kYScal];
    [self.contentView addSubview:self.nameTitleLbl];
    
    CGFloat right_Width = self.contentFrame.size.width - CGRectGetMaxX(self.nameTitleLbl.frame) - kLeftLbl_RightMargin * kXScal - kRight_CustomView_RightMargin * kXScal;
    self.nameView = [[SearchAndSelectView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameTitleLbl.frame) + kLeftLbl_RightMargin * kXScal, KRight_CustomView_TopMargin * kYScal, right_Width, kRight_CustomView_Height * kYScal)];
    self.nameView.backgroundColor = [UIColor colorWithHexString:@"#88dbed"];
    self.nameView.layer.cornerRadius = kRight_CustomView_Height * kYScal / 2.0;
    self.nameView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.nameView];
    
    self.hrDeviceTitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameTitleLbl.frame.origin.x, CGRectGetMaxY(self.nameView.frame) + kRight_CustomView_BottomMargin * kYScal, kLeftLbl_Width * kXScal, kRight_CustomView_Height * kYScal)];
    self.hrDeviceTitleLbl.textColor = [UIColor blackColor];
    self.hrDeviceTitleLbl.text = @"心率带ID";
    self.hrDeviceTitleLbl.font =  [UIFont systemFontOfSize:kLeftLbl_FontSize * kYScal];
    [self.contentView addSubview:self.hrDeviceTitleLbl];
    
    self.hrDeviceView = [[SearchAndSelectView alloc] initWithFrame:CGRectMake(self.nameView.frame.origin.x, CGRectGetMaxY(self.nameView.frame) + kRight_CustomView_BottomMargin * kYScal, right_Width, kRight_CustomView_Height * kYScal)];
    self.hrDeviceView.backgroundColor = [UIColor colorWithHexString:@"#88dbed"];
    self.hrDeviceView.layer.cornerRadius = kRight_CustomView_Height * kYScal /2.0;
    self.hrDeviceView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.hrDeviceView];
    
    self.bindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bindBtn setTitle:@"绑定" forState:UIControlStateNormal];
    [self.bindBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CGFloat bindBtn_LeftMargin = self.contentFrame.size.width - 2 * kBindBtn_Width * kXScal - kBindBtn_RightMargin * kXScal - kCancelBtn_RightMargin * kXScal;
    self.bindBtn.frame = CGRectMake(bindBtn_LeftMargin, CGRectGetMaxY(self.hrDeviceView.frame) + kBindBtn_TopMargin * kYScal, kBindBtn_Width * kXScal, kBindBtn_Height * kYScal);
    self.bindBtn.backgroundColor = [UIColor colorWithHexString:@"#109bba"];
    [self.bindBtn addTarget:self action:@selector(bind:) forControlEvents:UIControlEventTouchUpInside];
    self.bindBtn.layer.cornerRadius = kBindBtn_Height * kYScal / 2.0;
    self.bindBtn.layer.masksToBounds = YES;
    [self.contentView addSubview:self.bindBtn];
    
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    self.cancelBtn.frame = CGRectMake(CGRectGetMaxX(self.bindBtn.frame) + kBindBtn_RightMargin * kXScal, self.bindBtn.frame.origin.y, kBindBtn_Width * kXScal, kBindBtn_Height * kYScal);
    self.cancelBtn.backgroundColor = [UIColor colorWithHexString:@"#9b9b9b"];
    self.cancelBtn.layer.cornerRadius = kBindBtn_Height * kYScal / 2.0;
    self.cancelBtn.layer.masksToBounds = YES;
    [self.cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.cancelBtn];
}

#pragma mark - button click events

- (void)bind:(UIButton*)sender {
    [self dismiss];
}

- (void)cancel:(UIButton*)sender {
    [self dismiss];
}

- (void)show  {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
}

- (void)dismiss {
    [self removeFromSuperview];
}

@end
