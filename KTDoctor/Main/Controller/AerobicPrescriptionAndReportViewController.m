//
//  AerobicPrescriptionAndReportViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/23.
//  Copyright © 2019 dz. All rights reserved.
//

#import "AerobicPrescriptionAndReportViewController.h"
#import "PrescriptionDetailViewController.h"
#import "LMJDropdownMenu.h"
#import "CustomTextField.h"
#import "AerobicReportCell.h"
#import "UserModel.h"

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
#define kSummaryLbl_FontSize 13.0
#define kSummaryLbl_Height 13
#define kSummaryLbl_BottomMargin 16
#define kBottomView_BottomMargin 20
#define kListView_TopMargin 15
#define kListView_LeftMargin 15
#define kListView_BottomMargin 15
#define kNoDatLbl_Width 100
#define kNoDataLbl_FontSize 20
#define kNoDataLbl_Height 18

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
@property (nonatomic,strong)UILabel *noDataLbl;
@property (nonatomic,strong)NSMutableArray *closeArr;
@property (nonatomic,strong)UserModel *user;
@end

@implementation AerobicPrescriptionAndReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.closeArr = [NSMutableArray array];
    self.user = [[UserModel sharedUserModel] getCurrentUser];
    for (NSInteger i = 0; i < self.precriptionsArr.count; i++) {
        [self.closeArr addObject:[NSNumber numberWithBool:YES]];
    }
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
    
    CGFloat tfWidth = (self.searchBgView.frame.size.width - 2 * kNameTF_LeftMargin * kXScal - 5 * KSearchContent_Space * kXScal - kSearch_Button_Width * kXScal)/5;
    CGFloat TF_TopMargin = (self.searchBgView.frame.size.height - kSearch_TF_Height * kYScal)/2;
    self.prescriptionTF = [[CustomTextField alloc] initWithFrame:CGRectMake(kNameTF_LeftMargin * kXScal, TF_TopMargin, tfWidth, kSearch_TF_Height * kYScal)];
