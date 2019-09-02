//
//  PatientBaseInfoViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/5/13.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientBaseInfoViewController.h"
#import "PatientQuestionViewController.h"
#import "KTDropDownMenus.h"
#import "UnitTextField.h"
#import "WHC_PhotoListCell.h"
#import "WHC_PictureListVC.h"
#import "WHC_CameraVC.h"
#import "UserModel.h"

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
#define kDropdownHeight 30
#define kLongLbl_Width 95
#define kLongLbl_RightMargin 12
#define kLongLbl_TF_LeftMargin 8
#define kShortTF_Width 176
#define kMaxAlertHr_TF_Width 210
#define kChangeBtn_Width 58
#define kChangeBtn_Height 21
#define kChangeBtn_FontSize 12.0
#define kChangeBtn_LeftMargin 5
#define kMaxAlertHrTF_LeftMargin 24

@interface PatientBaseInfoViewController ()<WHC_CameraVCDelegate,WHC_ChoicePictureVCDelegate,UIImagePickerControllerDelegate,XXTGDropdownMenuDelegate,UITextFieldDelegate>
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
@property (nonatomic,strong)KTDropDownMenus *sexMenu;
@property (nonatomic,strong)UILabel *phoneLbl;
@property (nonatomic,strong)UIImageView *phoneStar;
@property (nonatomic,strong)UnitTextField *phoneTF;
@property (nonatomic,strong)UILabel *birthLbl;
@property (nonatomic,strong)UIImageView *birthStar;
@property (nonatomic,strong)UIButton *birthTF;
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
@property (nonatomic,strong)KTDropDownMenus *hrDeviceTF;
@property (nonatomic,strong)UIButton *changeBtn;
@property (nonatomic,strong)UILabel *maxAlertHrLbl;//最大报警心率
@property (nonatomic,strong)UnitTextField *maxAlertHrTF;
@property (nonatomic,strong)UIButton *nextBtn;
@property (nonatomic,strong)UIImage *selectedImg;
@property (nonatomic,assign)BOOL needUploadImg;
@property (nonatomic,copy)NSString *birthday;
@property (nonatomic,strong)UserModel *user;
@property (nonatomic,strong)NSMutableArray *privateDeviceArr;
@property (nonatomic,copy)NSString *selectedDeviceCode;
@property (nonatomic,assign)BOOL isHaveDian;
@end

