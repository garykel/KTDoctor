//
//  AerobicPrescriptionAndReportViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/23.
//  Copyright © 2019 dz. All rights reserved.
//

#import "AerobicPrescriptionAndReportViewController.h"
#import "LMJDropdownMenu.h"
#import "CustomTextField.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTimeLbl_LeftMargin 15
#define kTimeLbl_FontSize 16.0
#define kTimeLbl_Width 200
#define kTitle_FontSize 22
#define KSearchView_TopMargin 15
#define kSearchView_Height 46
#define kView_TopMargin 10
#define kView_BottomMargin 15
#define kView_LeftMargin 20
#define kNameTF_LeftMargin 15
#define KSearchContent_Space 15
#define kSearch_NameTF_Width 225
#define kSearch_DieaseDropview_Width 248
#define kSearch_RiskLevelDropview_Width 175
#define kSearch_AgeTF_Width 135
#define kSearch_Button_Width 110
#define kSearch_Button_RightMargin 16
#define kSearch_Button_Height 22
#define kSearch_Button_Font 11.0
#define kSearch_TF_Height 22
#define kSearch_TF_Font 12.0
#define kSearch_DropView_Font 12.0

@interface AerobicPrescriptionAndReportViewController ()<UITableViewDelegate,UITableViewDataSource,LMJDropdownMenuDelegate,CustomTextFieldDelegate>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *timeLbl;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIView *searchBgView;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)CustomTextField *prescriptionTF;
@property (nonatomic,strong)UIButton *startTimeTF;
@property (nonatomic,strong)NSString *startTimeStr;
@property (nonatomic,strong)CustomTextField *deviceTF;
@property (nonatomic,strong)LMJDropdownMenu *trainingPositionMenu;
@property (nonatomic,strong)LMJDropdownMenu *trainingEquipmentMenu;
@property (nonatomic,strong)UIButton *searchBtn;
@property (nonatomic,strong)UILabel *summaryLbl;
@property (nonatomic,strong)UITableView *listView;
@end

@implementation AerobicPrescriptionAndReportViewController

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
    self.titleLbl.text = @"有氧历史处方及报告";
    [self.navView addSubview:self.titleLbl];
}

- (NSString *)getCurrentTimeString{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *currentDate = [NSDate date];
    NSString *currentDateStr = [format stringFromDate:currentDate];
    return currentDateStr;
}

