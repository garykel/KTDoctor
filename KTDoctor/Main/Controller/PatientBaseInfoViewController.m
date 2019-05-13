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
#define kHeadLbl_FontSize 15.0
#define kHeadLbl_Width 29
#define kHeadLbl_Height 14
#define kHeadLbl_RightMargin 8
#define kHeadStar_Width 7
#define kNameLbl_TopMargin 47
#define kNameLbl_LeftMargin 67
#define kNameLbl_Width 65
#define kNameLbl_Height 14
#define kNameLbl_FontSize 15.0
#define kNameLbl_RightMargin 12
#define kNameLbl_BottomMargin 34
#define kNameTF_LeftMargin 11
#define kNameTF_Width 236
#define kNameTF_Height 26
#define kNameTF_FontSize 15.0
#define kHorizontalSpace 75
#define kSexTF_RightMargin 73
#define kLongLbl_Width 95
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
    
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.headImg.frame.size.width, kHeadLbl_Height * kYScal)];
    self.headView.backgroundColor = [UIColor clearColor];
    
    self.headLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kHeadLbl_Width * kXScal, kHeadLbl_Height * kYScal)];
    self.headLbl.text = @"头像";
    self.headLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.headLbl.numberOfLines = 1;
    self.headLbl.font = [UIFont systemFontOfSize:kHeadLbl_FontSize * kYScal];
    CGSize size = [self.headLbl sizeThatFits:CGSizeMake(MAXFLOAT, kHeadLbl_Height * kYScal)];
    self.headLbl.frame = CGRectMake(0, 0, size.width, size.height);
    
    CGFloat totalWidth = kHeadLbl_Width * kXScal + kHeadLbl_RightMargin * kYScal + kHeadStar_Width * kXScal;
    self.headView.frame = CGRectMake(0, 0, totalWidth, kHeadLbl_Height * kYScal);
    self.headView.center = CGPointMake(self.headImg.center.x, CGRectGetMaxY(self.headImg.frame) + kHeadImg_BottomMargin * kYScal + kHeadLbl_Height * kYScal/2.0);
    self.headStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.headStar.frame = CGRectMake(CGRectGetMaxX(self.headLbl.frame) + kHeadLbl_RightMargin * kXScal, 0, kHeadStar_Width * kXScal, kHeadLbl_RightMargin * kXScal);
    self.headStar.center = CGPointMake(CGRectGetMaxX(self.headLbl.frame) + kHeadLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.headLbl.center.y);
    [self.infoView addSubview:self.headView];
    [self.headView addSubview:self.headLbl];
    [self.headView addSubview:self.headStar];
    
    self.nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImg.frame) + kNameLbl_LeftMargin * kXScal, kNameLbl_TopMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.nameLbl.text = @"姓      名";
    self.nameLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.nameLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.nameLbl];
    
    self.nameStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.nameStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.nameStar.center = CGPointMake(CGRectGetMaxX(self.nameLbl.frame) + kNameLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.nameLbl.center.y);
    [self.infoView addSubview:self.nameStar];
    
    self.nameTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.nameTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.nameTF.text = [self.userInfo valueForKey:@"name"];
    self.nameTF.backgroundColor = [UIColor whiteColor];
    self.nameTF.center = CGPointMake(CGRectGetMaxX(self.nameStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal/2.0, self.nameLbl.center.y);
    [self.infoView addSubview:self.nameTF];
    
    self.sexLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameTF.frame) + kHorizontalSpace * kXScal, self.nameLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.sexLbl.text = @"性      别";
    self.sexLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.sexLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.sexLbl];
    
    self.sexStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.sexStar.frame = CGRectMake(CGRectGetMaxX(self.sexLbl.frame) + kNameLbl_RightMargin * kXScal, self.nameStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.sexStar];
    
    self.sexTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.sexStar.frame) + kNameTF_LeftMargin * kXScal, self.nameTF.frame.origin.y, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.sexTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.sexTF.text = @"男";
    self.sexTF.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.sexTF];
    
    self.phoneLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x,CGRectGetMaxY(self.nameLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.phoneLbl.text = @"手机号码";
    self.phoneLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.phoneLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.phoneLbl];
    
    self.phoneStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.phoneStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.phoneStar.center = CGPointMake(CGRectGetMaxX(self.phoneLbl.frame) + kNameLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.phoneLbl.center.y);
    [self.infoView addSubview:self.phoneStar];
    
    self.phoneTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.phoneStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.phoneTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.phoneTF.text = [self.userInfo valueForKey:@"mobile"];
    self.phoneTF.backgroundColor = [UIColor whiteColor];
    self.phoneTF.center = CGPointMake(CGRectGetMaxX(self.phoneStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal/2.0, self.phoneLbl.center.y);
    [self.infoView addSubview:self.phoneTF];
    
    self.birthLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.phoneTF.frame) + kHorizontalSpace * kXScal, self.phoneLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.birthLbl.text = @"出生日期";
    self.birthLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.birthLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.birthLbl];
    
    self.birthStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.birthStar.frame = CGRectMake(CGRectGetMaxX(self.birthLbl.frame) + kNameLbl_RightMargin * kXScal, self.phoneStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.birthStar];
    
    self.birthTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.birthStar.frame) + kNameTF_LeftMargin * kXScal, self.phoneTF.frame.origin.y, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.birthTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.birthTF.text = [self.userInfo valueForKey:@"birthdate"];
    self.birthTF.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.birthTF];
    
    self.heightLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x,CGRectGetMaxY(self.phoneLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.heightLbl.text = @"身      高";
    self.heightLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.heightLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.heightLbl];
    
    self.heightStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.heightStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.heightStar.center = CGPointMake(CGRectGetMaxX(self.nameLbl.frame) + kNameLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.nameLbl.center.y);
    [self.infoView addSubview:self.heightStar];
    
    self.heightTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.heightTF.unit = @"cm";
    self.heightTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.heightTF.text = [NSString stringWithFormat:@"%.1f",[[self.userInfo valueForKey:@"height"] floatValue]];
    self.heightTF.backgroundColor = [UIColor whiteColor];
    self.heightTF.center = CGPointMake(CGRectGetMaxX(self.heightStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal/2.0, self.heightLbl.center.y);
    [self.infoView addSubview:self.heightTF];
    
    self.weightLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.heightTF.frame) + kHorizontalSpace * kXScal, self.heightLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.weightLbl.text = @"体      重";
    self.weightLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.weightLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.weightLbl];
    
    self.weightStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.weightStar.frame = CGRectMake(CGRectGetMaxX(self.weightLbl.frame) + kNameLbl_RightMargin * kXScal, self.heightStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.weightStar];
    
    self.weightTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.weightStar.frame) + kNameTF_LeftMargin * kXScal, self.heightTF.frame.origin.y, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.weightTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.weightTF.text = [NSString stringWithFormat:@"%.1f",[[self.userInfo valueForKey:@"weight"] floatValue]];
    self.weightTF.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.weightTF];
    
    self.waistlineLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x,CGRectGetMaxY(self.heightLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.waistlineLbl.text = @"腰      围";
    self.waistlineLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.waistlineLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.waistlineLbl];
    
    self.waistlineStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.waistlineStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.waistlineStar.center = CGPointMake(CGRectGetMaxX(self.waistlineLbl.frame) + kNameLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.waistlineLbl.center.y);
    [self.infoView addSubview:self.waistlineStar];
    
    self.waistlineTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.waistlineStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.waistlineTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.waistlineTF.text = [NSString stringWithFormat:@"%.1f",[[self.userInfo valueForKey:@"waistline"] floatValue]];
    self.waistlineTF.backgroundColor = [UIColor whiteColor];
    self.waistlineTF.center = CGPointMake(CGRectGetMaxX(self.nameStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal/2.0, self.waistlineLbl.center.y);
    [self.infoView addSubview:self.waistlineTF];
    
    self.kfxtLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.waistlineTF.frame) + kHorizontalSpace * kXScal, self.waistlineLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.kfxtLbl.text = @"空腹血糖";
    self.kfxtLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.kfxtLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.kfxtLbl];
    
    self.kfxtStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.kfxtStar.frame = CGRectMake(CGRectGetMaxX(self.kfxtLbl.frame) + kNameLbl_RightMargin * kXScal, self.waistlineStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.kfxtStar];
    
    self.kfxtTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.kfxtStar.frame) + kNameTF_LeftMargin * kXScal, self.waistlineTF.frame.origin.y, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.kfxtTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.kfxtTF.text = @"男";
    self.kfxtTF.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.kfxtTF];
    
    self.quietHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x,CGRectGetMaxY(self.waistlineLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.quietHRLbl.text = @"安静心率";
    self.quietHRLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.quietHRLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.quietHRLbl];
    
    self.quietHRStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.quietHRStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.quietHRStar.center = CGPointMake(CGRectGetMaxX(self.quietHRLbl.frame) + kNameLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.quietHRLbl.center.y);
    [self.infoView addSubview:self.quietHRStar];
    
    self.quietHRTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.quietHRStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.quietHRTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.quietHRTF.text = [self.userInfo valueForKey:@"name"];
    self.quietHRTF.backgroundColor = [UIColor whiteColor];
    self.quietHRTF.center = CGPointMake(CGRectGetMaxX(self.quietHRStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal/2.0, self.quietHRLbl.center.y);
    [self.infoView addSubview:self.quietHRTF];
    
    self.xlbyLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.quietHRTF.frame) + kHorizontalSpace * kXScal, self.quietHRLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.xlbyLbl.text = @"心率变异";
    self.xlbyLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.xlbyLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.xlbyLbl];
    
    self.xlbyStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.xlbyStar.frame = CGRectMake(CGRectGetMaxX(self.xlbyLbl.frame) + kNameLbl_RightMargin * kXScal, self.quietHRStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.xlbyStar];
    
    self.xlbyTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.xlbyStar.frame) + kNameTF_LeftMargin * kXScal, self.quietHRTF.frame.origin.y, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.xlbyTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.xlbyTF.text = @"男";
    self.xlbyTF.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.xlbyTF];
    
    self.ssyLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x,CGRectGetMaxY(self.quietHRLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.ssyLbl.text = @"收 缩 压";
    self.ssyLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.ssyLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.ssyLbl];
    
    self.ssyStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.ssyStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.ssyStar.center = CGPointMake(CGRectGetMaxX(self.ssyLbl.frame) + kNameLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.ssyLbl.center.y);
    [self.infoView addSubview:self.ssyStar];
    
    self.ssyTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.ssyStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.ssyTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.ssyTF.text = [self.userInfo valueForKey:@"name"];
    self.ssyTF.backgroundColor = [UIColor whiteColor];
    self.ssyTF.center = CGPointMake(CGRectGetMaxX(self.ssyStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal/2.0, self.ssyLbl.center.y);
    [self.infoView addSubview:self.ssyTF];
    
    self.szyLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.ssyTF.frame) + kHorizontalSpace * kXScal, self.ssyLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.szyLbl.text = @"舒 张 压";
    self.szyLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.szyLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.szyLbl];
    
    self.szyStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.szyStar.frame = CGRectMake(CGRectGetMaxX(self.szyLbl.frame) + kNameLbl_RightMargin * kXScal, self.ssyStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.szyStar];
    
    self.szyTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.szyStar.frame) + kNameTF_LeftMargin * kXScal, self.ssyTF.frame.origin.y, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.szyTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.szyTF.text = @"男";
    self.szyTF.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.szyTF];
    
    self.gmdzdbLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x,CGRectGetMaxY(self.ssyLbl.frame) + kNameLbl_BottomMargin * kYScal, kLongLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.gmdzdbLbl.text = @"高密度脂蛋白";
    self.gmdzdbLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.gmdzdbLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.gmdzdbLbl];
    
    self.gmdzdbStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.gmdzdbStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.gmdzdbStar.center = CGPointMake(CGRectGetMaxX(self.gmdzdbLbl.frame) + kLongLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.gmdzdbLbl.center.y);
    [self.infoView addSubview:self.gmdzdbStar];
    
    self.gmdzdbTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.gmdzdbStar.frame) + kLongLbl_TF_LeftMargin * kXScal, 0, kShortTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.gmdzdbTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.gmdzdbTF.text = [self.userInfo valueForKey:@"name"];
    self.gmdzdbTF.backgroundColor = [UIColor whiteColor];
    self.gmdzdbTF.center = CGPointMake(CGRectGetMaxX(self.gmdzdbStar.frame) + kLongLbl_TF_LeftMargin * kXScal + kShortTF_Width * kXScal/2.0, self.gmdzdbLbl.center.y);
    [self.infoView addSubview:self.gmdzdbTF];
    
    self.hrDeviceLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.sexLbl.frame.origin.x, self.gmdzdbLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.hrDeviceLbl.text = @"心 率 带";
    self.hrDeviceLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.hrDeviceLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.hrDeviceLbl];
    
    self.hrDeviceStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.hrDeviceStar.frame = CGRectMake(CGRectGetMaxX(self.hrDeviceLbl.frame) + kNameLbl_RightMargin * kXScal, self.gmdzdbStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.hrDeviceStar];
    
    self.hrDeviceTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.hrDeviceStar.frame) + kNameTF_LeftMargin * kXScal, self.gmdzdbTF.frame.origin.y, kShortTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.hrDeviceTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.hrDeviceTF.text = @"男";
    self.hrDeviceTF.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.hrDeviceTF];
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