@implementation PatientBaseInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.user = [[UserModel sharedUserModel] getCurrentUser];
    self.privateDeviceArr = [NSMutableArray arrayWithObjects:@"无", nil];
    self.selectedDeviceCode = @"";
    self.isHaveDian = NO;
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    NSInteger userId = [[self.userInfo valueForKey:@"userId"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    [self getPrivateHrDevice:parameter];
    
    
    
    self.birthday = [self.userInfo valueForKey:@"birthdate"];
    self.needUploadImg = NO;
    [self setNavBar];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [para setValue:orgCode forKey:@"orgCode"];
    NSInteger userId = [[self.userInfo valueForKey:@"userId"] integerValue];
    [para setValue:@(userId) forKey:@"userId"];
    [para setValue:orgCode forKey:@"orgCode"];
    [para setValue:@14 forKey:@"deviceType"];
    [self getAvailableHrDevice:para];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.sexMenu hiddenCityList];
    [self.hrDeviceTF hiddenCityList];
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
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changePhoto:)];
    self.headImg.userInteractionEnabled = YES;
    [self.headImg addGestureRecognizer:tap];
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
    self.headStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.headStar.frame = CGRectMake(CGRectGetMaxX(self.headLbl.frame) + kHeadLbl_RightMargin * kXScal, 0, kHeadStar_Width * kXScal, kHeadLbl_RightMargin * kXScal);
    self.headStar.center = CGPointMake(CGRectGetMaxX(self.headLbl.frame) + kHeadLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.headLbl.center.y);
    [self.infoView addSubview:self.headView];
    [self.headView addSubview:self.headLbl];
    [self.headView addSubview:self.headStar];
    
    self.nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImg.frame) + kNameLbl_LeftMargin * kXScal, kNameLbl_TopMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.nameLbl.text = @"姓       名";
    self.nameLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.nameLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.nameLbl];
    
    self.nameStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
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
    self.sexLbl.text = @"性       别";
    self.sexLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.sexLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.sexLbl];
    
    self.sexStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.sexStar.frame = CGRectMake(CGRectGetMaxX(self.sexLbl.frame) + kNameLbl_RightMargin * kXScal, self.nameStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.sexStar];
    
    self.sexMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.sexStar.frame) + kNameTF_LeftMargin * kXScal, self.nameTF.frame.origin.y, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    [self.sexMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.sexMenu.defualtStr = @"男";
    self.sexMenu.delegate = self;
    self.sexMenu.titles = @[@"男",@"女"];
    NSString *sexStr = @"男";
    NSInteger sex = [[self.userInfo valueForKey:@"sex"] integerValue];
    if (sex == 1) {
        sexStr = @"男";
    } else if (sex == 2) {
        sexStr = @"女";
    }
    self.sexMenu.mainBtn.titleLabel.text = sexStr;
    [self.sexMenu.mainBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.sexMenu.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.sexMenu];
    
    self.phoneLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x,CGRectGetMaxY(self.nameLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.phoneLbl.text = @"手机号码";
    self.phoneLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.phoneLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.phoneLbl];
    
    self.phoneStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.phoneStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.phoneStar.center = CGPointMake(CGRectGetMaxX(self.phoneLbl.frame) + kNameLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.phoneLbl.center.y);
    [self.infoView addSubview:self.phoneStar];
    
    self.phoneTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.phoneStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.phoneTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.phoneTF.text = [self.userInfo valueForKey:@"mobile"];
    self.phoneTF.backgroundColor = [UIColor whiteColor];
    self.phoneTF.enabled = NO;
    self.phoneTF.center = CGPointMake(CGRectGetMaxX(self.phoneStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal/2.0, self.phoneLbl.center.y);
    [self.infoView addSubview:self.phoneTF];
    
    self.birthLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.phoneTF.frame) + kHorizontalSpace * kXScal, self.phoneLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.birthLbl.text = @"出生日期";
    self.birthLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.birthLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.birthLbl];
    
    self.birthStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.birthStar.frame = CGRectMake(CGRectGetMaxX(self.birthLbl.frame) + kNameLbl_RightMargin * kXScal, self.phoneStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.birthStar];
    
    self.birthTF = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.birthStar.frame) + kNameTF_LeftMargin * kXScal, self.phoneTF.frame.origin.y, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    [self.birthTF setTitle:[self.userInfo valueForKey:@"birthdate"] forState:UIControlStateNormal];
    self.birthTF.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.birthTF.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.birthTF.titleLabel setFont:[UIFont systemFontOfSize:kNameTF_FontSize * kYScal]];
    [self.birthTF setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.birthTF addTarget:self action:@selector(chooseBirthDay:) forControlEvents:UIControlEventTouchUpInside];
    self.birthTF.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.birthTF];
    
    self.heightLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x,CGRectGetMaxY(self.phoneLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.heightLbl.text = @"身       高";
    self.heightLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.heightLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.heightLbl];
    
    self.heightStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.heightStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.heightStar.center = CGPointMake(CGRectGetMaxX(self.heightLbl.frame) + kNameLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.heightLbl.center.y);
    [self.infoView addSubview:self.heightStar];
    
    self.heightTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.heightTF.unitLbl.text = @"cm";
    self.heightTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.heightTF.text = [NSString stringWithFormat:@"%.1f",[[self.userInfo valueForKey:@"height"] floatValue]];
    self.heightTF.backgroundColor = [UIColor whiteColor];
    self.heightTF.delegate = self;
    self.heightTF.center = CGPointMake(CGRectGetMaxX(self.heightStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal/2.0, self.heightLbl.center.y);
    [self.infoView addSubview:self.heightTF];
    
    self.weightLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.heightTF.frame) + kHorizontalSpace * kXScal, self.heightLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.weightLbl.text = @"体       重";
    self.weightLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.weightLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.weightLbl];
    
    self.weightStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.weightStar.frame = CGRectMake(CGRectGetMaxX(self.weightLbl.frame) + kNameLbl_RightMargin * kXScal, self.heightStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.weightStar];
    
    self.weightTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.weightStar.frame) + kNameTF_LeftMargin * kXScal, self.heightTF.frame.origin.y, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.weightTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.weightTF.text = [NSString stringWithFormat:@"%.1f",[[self.userInfo valueForKey:@"weight"] floatValue]];
    self.weightTF.backgroundColor = [UIColor whiteColor];
    self.weightTF.unitLbl.text = @"kg";
    self.weightTF.delegate = self;
    [self.infoView addSubview:self.weightTF];
    
    self.waistlineLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x,CGRectGetMaxY(self.heightLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.waistlineLbl.text = @"腰       围";
    self.waistlineLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.waistlineLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.waistlineLbl];
    
    self.waistlineStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.waistlineStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.waistlineStar.center = CGPointMake(CGRectGetMaxX(self.waistlineLbl.frame) + kNameLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.waistlineLbl.center.y);
    [self.infoView addSubview:self.waistlineStar];
    
    self.waistlineTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.waistlineStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.waistlineTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.waistlineTF.text = [NSString stringWithFormat:@"%.1f",[[self.userInfo valueForKey:@"waistline"] floatValue]];
    self.waistlineTF.backgroundColor = [UIColor whiteColor];
    self.waistlineTF.unitLbl.text = @"cm";
    self.waistlineTF.delegate = self;
    self.waistlineTF.center = CGPointMake(CGRectGetMaxX(self.nameStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal/2.0, self.waistlineLbl.center.y);
    [self.infoView addSubview:self.waistlineTF];
    
    self.kfxtLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.waistlineTF.frame) + kHorizontalSpace * kXScal, self.waistlineLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.kfxtLbl.text = @"空腹血糖";
    self.kfxtLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.kfxtLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.kfxtLbl];
    
    self.kfxtStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.kfxtStar.frame = CGRectMake(CGRectGetMaxX(self.kfxtLbl.frame) + kNameLbl_RightMargin * kXScal, self.waistlineStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.kfxtStar];
    
    self.kfxtTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.kfxtStar.frame) + kNameTF_LeftMargin * kXScal, self.waistlineTF.frame.origin.y, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.kfxtTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.kfxtTF.text = [NSString stringWithFormat:@"%.1f",[[self.userInfo valueForKey:@"fbg"] floatValue]];
    self.kfxtTF.unitLbl.text = @"mmol/L";
    self.kfxtTF.delegate = self;
    self.kfxtTF.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.kfxtTF];
    
    self.quietHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x,CGRectGetMaxY(self.waistlineLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.quietHRLbl.text = @"安静心率";
    self.quietHRLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.quietHRLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.quietHRLbl];
    
    self.quietHRStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.quietHRStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.quietHRStar.center = CGPointMake(CGRectGetMaxX(self.quietHRLbl.frame) + kNameLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.quietHRLbl.center.y);
    [self.infoView addSubview:self.quietHRStar];
    
    self.quietHRTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.quietHRStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.quietHRTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.quietHRTF.text = [NSString stringWithFormat:@"%d",[[self.userInfo valueForKey:@"restHr"] integerValue]];
    self.quietHRTF.backgroundColor = [UIColor whiteColor];
    self.quietHRTF.unitLbl.text = @"bpm";
    self.quietHRTF.delegate = self;
    self.quietHRTF.center = CGPointMake(CGRectGetMaxX(self.quietHRStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal/2.0, self.quietHRLbl.center.y);
    [self.infoView addSubview:self.quietHRTF];
    
    self.xlbyLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.quietHRTF.frame) + kHorizontalSpace * kXScal, self.quietHRLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.xlbyLbl.text = @"心率变异";
    self.xlbyLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.xlbyLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.xlbyLbl];
    
    self.xlbyStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.xlbyStar.frame = CGRectMake(CGRectGetMaxX(self.xlbyLbl.frame) + kNameLbl_RightMargin * kXScal, self.quietHRStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.xlbyStar];
    
    self.xlbyTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.xlbyStar.frame) + kNameTF_LeftMargin * kXScal, self.quietHRTF.frame.origin.y, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.xlbyTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.xlbyTF.text = [NSString stringWithFormat:@"%.1f",[[self.userInfo valueForKey:@"hrv"] floatValue]];
    self.xlbyTF.backgroundColor = [UIColor whiteColor];
    self.xlbyTF.delegate = self;
    [self.infoView addSubview:self.xlbyTF];
    
    self.ssyLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x,CGRectGetMaxY(self.quietHRLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.ssyLbl.text = @"收  缩  压";
    self.ssyLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.ssyLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.ssyLbl];
    
    self.ssyStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.ssyStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.ssyStar.center = CGPointMake(CGRectGetMaxX(self.ssyLbl.frame) + kNameLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.ssyLbl.center.y);
    [self.infoView addSubview:self.ssyStar];
    
    self.ssyTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.ssyStar.frame) + kNameTF_LeftMargin * kXScal, 0, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.ssyTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.ssyTF.text = [NSString stringWithFormat:@"%d",[[self.userInfo valueForKey:@"sbp"] integerValue]];
    self.ssyTF.unitLbl.text = @"mmHg";
    self.ssyTF.backgroundColor = [UIColor whiteColor];
    self.ssyTF.delegate = self;
    self.ssyTF.center = CGPointMake(CGRectGetMaxX(self.ssyStar.frame) + kNameTF_LeftMargin * kXScal + kNameTF_Width * kXScal/2.0, self.ssyLbl.center.y);
    [self.infoView addSubview:self.ssyTF];
    
    self.szyLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.ssyTF.frame) + kHorizontalSpace * kXScal, self.ssyLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.szyLbl.text = @"舒  张  压";
    self.szyLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.szyLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.szyLbl];
    
    self.szyStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.szyStar.frame = CGRectMake(CGRectGetMaxX(self.szyLbl.frame) + kNameLbl_RightMargin * kXScal, self.ssyStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.szyStar];
    
    self.szyTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.szyStar.frame) + kNameTF_LeftMargin * kXScal, self.ssyTF.frame.origin.y, kNameTF_Width * kXScal, kNameTF_Height * kYScal)];
    self.szyTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.szyTF.text = [NSString stringWithFormat:@"%d",[[self.userInfo valueForKey:@"dbp"] integerValue]];
    self.szyTF.unitLbl.text = @"mmHg";
    self.szyTF.delegate = self;
    self.szyTF.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.szyTF];
    
    self.gmdzdbLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x,CGRectGetMaxY(self.ssyLbl.frame) + kNameLbl_BottomMargin * kYScal, kLongLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.gmdzdbLbl.text = @"高密度脂蛋白";
    self.gmdzdbLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.gmdzdbLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.gmdzdbLbl];
    
    self.gmdzdbStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.gmdzdbStar.frame = CGRectMake(0, 0, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    self.gmdzdbStar.center = CGPointMake(CGRectGetMaxX(self.gmdzdbLbl.frame) + kLongLbl_RightMargin * kXScal + kHeadStar_Width * kXScal/2.0, self.gmdzdbLbl.center.y);
    [self.infoView addSubview:self.gmdzdbStar];
    
    self.gmdzdbTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.gmdzdbStar.frame) + kLongLbl_TF_LeftMargin * kXScal, 0, kMaxAlertHr_TF_Width * kXScal, kNameTF_Height * kYScal)];
    self.gmdzdbTF.font = [UIFont systemFontOfSize:kNameTF_FontSize * kYScal];
    self.gmdzdbTF.text = [NSString stringWithFormat:@"%.1f",[[self.userInfo valueForKey:@"hdl"] floatValue]];
    self.gmdzdbTF.backgroundColor = [UIColor whiteColor];
    self.gmdzdbTF.unitLbl.text = @"mmol/L";
    self.gmdzdbTF.delegate = self;
    self.gmdzdbTF.center = CGPointMake(CGRectGetMaxX(self.gmdzdbStar.frame) + kLongLbl_TF_LeftMargin * kXScal + kMaxAlertHr_TF_Width * kXScal/2.0, self.gmdzdbLbl.center.y);
    [self.infoView addSubview:self.gmdzdbTF];
    
    self.hrDeviceLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.sexLbl.frame.origin.x, self.gmdzdbLbl.frame.origin.y, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.hrDeviceLbl.text = @"心  率  带";
    self.hrDeviceLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.hrDeviceLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.infoView addSubview:self.hrDeviceLbl];
    
    self.hrDeviceStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueStar"]];
    self.hrDeviceStar.frame = CGRectMake(CGRectGetMaxX(self.hrDeviceLbl.frame) + kNameLbl_RightMargin * kXScal, self.gmdzdbStar.frame.origin.y, kHeadStar_Width * kXScal, kHeadStar_Width * kXScal);
    [self.infoView addSubview:self.hrDeviceStar];
    
    self.hrDeviceTF = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(self.szyTF.frame.origin.x, self.gmdzdbTF.frame.origin.y, kShortTF_Width * kXScal, kNameTF_Height * kYScal)];
    [self.hrDeviceTF setDropdownHeight:kDropdownHeight * kYScal];
