//
//  PatientQuestionViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/5/14.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientQuestionViewController.h"
#import "PatientRiskLevelViewController.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 150
#define kInfoView_TopMargin 40
#define kInfoView_LeftMargin 20
#define kInfoView_BottomMargin 30
#define kNextBtn_Width 130
#define kNextBtn_Height 30
#define kNextBtn_RightMargin 30
#define kNextBtn_FontSize 15.0
#define kNextBtn_BottomMargin 35

#define kFirstQuestionView_TopMargin 26
#define kQuestionView_LeftMargin 15
#define kQuestionView_Width 4
#define kQuestionView_Height 10
#define kQuestionLbl_Width 250
#define kQuestionLbl_Height 15.0
#define kQuestionLbl_LeftMargin 10
#define kQuestionLbl_FontSize 15.0
#define kAnswer1Lbl_Radio_LeftMargin 6
#define kAnswer1Lbl_Radio_RightMargin 10
#define kAnswer1Lbl_Radio_TopMargin 16
#define kAnswer1Lbl_Width 330
#define kAnswer1Lbl_TopMargin 15
#define kRadioBtn_Width 10
#define kQuestionView2_TopMargin 22
#define kQuestion2_SubQuestionLbl_TopMargin 15
#define kQuestion2_SubQuestionLbl_LeftMargin 15
#define kQuestion2_SubQuestionLbl_RightMargin 15
#define kQuestion2_SubQuestionLbl_FontSize 12.0
#define kQuestion2_SubQuestionLbl_Height 12.0
#define kQuestion2_SubQuestionLbl_Width 45
#define kAnswerLbl_YesLbl_Width 12
#define kAnswerLbl_YesLbl_Height 11
#define kAnswerLbl_YesLbl_RightMargin 20
#define kAnswerLbl_Nol_Width 12
#define kAnswerLbl_NoLbl_Height 11
#define kQuestion3_Radio_LeftMargin 6
#define kQuestion3_Radio_RightMargin 6
#define kQuestion3_Radio_TopMargin 16
#define kQuestion3_YesLbl_RightMargin 20
#define kQuestion5_AnswerLbl_RightMargin 100
#define kQuestion5_NumLbl_Width 12
#define kQuestion5_NumLbl_Height 13
#define kQuestion5_Lbl_FontSize 12.0

@interface PatientQuestionViewController ()
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIView *infoView;
@property (nonatomic,strong)UIView *question1View;
@property (nonatomic,strong)UILabel *question1Lbl;
@property (nonatomic,strong)UIButton *answer1YesRadio;
@property (nonatomic,strong)UILabel *answer1YesLbl;
@property (nonatomic,strong)UIButton *answer1NoRadio;
@property (nonatomic,strong)UILabel *answer1NoLbl;
@property (nonatomic,strong)UIView *question2View;
@property (nonatomic,strong)UILabel *question2Lbl;
@property (nonatomic,strong)UILabel *hbpLbl;//高血压
@property (nonatomic,strong)UIButton *hbpYesImg;
@property (nonatomic,strong)UIButton *hbpNoImg;
@property (nonatomic,strong)UILabel *hbsLbl;//高血糖
@property (nonatomic,strong)UIButton *hbsYesImg;
@property (nonatomic,strong)UIButton *hbsNoImg;
@property (nonatomic,strong)UILabel *hbfLbl;//高血脂
@property (nonatomic,strong)UIButton *hbfYesImg;
@property (nonatomic,strong)UIButton *hbfNoImg;
@property (nonatomic,strong)UILabel *highSmokeLbl;//吸烟
@property (nonatomic,strong)UIButton *smokeYesImg;
@property (nonatomic,strong)UIButton *smokeNoImg;
@property (nonatomic,strong)UIView *question3View;
@property (nonatomic,strong)UILabel *question3Lbl;
@property (nonatomic,strong)UIButton *question3YesImg;
@property (nonatomic,strong)UIButton *question3NoImg;
@property (nonatomic,strong)UIView *question4View;
@property (nonatomic,strong)UILabel *question4Lbl;
@property (nonatomic,strong)UIButton *question4YesImg;
@property (nonatomic,strong)UIButton *question4NoImg;
@property (nonatomic,strong)UIView *question5View;
@property (nonatomic,strong)UILabel *question5Lbl;
@property (nonatomic,strong)UIButton *question5YesImg;
@property (nonatomic,strong)UIButton *question5NoImg;
@property (nonatomic,strong)UILabel *question5Num1Lbl;
@property (nonatomic,strong)UILabel *question5SubLbl1;
@property (nonatomic,strong)UILabel *question5Num2Lbl;
@property (nonatomic,strong)UILabel *question5SubLbl2;
@property (nonatomic,strong)UILabel *question5Num3Lbl;
@property (nonatomic,strong)UILabel *question5SubLbl3;
@property (nonatomic,strong)UILabel *question5Num4Lbl;
@property (nonatomic,strong)UILabel *question5SubLbl4;
@property (nonatomic,strong)UILabel *question5Num5Lbl;
@property (nonatomic,strong)UILabel *question5SubLbl5;
@property (nonatomic,strong)UILabel *question5Num6Lbl;
@property (nonatomic,strong)UILabel *question5SubLbl6;
@property (nonatomic,strong)UILabel *question5Num7Lbl;
@property (nonatomic,strong)UILabel *question5SubLbl7;
@property (nonatomic,strong)UILabel *question5Num8Lbl;
@property (nonatomic,strong)UILabel *question5SubLbl8;
@property (nonatomic,strong)UILabel *question5Num9Lbl;
@property (nonatomic,strong)UILabel *question5SubLbl9;
@property (nonatomic,strong)UIButton *previousPage;
@property (nonatomic,strong)UIButton *nextPage;
@end

