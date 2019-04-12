//
//  HistoryDetailViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/4.
//  Copyright © 2019 dz. All rights reserved.
//

#import "HistoryDetailViewController.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTimeLbl_LeftMargin 15
#define kTimeLbl_FontSize 16.0
#define kTimeLbl_Width 200
#define kTitle_FontSize 22
#define kBackgroundImg_TopMargin 10
#define kBackgroundImg_LeftMargin 15
#define kBackgroundImg_BottomMargin 15
#define kLeftView_TopMargin 50
#define kLeftView_LeftMargin 10
#define kLeftView_RightMargin 10
#define kLeftUnitLbl_RightMargin 10
#define kRightUnitLbl_LeftMargin 10

@interface HistoryDetailViewController ()
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *bgImg; 
@property (nonatomic,strong)UIView *leftView;
@property (nonatomic,strong)UIImageView *finishBgImg;
@property (nonatomic,strong)UILabel *finishLbl;
@property (nonatomic,strong)UILabel *finishValLbl;
@property (nonatomic,strong)UIImageView *headImg;
@property (nonatomic,strong)UILabel *nameLbl;
@property (nonatomic,strong)UILabel *idLbl;
@property (nonatomic,strong)UIView *sportView;
@property (nonatomic,strong)UILabel *avgHRLbl;
@property (nonatomic,strong)UILabel *avgHRValLbl;
@property (nonatomic,strong)UILabel *avgUnitLbl;
@property (nonatomic,strong)UILabel *maxHRLbl;
@property (nonatomic,strong)UILabel *maxHRValLbl;
@property (nonatomic,strong)UILabel *maxUnitLbl;
@property (nonatomic,strong)UILabel *avgSpeedLbl;
@property (nonatomic,strong)UILabel *avgSpeedValLbl;
@property (nonatomic,strong)UILabel *avgSpeedUnitLbl;
@property (nonatomic,strong)UILabel *avgDifficultyLbl;
@property (nonatomic,strong)UILabel *avgDifficultyValLbl;
@property (nonatomic,strong)UILabel *calorieLbl;
@property (nonatomic,strong)UILabel *calorieValLbl;
@property (nonatomic,strong)UILabel *calorieUnitLbl;
@property (nonatomic,strong)UILabel *mileLbl;
@property (nonatomic,strong)UILabel *mileValLbl;
@property (nonatomic,strong)UILabel *mileUnitLbl;
@property (nonatomic,strong)UILabel *timeLbl;
@property (nonatomic,strong)UILabel *timeValLbl;
@property (nonatomic,strong)UIImageView *seperateLine1;
@property (nonatomic,strong)UIImageView *seperateLine2;
@property (nonatomic,strong)UIImageView *seperateLine3;
@property (nonatomic,strong)UIImageView *seperateLine4;
@property (nonatomic,strong)UIImageView *seperateLine5;
@property (nonatomic,strong)UIImageView *seperateLine6;
@end

@implementation HistoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
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
    
    CGFloat titleLbl_LeftMargin = (kWidth - kTimeLbl_Width)/2;
    CGFloat titleLbl_TopMargin = (kNavView_Height - kButton_Height)/2;
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(titleLbl_LeftMargin, titleLbl_TopMargin, kTimeLbl_Width, kButton_Height)];
    self.titleLbl.font = [UIFont systemFontOfSize:kTitle_FontSize];
    self.titleLbl.textColor = [UIColor whiteColor];
    self.titleLbl.textAlignment = NSTextAlignmentCenter;
    self.titleLbl.text = @"运动结果";
    [self.navView addSubview:self.titleLbl];
}

- (void)setupUI {
    UIImage *bgImg = [UIImage imageNamed:@"whiteBg"];
    bgImg = [self imageCompressWithSimple:bgImg scaledToSize:CGSizeMake(kWidth - 2 * kBackgroundImg_LeftMargin * kXScal, kHeight - (CGRectGetMaxY(self.navView.frame) + kBackgroundImg_TopMargin * kYScal + kBackgroundImg_BottomMargin * kYScal))];
    self.bgImg = [[UIImageView alloc] initWithImage:bgImg];
    self.bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(kBackgroundImg_LeftMargin * kXScal, CGRectGetMaxY(self.navView.frame) + kBackgroundImg_TopMargin * kYScal, kWidth - 2 * kBackgroundImg_LeftMargin * kXScal, kHeight - (CGRectGetMaxY(self.navView.frame) + kBackgroundImg_TopMargin * kYScal + kBackgroundImg_BottomMargin * kYScal))];
    [self.view addSubview:self.bgImg];
    self.bgImg.userInteractionEnabled = YES;
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
    [self.navigationController popViewControllerAnimated:YES];
}

@end
