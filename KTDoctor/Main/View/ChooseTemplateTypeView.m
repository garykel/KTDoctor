//
//  ChooseTemplateTypeView.m
//  KTDoctor
//
//  Created by duwei on 2019/5/17.
//  Copyright © 2019 dz. All rights reserved.
//

#import "ChooseTemplateTypeView.h"

#define kView_Height 240
#define kView_LeftMargin 185
#define kTopView_Height 40
#define kTitleLbl_Width 150
#define kTitleLbl_Height 18
#define kTitleLbl_FontSize 18.0
#define kCloseBtn_Width 26
#define kCloseBtn_RightMargin 15
#define kButton_Height 40
#define kButton_Width 170
#define kButton_HSpace 100
#define kButton_FontSize 15.0

@interface ChooseTemplateTypeView()
@property (nonatomic,assign)CGRect contentFrame;
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIButton *closeBtn;
@end

@implementation ChooseTemplateTypeView

- (instancetype)initWithFrame:(CGRect)frame{
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
    self.contentView.frame = CGRectMake(0, 0, kWidth - 2 * kView_LeftMargin * kXScal, kView_Height * kYScal);
    self.contentView.frame = self.contentFrame;
    self.contentView.layer.cornerRadius = 2;
    self.contentView.layer.masksToBounds = YES;
    CGPoint center = self.center;
    CGFloat x = center.x;
    CGFloat y = center.y;
    self.contentView.center = CGPointMake(x, y - 50);
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 6;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handletapGesture:)];
    [self addGestureRecognizer:tap];
    
    [self addSubview:self.contentView];
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, kTopView_Height * kYScal)];
    self.topView.backgroundColor = [UIColor colorWithHexString:@"#d4dce2"];
    [self.contentView addSubview:self.topView];
    
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake((self.topView.frame.size.width - kTitleLbl_Width * kXScal)/2, (kTopView_Height * kYScal - kTitleLbl_Height * kYScal)/2.0, kTitleLbl_Width * kXScal, kTitleLbl_Height * kYScal)];
    self.titleLbl.textColor = [UIColor blackColor];
    self.titleLbl.text = @"选择有氧模板类型";
    self.titleLbl.font = [UIFont systemFontOfSize:kTitleLbl_FontSize * kYScal];
    [self.topView addSubview:self.titleLbl];
    
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closeBtn.frame = CGRectMake(self.contentView.frame.size.width - kCloseBtn_Width * kXScal - kCloseBtn_RightMargin * kXScal, 0, kCloseBtn_Width * kXScal, kCloseBtn_Width * kXScal);
    self.closeBtn.center = CGPointMake(self.contentView.frame.size.width - kCloseBtn_Width * kXScal - kCloseBtn_RightMargin * kXScal + kCloseBtn_Width * kXScal/2.0, self.titleLbl.center.y);
    [self.closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [self.closeBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.closeBtn];
    
    self.intensiteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat leftMargin = (self.contentView.frame.size.width - 2 * kButton_Width * kXScal - kButton_HSpace * kXScal)/2;
    CGFloat topMargin = (self.contentView.frame.size.height - kTopView_Height * kYScal - kButton_Height * kYScal)/2.0;
    self.intensiteBtn.frame = CGRectMake(leftMargin, CGRectGetMaxY(self.topView.frame) + topMargin, kButton_Width *kXScal, kButton_Height *kYScal);
    self.intensiteBtn.layer.cornerRadius = 10;
    self.intensiteBtn.layer.borderColor = [UIColor grayColor].CGColor;
    [self.intensiteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.intensiteBtn setTitle:@"强度模板" forState:UIControlStateNormal];
    self.intensiteBtn.layer.borderWidth = 2;
    [self.contentView addSubview:self.intensiteBtn];
    
    self.powerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.powerBtn.frame = CGRectMake(CGRectGetMaxX(self.intensiteBtn.frame) + kButton_HSpace * kXScal, self.intensiteBtn.frame.origin.y, kButton_Width * kXScal, kButton_Height * kYScal);
    self.powerBtn.layer.cornerRadius = 10;
    self.powerBtn.layer.borderWidth = 2;
    self.powerBtn.layer.borderColor = [UIColor grayColor].CGColor;
    [self.powerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.powerBtn setTitle:@"功率模板" forState:UIControlStateNormal];
    [self.contentView addSubview:self.powerBtn];
}

- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
}

- (void)dismiss {
    [self removeFromSuperview];
}

// 点击其他区域关闭弹窗
- (void)handletapGesture:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded){
        CGPoint location = [sender locationInView:self];
        NSLog(@"location :%@",NSStringFromCGPoint(location));
        if (!CGRectContainsPoint(self.contentView.frame, location)) {
            [self dismiss];
        }
    }
}
@end