- (void)setupUI {
    self.searchBgView = [[UIView alloc] initWithFrame:CGRectMake(kView_LeftMargin * kXScal, CGRectGetMaxY(self.navView.frame) + KSearchView_TopMargin * kYScal, kWidth - 2 * kView_LeftMargin * kXScal, kSearchView_Height * kYScal)];
    self.searchBgView.backgroundColor = [UIColor colorWithHexString:@"#e6f5f8"];
    self.searchBgView.layer.cornerRadius = 4;
    self.searchBgView.layer.masksToBounds = YES;
    [self.view addSubview:self.searchBgView];
    
    CGFloat tfWidth = (self.searchBgView.frame.size.width - 2 * kNameTF_LeftMargin * kXScal - 4 * KSearchContent_Space * kXScal - kSearch_Button_Width * kXScal)/5;
    CGFloat TF_TopMargin = (self.searchBgView.frame.size.height - kSearch_TF_Height * kYScal)/2;
    self.prescriptionTF = [[CustomTextField alloc] initWithFrame:CGRectMake(kNameTF_LeftMargin * kXScal, TF_TopMargin, tfWidth, kSearch_TF_Height * kYScal)];
    self.prescriptionTF.layer.borderWidth = 1;
    self.prescriptionTF.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.prescriptionTF.backgroundColor = [UIColor whiteColor];
    self.prescriptionTF.placeholderLbl.text = @"处方名称";
    self.prescriptionTF.placeholderLbl.font = [UIFont systemFontOfSize:kSearch_TF_Font * kYScal];
    self.prescriptionTF.placeholderLbl.textColor = [UIColor colorWithHexString:@"#999999"];
    self.prescriptionTF.delegate = self;
    [self.searchBgView addSubview:self.prescriptionTF];
    
    self.startTimeTF = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.prescriptionTF.frame) + KSearchContent_Space * kXScal, self.prescriptionTF.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    self.startTimeTF.backgroundColor = [UIColor whiteColor];
    [self.startTimeTF setImage:[UIImage imageNamed:@"calendar"] forState:UIControlStateNormal];
    [self.startTimeTF setTitle:@"开始时间" forState:UIControlStateNormal];
    [self.startTimeTF setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.startTimeTF setImageEdgeInsets:UIEdgeInsetsMake(0, self.startTimeTF.frame.size.width - 20, 0, 0)];
    [self.startTimeTF setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 35)];
    [self.startTimeTF addTarget:self action:@selector(chooseStartTime:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBgView addSubview:self.startTimeTF];
    
    self.deviceTF = [[CustomTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.startTimeTF.frame) + KSearchContent_Space * kXScal, self.prescriptionTF.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    self.deviceTF.text = @"有氧设备";
    self.deviceTF.font = [UIFont systemFontOfSize:kSearch_TF_Font * kYScal];
    [self.searchBgView addSubview:self.deviceTF];
    
    self.trainingPositionMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deviceTF.frame) + KSearchContent_Space * kXScal, self.prescriptionTF.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    [self.trainingPositionMenu setMenuTitles:@[@"心肺"] rowHeight:kSearch_TF_Height attr:@{@"title":@"训练部位",@"titleFont":[UIFont systemFontOfSize:kSearch_DropView_Font * kYScal],@"titleColor":[UIColor colorWithHexString:@"#999999"],@"itemColor":[UIColor colorWithHexString:@"#999999"],@"itemFont":[UIFont systemFontOfSize:kSearch_TF_Font * kYScal]}];
    self.trainingPositionMenu.delegate = self;
    self.trainingPositionMenu.tag = 10;
    [self.searchBgView addSubview:self.trainingPositionMenu];
    
    self.trainingEquipmentMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingPositionMenu.frame) + KSearchContent_Space * kXScal, self.prescriptionTF.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    [self.trainingEquipmentMenu setMenuTitles:@[@"功率车",@"椭圆机"] rowHeight:kSearch_TF_Font attr:@{@"title":@"训练设备",@"titleFont":[UIFont systemFontOfSize:kSearch_DropView_Font * kYScal],@"titleColor":[UIColor colorWithHexString:@"#999999"],@"itemColor":[UIColor colorWithHexString:@"#999999"],@"itemFont":[UIFont systemFontOfSize:kSearch_TF_Font * kYScal]}];
    self.trainingEquipmentMenu.delegate = self;
    [self.searchBgView addSubview:self.trainingEquipmentMenu];
    
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat button_TopMargin = (self.searchBgView.frame.size.height - kSearch_Button_Height * kYScal)/2;
    self.searchBtn.frame = CGRectMake(CGRectGetMaxX(self.trainingEquipmentMenu.frame) + KSearchContent_Space * kXScal, button_TopMargin, kSearch_Button_Width * kXScal, kSearch_Button_Height * kYScal);
    [self.searchBtn setBackgroundColor:[UIColor colorWithHexString:@"#10a9cc"]];
    [self.searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [self.searchBtn.titleLabel setFont:[UIFont systemFontOfSize:kSearch_Button_Font * kYScal]];
    [self.searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.searchBtn.layer.cornerRadius = kSearch_Button_Height * kYScal / 2.0;
    self.searchBtn.layer.masksToBounds = YES;
    [self.searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBgView addSubview:self.searchBtn];
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)search:(UIButton*)sender {
    
}

- (void)chooseStartTime:(UIButton *)sender {
    __weak typeof (self)weakSelf = self;
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {
        NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd"];
        [weakSelf.startTimeTF setTitle:date forState:UIControlStateNormal];
        weakSelf.startTimeStr = date;
    }];
    datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.doneButtonColor = [UIColor grayColor];//确定按钮的颜色
    [datepicker show];
}
@end
