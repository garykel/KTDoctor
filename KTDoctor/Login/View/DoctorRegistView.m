//
//  DoctorRegistView.m
//  KTDoctor
//
//  Created by duwei on 2019/3/18.
//  Copyright © 2019 dz. All rights reserved.
//

#import "DoctorRegistView.h"

#define kRegistView_LeftMargin 200
#define kRegistView_TopMargin 150
#define kRegistView_TopView_Height 80
#define kRegistView_TitleLbl_FontSize 40.0
#define kRegistView_ExitBtn_Width 50
#define kRegistView_ExitBtn_RightMargin 20
#define kRegistView_HeadImg_TopMargin 30
#define kRegistView_HeadImg_Width 80
#define kRegistView_HeadImg_LeftMargin 20
#define kRegistView_HeadLbl_TopMargin 15
#define kRegistView_HeadLbl_Width 50
#define kRegistView_HeadLbl_Height 20
#define kRegistView_Lbl_FontSize 18.0
#define kRegistView_RedStar_LeftMargin 2
#define kRegistView_RedStar_Width 10
#define kRegistView_NameLbl_TopMargin 15
#define kRegistView_NameLbl_Width 90
#define kRegistView_LblLeftMargin 20
#define kRegistView_TextField_Height 50
#define kRegistView_TextField_Width 150
#define kRegistView_Vertical_Space 10
#define kRegistView_TextField_LeftMargin 15
#define kRegistView_SexSelect_Width 100
#define kRegistView_BirthSelect_Width 180
#define kRegistView_SkillsLbl_Height 90
#define kRegistView_SkillsView_Height 200
#define KRegistView_OKBtn_Width 100
#define kRegistView_OKBtn_TopMargin 20
#define kRegistView_OKBtn_Height 44

@interface DoctorRegistView()
@property (nonatomic,assign)CGRect contentFrame;
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *endTitle;
@property (nonatomic,strong)UIImageView *headImg;
@property (nonatomic,strong)UILabel *headLbl;
@property (nonatomic,strong)UIImageView *headRedStar;
@property (nonatomic,strong)UILabel *usernameLbl;
@property (nonatomic,strong)UIImageView *usernameRedStar;
@property (nonatomic,strong)UITextField *usernameTF;
@property (nonatomic,strong)UILabel *sexLbl;
@property (nonatomic,strong)UIImageView *sexRedStar;
@property (nonatomic,strong)UITextField *sexTF;
@property (nonatomic,strong)UILabel *birthLbl;
@property (nonatomic,strong)UIImageView *birthRedStar;
@property (nonatomic,strong)UITextField *birthTF;
@property (nonatomic,strong)UILabel *organizeLbl;
@property (nonatomic,strong)UIImageView *organizeRedStar;
@property (nonatomic,strong)UITextField *organizeTF;
@property (nonatomic,strong)UILabel *skillsLbl;
@property (nonatomic,strong)UIImageView *skillsRedStar;
@property (nonatomic,strong)UITextView *skillsView;
@property (nonatomic,strong)UIButton *okBtn;
@end

@implementation DoctorRegistView

