//
//  PatientBaseInfoViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/5/13.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientBaseInfoViewController.h"
#import "UnitTextField.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 150
#define kInfoView_TopMargin 40
#define kInfoView_LeftMargin 20
#define kInfoView_BottomMargin 30
#define kNextBtn_Width 130
#define kNextBtn_Height 30
#define kNextBtn_FontSize 15.0
#define kNextBtn_BottomMargin 35

#define kHeadImg_TopMargin 106
#define kHeadImg_LeftMargin 52
#define kHeadImg_Widht 71
#define kHeadImg_BottomMargin 16
#define kHeadImg_FontSize 15.0
#define kHeadLbl_Width 29
#define kHeadLbl_Height 14
#define kHeadLbl_RightMargin 8
#define kHeadStar_Width 7
#define kNameLbl_TopMargin 47
#define kNameLbl_Width 58
#define kNameLbl_Height 14
#define kNameLbl_FontSize 15.0
#define kNameLbl_RightMargin 12
#define kNameLbl_BottomMargin 34
#define kNameTF_LeftMargin 11
#define kNameTF_Width 236
#define kNameTF_Height 26
#define kNameTF_FontSize 15.0
#define kSexTF_RightMargin 73
#define kLongLbl_Width 88
#define kLongLbl_RightMargin 12
#define kLongLbl_TF_LeftMargin 8
#define kShortTF_Width 176
#define kChangeBtn_Width 58
#define kChangeBtn_Height 21
#define kChangeBtn_FontSize 12.0
#define kChangeBtn_LeftMargin 5
@interface PatientBaseInfoViewController ()
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIView *infoView;
@property (nonatomic,strong)UIImageView *headImg;
@property (nonatomic,strong)UIView *headView;
@property (nonatomic,strong)UILabel *headLbl;//头像
@property (nonatomic,strong)UIImageView *headStar;
@property (nonatomic,strong)UILabel *nameLbl;
@property (nonatomic,strong)UIImageView *nameStar;
@property (nonatomic,strong)UnitTextField *nameTF;
@property (nonatomic,strong)UILabel *sexLbl;
@property (nonatomic,strong)UIImageView *sexStar;
@property (nonatomic,strong)UnitTextField *sexTF;
@property (nonatomic,strong)UILabel *phoneLbl;
@property (nonatomic,strong)UIImageView *phoneStar;
@property (nonatomic,strong)UnitTextField *phoneTF;
@property (nonatomic,strong)UILabel *birthLbl;
@property (nonatomic,strong)UIImageView *birthStar;
@property (nonatomic,strong)UnitTextField *birthTF;
@property (nonatomic,strong)UILabel *heightLbl;
@property (nonatomic,strong)UIImageView *heightStar;
@property (nonatomic,strong)UnitTextField *heightTF;
@property (nonatomic,strong)UILabel *weightLbl;
@property (nonatomic,strong)UIImageView *weightStar;
@property (nonatomic,strong)UnitTextField *weightTF;
@property (nonatomic,strong)UILabel *waistlineLbl;//腰围
@property (nonatomic,strong)UIImageView *waistlineStar;
@property (nonatomic,strong)UnitTextField *waistlineTF;
@property (nonatomic,strong)UILabel *kfxtLbl;//空腹血糖
@property (nonatomic,strong)UIImageView *kfxtStar;
@property (nonatomic,strong)UnitTextField *kfxtTF;
@property (nonatomic,strong)UILabel *quietHRLbl;//安静心率
@property (nonatomic,strong)UIImageView *quietHRStar;
@property (nonatomic,strong)UnitTextField *quietHRTF;
@property (nonatomic,strong)UILabel *xlbyLbl;//心率变异
@property (nonatomic,strong)UIImageView *xlbyStar;
@property (nonatomic,strong)UnitTextField *xlbyTF;
@property (nonatomic,strong)UILabel *ssyLbl;//收缩压
@property (nonatomic,strong)UIImageView *ssyStar;
@property (nonatomic,strong)UnitTextField *ssyTF;
@property (nonatomic,strong)UILabel *szyLbl;//舒张压
@property (nonatomic,strong)UIImageView *szyStar;
@property (nonatomic,strong)UnitTextField *szyTF;
@property (nonatomic,strong)UILabel *gmdzdbLbl;//高密度脂蛋白
@property (nonatomic,strong)UIImageView *gmdzdbStar;
@property (nonatomic,strong)UnitTextField *gmdzdbTF;
@property (nonatomic,strong)UILabel *hrDeviceLbl;//心率带
@property (nonatomic,strong)UIImageView *hrDeviceStar;
@property (nonatomic,strong)UnitTextField *hrDeviceTF;
@property (nonatomic,strong)UIButton *changeBtn;
@property (nonatomic,strong)UILabel *maxAlertHr;//最大报警心率
@property (nonatomic,strong)UITextField *maxAlertHrTF;
@property (nonatomic,strong)UIButton *nextBtn;
@end

@implementation PatientBaseInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    self.headImg = [[UIImageView alloc] init];
    self.headImg.frame = CGRectMake(kHeadImg_LeftMargin *kXScal, kHeadImg_TopMargin * kYScal, kHeadImg_Widht * kYScal, kHeadImg_Widht * kYScal);
    NSString *headUrl = [self.userInfo valueForKey:@"headUrl"];
    self.headImg.layer.cornerRadius = kHeadImg_Widht * kYScal/2.0;
    self.headImg.layer.masksToBounds = YES;
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
    [self.infoView addSubview:self.headImg];
    
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(self.headImg.frame.origin.x, CGRectGetMaxY(self.headImg.frame) + kHeadImg_BottomMargin * kYScal, self.headImg.frame.size.width, kHeadLbl_Height * kYScal)];
    self.headView.backgroundColor = [UIColor clearColor];
    
    self.headLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kHeadLbl_Width * kXScal, kHeadLbl_Height * kYScal)];
    self.headLbl.text = @"头像";
    self.headLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.headLbl.numberOfLines = 1;
    CGSize size = [self.headLbl sizeThatFits:CGSizeMake(MAXFLOAT, kHeadLbl_Height * kYScal)];
    self.headLbl.frame = CGRectMake(0, 0, size.width, size.height);
    CGFloat totalWidth = kHeadLbl_Width * kXScal + kHeadLbl_RightMargin * kYScal + kHeadStar_Width * kXScal;
    self.headView.frame = CGRectMake(0, 0, totalWidth, kHeadLbl_Height * kYScal);
    [self.infoView addSubview:self.headView];
    [self.headView addSubview:self.headLbl];
    [self.headView addSubview:self.headStar];
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

#pragma mark - netWork fuctions

@end