//    self.hrDeviceTF.defualtStr = @"无";
    [self.hrDeviceTF.mainBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.hrDeviceTF.delegate = self;
    self.hrDeviceTF.titles = [self.privateDeviceArr copy];
    self.hrDeviceTF.backgroundColor = [UIColor whiteColor];
    [self.infoView addSubview:self.hrDeviceTF];
    
    self.changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.changeBtn.frame = CGRectMake(CGRectGetMaxX(self.hrDeviceTF.frame) + kChangeBtn_LeftMargin * kXScal, 0, kChangeBtn_Width * kXScal, kChangeBtn_Height * kYScal);
    self.changeBtn.center = CGPointMake(CGRectGetMaxX(self.hrDeviceTF.frame) + kChangeBtn_LeftMargin * kXScal + kChangeBtn_Width * kXScal/2.0, self.hrDeviceTF.center.y);
    [self.changeBtn setTitle:@"更换" forState:UIControlStateNormal];
    self.changeBtn.layer.cornerRadius = 10;
    self.changeBtn.layer.masksToBounds = YES;
    [self.changeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.changeBtn.backgroundColor = [UIColor colorWithHexString:@"#25ABD9"];
    [self.changeBtn.titleLabel setFont:[UIFont systemFontOfSize:kChangeBtn_FontSize * kYScal]];
    [self.changeBtn addTarget:self action:@selector(changePrivateHRDevice:) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView addSubview:self.changeBtn];
    
    self.maxAlertHrLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.gmdzdbLbl.frame.origin.x, CGRectGetMaxY(self.gmdzdbLbl.frame) + kNameLbl_BottomMargin * kYScal, self.gmdzdbLbl.frame.size.width, kNameLbl_Height * kYScal)];
    self.maxAlertHrLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.maxAlertHrLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.maxAlertHrLbl.text = @"最大报警心率";
    [self.infoView addSubview:self.maxAlertHrLbl];
    
    self.maxAlertHrTF = [[UnitTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.maxAlertHrLbl.frame) + kMaxAlertHrTF_LeftMargin * kXScal, 0, kMaxAlertHr_TF_Width * kXScal, kNameTF_Height * kYScal)];
    self.maxAlertHrTF.backgroundColor = [UIColor whiteColor];
    self.maxAlertHrTF.center = CGPointMake(CGRectGetMaxX(self.maxAlertHrLbl.frame) + kMaxAlertHrTF_LeftMargin * kXScal + kMaxAlertHr_TF_Width * kXScal/2.0, self.maxAlertHrLbl.center.y);
    self.maxAlertHrTF.placeholder = @"心率范围50-240";
    self.maxAlertHrTF.unitLbl.text = @"bpm";
    self.maxAlertHrTF.delegate = self;
    self.maxAlertHrTF.text = [NSString stringWithFormat:@"%d",[[self.userInfo valueForKey:@"maxAlarmHr"] integerValue]];
    [self.infoView addSubview:self.maxAlertHrTF];
    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextBtn.frame = CGRectMake((kWidth - kNextBtn_Width * kXScal)/2, CGRectGetMaxY(self.infoView.frame) + kInfoView_BottomMargin * kYScal, kNextBtn_Width * kXScal, kNextBtn_Height * kYScal);
    [self.nextBtn setTitle:@"下一页" forState:UIControlStateNormal];
    [self.nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.nextBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.nextBtn.titleLabel setFont:[UIFont systemFontOfSize:kNextBtn_FontSize * kYScal]];
    [self.nextBtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgImg addSubview:self.nextBtn];
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