//    self.prescriptionTF.layer.borderWidth = 1;
//    self.prescriptionTF.layer.borderColor = [UIColor lightGrayColor].CGColor;
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
    self.startTimeTF.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.startTimeTF.titleLabel setFont:[UIFont systemFontOfSize:kSearch_TF_Font * kYScal]];
    [self.startTimeTF setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.startTimeTF setImageEdgeInsets:UIEdgeInsetsMake(0, self.startTimeTF.frame.size.width - 20, 0, 0)];
    [self.startTimeTF setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 35)];
    [self.startTimeTF addTarget:self action:@selector(chooseStartTime:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBgView addSubview:self.startTimeTF];
    
    self.deviceTF = [[CustomTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.startTimeTF.frame) + KSearchContent_Space * kXScal, self.prescriptionTF.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    self.deviceTF.placeholderLbl.text = @"有氧设备";
    self.deviceTF.enabled = NO;
    self.deviceTF.font = [UIFont systemFontOfSize:kSearch_TF_Font * kYScal];
    self.deviceTF.backgroundColor = [UIColor whiteColor];
    self.deviceTF.placeholderLbl.font = [UIFont systemFontOfSize:kSearch_TF_Font * kYScal];
    [self.searchBgView addSubview:self.deviceTF];
    
    self.trainingPositionMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deviceTF.frame) + KSearchContent_Space * kXScal + kView_LeftMargin  * kXScal, self.prescriptionTF.frame.origin.y  + self.searchBgView.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    [self.trainingPositionMenu setMenuTitles:@[@"心肺"] rowHeight:kSearch_TF_Height attr:@{@"title":@"训练部位",@"titleFont":[UIFont systemFontOfSize:kSearch_DropView_Font * kYScal],@"titleColor":[UIColor colorWithHexString:@"#999999"],@"itemColor":[UIColor colorWithHexString:@"#2e2e2e"],@"itemFont":[UIFont systemFontOfSize:kSearch_TF_Font * kYScal]}];
    self.trainingPositionMenu.delegate = self;
    self.trainingPositionMenu.tag = 10;
    [self.view addSubview:self.trainingPositionMenu];
    
    self.trainingEquipmentMenu = [[LMJDropdownMenu alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingPositionMenu.frame) + KSearchContent_Space * kXScal, self.trainingPositionMenu.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    [self.trainingEquipmentMenu setMenuTitles:@[@"功率车",@"椭圆机"] rowHeight:kSearch_TF_Height attr:@{@"title":@"训练设备",@"titleFont":[UIFont systemFontOfSize:kSearch_DropView_Font * kYScal],@"titleColor":[UIColor colorWithHexString:@"#999999"],@"itemColor":[UIColor colorWithHexString:@"#2e2e2e"],@"itemFont":[UIFont systemFontOfSize:kSearch_TF_Font * kYScal]}];
    self.trainingEquipmentMenu.delegate = self;
    [self.view addSubview:self.trainingEquipmentMenu];
    
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat button_TopMargin = (self.searchBgView.frame.size.height - kSearch_Button_Height * kYScal)/2;
    self.searchBtn.frame = CGRectMake(CGRectGetMaxX(self.trainingEquipmentMenu.frame) + KSearchContent_Space * kXScal - kView_LeftMargin  * kXScal, button_TopMargin, kSearch_Button_Width * kXScal, kSearch_Button_Height * kYScal);
    [self.searchBtn setBackgroundColor:[UIColor colorWithHexString:@"#10a9cc"]];
    [self.searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [self.searchBtn.titleLabel setFont:[UIFont systemFontOfSize:kSearch_Button_Font * kYScal]];
    [self.searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.searchBtn.layer.cornerRadius = kSearch_Button_Height * kYScal / 2.0;
    self.searchBtn.layer.masksToBounds = YES;
    [self.searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBgView addSubview:self.searchBtn];
    
    self.summaryLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.searchBgView.frame.origin.x, CGRectGetMaxY(self.searchBgView.frame) + kView_BottomMargin * kYScal, self.searchBgView.frame.size.width, kSummaryLbl_Height * kYScal)];
    self.summaryLbl.font = [UIFont systemFontOfSize:kSummaryLbl_FontSize * kYScal];
    self.summaryLbl.textColor = [UIColor colorWithHexString:@"#2e2e2e"];
    NSDictionary *summarydict = [self getReportSummary];
    self.summaryLbl.text = [NSString stringWithFormat:@"累积处方数：%d  累积运动天数：%d  累积报告数：%d",[[summarydict valueForKey:@"sumPrescriptionCount"] integerValue],[[summarydict valueForKey:@"sumSportDays"] integerValue],[[summarydict valueForKey:@"sumReportCount"] integerValue]];
    [self.view addSubview:self.summaryLbl];
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(self.searchBgView.frame.origin.x, CGRectGetMaxY(self.summaryLbl.frame) + kSummaryLbl_BottomMargin * kYScal, self.searchBgView.frame.size.width, kHeight - CGRectGetMaxY(self.summaryLbl.frame) - kSummaryLbl_BottomMargin * kYScal - kBottomView_BottomMargin * kYScal)];
    self.bottomView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    self.bottomView.layer.cornerRadius = 4;
    self.bottomView.layer.masksToBounds = YES;
    [self.view addSubview:self.bottomView];
    
    self.listView = [[UITableView alloc] initWithFrame:CGRectMake(kListView_LeftMargin * kXScal, kListView_TopMargin * kYScal, self.bottomView.frame.size.width - 2 * kListView_LeftMargin * kXScal, self.bottomView.frame.size.height - kListView_TopMargin * kYScal - kListView_BottomMargin * kYScal) style:UITableViewStylePlain];
    self.listView.backgroundColor = [UIColor colorWithHexString:@"#DBF2F7"];
    self.listView.tableFooterView = [[UIView alloc] init];
    self.listView.dataSource = self;
    self.listView.delegate = self;
    [self.bottomView addSubview:self.listView];
    
    CGFloat noDataLbl_LeftMargin = (self.bottomView.frame.size.width - kNoDatLbl_Width * kXScal)/2.0;
    CGFloat noDataLbl_TopMargin = (self.bottomView.frame.size.height - kNoDataLbl_Height * kYScal)/2.0;
    self.noDataLbl = [[UILabel alloc] initWithFrame:CGRectMake(noDataLbl_LeftMargin, noDataLbl_TopMargin, kNoDatLbl_Width * kXScal, kNoDataLbl_Height * kYScal)];
    self.noDataLbl.textColor = [UIColor grayColor];
    self.noDataLbl.textAlignment = NSTextAlignmentCenter;
    self.noDataLbl.text = @"数据为空";
    self.noDataLbl.font = [UIFont systemFontOfSize:kNoDataLbl_FontSize * kYScal];
    self.noDataLbl.center = self.listView.center;
    self.noDataLbl.hidden = YES;
    [self.listView addSubview:self.noDataLbl];
    if (self.precriptionsArr.count == 0) {
        self.noDataLbl.hidden = NO;
    } else {
        self.noDataLbl.hidden = YES;
    }
}

- (NSDictionary *)getReportSummary {
    NSLog(@"prescription:%@",self.precriptionsArr);
    NSInteger sumPrescriptionCount = 0;
    NSInteger sumSportDays = 0;
    NSInteger sumReportCount = 0;
    if (self.precriptionsArr.count > 0) {
        for (NSDictionary *prescription in self.precriptionsArr) {
            sumPrescriptionCount += 1;
            sumSportDays += [[prescription valueForKey:@"sportDays"] integerValue];
            sumReportCount += [[prescription valueForKey:@"reportNum"] integerValue];
        }
    }
    return @{@"sumPrescriptionCount":@(sumPrescriptionCount),@"sumSportDays":@(sumSportDays),@"sumReportCount":@(sumReportCount)};
}