@implementation PatientQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"self.userinfo is :%@",self.userInfo);
    [self setNavBar];
    [self setupUI];
}

- (void)setNavBar {
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, kNavView_TopMargin, kWidth, kNavView_Height)];
    self.navView.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.view addSubview:self.navView];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    self.backButton.adjustsImageWhenHighlighted = NO;
    CGFloat backButtonTop = (kNavView_Height - kButton_Height)/2;
    self.backButton.frame = CGRectMake(kBackButton_LeftMargin, backButtonTop, kButton_Height, kButton_Height);
    self.backButton.layer.cornerRadius = kButton_Height / 2.0;
    self.backButton.layer.masksToBounds = YES;
    [self.backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.backButton];
    
    CGFloat titleLbl_TopMargin = (kNavView_Height - kButton_Height)/2;
    CGFloat titleLbl_LeftMargin = kWidth/2 - kTitleLbl_Width/2;
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(titleLbl_LeftMargin, titleLbl_TopMargin, kTitleLbl_Width, kButton_Height)];
    self.titleLbl.font = [UIFont systemFontOfSize:kTitle_FontSize];
    self.titleLbl.textColor = [UIColor whiteColor];
    self.titleLbl.textAlignment = NSTextAlignmentCenter;
    self.titleLbl.text = @"患者资料";
    [self.navView addSubview:self.titleLbl];
}