- (void)chooseBirthDay:(UIButton*)sender {
    [self hideAllMenus];
    NSLog(@"选择出生日期");
    //    self.hidden = YES;
    __weak typeof (self)weakSelf = self;
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {
        
        NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd"];
        NSLog(@"选择的日期：%@",date);
        [weakSelf.birthTF setTitle:date forState:UIControlStateNormal];
        weakSelf.birthday = date;
        //        weakSelf.hidden = NO;
    }];
    datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.doneButtonColor = [UIColor grayColor];//确定按钮的颜色
    [datepicker show];
}

- (void)changePhoto:(UITapGestureRecognizer*)gesture {
    [self hideAllMenus];
    BOOL useable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    if (useable) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"获取头像"
                                                                       message:@""
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"从相册获取图片" style:UIAlertActionStyleDestructive
                                                             handler:^(UIAlertAction * action) {
                                                                 //响应事件
                                                                 WHC_PictureListVC  * vc = [WHC_PictureListVC new];
                                                                 vc.delegate = self;
                                                                 vc.maxChoiceImageNumberumber = 1;
                                                                 [self.navigationController presentViewController:[[UINavigationController alloc]initWithRootViewController:vc] animated:YES completion:nil];
                                                             }];
        UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"从相机获取图片" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action) {
                                                               //响应事件
                                                               WHC_CameraVC * vc = [WHC_CameraVC new];
                                                               vc.delegate = self;
                                                               [self.navigationController presentViewController:vc animated:YES completion:nil];
                                                           }];
        [alert addAction:saveAction];
        [alert addAction:deleteAction];
        alert.popoverPresentationController.sourceView = self.view;
        alert.popoverPresentationController.sourceRect = CGRectMake(0,0,1.0,1.0);
        [self.navigationController presentViewController:alert animated:YES completion:nil];
    }
}

