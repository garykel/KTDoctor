//
//  PatientQuestionViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/5/14.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientQuestionViewController.h"

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
@property (nonatomic,strong)UIImageView *hbpYesImg;
@property (nonatomic,strong)UILabel *hbpYesLbl;
@property (nonatomic,strong)UIImageView *hbpNoImg;
@property (nonatomic,strong)UILabel *hbpNoLbl;
@property (nonatomic,strong)UILabel *hbsLbl;//高血糖
@property (nonatomic,strong)UIImageView *hbsYesImg;
@property (nonatomic,strong)UILabel *hbsYesLbl;
@property (nonatomic,strong)UIImageView *hbsNoImg;
@property (nonatomic,strong)UILabel *hbsNoLbl;
@property (nonatomic,strong)UILabel *hbfLbl;//高血脂
@property (nonatomic,strong)UILabel *hbfYesLbl;
@property (nonatomic,strong)UIImageView *hbfYesImg;
@property (nonatomic,strong)UILabel *hbfNoLbl;
@property (nonatomic,strong)UIImageView *hbfNoImg;
@property (nonatomic,strong)UILabel *highSmokeLbl;//吸烟
@property (nonatomic,strong)UIImageView *smokeYesImg;
@property (nonatomic,strong)UILabel *smokeYesLbl;
@property (nonatomic,strong)UIImageView *smokeNoImg;
@property (nonatomic,strong)UILabel *smokeNoLbl;
@property (nonatomic,strong)UIView *question3View;
@property (nonatomic,strong)UILabel *question3Lbl;
@property (nonatomic,strong)UIImageView *question3YesImg;
@property (nonatomic,strong)UILabel *question3YesLbl;
@property (nonatomic,strong)UIImageView *question3NoImg;
@property (nonatomic,strong)UILabel *question3NoLbl;
@property (nonatomic,strong)UIView *question4View;
@property (nonatomic,strong)UILabel *question4Lbl;
@property (nonatomic,strong)UIImageView *question4YesImg;
@property (nonatomic,strong)UILabel *question4YesLbl;
@property (nonatomic,strong)UIImageView *question4NoImg;
@property (nonatomic,strong)UILabel *question4NoLbl;
@property (nonatomic,strong)UIView *question5View;
@property (nonatomic,strong)UILabel *question5Lbl;
@property (nonatomic,strong)UIButton *question5YesImg;
@property (nonatomic,strong)UILabel *question5YesLbl;
@property (nonatomic,strong)UIButton *question5NoImg;
@property (nonatomic,strong)UILabel *question5NoLbl;
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
    if (hasHbp == 1) {
        self.hbpYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.hbpYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.hbpYesImg.frame = CGRectMake(CGRectGetMaxX(self.hbpLbl.frame) + kQuestion2_SubQuestionLbl_RightMargin * kXScal, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat hbpYesImg_centerX = CGRectGetMaxX(self.hbpLbl.frame) + kQuestion2_SubQuestionLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal / 2.0;
    self.hbpYesImg.center = CGPointMake(hbpYesImg_centerX, self.hbpLbl.center.y);
    [self.infoView addSubview:self.hbpYesImg];
    
    self.hbpYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.hbpYesImg.frame) + kQuestion3_Radio_LeftMargin * kXScal, self.hbpLbl.frame.origin.y, kAnswerLbl_YesLbl_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    self.hbpYesLbl.text = @"有";
    self.hbpYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.hbpYesLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.hbpYesLbl];
    
    if (hasHbp == 2) {
        self.hbpNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.hbpNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.hbpNoImg.frame = CGRectMake(CGRectGetMaxX(self.hbpYesLbl.frame) + kAnswerLbl_YesLbl_RightMargin * kXScal, self.hbpYesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.infoView addSubview:self.hbpNoImg];
    
    self.hbpNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.hbpNoImg.frame) + kQuestion3_Radio_RightMargin * kXScal, self.hbpLbl.frame.origin.y, kAnswerLbl_Nol_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    self.hbpNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.hbpNoLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    self.hbpNoLbl.text = @"无";
    [self.infoView addSubview:self.hbpNoLbl];
    
    //高血糖
    self.hbsLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hbpLbl.frame.origin.x, CGRectGetMaxY(self.hbpLbl.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion2_SubQuestionLbl_Width * kXScal, kQuestion2_SubQuestionLbl_Height * kYScal)];
    self.hbsLbl.text = @"高血糖";
    self.hbsLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.hbsLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.hbsLbl];
    NSInteger hasHbs = [[self.userInfo valueForKey:@"hasHbs"] integerValue];
    if (hasHbs == 1) {
        self.hbsYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.hbsYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.hbsYesImg.frame = CGRectMake(0, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat hbsYesImg_CenterX = CGRectGetMaxX(self.hbsLbl.frame) + kQuestion2_SubQuestionLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal/2.0;
    self.hbsYesImg.center = CGPointMake(hbsYesImg_CenterX, self.hbsLbl.center.y);
    [self.infoView addSubview:self.hbsYesImg];
    
    self.hbsYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hbpYesLbl.frame.origin.x, self.hbsLbl.frame.origin.y, kAnswerLbl_YesLbl_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    self.hbsYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.hbsYesLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    self.hbsYesLbl.text = @"有";
    [self.infoView addSubview:self.hbsYesLbl];
    if (hasHbs == 2) {
        self.hbsNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.hbsNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.hbsNoImg.frame = CGRectMake(self.hbpNoImg.frame.origin.x, self.hbsYesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.infoView addSubview:self.hbsNoImg];
    
    self.hbsNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.hbsNoImg.frame) + kQuestion3_Radio_RightMargin * kXScal, self.hbsYesLbl.frame.origin.y, kAnswerLbl_Nol_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    self.hbsNoLbl.text = @"无";
    self.hbsNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.hbsNoLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.hbsNoLbl];
    
    //高血脂
    self.hbfLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hbpLbl.frame.origin.x, CGRectGetMaxY(self.hbsLbl.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion2_SubQuestionLbl_Width * kXScal, kQuestion2_SubQuestionLbl_Height * kYScal)];
    self.hbfLbl.text = @"高血脂";
    self.hbfLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.hbfLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.hbfLbl];
    NSInteger hasHbf = [[self.userInfo valueForKey:@"hasHbf"] integerValue];
    if (hasHbf == 1) {
        self.hbfYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.hbfYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.hbfYesImg.frame = CGRectMake(0, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat hbfYesImg_CenterX = CGRectGetMaxX(self.hbfLbl.frame) + kQuestion2_SubQuestionLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal/2.0;
    self.hbfYesImg.center = CGPointMake(hbfYesImg_CenterX, self.hbfLbl.center.y);
    [self.infoView addSubview:self.hbfYesImg];
    
    self.hbfYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hbsYesLbl.frame.origin.x, self.hbfLbl.frame.origin.y, kAnswerLbl_YesLbl_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    self.hbfYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.hbfYesLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    self.hbfYesLbl.text = @"有";
    [self.infoView addSubview:self.hbfYesLbl];
    if (hasHbf == 2) {
        self.hbfNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.hbfNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.hbfNoImg.frame = CGRectMake(self.hbsNoImg.frame.origin.x, self.hbfYesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.infoView addSubview:self.hbfNoImg];
    
    self.hbfNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hbsNoLbl.frame.origin.x, self.hbfYesLbl.frame.origin.y, kAnswerLbl_Nol_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    self.hbfNoLbl.text = @"无";
    self.hbfNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.hbfNoLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.hbfNoLbl];
    
    //吸烟
    self.highSmokeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hbfLbl.frame.origin.x, CGRectGetMaxY(self.hbfLbl.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion2_SubQuestionLbl_Width * kXScal, kQuestion2_SubQuestionLbl_Height * kYScal)];
    self.highSmokeLbl.text = @"吸   烟";
    self.highSmokeLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.highSmokeLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.highSmokeLbl];
    
    NSInteger hasSmoking = [[self.userInfo valueForKey:@"hasSmoking"] integerValue];
    if (hasSmoking == 1) {
        self.smokeYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.smokeYesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.smokeYesImg.frame = CGRectMake(0, 0, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    CGFloat latestSmokefYesImg_CenterX = CGRectGetMaxX(self.highSmokeLbl.frame) + kQuestion2_SubQuestionLbl_RightMargin * kXScal + kRadioBtn_Width * kXScal/2.0;
    self.smokeYesImg.center = CGPointMake(latestSmokefYesImg_CenterX, self.highSmokeLbl.center.y);
    [self.infoView addSubview:self.smokeYesImg];
    
    self.smokeYesLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hbfYesLbl.frame.origin.x, self.highSmokeLbl.frame.origin.y, kAnswerLbl_YesLbl_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    self.smokeYesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.smokeYesLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    self.smokeYesLbl.text = @"有";
    [self.infoView addSubview:self.smokeYesLbl];
    if (hasSmoking == 2) {
        self.smokeNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.smokeNoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.smokeNoImg.frame = CGRectMake(self.hbfNoImg.frame.origin.x, self.smokeYesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.infoView addSubview:self.smokeNoImg];
    
    self.smokeNoLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.hbfNoLbl.frame.origin.x, self.smokeYesLbl.frame.origin.y, kAnswerLbl_Nol_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    self.smokeNoLbl.text = @"无";
    self.smokeNoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.smokeNoLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.smokeNoLbl];
    
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
    if (familyDiabetes == 1) {
        self.question3YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.question3YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.question3YesImg.frame = CGRectMake(self.highSmokeLbl.frame.origin.x,CGRectGetMaxY(self.question3Lbl.frame) + kAnswer1Lbl_Radio_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.infoView addSubview:self.question3YesImg];
    
    self.question3YesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question3YesImg.frame) + kQuestion3_Radio_RightMargin * kXScal, 0, kAnswerLbl_YesLbl_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    CGFloat latestQuestion3YesLbl_CenterX = CGRectGetMaxX(self.question3YesImg.frame) + kQuestion3_Radio_RightMargin * kXScal + kAnswerLbl_YesLbl_Width /2.0;
    self.question3YesLbl.center = CGPointMake(latestQuestion3YesLbl_CenterX, self.question3YesImg.center.y);
    self.question3YesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question3YesLbl.text = @"有";
    self.question3YesLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.question3YesLbl];
    if (familyDiabetes == 2) {
        self.question3NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.question3NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.question3NoImg.frame = CGRectMake(CGRectGetMaxX(self.question3YesLbl.frame) + kAnswerLbl_YesLbl_RightMargin * kXScal, self.question3YesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.infoView addSubview:self.question3NoImg];
    
    self.question3NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question3NoImg.frame) + kQuestion3_Radio_RightMargin, self.question3YesLbl.frame.origin.y, kAnswerLbl_Nol_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    self.question3NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question3NoLbl.text = @"无";
    self.question3NoLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.question3NoLbl];
    
    //问题四
    self.question4View = [[UIImageView alloc] initWithFrame:CGRectMake(self.question3View.frame.origin.x, CGRectGetMaxY(self.question3YesLbl.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal,self.question3View.frame.size.width , self.question3View.frame.size.height)];
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
    if (familySuddenDeath == 1) {
        self.question4YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.question4YesImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.question4YesImg.frame = CGRectMake(self.question3YesImg.frame.origin.x, CGRectGetMaxY(self.question4Lbl.frame) + kAnswer1Lbl_Radio_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.infoView addSubview:self.question4YesImg];
    
    self.question4YesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question4YesImg.frame) + kQuestion3_Radio_RightMargin * kXScal, 0, kAnswerLbl_YesLbl_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    CGFloat question4YesLbl_CenterX = CGRectGetMaxX(self.question4YesImg.frame) + kQuestion3_Radio_RightMargin * kXScal + kAnswerLbl_YesLbl_Width /2.0;
    self.question4YesLbl.center = CGPointMake(question4YesLbl_CenterX, self.question4YesImg.center.y);
    self.question4YesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question4YesLbl.text = @"有";
    self.question4YesLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.question4YesLbl];

    if (familySuddenDeath == 2) {
        self.question4NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_selected"]];
    } else {
        self.question4NoImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radio_unselected"]];
    }
    self.question4NoImg.frame = CGRectMake(CGRectGetMaxX(self.question4YesLbl.frame) + kQuestion3_YesLbl_RightMargin * kXScal, self.question4YesImg.frame.origin.y, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.infoView addSubview:self.question4NoImg];

    self.question4NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question4NoImg.frame) + kQuestion3_Radio_RightMargin * kXScal, self.question4YesLbl.frame.origin.y, kAnswerLbl_Nol_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    self.question4NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question4NoLbl.text = @"无";
    self.question4NoLbl.font = [UIFont systemFontOfSize:kQuestion2_SubQuestionLbl_FontSize * kYScal];
    [self.infoView addSubview:self.question4NoLbl];
    
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
    self.question5YesImg.frame = CGRectMake(self.question5Lbl.frame.origin.x + kQuestion3_Radio_LeftMargin * kXScal, CGRectGetMaxY(self.question5Lbl.frame) + kAnswer1Lbl_Radio_TopMargin * kYScal, kRadioBtn_Width * kYScal, kRadioBtn_Width * kYScal);
    [self.question5YesImg setTitle:@"有" forState:UIControlStateNormal];
    [self.infoView addSubview:self.question5YesImg];
    
    self.question5YesLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question5YesImg.frame) + kAnswer1Lbl_Radio_RightMargin * kXScal, 0, kAnswerLbl_YesLbl_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    CGFloat latestQuestion5YesLbl_CenterX = CGRectGetMaxX(self.question5YesImg.frame) + kAnswer1Lbl_Radio_RightMargin * kXScal + kAnswerLbl_YesLbl_Width * kXScal /2.0;
    self.question5YesLbl.center = CGPointMake(latestQuestion5YesLbl_CenterX, self.question5YesImg.center.y);
    self.question5YesLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5YesLbl.text = @"有";
    self.question5YesLbl.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    [self.infoView addSubview:self.question5YesLbl];
    
    self.question5NoImg = [UIButton buttonWithType:UIButtonTypeCustom];
    self.question5NoImg.frame = CGRectMake(CGRectGetMaxX(self.question5YesLbl.frame) + kAnswerLbl_YesLbl_RightMargin * kXScal, self.question5YesImg.frame.origin.y, kRadioBtn_Width * kXScal, kRadioBtn_Width * kXScal);
    if (threeMonthStatus == 2) {
        [self.question5NoImg setImage:[UIImage imageNamed:@"radio_selected"] forState:UIControlStateNormal];
    } else {
        [self.question5NoImg setImage:[UIImage imageNamed:@"radio_unselected"] forState:UIControlStateNormal];
    }
    [self.infoView addSubview:self.question5NoImg];
    
    self.question5NoLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.question5NoImg.frame) + kQuestion3_Radio_RightMargin, self.question5YesLbl.frame.origin.y, kAnswerLbl_Nol_Width * kXScal, kAnswerLbl_YesLbl_Height * kYScal)];
    self.question5NoLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.question5NoLbl.text = @"无";
    self.question5NoLbl.font = [UIFont systemFontOfSize:kQuestion5_Lbl_FontSize * kYScal];
    [self.infoView addSubview:self.question5NoLbl];
    
    self.question5Num1Lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.question5Lbl.frame.origin.x, CGRectGetMaxY(self.question5YesLbl.frame) + kQuestion2_SubQuestionLbl_TopMargin * kYScal, kQuestion5_NumLbl_Width * kXScal, kQuestion5_NumLbl_Height * kYScal)];
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
//
//    self.latestQuestion5Lbl22 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl1.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl22.text = @"2.";
//    self.latestQuestion5Lbl22.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl22.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    [self.leftContentView addSubview:self.latestQuestion5Lbl22];
//
//    self.latestQuestion5Lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl1.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl2.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    self.latestQuestion5Lbl2.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl2.text = @"呼吸急促，在休息或轻度用力时呼吸困难；";
//    self.latestQuestion5Lbl2.numberOfLines = 0;
//    CGSize latestQuestion5Lbl2Size = [self.latestQuestion5Lbl2 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
//    self.latestQuestion5Lbl2.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl1.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl2Size.width, latestQuestion5Lbl2Size.height);
//    [self.leftContentView addSubview:self.latestQuestion5Lbl2];
//    self.latestQuestion5Lbl22.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl2.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
//
//    self.latestQuestion5Lbl33 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl2.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl33.text = @"3.";
//    self.latestQuestion5Lbl33.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl33.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    [self.leftContentView addSubview:self.latestQuestion5Lbl33];
//
//    self.latestQuestion5Lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl2.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl3.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    self.latestQuestion5Lbl3.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl3.text = @"端坐呼吸困难（坐着都感觉呼吸困难）；";
//    self.latestQuestion5Lbl3.numberOfLines = 0;
//    CGSize latestQuestion5Lbl3Size = [self.latestQuestion5Lbl3 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
//    self.latestQuestion5Lbl3.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl2.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl3Size.width, latestQuestion5Lbl3Size.height);
//    [self.leftContentView addSubview:self.latestQuestion5Lbl3];
//    self.latestQuestion5Lbl33.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl3.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
//
//    self.latestQuestion5Lbl44 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl3.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl44.text = @"4.";
//    self.latestQuestion5Lbl44.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl44.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    [self.leftContentView addSubview:self.latestQuestion5Lbl44];
//
//    self.latestQuestion5Lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl3.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl4.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    self.latestQuestion5Lbl4.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl4.text = @"踝部水肿；";
//    self.latestQuestion5Lbl4.numberOfLines = 0;
//    CGSize latestQuestion5Lbl4Size = [self.latestQuestion5Lbl4 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
//    self.latestQuestion5Lbl4.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl3.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl4Size.width, latestQuestion5Lbl4Size.height);
//    [self.leftContentView addSubview:self.latestQuestion5Lbl4];
//    self.latestQuestion5Lbl44.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl4.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
//
//    self.latestQuestion5Lbl55 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl4.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl55.text = @"5.";
//    self.latestQuestion5Lbl55.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl55.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    [self.leftContentView addSubview:self.latestQuestion5Lbl55];
//
//    self.latestQuestion5Lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl4.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl5.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    self.latestQuestion5Lbl5.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl5.text = @"心悸或心动过速；";
//    self.latestQuestion5Lbl5.numberOfLines = 0;
//    CGSize latestQuestion5Lbl5Size = [self.latestQuestion5Lbl5 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
//    self.latestQuestion5Lbl5.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl4.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl5Size.width, latestQuestion5Lbl5Size.height);
//    [self.leftContentView addSubview:self.latestQuestion5Lbl5];
//    self.latestQuestion5Lbl55.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl5.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
//
//    self.latestQuestion5Lbl66 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl5.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl66.text = @"6.";
//    self.latestQuestion5Lbl66.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl66.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    [self.leftContentView addSubview:self.latestQuestion5Lbl66];
//
//    self.latestQuestion5Lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl5.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl6.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    self.latestQuestion5Lbl6.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl6.text = @"间歇性跛行（有疼痛感，或与供血不足有关的下肢痉挛）；";
//    self.latestQuestion5Lbl6.numberOfLines = 0;
//    CGSize latestQuestion5Lbl6Size = [self.latestQuestion5Lbl6 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
//    self.latestQuestion5Lbl6.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl5.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl6Size.width, latestQuestion5Lbl6Size.height);
//    [self.leftContentView addSubview:self.latestQuestion5Lbl6];
//    self.latestQuestion5Lbl66.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl6.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
//
//    self.latestQuestion5Lbl77 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl6.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl77.text = @"7.";
//    self.latestQuestion5Lbl77.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl77.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    [self.leftContentView addSubview:self.latestQuestion5Lbl77];
//
//    self.latestQuestion5Lbl7 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl6.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl7.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    self.latestQuestion5Lbl7.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl7.text = @"已知的心脏杂音；";
//    self.latestQuestion5Lbl7.numberOfLines = 0;
//    CGSize latestQuestion5Lbl7Size = [self.latestQuestion5Lbl7 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
//    self.latestQuestion5Lbl7.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl6.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl7Size.width, latestQuestion5Lbl7Size.height);
//    [self.leftContentView addSubview:self.latestQuestion5Lbl7];
//    self.latestQuestion5Lbl77.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl7.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
//
//    self.latestQuestion5Lbl88 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl7.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl88.text = @"8.";
//    self.latestQuestion5Lbl88.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl88.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    [self.leftContentView addSubview:self.latestQuestion5Lbl88];
//
//    self.latestQuestion5Lbl8 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl7.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl8.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    self.latestQuestion5Lbl8.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl8.text = @"异常疲劳或日常活动呼吸困难；";
//    self.latestQuestion5Lbl8.numberOfLines = 0;
//    CGSize latestQuestion5Lbl8Size = [self.latestQuestion5Lbl8 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
//    self.latestQuestion5Lbl8.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl7.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl8Size.width, latestQuestion5Lbl8Size.height);
//    [self.leftContentView addSubview:self.latestQuestion5Lbl8];
//    self.latestQuestion5Lbl88.frame = CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, self.latestQuestion5Lbl8.frame.origin.y, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal);
//
//    self.latestQuestion5Lbl99 = [[UILabel alloc] initWithFrame:CGRectMake(kFifthAnswerLbl_LeftMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl8.frame) + kFifthAnswerLbl_TopMargin * kYScal, kSecondAnswerLbl_Yes_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl99.text = @"9.";
//    self.latestQuestion5Lbl99.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl99.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    [self.leftContentView addSubview:self.latestQuestion5Lbl99];
//
//    self.latestQuestion5Lbl9 = [[UILabel alloc] initWithFrame:CGRectMake(self.latestQuestion5Lbl1.frame.origin.x, CGRectGetMaxY(self.latestQuestion5Lbl8.frame) + kFifthAnswerLbl_BottomMargin * kYScal, kFifthAnswerLbl_Width * kXScal, kAnswerLbl_FontSize * kYScal)];
//    self.latestQuestion5Lbl9.font = [UIFont systemFontOfSize:kAnswerLbl_FontSize * kYScal];
//    self.latestQuestion5Lbl9.textColor = [UIColor colorWithHexString:@"#444444"];
//    self.latestQuestion5Lbl9.text = @"由大脑供血不足引起的头晕或晕厥。";
//    self.latestQuestion5Lbl9.numberOfLines = 0;
//    CGSize latestQuestion5Lbl9Size = [self.latestQuestion5Lbl9 sizeThatFits:CGSizeMake(kFifthAnswerLbl_Width * kXScal, MAXFLOAT)];
//    self.latestQuestion5Lbl9.frame = CGRectMake(CGRectGetMaxX(self.latestQuestion5Lbl11.frame) + kFifthAnswerNoLbl_RightMargin * kXScal, CGRectGetMaxY(self.latestQuestion5Lbl8.frame) + kFifthAnswerLbl_BottomMargin * kYScal, latestQuestion5Lbl9Size.width, latestQuestion5Lbl9Size.height);
//    [self.leftContentView addSubview:self.latestQuestion5Lbl9];
    
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