- (instancetype)initWithFrame:(CGRect)frame basicInfo:(NSDictionary*)basicInfo {
    if (self = [super init]) {
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
    self.contentView.frame = CGRectMake(0, 0, kWidth - 2 * kRegistView_LeftMargin, kHeight - 2 * kRegistView_TopMargin);
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
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, kRegistView_TopView_Height)];
    topView.backgroundColor = [UIColor colorWithHexString:@"#d0dce3"];
    [self.contentView addSubview:topView];
    
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, topView.frame.size.width, kRegistView_TitleLbl_FontSize)];
    titleLbl.center = topView.center;
    titleLbl.text = @"医师注册";
    titleLbl.font = [UIFont systemFontOfSize:kRegistView_TitleLbl_FontSize];
    titleLbl.textColor = [UIColor blackColor];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:titleLbl];
    
    UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [exitBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    exitBtn.layer.cornerRadius = kRegistView_ExitBtn_Width * kXScal / 2.0;
    exitBtn.layer.masksToBounds = YES;
    CGFloat exitBtnTop = (topView.frame.size.height - kRegistView_ExitBtn_Width * kXScal)/2;
    exitBtn.frame = CGRectMake(topView.frame.size.width - kRegistView_ExitBtn_RightMargin * kXScal - kRegistView_ExitBtn_Width * kXScal, exitBtnTop, kRegistView_ExitBtn_Width * kXScal, kRegistView_ExitBtn_Width * kXScal);
    
    [exitBtn addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:exitBtn];
    
    self.headImg = [[UIImageView alloc] initWithFrame:CGRectMake(kRegistView_HeadImg_LeftMargin * kXScal,CGRectGetMaxY(topView.frame) + kRegistView_HeadImg_TopMargin * kYScal, kRegistView_HeadImg_Width * kXScal, kRegistView_HeadImg_Width * kXScal)];
    self.headImg.backgroundColor = [UIColor lightGrayColor];
    self.headImg.layer.cornerRadius = kRegistView_HeadImg_Width * kXScal / 2.0;
    self.headImg.layer.masksToBounds = YES;
    [self.contentView addSubview:self.headImg];
    
    self.headLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headImg.frame) + kRegistView_HeadLbl_TopMargin * kYScal, kRegistView_HeadLbl_Width * kXScal, kRegistView_HeadLbl_Height * kYScal)];
    self.headLbl.text = @"头像";
    CGFloat headLblX = self.headImg.center.x;
    CGFloat headLblY = CGRectGetMaxY(self.headImg.frame) + kRegistView_HeadLbl_TopMargin * kYScal + kRegistView_HeadLbl_Height * kYScal / 2.0;
    self.headLbl.center = CGPointMake(headLblX, headLblY);
    self.headLbl.textColor = [UIColor blackColor];
    self.headLbl.font = [UIFont systemFontOfSize:kRegistView_Lbl_FontSize * kYScal];
    [self.contentView addSubview:self.headLbl];
    
    self.headRedStar = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headLbl.frame) - kRegistView_RedStar_LeftMargin * kXScal, self.headLbl.frame.origin.y, kRegistView_RedStar_Width * kXScal, kRegistView_RedStar_Width * kXScal)];
    CGFloat headRedStarX = CGRectGetMaxX(self.headLbl.frame) - kRegistView_RedStar_LeftMargin * kXScal;
    CGFloat headRedStarY = self.headLbl.center.y;
    self.headRedStar.center = CGPointMake(headRedStarX, headRedStarY);
    self.headRedStar.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.headRedStar];
    
    self.usernameLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImg.frame) + kRegistView_LblLeftMargin * kXScal, CGRectGetMaxY(topView.frame) + kRegistView_NameLbl_TopMargin * kYScal, kRegistView_NameLbl_Width * kXScal, kRegistView_TextField_Height * kYScal)];
    self.usernameLbl.text = @"姓      名";
    self.usernameLbl.font = [UIFont systemFontOfSize:kRegistView_Lbl_FontSize * kYScal];
    self.usernameLbl.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.usernameLbl];
    
    self.usernameRedStar = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.usernameLbl.frame) - kRegistView_RedStar_LeftMargin * kXScal, self.usernameLbl.frame.origin.y, kRegistView_RedStar_Width * kXScal, kRegistView_RedStar_Width * kXScal)];
    CGFloat usernameStarX = CGRectGetMaxX(self.usernameLbl.frame) - kRegistView_RedStar_LeftMargin * kXScal;
    CGFloat usernameRedStarY = self.usernameLbl.center.y;
    self.usernameRedStar.center = CGPointMake(usernameStarX, usernameRedStarY);
    self.usernameRedStar.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.usernameRedStar];
    
    self.usernameTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.usernameRedStar.frame) + kRegistView_TextField_LeftMargin * kXScal, self.usernameLbl.frame.origin.y, kRegistView_TextField_Width, kRegistView_TextField_Height)];
    self.usernameTF.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    self.usernameTF.placeholder = @"请输入姓名";
    [self.contentView addSubview:self.usernameTF];
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