- (void)changePrivateHRDevice:(UIButton*)sender {
    [self hideAllMenus];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    NSInteger userId = [[self.userInfo valueForKey:@"userId"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    [parameter setValue:self.selectedDeviceCode forKey:@"deviceCode"];
    [self changeUserPrivateHrDevice:parameter];
}

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)next:(UIButton*)sender {
    if (self.nameTF.text.length > 0 && self.phoneTF.text.length > 0 && self.heightTF.text.length > 0 && self.weightTF.text.length > 0 && self.waistlineTF.text.length > 0 && self.kfxtTF.text.length > 0 && self.quietHRTF.text.length > 0 && self.xlbyTF.text.length > 0 && self.ssyTF.text.length > 0 && self.szyTF.text.length > 0 && self.gmdzdbTF.text.length > 0 && self.maxAlertHrTF.text.length > 0) {
        NSMutableDictionary *dict = [self.userInfo mutableCopy];
        [dict setValue:self.nameTF.text forKey:@"name"];
        NSString *sexStr = self.sexMenu.mainBtn.titleLabel.text;
        NSInteger sex = 1;
        if ([sexStr isEqualToString:@"男"]) {
            sex = 1;
        } else if ([sexStr isEqualToString:@"女"]) {
            sex = 2;
        }
        [dict setValue:@(sex) forKey:@"sex"];
        [dict setValue:self.phoneTF.text forKey:@"mobile"];
        [dict setValue:self.birthday forKey:@"birthdate"];
        CGFloat height = [self.heightTF.text floatValue];
        [dict setValue:[NSString stringWithFormat:@"%.1f",height] forKey:@"height"];
        CGFloat weight = [self.weightTF.text floatValue];
        [dict setValue:[NSString stringWithFormat:@"%.1f",weight] forKey:@"weight"];
        CGFloat waistline = [self.waistlineTF.text floatValue];
        [dict setValue:[NSString stringWithFormat:@"%.1f",waistline] forKey:@"waistline"];
        CGFloat fbg = [self.kfxtTF.text floatValue];
        [dict setValue:[NSString stringWithFormat:@"%.1f",fbg] forKey:@"fbg"];
        NSInteger restHr = [self.quietHRTF.text integerValue];
        [dict setValue:@(restHr) forKey:@"restHr"];
        CGFloat hrv = [self.xlbyTF.text floatValue];
        [dict setValue:[NSString stringWithFormat:@"%.1f",hrv] forKey:@"hrv"];
        CGFloat  sbp = [self.ssyTF.text integerValue];
        [dict setValue:@(sbp) forKey:@"sbp"];
        NSInteger dbp = [self.szyTF.text integerValue];
        [dict setValue:@(dbp) forKey:@"dbp"];
        CGFloat hdl = [self.gmdzdbTF.text floatValue];
        [dict setValue:[NSString stringWithFormat:@"%.1f",hdl] forKey:@"hdl"];
        NSInteger maxAlarmHr = [self.maxAlertHrTF.text integerValue];
        [dict setValue:@(maxAlarmHr) forKey:@"maxAlarmHr"];
        self.userInfo = [dict copy];
        NSLog(@"下一页");
        if (self.needUploadImg) {
            [self upLoadImage];
        } else {
            PatientQuestionViewController *question = [[PatientQuestionViewController alloc] init];
            question.userInfo = [self.userInfo mutableCopy];
            [self.navigationController pushViewController:question animated:NO];
        }
    } else {
        [STTextHudTool showText:@"请补齐未填项"];
    }
}

#pragma mark - XXTGDropdownMenuDelegate

- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string
{
    if (menu == self.hrDeviceTF) {
        if ([string isEqualToString:@"无"]) {
            self.selectedDeviceCode = @"";
        } else {
            self.selectedDeviceCode = string;
        }
    }
}

- (void)dropdownMenu:(KTDropDownMenus *)menu mainBtnClick:(UIButton *)sender {
    [self hideOtherMenuExcept:menu];
    if (menu == self.hrDeviceTF) {
        [self.hrDeviceTF.mTableView reloadData];
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        NSDictionary *dict = self.user.organ;
        NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
        NSString *orgCode = orgCodeArr[0];
        [parameter setValue:orgCode forKey:@"orgCode"];
        [parameter setValue:@14 forKey:@"deviceType"];
        [self getAvailableHrDevice:parameter];
    }
}

- (void)hideOtherMenuExcept:(KTDropDownMenus*)menu {
    for (UIView *view in self.infoView.subviews) {
        if ([view isKindOfClass:[KTDropDownMenus class]]) {
            KTDropDownMenus *ktMenu = (KTDropDownMenus*)view;
            if (ktMenu != menu) {
                [ktMenu hiddenCityList];
            }
        }
    }
}

- (void)hideAllMenus {
    for (UIView *view in self.infoView.subviews) {
        if ([view isKindOfClass:[KTDropDownMenus class]]) {
            KTDropDownMenus *ktMenu = (KTDropDownMenus*)view;
            [ktMenu hiddenCityList];
        }
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self hideAllMenus];
}

#pragma mark - WHC_ChoicePictureVCDelegate
- (void)WHCChoicePictureVC:(WHC_ChoicePictureVC *)choicePictureVC didSelectedPhotoArr:(NSArray *)photoArr{
    NSLog(@"photoArr:%@",photoArr);
    if (photoArr.count > 0) {
        UIImage *image = photoArr[0];
        self.headImg.image = image;
        self.selectedImg = image;
        self.needUploadImg = YES;
    }
}

#pragma mark - WHC_CameraVCDelegate
- (void)WHCCameraVC:(WHC_CameraVC *)cameraVC didSelectedPhoto:(UIImage *)photo{
    if (photo) {
        self.headImg.image = photo;
        self.selectedImg = photo;
        self.needUploadImg = YES;
    }
    [self WHCChoicePictureVC:nil didSelectedPhotoArr:@[photo]];
}

- (void)upLoadImage {
    UIImage *image = self.selectedImg;
    NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Portrait.jpg"];
    BOOL success = [UIImageJPEGRepresentation(image, 0.5) writeToFile:jpgPath atomically:YES]; //其中0.5表示压缩比例，1表示不压缩，数值越小压缩比例越大
    if (success) {
        NSLog(@"写入本地成功");
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        [parameter setObject:jpgPath forKey:@"file"];
        [self uploadPhoto:parameter];
    }
}

//上传头像
- (void)uploadPhoto:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kUPLOAD_IMAGE_URL] andParams:parameter andProgress:^(NSProgress *progress) {
        
    } andSucceed:^(NSDictionary *responseObject) {
        long code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"msg is :%@",msg);
        NSLog(@"responseObject is:%@",responseObject);
        if (code == 0) {
            NSDictionary *dataDict = [responseObject valueForKey:@"data"];
            NSString *url = [dataDict valueForKey:@"url"];
            NSLog(@"image url is :%@",url);
            [self.userInfo setValue:url forKey:@"headUrl"];
            NSLog(@"上传成功");
            PatientQuestionViewController *question = [[PatientQuestionViewController alloc] init];
            question.userInfo = weakSelf.userInfo;
            [weakSelf.navigationController pushViewController:question animated:NO];
        }  else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        [STTextHudTool hideSTHud];
        NSLog(@"error :%@",error);
    }];
}

