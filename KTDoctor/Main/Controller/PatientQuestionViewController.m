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
#define kQuestionLbl_Width 150
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
#define kQuestion2_SubQuestionLbl_RightMargin 18
#define kQuestion2_SubQuestionLbl_FontSize 12.0
#define kQuestion2_SubQuestionLbl_Height 12.0
#define kQuestion2_SubQuestionLbl_Width 36
#define kAnswerLbl_YesLbl_Width 11
#define kAnswerLbl_YesLbl_Height 11
#define kAnswerLbl_Nol_Width 12
#define kAnswerLbl_NoLbl_Height 11
#define kQuestion3_Radio_LeftMargin 6
#define kQuestion3_Radio_RightMargin 6
#define kQuestion3_Radio_TopMargin 16
#define kQuestion3_YesLbl_RightMargin 20
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