#pragma mark - UITableViewDelegate && UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.precriptionsArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 67 * kYScal;
    BOOL close = [[self.closeArr objectAtIndex:indexPath.section] boolValue];
    if (close) {
        return 67 * kYScal;
    } else {
        return (67 + 400)* kYScal;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footer = [[UIView alloc] init];
    footer.backgroundColor = [UIColor clearColor];
    return footer;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseCellStr = [NSString stringWithFormat:@"prescriptionCellId%d%d",indexPath.section,indexPath.row];
    AerobicReportCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellStr];
    if (cell == nil) {
        cell = [[AerobicReportCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellStr];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (self.precriptionsArr.count > 0) {
        NSDictionary *dict = [self.precriptionsArr objectAtIndex:indexPath.section];
        NSInteger riskLevel = [[dict valueForKey:@"riskLevel"] integerValue];
        NSString *riskLevelStr = @"低";
        if (riskLevel == 1) {
            riskLevelStr = @"低";
        } else if (riskLevel == 2) {
            riskLevelStr = @"中";
        } else if (riskLevel == 3) {
            riskLevelStr = @"高";
        }
        cell.riskLevelValLbl.text = riskLevelStr;
        NSArray *typeList = [dict valueForKey:@"typeList"];
        if (typeList.count > 0) {
            NSDictionary *equipmentDict = [typeList objectAtIndex:2];
            cell.trainingEquipmentNameLbl.text = [equipmentDict valueForKey:@"name"];
        }
        cell.prescriptionNameLbl.text = [NSString stringWithFormat:@"测试%d",indexPath.section + 1];
        cell.createTimeValLbl.text = [dict valueForKey:@"createTime"];
        cell.doctorNameLbl.text = [dict valueForKey:@"doctorName"];
        NSInteger sportDays = [[dict valueForKey:@"sportDays"] integerValue];
        cell.sportDaysValLbl.text = [NSString stringWithFormat:@"%d",sportDays];
        NSInteger reportNum = [[dict valueForKey:@"reportNum"] integerValue];
        cell.reportsValLbl.text = [NSString stringWithFormat:@"%d",reportNum];
        cell.reportsBtn.tag = 1000 + indexPath.section;
        [cell.reportsBtn addTarget:self action:@selector(showReport:) forControlEvents:UIControlEventTouchUpInside];
        cell.prescriptionDetailBtn.tag = 2000+ indexPath.section;
        [cell.prescriptionDetailBtn addTarget:self action:@selector(prescriptionDetail:) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
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

- (void)showReport:(UIButton*)sender {
    NSInteger index = sender.tag - 1000;
    NSDictionary *dict = [self.precriptionsArr objectAtIndex:index];
    NSInteger reportNum = [[dict valueForKey:@"reportNum"] integerValue];
    if (reportNum > 0) {
        BOOL close = [[self.closeArr objectAtIndex:index] boolValue];
        [self.closeArr replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:!close]];
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        [parameter setValue:@0 forKey:@"offset"];
        [parameter setValue:@10 forKey:@"rows"];
        NSDictionary *dict = self.user.organ;
        NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
        NSString *orgCode = orgCodeArr[0];
        [parameter setValue:orgCode forKey:@"orgCode"];
        NSInteger userId = [[self.patientInfo valueForKey:@"userId"] integerValue];
        [parameter setValue:@(userId) forKey:@"userId"];
        NSDictionary *prescriptionDict = [self.precriptionsArr objectAtIndex:index];
        NSInteger prescriptionId = [[prescriptionDict valueForKey:@"id"] integerValue];
        [parameter setValue:@(prescriptionId) forKey:@"prescriptionId"];
        [parameter setValue:@"-create_time" forKey:@"sort"];
        [self showReportList:parameter index:index];
    }
}

- (void)prescriptionDetail:(UIButton*)sender {
    NSLog(@"查看处方详情");
    NSInteger index = sender.tag - 2000;
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    NSDictionary *prescriptionDict = [self.precriptionsArr objectAtIndex:index];
    NSInteger id = [[prescriptionDict valueForKey:@"id"] integerValue];
    [parameter setValue:@(id) forKey:@"id"];
    [self checkPrescriptionDetail:parameter];
}

- (void)checkPrescriptionDetail:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_PRESCRIPTION_DETAIL_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************%@**************",responseObject);
        if (code == 0) {
            NSDictionary *data = [responseObject valueForKey:@"data"];
            PrescriptionDetailViewController *detail = [[PrescriptionDetailViewController alloc] init];
            detail.prescriptionDict = data;
            [weakSelf.navigationController pushViewController:detail animated:NO];
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

- (void)showReportList:(NSMutableDictionary*)parameter index:(NSInteger)index{
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USER_REPORTLIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************%@**************",responseObject);
        if (code == 0) {
            NSArray *datas = [responseObject valueForKey:@"rows"];
            AerobicReportCell *cell = (AerobicReportCell*)[self.listView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]];
            if (datas.count > 0) {
                NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"startTime" ascending:NO];
                datas = [[datas sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]] mutableCopy];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.reportsArr = [datas mutableCopy];
                [cell.reportListview reloadData];
                NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:index];
                [weakSelf.listView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
            });
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
@end