#pragma mark - netWork fuctions
- (void)getPrivateHrDevice:(NSMutableDictionary *)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USER_PRIVATE_DEVICE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSString *error = [responseObject valueForKey:@"error"];
        NSLog(@"private hr device :%@ :%@",responseObject,error);
        if (code == 0) {
            NSArray *privateDevices = [responseObject valueForKey:@"data"];
            if (privateDevices.count > 0) {
                NSDictionary *dict = [privateDevices objectAtIndex:0];
                NSString *deviceCode = [dict valueForKey:@"deviceCode"];
                [weakSelf.hrDeviceTF.mainBtn setTitle:deviceCode forState:UIControlStateNormal];
                [weakSelf.hrDeviceTF.mainBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                weakSelf.hrDeviceTF.defualtStr = deviceCode;
            } else {
                [weakSelf.hrDeviceTF.mainBtn setTitle:@"无" forState:UIControlStateNormal];
                [weakSelf.hrDeviceTF.mainBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [weakSelf.hrDeviceTF.mTableView reloadData];
            }
        } else if (code == 10011) {
            [weakSelf.hrDeviceTF hiddenCityList];
            [weakSelf.sexMenu hiddenCityList];
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [self.navigationController popToRootViewControllerAnimated:NO];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)getAvailableHrDevice:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_AVAILABLE_DEVICE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSString *error = [responseObject valueForKey:@"error"];
        NSLog(@"private hr device :%@ :%@",responseObject,error);
        if (weakSelf.privateDeviceArr.count > 0) {
            [weakSelf.privateDeviceArr removeAllObjects];
        }
        [weakSelf.privateDeviceArr addObject:@"无"];
        if (code == 0) {
            NSArray *privateDevices = [responseObject valueForKey:@"data"];
            if (privateDevices.count > 0) {
                for (NSDictionary *device in privateDevices) {
                    NSString *deviceId = [device valueForKey:@"deviceCode"];
                    if (![weakSelf.privateDeviceArr containsObject:deviceId]) {
                        [weakSelf.privateDeviceArr addObject:deviceId];
                    }
                }
                weakSelf.hrDeviceTF.titles = [weakSelf.privateDeviceArr copy];
                [weakSelf.hrDeviceTF.mTableView reloadData];
            } else {
                [weakSelf.hrDeviceTF.mainBtn setTitle:@"无" forState:UIControlStateNormal];
                [weakSelf.hrDeviceTF.mainBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [weakSelf.hrDeviceTF.mTableView reloadData];
            }
        } else if (code == 10011) {
            [weakSelf.hrDeviceTF hiddenCityList];
            [weakSelf.sexMenu hiddenCityList];
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [self.navigationController popToRootViewControllerAnimated:NO];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)changeUserPrivateHrDevice:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_CHANGE_HR_DEVICE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSString *error = [responseObject valueForKey:@"error"];
        NSLog(@"bind device :%@ :%@",responseObject,error);
        if (code == 0) {
            [STTextHudTool showText:@"成功"];
        } else if (code == 10011) {
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [weakSelf.navigationController popToRootViewControllerAnimated:NO];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text isEqualToString:@"0.0"] || [textField.text isEqualToString:@"0"]) {
        textField.text = @"";
        [STTextHudTool showText:@"输入数字需要大于0"];
    } else {
        if (textField == self.quietHRTF) {
            NSInteger hr = [textField.text integerValue];
            if (hr <= 50) {
                textField.text = @"50";
            } else if (hr >=240) {
                textField.text = @"240";
            }
        } else if (textField == self.maxAlertHrTF) {
            NSInteger alertHr = [self.maxAlertHrTF.text integerValue];
            if (alertHr <= 50) {
                textField.text = @"50";
            } else if (alertHr >= 240) {
                textField.text = @"240";
            }
        }
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == self.quietHRTF || textField == self.ssyTF || textField == self.szyTF || textField == self.maxAlertHrTF) {
        return [self validateInteger:string];
    } else if (textField == self.heightTF || textField == self.weightTF || textField == self.waistlineTF || textField == self.kfxtTF || textField == self.xlbyTF || textField == self.gmdzdbTF) {
        if ([textField.text containsString:@"."]) {
            self.isHaveDian = YES;
        }else{
            self.isHaveDian = NO;
        }
        if (string.length > 0) {
            //当前输入的字符
            unichar single = [string characterAtIndex:0];
            // 不能输入.0-9以外的字符
            if (!((single >= '0' && single <= '9') || single == '.')) return NO;
            // 只能有一个小数点
            if (self.isHaveDian && single == '.') return NO;
            // 如果第一位是.则前面加上0.
            if ((textField.text.length == 0) && (single == '.')) {
                textField.text = @"0";
            }
            // 如果第一位是0则后面必须输入点，否则不能输入。
            if ([textField.text hasPrefix:@"0"]) {
                if (textField.text.length > 1) {
                    NSString *secondStr = [textField.text substringWithRange:NSMakeRange(1, 1)];
                    if (![secondStr isEqualToString:@"."]) return NO;
                }else{
                    if (![string isEqualToString:@"."]) return NO;
                }
            }
            // 小数点后最多能输入两位
            if (self.isHaveDian) {
                NSRange ran = [textField.text rangeOfString:@"."];
                // 由于range.location是NSUInteger类型的，所以这里不能通过(range.location - ran.location)>2来判断
                if (range.location > ran.location) {
                    if ([textField.text pathExtension].length > 1) return NO;
                }
            }
        }
        return YES;
    } else {
        return YES;
    }
}

- (BOOL)validateFloatNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

- (BOOL)validateInteger:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}
@end
