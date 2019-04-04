//
//  HistoryViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/4.
//  Copyright © 2019 dz. All rights reserved.
//

#import "HistoryViewController.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTimeLbl_LeftMargin 15
#define kTimeLbl_FontSize 16.0
#define kTimeLbl_Width 200
#define kTitle_FontSize 22
#define KSearchView_TopMargin 15
#define kSearchView_Height 50
#define kView_BottomMargin 15
#define kView_LeftMargin 30
#define kStartTimeMenu_LeftMargin 15
#define kSearch_TF_Height 40
#define kSearch_TF_Width 150

@interface HistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *timeLbl;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIView *searchBgView;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UIButton *startTimeTF;
@property (nonatomic,strong)UITextField *nameTF;
@property (nonatomic,strong)UITextField *prescriptionTF;
@property (nonatomic,strong)UIButton *searchBtn;
@property (nonatomic,strong)UITableView *listView;
@end

@implementation HistoryViewController

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
    
    self.timeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.backButton.frame) + kTimeLbl_LeftMargin, self.backButton.frame.origin.y, kTimeLbl_Width, kButton_Height)];
    self.timeLbl.textAlignment = NSTextAlignmentLeft;
    NSString *currentDateStr = [self getCurrentTimeString];
    self.timeLbl.text = currentDateStr;
    self.timeLbl.textColor = [UIColor whiteColor];
    [self.navView addSubview:self.timeLbl];
    
    CGFloat titleLbl_LeftMargin = (kWidth - kTimeLbl_Width)/2;
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(titleLbl_LeftMargin, self.timeLbl.frame.origin.y, kTimeLbl_Width, kButton_Height)];
    self.titleLbl.font = [UIFont systemFontOfSize:kTitle_FontSize];
    self.titleLbl.textColor = [UIColor whiteColor];
    self.titleLbl.textAlignment = NSTextAlignmentCenter;
    self.titleLbl.text = @"历史记录";
    [self.navView addSubview:self.titleLbl];
}

- (void)setupUI {
    self.searchBgView = [[UIView alloc] initWithFrame:CGRectMake(kView_LeftMargin * kXScal, CGRectGetMaxY(self.navView.frame), kWidth - 2 * kView_LeftMargin * kXScal, kSearchView_Height * kYScal)];
    self.searchBgView.backgroundColor = [UIColor colorWithHexString:@"#e6f5f8"];
    self.searchBgView.layer.cornerRadius = 4;
    self.searchBgView.layer.masksToBounds = YES;
    [self.view addSubview:self.searchBgView];
    
    self.startTimeTF = [[UIButton alloc] initWithFrame:CGRectMake(kStartTimeMenu_LeftMargin * kXScal, self.searchBgView.center.y - kSearch_TF_Height * kYScal / 2, kSearch_TF_Width * kXScal, kSearch_TF_Height * kYScal)];
    self.startTimeTF.backgroundColor = [UIColor whiteColor];
    [self.startTimeTF setImage:[UIImage imageNamed:@"dropdownMenu"] forState:UIControlStateNormal];
    [self.startTimeTF setTitle:@"开始时间" forState:UIControlStateNormal];
    [self.startTimeTF setTitleColor:[UIColor colorWithHexString:@"#9fb5bd"] forState:UIControlStateNormal];
    [self.startTimeTF setImageEdgeInsets:UIEdgeInsetsMake(0, self.startTimeTF.frame.size.width - 20, 0, 0)];
    [self.startTimeTF setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 35)];
    [self.startTimeTF addTarget:self action:@selector(chooseStartTime:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBgView addSubview:self.startTimeTF];
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(self.searchBgView.frame.origin.x, CGRectGetMaxY(self.searchBgView.frame) + KSearchView_TopMargin * kYScal, self.searchBgView.frame.size.width, kHeight - CGRectGetMaxY(self.searchBgView.frame) - 2 * kView_BottomMargin * kYScal)];
    self.bottomView.backgroundColor = [UIColor colorWithHexString:@"#e6f5f8"];
    self.bottomView.layer.cornerRadius = 4;
    self.bottomView.layer.masksToBounds = YES;
    [self.view addSubview:self.bottomView];
}

- (void)chooseStartTime:(UIButton *)sender {
    
}

- (NSString *)getCurrentTimeString{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *currentDate = [NSDate date];
    NSString *currentDateStr = [format stringFromDate:currentDate];
    return currentDateStr;
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