- (void)setupUI {
    UIImage *bgImg = [UIImage imageNamed:@"history_bg"];
    bgImg = [self imageCompressWithSimple:bgImg scaledToSize:CGSizeMake(kWidth, kHeight - CGRectGetMaxY(self.navView.frame))];
    self.bgImg = [[UIImageView alloc] initWithImage:bgImg];
    self.bgImg.frame = CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWidth, kHeight - CGRectGetMaxY(self.navView.frame));
    [self.view addSubview:self.bgImg];
    self.bgImg.userInteractionEnabled = YES;
    
    self.infoView = [[UIView alloc] initWithFrame:CGRectMake(kInfoView_LeftMargin * kXScal, kInfoView_TopMargin * kYScal, kWidth - 2 * kInfoView_LeftMargin * kXScal, self.bgImg.frame.size.height - (kInfoView_TopMargin + kInfoView_BottomMargin + kNextBtn_Height + kNextBtn_BottomMargin) * kYScal)];
    self.infoView.backgroundColor = [UIColor colorWithHexString:@"#E8F5F5"];
    self.infoView.layer.cornerRadius = 4;
    self.infoView.layer.masksToBounds = YES;
    [self.bgImg addSubview:self.infoView];
    
    self.question1View = [[UIView alloc] initWithFrame:CGRectMake(kQuestionView_LeftMargin * kXScal, kFirstQuestionView_TopMargin * kYScal, kQuestionView_Width * kXScal, kQuestionView_Height * kYScal)];
    self.question1View.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.infoView addSubview:self.question1View];
    
    self.question1Lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kQuestionLbl_Width * kXScal, kQuestionLbl_Height * kYScal)];
    self.question1Lbl.textColor = [UIColor colorWithHexString:@"#000033"];
    self.question1Lbl.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    self.question1Lbl.text = @"您平时做多少运动";
    self.question1Lbl.center = CGPointMake(CGRectGetMaxX(self.question1View.frame) + kQuestionLbl_LeftMargin * kXScal + kQuestionLbl_Width * kXScal/2.0, self.question1View.center.y);
    [self.infoView addSubview:self.question1Lbl];
    
    NSInteger sportFrequency = [[self.userInfo valueForKey:@"sportFrequency"] integerValue];
    self.answer1YesRadio = [UIButton buttonWithType:UIButtonTypeCustom];
    self.answer1YesRadio.frame = CGRectMake(self.question1Lbl.frame.origin.x + kAnswer1Lbl_Radio_LeftMargin * kXScal, CGRectGetMaxY(self.question1Lbl.frame) + kAnswer1Lbl_Radio_TopMargin * kYScal, kRadioBtn_Width * kXScal, kRadioBtn_Width * kXScal);
    if (sportFrequency == 2) {
        [self.answer1YesRadio setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.answer1YesRadio setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.answer1YesRadio.tag = 10;
    [self.answer1YesRadio addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.answer1YesRadio];
    
    self.answer1YesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.answer1YesRadio.frame) + kAnswer1Lbl_TopMargin * kXScal, CGRectGetMaxY(self.question1Lbl.frame) + kAnswer1Lbl_TopMargin * kYScal, kAnswer1Lbl_Width * kXScal, kQuestionLbl_FontSize * kYScal)];
    self.answer1YesLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    self.answer1YesLbl.text = @"一天做了不少运动或者非常多的运动（选择这个选项，如果每周您做了多于150分钟的中等强度的运动或者每周做的多于75分钟的高强度运动）";
    self.answer1YesLbl.numberOfLines = 0;
    CGSize anser1YesTextSize = [self.answer1YesLbl sizeThatFits:CGSizeMake(kAnswer1Lbl_Width * kXScal, MAXFLOAT)];
    self.answer1YesLbl.frame = CGRectMake(CGRectGetMaxX(self.answer1YesRadio.frame) + kAnswer1Lbl_TopMargin * kXScal, CGRectGetMaxY(self.question1Lbl.frame) + kAnswer1Lbl_TopMargin * kYScal,anser1YesTextSize.width, anser1YesTextSize.height);
    [self.infoView addSubview:self.answer1YesLbl];
    
    self.answer1NoRadio = [UIButton buttonWithType:UIButtonTypeCustom];
    self.answer1NoRadio.frame = CGRectMake(self.answer1YesRadio.frame.origin.x, CGRectGetMaxY(self.answer1YesLbl.frame) + kAnswer1Lbl_Radio_TopMargin * kYScal, kRadioBtn_Width * kXScal, kRadioBtn_Width * kXScal);
    if (sportFrequency == 2) {
        [self.answer1NoRadio setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    } else {
        [self.answer1NoRadio setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    }
    self.answer1NoRadio.tag = 20;
    [self.answer1NoRadio addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.answer1NoRadio];
    
    self.answer1NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.answer1YesRadio.frame) + kAnswer1Lbl_TopMargin * kXScal, CGRectGetMaxY(self.answer1YesLbl.frame) + kAnswer1Lbl_TopMargin * kYScal, kAnswer1Lbl_Width * kXScal, kQuestion2_SubQuestionLbl_FontSize * kYScal)];
    self.answer1NoLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    self.answer1NoLbl.text = @"一天基本不做运动或者很少做运动（选择这个选项，如果每周您做了少于150分钟的中等强度运动或者每周少于75分钟的高强度运动）";
    self.answer1NoLbl.numberOfLines = 0;
    CGSize anser1NoTextSize = [self.answer1YesLbl sizeThatFits:CGSizeMake(kAnswer1Lbl_Width * kXScal, MAXFLOAT)];
    self.answer1NoLbl.frame = CGRectMake(CGRectGetMaxX(self.answer1NoRadio.frame) + kAnswer1Lbl_TopMargin * kXScal, CGRectGetMaxY(self.answer1YesLbl.frame) + kAnswer1Lbl_TopMargin * kYScal,anser1NoTextSize.width, anser1NoTextSize.height);
    [self.infoView addSubview:self.answer1NoLbl];
    
    //问题二
    self.question2View = [[UIView alloc] initWithFrame:CGRectMake(self.question1View.frame.origin.x,CGRectGetMaxY(self.answer1NoLbl.frame) + kQuestionView2_TopMargin * kYScal, kQuestionView_Width * kXScal, kQuestionView_Height * kYScal)];
    self.question2View.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.infoView addSubview:self.question2View];
    
    self.question2Lbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question2View.frame) + kQuestionLbl_LeftMargin * kXScal, 0 ,self.question1Lbl.frame.size.width, self.question1Lbl.frame.size.height)];
    self.question2Lbl.text = @"有没有以下情况";
    self.question2Lbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    CGFloat question2_CenterX = CGRectGetMaxX(self.question2View.frame) + kQuestionLbl_LeftMargin * kXScal + self.question1Lbl.frame.size.width/2.0;
    self.question2Lbl.center = CGPointMake(question2_CenterX, self.question2View.center.y);
    self.question2Lbl.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.infoView addSubview:self.question2Lbl];
    
    //高血压
    self.hbpLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question2View.frame.origin.x + kQuestion2_SubQuestionLbl_LeftMargin * kXScal, CGRectGetMaxY(self.question2Lbl.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion2_SubQuestionLbl_Width * kXScal,kQuestion2_SubQuestionLbl_Height * kYScal)];
    self.hbpLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.hbpLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    self.hbpLbl.text = @"高血压";
    [self.infoView addSubview:self.hbpLbl];
    
    NSInteger hasHbp = [[self.userInfo valueForKey:@"hasHbp"] integerValue];
    self.hbpYesImg = [UIButton buttonWithType:UIButtonTypeCustom];
    if (hasHbp == 1) {
        [self.hbpYesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.hbpYesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.hbpYesImg.frame = CGRectMake(CGRectGetMaxX(self.hbpLbl.frame) + kQuestion2_SubQuestionLbl_RightMargin * kXScal, 0, (kRadioBtn_Width + kQuestion3_Radio_LeftMargin + kAnswerLbl_YesLbl_Width) * kXScal, kAnswerLbl_YesLbl_Height * kYScal);
    CGFloat hbpYesImg_centerX = CGRectGetMaxX(self.hbpLbl.frame) + kQuestion2_SubQuestionLbl_RightMargin * kXScal + (kRadioBtn_Width + kQuestion3_Radio_LeftMargin + kAnswerLbl_YesLbl_Width) * kXScal / 2.0;
    [self.hbpYesImg setTitle:@"有" forState:UIControlStateNormal];
    [self.hbpYesImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    self.hbpYesImg.center = CGPointMake(hbpYesImg_centerX, self.hbpLbl.center.y);
    self.hbpYesImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.hbpYesImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.hbpYesImg.tag = 30;
    [self.hbpYesImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.hbpYesImg];
    
    self.hbpNoImg = [UIButton buttonWithType:UIButtonTypeCustom];
    if (hasHbp == 2) {
        [self.hbpNoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.hbpNoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.hbpNoImg.frame = CGRectMake(CGRectGetMaxX(self.hbpYesImg.frame) + kAnswerLbl_YesLbl_RightMargin * kXScal, self.hbpYesImg.frame.origin.y, (kRadioBtn_Width + kQuestion3_Radio_LeftMargin + kAnswerLbl_YesLbl_Width) * kXScal, kAnswerLbl_YesLbl_Height * kYScal);
    [self.hbpNoImg setTitle:@"无" forState:UIControlStateNormal];
    [self.hbpNoImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    self.hbpNoImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.hbpNoImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.hbpNoImg.tag = 40;
    [self.hbpNoImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.hbpNoImg];
    
    //高血糖
    self.hbsLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hbpLbl.frame.origin.x, CGRectGetMaxY(self.hbpLbl.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion2_SubQuestionLbl_Width * kXScal, kQuestion2_SubQuestionLbl_Height * kYScal)];
    self.hbsLbl.text = @"高血糖";
    self.hbsLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.hbsLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.hbsLbl];
    NSInteger hasHbs = [[self.userInfo valueForKey:@"hasHbs"] integerValue];
    self.hbsYesImg = [UIButton buttonWithType:UIButtonTypeCustom];
    if (hasHbs == 1) {
        [self.hbsYesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.hbsYesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.hbsYesImg.frame = CGRectMake(0, 0, self.hbpYesImg.frame.size.width, self.hbpYesImg.frame.size.height);
    CGFloat hbsYesImg_CenterX = CGRectGetMaxX(self.hbsLbl.frame) + kQuestion2_SubQuestionLbl_RightMargin * kXScal + self.hbpYesImg.frame.size.width/2.0;
    self.hbsYesImg.center = CGPointMake(hbsYesImg_CenterX, self.hbsLbl.center.y);
    [self.hbsYesImg setTitle:@"有" forState:UIControlStateNormal];
    [self.hbsYesImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    self.hbsYesImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.hbsYesImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.hbsYesImg.tag = 50;
    [self.hbsYesImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.hbsYesImg];
    
    self.hbsNoImg = [UIButton buttonWithType:UIButtonTypeCustom];
    if (hasHbs == 2) {
        [self.hbsNoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.hbsNoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.hbsNoImg.frame = CGRectMake(self.hbpNoImg.frame.origin.x, self.hbsYesImg.frame.origin.y, self.hbpNoImg.frame.size.width, self.hbpNoImg.frame.size.height);
    [self.hbsNoImg setTitle:@"无" forState:UIControlStateNormal];
    [self.hbsNoImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    self.hbsNoImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.hbsNoImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.hbsNoImg.tag = 60;
    [self.hbsNoImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.hbsNoImg];
    
    //高血脂
    self.hbfLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hbpLbl.frame.origin.x, CGRectGetMaxY(self.hbsLbl.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion2_SubQuestionLbl_Width * kXScal, kQuestion2_SubQuestionLbl_Height * kYScal)];
    self.hbfLbl.text = @"高血脂";
    self.hbfLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.hbfLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.hbfLbl];
    NSInteger hasHbf = [[self.userInfo valueForKey:@"hasHbf"] integerValue];
    self.hbfYesImg = [UIButton buttonWithType:UIButtonTypeCustom];
    if (hasHbf == 1) {
        [self.hbfYesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.hbfYesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.hbfYesImg.frame = CGRectMake(0, 0, self.hbpYesImg.frame.size.width, self.hbpYesImg.frame.size.height);
    CGFloat hbfYesImg_CenterX = CGRectGetMaxX(self.hbfLbl.frame) + kQuestion2_SubQuestionLbl_RightMargin * kXScal + self.hbpYesImg.frame.size.width/2.0;
    self.hbfYesImg.center = CGPointMake(hbfYesImg_CenterX, self.hbfLbl.center.y);
    [self.hbfYesImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    [self.hbfYesImg setTitle:@"有" forState:UIControlStateNormal];
    self.hbfYesImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.hbfYesImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.hbfYesImg.tag = 70;
    [self.hbfYesImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.hbfYesImg];
    
    self.hbfNoImg = [UIButton buttonWithType:UIButtonTypeCustom];
    if (hasHbf == 2) {
        [self.hbfNoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.hbfNoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.hbfNoImg.frame = CGRectMake(self.hbsNoImg.frame.origin.x, self.hbfYesImg.frame.origin.y, self.hbpNoImg.frame.size.width, self.hbpNoImg.frame.size.height);
    [self.hbfNoImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    [self.hbfNoImg setTitle:@"无" forState:UIControlStateNormal];
    self.hbfNoImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.hbfNoImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.hbfNoImg.tag = 80;
    [self.hbfNoImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.hbfNoImg];
    
    //吸烟
    self.highSmokeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hbfLbl.frame.origin.x, CGRectGetMaxY(self.hbfLbl.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion2_SubQuestionLbl_Width * kXScal, kQuestion2_SubQuestionLbl_Height * kYScal)];
    self.highSmokeLbl.text = @"吸   烟";
    self.highSmokeLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.highSmokeLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.highSmokeLbl];
    
    NSInteger hasSmoking = [[self.userInfo valueForKey:@"hasSmoking"] integerValue];
    self.smokeYesImg = [UIButton buttonWithType:UIButtonTypeCustom];
    if (hasSmoking == 1) {
        [self.smokeYesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.smokeYesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.smokeYesImg.frame = CGRectMake(0, 0, self.hbpYesImg.frame.size.width, self.hbpYesImg.frame.size.height);
    CGFloat latestSmokefYesImg_CenterX = CGRectGetMaxX(self.highSmokeLbl.frame) + kQuestion2_SubQuestionLbl_RightMargin * kXScal + self.hbfYesImg.frame.size.width/2.0;
    self.smokeYesImg.center = CGPointMake(latestSmokefYesImg_CenterX, self.highSmokeLbl.center.y);
    [self.smokeYesImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    [self.smokeYesImg setTitle:@"有" forState:UIControlStateNormal];
    self.smokeYesImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.smokeYesImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.smokeYesImg.tag = 90;
    [self.smokeYesImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.smokeYesImg];
    
    self.smokeNoImg = [UIButton buttonWithType:UIButtonTypeCustom];
    if (hasSmoking == 2) {
        [self.smokeNoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.smokeNoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.smokeNoImg.frame = CGRectMake(self.hbpNoImg.frame.origin.x, self.smokeYesImg.frame.origin.y, self.hbpNoImg.frame.size.width, self.hbpNoImg.frame.size.height);
    [self.smokeNoImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    [self.smokeNoImg setTitle:@"无" forState:UIControlStateNormal];
    self.smokeNoImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.smokeNoImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.smokeNoImg.tag = 100;
    [self.smokeNoImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.smokeNoImg];
    
    self.question3View = [[UIView alloc] initWithFrame:CGRectMake(self.question1View.frame.origin.x,CGRectGetMaxY(self.highSmokeLbl.frame) + kQuestionView2_TopMargin * kYScal, kQuestionView_Width * kXScal, kQuestionView_Height * kYScal)];
    self.question3View.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.infoView addSubview:self.question3View];
    
    //问题三
    self.question3Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question2Lbl.frame.origin.x, 0, self.question1Lbl.frame.size.width, self.question1Lbl.frame.size.height)];
    self.question3Lbl.text = @"您家里有没有人患糖尿病？";
    self.question3Lbl.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    CGFloat question3_CenterX = self.question2Lbl.frame.origin.x + self.question1Lbl.frame.size.width/2.0;
    self.question3Lbl.center = CGPointMake(question3_CenterX, self.question3View.center.y);
    self.question3Lbl.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.infoView addSubview:self.question3Lbl];
    
    NSInteger familyDiabetes = [[self.userInfo valueForKey:@"familyDiabetes"] integerValue];
    self.question3YesImg = [UIButton buttonWithType:UIButtonTypeCustom];
    if (familyDiabetes == 1) {
        [self.question3YesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.question3YesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.question3YesImg.frame = CGRectMake(self.highSmokeLbl.frame.origin.x,CGRectGetMaxY(self.question3Lbl.frame) + kAnswer1Lbl_Radio_TopMargin * kYScal, self.hbpYesImg.frame.size.width, self.hbpYesImg.frame.size.height);
    [self.question3YesImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    [self.question3YesImg setTitle:@"有" forState:UIControlStateNormal];
    self.question3YesImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.question3YesImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.question3YesImg.tag = 110;
    [self.question3YesImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.question3YesImg];
    
    self.question3NoImg = [UIButton buttonWithType:UIButtonTypeCustom];
    if (familyDiabetes == 2) {
        [self.question3NoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.question3NoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    
    self.question3NoImg.frame = CGRectMake(CGRectGetMaxX(self.question3YesImg.frame) + kAnswerLbl_YesLbl_RightMargin * kXScal, self.question3YesImg.frame.origin.y, self.hbpNoImg.frame.size.width, self.hbpNoImg.frame.size.height);
    [self.question3NoImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    [self.question3NoImg setTitle:@"无" forState:UIControlStateNormal];
    self.question3NoImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.question3NoImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.question3NoImg.tag = 120;
    [self.question3NoImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.question3NoImg];
    
    //问题四
    self.question4View = [[UIImageView alloc] initWithFrame:CGRectMake(self.question3View.frame.origin.x, CGRectGetMaxY(self.question3YesImg.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal,self.question3View.frame.size.width , self.question3View.frame.size.height)];
    self.question4View.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.infoView addSubview:self.question4View];
    
    self.question4Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question1Lbl.frame.origin.x, 0 ,self.question1Lbl.frame.size.width, self.question1Lbl.frame.size.height)];
    self.question4Lbl.text = @"您家里有没有人出现猝死的情况？";
    self.question4Lbl.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    CGFloat question4_CenterX = CGRectGetMaxX(self.question4View.frame) + kQuestionLbl_LeftMargin * kXScal + self.question1Lbl.frame.size.width/2.0;
    self.question4Lbl.center = CGPointMake(question4_CenterX, self.question4View.center.y);
    self.question4Lbl.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.infoView addSubview:self.question4Lbl];
    
    NSInteger familySuddenDeath = [[self.userInfo valueForKey:@"familySuddenDeath"] integerValue];
    self.question4YesImg = [UIButton buttonWithType:UIButtonTypeCustom];
    if (familySuddenDeath == 1) {
        [self.question4YesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.question4YesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.question4YesImg.frame = CGRectMake(self.question3YesImg.frame.origin.x, CGRectGetMaxY(self.question4Lbl.frame) + kAnswer1Lbl_Radio_TopMargin * kYScal, self.hbpYesImg.frame.size.width, self.hbpYesImg.frame.size.height);
    [self.question4YesImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    [self.question4YesImg setTitle:@"有" forState:UIControlStateNormal];
    self.question4YesImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.question4YesImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.question4YesImg.tag = 130;
    [self.question4YesImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.question4YesImg];

    self.question4NoImg = [UIButton buttonWithType:UIButtonTypeCustom];
    if (familySuddenDeath == 2) {
        [self.question4NoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.question4NoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.question4NoImg.frame = CGRectMake(self.question3NoImg.frame.origin.x, self.question4YesImg.frame.origin.y, self.hbpNoImg.frame.size.width, self.hbpNoImg.frame.size.height);
    [self.question4NoImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    [self.question4NoImg setTitle:@"无" forState:UIControlStateNormal];
    self.question4NoImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.question4NoImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.question4NoImg.tag = 140;
    [self.question4NoImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.question4NoImg];
    
    //问题五
    CGFloat space = self.infoView.frame.size.width - kQuestionView_LeftMargin * kXScal - 2 * (kQuestionView_Width +  kQuestionLbl_LeftMargin + kAnswer1Lbl_Radio_LeftMargin + kRadioBtn_Width +  kAnswer1Lbl_Radio_RightMargin + kAnswer1Lbl_Width) * kXScal - kQuestion5_AnswerLbl_RightMargin * kXScal;
    self.question5View = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.answer1YesLbl.frame) + space, self.question1View.frame.origin.y, kQuestionView_Width * kXScal, kQuestionView_Height * kYScal)];
    self.question5View.backgroundColor = [UIColor colorWithHexString:@"#10A9CB"];
    [self.infoView addSubview:self.question5View];
    
    self.question5Lbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question5View.frame) + kQuestionLbl_LeftMargin * kXScal, self.question1Lbl.frame.origin.y, self.question1Lbl.frame.size.width, self.question1Lbl.frame.size.height)];
    self.question5Lbl.text = @"最近三个月有无以下状况出现？";
    self.question5Lbl.font = [UIFont systemFontOfSize:kQuestionLbl_FontSize * kYScal];
    self.question5Lbl.textColor = [UIColor colorWithHexString:@"#000033"];
    [self.infoView addSubview:self.question5Lbl];
    
    self.question5YesImg = [UIButton buttonWithType:UIButtonTypeCustom];
    NSInteger threeMonthStatus = [[self.userInfo valueForKey:@"threeMonthStatus"] integerValue];
    if (threeMonthStatus == 1) {
        [self.question5YesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.question5YesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    self.question5YesImg.frame = CGRectMake(self.question5Lbl.frame.origin.x + kQuestion3_Radio_LeftMargin * kXScal, CGRectGetMaxY(self.question5Lbl.frame) + kAnswer1Lbl_Radio_TopMargin * kYScal, self.hbpYesImg.frame.size.width, self.hbpYesImg.frame.size.height);
    [self.question5YesImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    [self.question5YesImg setTitle:@"有" forState:UIControlStateNormal];
    self.question5YesImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.question5YesImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.question5YesImg.tag = 150;
    [self.question5YesImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.question5YesImg];
    
    self.question5NoImg = [UIButton buttonWithType:UIButtonTypeCustom];
    self.question5NoImg.frame = CGRectMake(CGRectGetMaxX(self.question5YesImg.frame) + kAnswerLbl_YesLbl_RightMargin * kXScal, self.question5YesImg.frame.origin.y, self.hbpNoImg.frame.size.width, self.hbpNoImg.frame.size.height);
    if (threeMonthStatus == 2) {
        [self.question5NoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.question5NoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    [self.question5NoImg.titleLabel setFont:[UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal]];
    [self.question5NoImg setTitle:@"无" forState:UIControlStateNormal];
    self.question5NoImg.titleEdgeInsets = UIEdgeInsetsMake(0, kQuestion3_Radio_LeftMargin, 0, 0);
    [self.question5NoImg setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
    self.question5NoImg.tag = 160;
    [self.question5NoImg addTarget:self action:@selector(chooseYesOrNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.question5NoImg];
    
    self.question5Num1Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question5Lbl.frame.origin.x, CGRectGetMaxY(self.question5YesImg.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion5_NumLbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5Num1Lbl.text = @"1.";
    self.question5Num1Lbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5Num1Lbl.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    [self.infoView addSubview:self.question5Num1Lbl];

    self.question5SubLbl1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question5Num1Lbl.frame), self.question5Num1Lbl.frame.origin.y, kAnswer1Lbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5SubLbl1.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    self.question5SubLbl1.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5SubLbl1.numberOfLines = 0;
    self.question5SubLbl1.text = @"可能是由于局部缺血造成的疼痛（感觉闷）或不适，在胸部、颈部、下颌、手臂或其他区域；";
    CGSize latestQuestion5Lbl1Size = [self.question5SubLbl1 sizeThatFits:CGSizeMake(kAnswer1Lbl_Width * kXScal, MAXFLOAT)];
    self.question5SubLbl1.frame = CGRectMake(CGRectGetMaxX(self.question5Num1Lbl.frame), self.question5Num1Lbl.frame.origin.y, latestQuestion5Lbl1Size.width, latestQuestion5Lbl1Size.height);
    [self.infoView addSubview:self.question5SubLbl1];
    
    self.question5Num2Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question5Lbl.frame.origin.x, CGRectGetMaxY(self.question5SubLbl1.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion5_NumLbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5Num2Lbl.text = @"2.";
    self.question5Num2Lbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5Num2Lbl.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    [self.infoView addSubview:self.question5Num2Lbl];
    
    self.question5SubLbl2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question5Num1Lbl.frame), self.question5Num2Lbl.frame.origin.y, kAnswer1Lbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5SubLbl2.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    self.question5SubLbl2.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5SubLbl2.numberOfLines = 0;
    self.question5SubLbl2.text = @"呼吸急促，在休息或轻度用力时呼吸困难；";
    CGSize latestQuestion5Lbl2Size = [self.question5SubLbl2 sizeThatFits:CGSizeMake(kAnswer1Lbl_Width * kXScal, MAXFLOAT)];
    self.question5SubLbl2.frame = CGRectMake(CGRectGetMaxX(self.question5Num2Lbl.frame), self.question5Num2Lbl.frame.origin.y, latestQuestion5Lbl2Size.width, latestQuestion5Lbl2Size.height);
    [self.infoView addSubview:self.question5SubLbl2];
    
    self.question5Num3Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question5Lbl.frame.origin.x, CGRectGetMaxY(self.question5SubLbl2.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion5_NumLbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5Num3Lbl.text = @"3.";
    self.question5Num3Lbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5Num3Lbl.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    [self.infoView addSubview:self.question5Num3Lbl];
    
    self.question5SubLbl3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question5Num1Lbl.frame), self.question5Num3Lbl.frame.origin.y, kAnswer1Lbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5SubLbl3.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    self.question5SubLbl3.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5SubLbl3.numberOfLines = 0;
    self.question5SubLbl3.text = @"端坐呼吸困难（坐着都感觉呼吸困难）；";
    CGSize latestQuestion5Lbl3Size = [self.question5SubLbl3 sizeThatFits:CGSizeMake(kAnswer1Lbl_Width * kXScal, MAXFLOAT)];
    self.question5SubLbl3.frame = CGRectMake(CGRectGetMaxX(self.question5Num3Lbl.frame), self.question5Num3Lbl.frame.origin.y, latestQuestion5Lbl3Size.width, latestQuestion5Lbl3Size.height);
    [self.infoView addSubview:self.question5SubLbl3];
    
    self.question5Num4Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question5Lbl.frame.origin.x, CGRectGetMaxY(self.question5SubLbl3.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion5_NumLbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5Num4Lbl.text = @"4.";
    self.question5Num4Lbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5Num4Lbl.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    [self.infoView addSubview:self.question5Num4Lbl];
    
    self.question5SubLbl4 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question5Num1Lbl.frame), self.question5Num4Lbl.frame.origin.y, kAnswer1Lbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5SubLbl4.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    self.question5SubLbl4.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5SubLbl4.numberOfLines = 0;
    self.question5SubLbl4.text = @"踝部水肿；";
    CGSize latestQuestion5Lbl4Size = [self.question5SubLbl4 sizeThatFits:CGSizeMake(kAnswer1Lbl_Width * kXScal, MAXFLOAT)];
    self.question5SubLbl4.frame = CGRectMake(CGRectGetMaxX(self.question5Num4Lbl.frame), self.question5Num4Lbl.frame.origin.y, latestQuestion5Lbl4Size.width, latestQuestion5Lbl4Size.height);
    [self.infoView addSubview:self.question5SubLbl4];
    
    self.question5Num5Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question5Lbl.frame.origin.x, CGRectGetMaxY(self.question5SubLbl4.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion5_NumLbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5Num5Lbl.text = @"5.";
    self.question5Num5Lbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5Num5Lbl.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    [self.infoView addSubview:self.question5Num5Lbl];
    
    self.question5SubLbl5 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question5Num1Lbl.frame), self.question5Num3Lbl.frame.origin.y, kAnswer1Lbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5SubLbl5.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    self.question5SubLbl5.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5SubLbl5.numberOfLines = 0;
    self.question5SubLbl5.text = @"心悸或心动过速；";
    CGSize latestQuestion5Lbl5Size = [self.question5SubLbl5 sizeThatFits:CGSizeMake(kAnswer1Lbl_Width * kXScal, MAXFLOAT)];
    self.question5SubLbl5.frame = CGRectMake(CGRectGetMaxX(self.question5Num5Lbl.frame), self.question5Num5Lbl.frame.origin.y, latestQuestion5Lbl5Size.width, latestQuestion5Lbl5Size.height);
    [self.infoView addSubview:self.question5SubLbl5];
    
    self.question5Num6Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question5Lbl.frame.origin.x, CGRectGetMaxY(self.question5SubLbl5.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion5_NumLbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5Num6Lbl.text = @"6.";
    self.question5Num6Lbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5Num6Lbl.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    [self.infoView addSubview:self.question5Num6Lbl];
    
    self.question5SubLbl6 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question5Num1Lbl.frame), self.question5Num6Lbl.frame.origin.y, kAnswer1Lbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5SubLbl6.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    self.question5SubLbl6.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5SubLbl6.numberOfLines = 0;
    self.question5SubLbl6.text = @"间歇性跛行（有疼痛感，或与供血不足有关的下肢痉挛）；";
    CGSize latestQuestion5Lbl6Size = [self.question5SubLbl6 sizeThatFits:CGSizeMake(kAnswer1Lbl_Width * kXScal, MAXFLOAT)];
    self.question5SubLbl6.frame = CGRectMake(CGRectGetMaxX(self.question5Num6Lbl.frame), self.question5Num6Lbl.frame.origin.y, latestQuestion5Lbl6Size.width, latestQuestion5Lbl6Size.height);
    [self.infoView addSubview:self.question5SubLbl6];
    
    self.question5Num7Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question5Lbl.frame.origin.x, CGRectGetMaxY(self.question5SubLbl6.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion5_NumLbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5Num7Lbl.text = @"7.";
    self.question5Num7Lbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5Num7Lbl.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    [self.infoView addSubview:self.question5Num7Lbl];
    
    self.question5SubLbl7 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question5Num1Lbl.frame), self.question5Num7Lbl.frame.origin.y, kAnswer1Lbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5SubLbl7.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    self.question5SubLbl7.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5SubLbl7.numberOfLines = 0;
    self.question5SubLbl7.text = @"已知的心脏杂音；";
    CGSize latestQuestion5Lbl7Size = [self.question5SubLbl7 sizeThatFits:CGSizeMake(kAnswer1Lbl_Width * kXScal, MAXFLOAT)];
    self.question5SubLbl7.frame = CGRectMake(CGRectGetMaxX(self.question5Num7Lbl.frame), self.question5Num7Lbl.frame.origin.y, latestQuestion5Lbl7Size.width, latestQuestion5Lbl7Size.height);
    [self.infoView addSubview:self.question5SubLbl7];
    
    self.question5Num8Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question5Lbl.frame.origin.x, CGRectGetMaxY(self.question5SubLbl7.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion5_NumLbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5Num8Lbl.text = @"8.";
    self.question5Num8Lbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5Num8Lbl.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    [self.infoView addSubview:self.question5Num8Lbl];
    
    self.question5SubLbl8 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question5Num1Lbl.frame), self.question5Num8Lbl.frame.origin.y, kAnswer1Lbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5SubLbl8.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    self.question5SubLbl8.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5SubLbl8.numberOfLines = 0;
    self.question5SubLbl8.text = @"异常疲劳或日常活动呼吸困难；";
    CGSize latestQuestion5Lbl8Size = [self.question5SubLbl8 sizeThatFits:CGSizeMake(kAnswer1Lbl_Width * kXScal, MAXFLOAT)];
    self.question5SubLbl8.frame = CGRectMake(CGRectGetMaxX(self.question5Num8Lbl.frame), self.question5Num8Lbl.frame.origin.y, latestQuestion5Lbl8Size.width, latestQuestion5Lbl8Size.height);
    [self.infoView addSubview:self.question5SubLbl8];
    
    self.question5Num9Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question5Lbl.frame.origin.x, CGRectGetMaxY(self.question5SubLbl8.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion5_NumLbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5Num9Lbl.text = @"9.";
    self.question5Num9Lbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5Num9Lbl.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    [self.infoView addSubview:self.question5Num9Lbl];
    
    self.question5SubLbl9 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question5Num1Lbl.frame), self.question5Num3Lbl.frame.origin.y, kAnswer1Lbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
    self.question5SubLbl9.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    self.question5SubLbl9.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5SubLbl9.numberOfLines = 0;
    self.question5SubLbl9.text = @"由大脑供血不足引起的头晕或晕厥。";
    CGSize latestQuestion5Lbl9Size = [self.question5SubLbl9 sizeThatFits:CGSizeMake(kAnswer1Lbl_Width * kXScal, MAXFLOAT)];
    self.question5SubLbl9.frame = CGRectMake(CGRectGetMaxX(self.question5Num9Lbl.frame), self.question5Num9Lbl.frame.origin.y, latestQuestion5Lbl9Size.width, latestQuestion5Lbl9Size.height);
    [self.infoView addSubview:self.question5SubLbl9];
    
    self.previousPage = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat left = (kWidth - 2 * kNextBtn_Width * kXScal - kNextBtn_RightMargin * kXScal)/2;
    self.previousPage.frame = CGRectMake(left, CGRectGetMaxY(self.infoView.frame) + kInfoView_BottomMargin * kYScal, kNextBtn_Width * kXScal, kNextBtn_Height * kYScal);
    [self.previousPage setTitle:@"上一页" forState:UIControlStateNormal];
    [self.previousPage setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.previousPage.titleLabel setFont:[UIFont systemFontOfSize:kNextBtn_FontSize * kYScal]];
    self.previousPage.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.previousPage addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgImg addSubview:self.previousPage];
    
    self.nextPage = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextPage.frame = CGRectMake(CGRectGetMaxX(self.previousPage.frame) + kNextBtn_RightMargin * kXScal, self.previousPage.frame.origin.y, kNextBtn_Width * kXScal, kNextBtn_Height * kYScal);
    [self.nextPage setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.nextPage setTitle:@"下一页" forState:UIControlStateNormal];
    [self.nextPage.titleLabel setFont:[UIFont systemFontOfSize:kNextBtn_FontSize * kYScal]];
    self.nextPage.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.nextPage addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgImg addSubview:self.nextPage];
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

- (void)next:(UIButton*)sender {
    PatientRiskLevelViewController *risk = [[PatientRiskLevelViewController alloc] init];
    risk.userInfo = self.userInfo;
    [self.navigationController pushViewController:risk animated:NO];
}

- (void)chooseYesOrNo:(UIButton*)sender {
    NSInteger tag = sender.tag;
    if (tag == 10) {
        [self.answer1YesRadio setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.answer1NoRadio setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@2 forKey:@"sportFrequency"];
    } else if (tag == 20) {
        [self.answer1YesRadio setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.answer1NoRadio setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@1 forKey:@"sportFrequency"];
    } else if (tag == 30) {
        [self.hbpYesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.hbpNoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@1 forKey:@"hasHbp"];
    } else if (tag == 40) {
        [self.hbpYesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.hbpNoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@2 forKey:@"hasHbp"];
    } else if (tag == 50) {
        [self.hbsYesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.hbsNoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@1 forKey:@"hasHbs"];
    } else if (tag == 60) {
        [self.hbsYesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.hbsNoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@2 forKey:@"hasHbs"];
    } else if (tag == 70) {
        [self.hbfYesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.hbfNoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@1 forKey:@"hasHbf"];
    } else if (tag == 80) {
        [self.hbfYesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.hbfNoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@2 forKey:@"hasHbf"];
    } else if (tag == 90) {
        [self.smokeYesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.smokeNoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@1 forKey:@"hasSmoking"];
    } else if (tag == 100) {
        [self.smokeYesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.smokeNoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@2 forKey:@"hasSmoking"];
    } else if (tag == 110) {
        [self.question3YesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.question3NoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@1 forKey:@"familyDiabetes"];
    } else if (tag == 120) {
        [self.question3YesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.question3NoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@2 forKey:@"familyDiabetes"];
    } else if (tag == 130) {
        [self.question4YesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.question4NoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@1 forKey:@"familySuddenDeath"];
    } else if (tag == 140) {
        [self.question4YesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.question4NoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@2 forKey:@"familySuddenDeath"];
    } else if (tag == 150) {
        [self.question5YesImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.question5NoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@1 forKey:@"threeMonthStatus"];
    } else if (tag == 160) {
        [self.question5YesImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
        [self.question5NoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
        [self.userInfo setValue:@2 forKey:@"threeMonthStatus"];
    }
}

@end
