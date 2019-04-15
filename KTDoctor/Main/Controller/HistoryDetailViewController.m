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
#define kLeftView_BottomMargin 30
#define kLeftView_LeftMargin 10
#define kLeftView_RightMargin 10
#define kLeftView_Width 250
#define kHeadImg_TopMargin 15
#define kHeadImg_LeftMargin 40
#define kHeadImg_Width 47
#define kNameLbl_LeftMargin 7
#define kNameLbl_BottomMargin 5
#define kNameLbl_Height 15
#define kNameLbl_Width 100
#define kNameLbl_FontSize 15
#define kFinishImg_Width 55
#define kFinishImg_RightMargin 6
#define kFinishImg_TopMargin 22
#define kFinishLbl_Height 12
#define kFinishLbl_BottomMargin 6
#define kFinishLbl_FontSize 12
#define kSportView_TopMargin 12
#define kSportView_LeftMargin 6
#define kSportView_BottomMargin 15
#define kLeftUnitLbl_RightMargin 10
#define kRightUnitLbl_LeftMargin 10
#define kLineCharView_TopMargin 10
#define kLineCharView_BottomMargin 20
#define kLeftUnitImg_Width 18
#define kLeftUnitImg_RightMargin 10
#define kLeftUnitImg_Height 84
#define kRightUnitImg_Width 17
#define kRightUnitImg_Height 87
#define kSeperateLine_Height 2
#define kCellLbl_LeftMargin 6
#define kCellLbl_Space 10
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
@property (nonatomic,strong)UIImageView *leftUnitImg;
@property (nonatomic,strong)UIImageView *rightUnitImg;
@property (nonatomic,strong)UIView *lineChartView;
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
    self.bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(kBackgroundImg_LeftMargin * kXScal, CGRectGetMaxY(self.navView.frame) + kBackgroundImg_TopMargin * kYScal, kWidth - 2 * kBackgroundImg_LeftMargin * kXScal, kHeight - (CGRectGetMaxY(self.navView.frame) + kBackgroundImg_TopMargin * kYScal + kBackgroundImg_BottomMargin * kYScal))];
    self.bgImg.image = bgImg;
    [self.view addSubview:self.bgImg];
    self.bgImg.userInteractionEnabled = YES;
    
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(kLeftView_LeftMargin * kXScal, kLeftView_TopMargin * kYScal, kLeftView_Width, self.bgImg.frame.size.height - kLeftView_TopMargin * kYScal - kLeftView_BottomMargin * kYScal)];
    self.leftView.backgroundColor = [UIColor colorWithHexString:@"#d1f3f8"];
    [self.bgImg addSubview:self.leftView];
    
    CGFloat finishImgLeftMargin = self.leftView.frame.size.width - (kFinishImg_Width - kFinishImg_RightMargin) * kXScal;
    self.finishBgImg = [[UIImageView alloc] initWithFrame:CGRectMake(finishImgLeftMargin, -kFinishImg_TopMargin * kYScal, kFinishImg_Width * kYScal, kFinishImg_Width * kYScal)];
    self.finishBgImg.image = [UIImage imageNamed:@"finish"];
    [self.leftView addSubview:self.finishBgImg];
    
    CGFloat finishLbl_TopMargin = (kFinishImg_Width * kYScal - 2 * kFinishLbl_Height * kYScal - kFinishLbl_BottomMargin * kYScal)/2;
    self.finishLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, finishLbl_TopMargin, self.finishBgImg.frame.size.width, kFinishLbl_Height * kYScal)];
    self.finishLbl.textColor = [UIColor blackColor];
    self.finishLbl.text = @"完成度";
    self.finishLbl.textAlignment = NSTextAlignmentCenter;
    self.finishLbl.font = [UIFont systemFontOfSize:kFinishLbl_FontSize * kYScal];
    [self.finishBgImg addSubview:self.finishLbl];
    
    self.finishValLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.finishLbl.frame) + kFinishLbl_BottomMargin * kYScal, self.finishBgImg.frame.size.width, kFinishLbl_Height * kYScal)];
    self.finishValLbl.textAlignment = NSTextAlignmentCenter;
    self.finishValLbl.textColor = [UIColor blackColor];
    self.finishValLbl.text = @"0%";
    self.finishValLbl.font = [UIFont systemFontOfSize:kFinishLbl_FontSize * kYScal];
    [self.finishBgImg addSubview:self.finishValLbl];
    
    self.headImg = [[UIImageView alloc] initWithFrame:CGRectMake(kHeadImg_LeftMargin * kXScal, kHeadImg_TopMargin * kYScal, kHeadImg_Width * kYScal, kHeadImg_Width * kYScal)];
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:[self.sportDict valueForKey:@"headUrl"]] placeholderImage:[UIImage imageNamed:@"default_head"]];
    self.headImg.layer.cornerRadius = kHeadImg_Width * kYScal / 2.0;
    self.headImg.layer.masksToBounds = YES;
    [self.leftView addSubview:self.headImg];
    
    CGFloat nameLbl_TopMargin = (kHeadImg_Width * kYScal - 2 * kNameLbl_Height * kYScal - kNameLbl_BottomMargin * kYScal)/2;
    self.nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImg.frame) + kNameLbl_LeftMargin * kXScal,self.headImg.frame.origin.y + nameLbl_TopMargin, kNameLbl_Width * kXScal, kNameLbl_Height *kYScal)];
    self.nameLbl.textColor = [UIColor blackColor];
    self.nameLbl.text = [self.sportDict valueForKey:@"name"];
    [self.leftView addSubview:self.nameLbl];
    
    self.idLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x, CGRectGetMaxY(self.nameLbl.frame) + kNameLbl_BottomMargin * kYScal, kNameLbl_Width * kXScal, kNameLbl_Height * kYScal)];
    self.idLbl.text = [NSString stringWithFormat:@"ID : %@",[self.sportDict valueForKey:@"userId"]];
    [self.leftView addSubview:self.idLbl];
    
    self.sportView = [[UIView alloc] initWithFrame:CGRectMake(kSportView_LeftMargin * kXScal,CGRectGetMaxY(self.idLbl.frame) + kSportView_TopMargin * kYScal, self.leftView.frame.size.width - 2 * kSportView_LeftMargin * kXScal, self.leftView.frame.size.height - CGRectGetMaxY(self.headImg.frame) - kSportView_TopMargin * kYScal - kSportView_BottomMargin * kYScal)];
    self.sportView.layer.cornerRadius = 4;
    self.sportView.layer.masksToBounds = YES;
    self.sportView.backgroundColor = [UIColor colorWithHexString:@"#e4f7f8"];
    [self.leftView addSubview:self.sportView];
    
    CGFloat cellHeight = (self.sportView.frame.size.height - 6 * kSeperateLine_Height * kYScal)/7;
    CGFloat lblWidth = (self.sportView.frame.size.width - 2 * kCellLbl_Space)/3;
    self.avgHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(kCellLbl_LeftMargin * kXScal, 0,lblWidth, cellHeight)];
    self.avgHRLbl.text = @"平均心率";
    self.avgHRLbl.textColor = [UIColor blackColor];
    [self.sportView addSubview:self.avgHRLbl];
    
    self.avgHRValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgHRLbl.frame) + kCellLbl_Space * kXScal, 0, lblWidth, cellHeight)];
    self.avgHRValLbl.textColor = [UIColor blackColor];
    NSDictionary *sportData = [self.sportDict valueForKey:@"sportData"];
    NSInteger avgHr = [[sportData valueForKey:@"avgHr"] integerValue];
    self.avgHRValLbl.text = [NSString stringWithFormat:@"%d",avgHr];
    self.avgHRValLbl.textAlignment = NSTextAlignmentCenter;
    [self.sportView addSubview:self.avgHRValLbl];
    
    self.avgUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgHRValLbl.frame) + kCellLbl_Space * kXScal, self.avgHRValLbl.frame.origin.y, lblWidth, cellHeight)];
    self.avgUnitLbl.textColor = [UIColor blackColor];
    self.avgUnitLbl.text = @"bpm";
    [self.sportView addSubview:self.avgUnitLbl];
        
    CGFloat leftUnitImg_TopMargin = (self.bgImg.frame.size.height - kLineCharView_TopMargin * kYScal - kLineCharView_BottomMargin * kYScal - kLeftUnitImg_Height * kYScal)/2;
    self.leftUnitImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.leftView.frame) + kLeftView_RightMargin * kXScal, leftUnitImg_TopMargin, kLeftUnitImg_Width * kXScal, kLeftUnitImg_Height * kYScal)];
    self.leftUnitImg.image = [UIImage imageNamed:@"leftUnit"];
    [self.bgImg addSubview:self.leftUnitImg];
    
    CGFloat lineChartView_Width = self.bgImg.frame.size.width - CGRectGetMaxX(self.leftUnitImg.frame) - kLeftUnitImg_RightMargin * kXScal - 2 * kRightUnitLbl_LeftMargin * kXScal - kRightUnitImg_Width * kXScal;
    CGFloat lineChartView_Height = self.bgImg.frame.size.height - kLineCharView_TopMargin * kYScal - kLineCharView_BottomMargin * kYScal;
    self.lineChartView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.leftUnitImg.frame) + kLeftUnitImg_RightMargin * kXScal, kLineCharView_TopMargin * kYScal, lineChartView_Width, lineChartView_Height)];
    self.lineChartView.backgroundColor = [UIColor greenColor];
    [self.bgImg addSubview:self.lineChartView];
    
    CGFloat righUnitImg_TopMargin = (self.bgImg.frame.size.height - kLineCharView_TopMargin * kYScal - kLineCharView_BottomMargin * kYScal - kRightUnitImg_Height * kYScal)/2;
    self.rightUnitImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lineChartView.frame) + kLeftUnitImg_RightMargin * kXScal, righUnitImg_TopMargin, kRightUnitImg_Width * kXScal, kRightUnitImg_Height * kYScal)];
    self.rightUnitImg.image = [UIImage imageNamed:@"rightUnit"];
    [self.bgImg addSubview:self.rightUnitImg];
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
