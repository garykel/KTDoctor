//
//  AerobicPrescriptionAndReportViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/23.
//  Copyright © 2019 dz. All rights reserved.
//

#import "AerobicPrescriptionAndReportViewController.h"
#import "PrescriptionDetailViewController.h"
#import "KTDropDownMenus.h"
#import "CustomTextField.h"
#import "AerobicReportCell.h"
#import "UserModel.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTimeLbl_LeftMargin 15
#define kTimeLbl_FontSize 16.0
#define kTimeLbl_Width 230
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
#define kDropdownHeight 30
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
#define kReportList_CellHeight 195

@interface AerobicPrescriptionAndReportViewController ()<UITableViewDelegate,UITableViewDataSource,XXTGDropdownMenuDelegate,CustomTextFieldDelegate,PGDatePickerDelegate,PGDatePickManagerDelegate>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *timeLbl;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIView *searchBgView;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UITextField *prescriptionTF;
@property (nonatomic,strong)UIButton *startTimeTF;
@property (nonatomic,strong)NSString *startTimeStr;
@property (nonatomic,strong)CustomTextField *deviceTF;
@property (nonatomic,strong)KTDropDownMenus *trainingPositionMenu;
@property (nonatomic,strong)KTDropDownMenus *trainingEquipmentMenu;
@property (nonatomic,copy)NSString *trainingEquipmentStr;
@property (nonatomic,strong)NSMutableArray *equipmentsArr;
@property (nonatomic,strong)UIButton *searchBtn;
@property (nonatomic,strong)UILabel *summaryLbl;
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,strong)UILabel *noDataLbl;
@property (nonatomic,strong)NSMutableArray *closeArr;
@property (nonatomic,strong)NSMutableArray *searchCloseArr;
@property (nonatomic,strong)UserModel *user;
@property (nonatomic,assign)BOOL isSearch;
@property (nonatomic,assign)NSInteger offset;
@property (nonatomic,strong)PGDatePickManager *datePickManager;
@property (nonatomic,strong)NSMutableArray *searchResults;
@property (nonatomic,assign)BOOL isFooterClick;
@end

@implementation AerobicPrescriptionAndReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.isSearch = NO;
    self.isFooterClick = NO;
    self.searchResults = [NSMutableArray array];
    self.closeArr = [NSMutableArray array];
    self.searchCloseArr = [NSMutableArray array];
    self.equipmentsArr = [NSMutableArray array];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideAllDropDownMenu) name:kHideDropDownNotification object:nil];
    self.user = [[UserModel sharedUserModel] getCurrentUser];
    for (NSInteger i = 0; i < self.precriptionsArr.count; i++) {
        [self.closeArr addObject:[NSNumber numberWithBool:YES]];
    }
    [self setNavBar];
    [self setupUI];
}

- (void)hideAllDropDownMenu {
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[KTDropDownMenus class]]) {
            KTDropDownMenus *menu = (KTDropDownMenus*)view;
            [menu hiddenCityList];
        }
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    self.prescriptionTF = [[UITextField alloc] initWithFrame:CGRectMake(kNameTF_LeftMargin * kXScal, TF_TopMargin, tfWidth, kSearch_TF_Height * kYScal)];
//    self.prescriptionTF.layer.borderWidth = 1;
//    self.prescriptionTF.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.prescriptionTF.backgroundColor = [UIColor whiteColor];
    self.prescriptionTF.placeholder = @"处方名称";
    [self.searchBgView addSubview:self.prescriptionTF];
    
    self.startTimeTF = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.prescriptionTF.frame) + KSearchContent_Space * kXScal, self.prescriptionTF.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    self.startTimeTF.backgroundColor = [UIColor whiteColor];
    [self.startTimeTF setImage:[UIImage imageNamed:@"calendar"] forState:UIControlStateNormal];
    [self.startTimeTF setTitle:@"开始时间" forState:UIControlStateNormal];
    self.startTimeTF.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.startTimeTF.titleLabel setFont:[UIFont systemFontOfSize:kSearch_TF_Font * kYScal]];
    [self.startTimeTF setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.startTimeTF setImageEdgeInsets:UIEdgeInsetsMake(0, self.startTimeTF.frame.size.width - 20, 0, 0)];
    [self.startTimeTF setTitleEdgeInsets:UIEdgeInsetsMake(0, -tfWidth * kXScal/2.0 - 20, 0, 0)];
    [self.startTimeTF addTarget:self action:@selector(chooseStartTime:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBgView addSubview:self.startTimeTF];
    
    self.deviceTF = [[CustomTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.startTimeTF.frame) + KSearchContent_Space * kXScal, self.prescriptionTF.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    self.deviceTF.placeholderLbl.text = @"有氧设备";
    self.deviceTF.enabled = NO;
    self.deviceTF.font = [UIFont systemFontOfSize:kSearch_TF_Font * kYScal];
    self.deviceTF.backgroundColor = [UIColor whiteColor];
    self.deviceTF.placeholderLbl.font = [UIFont systemFontOfSize:kSearch_TF_Font * kYScal];
    [self.searchBgView addSubview:self.deviceTF];
    
    self.trainingPositionMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deviceTF.frame) + KSearchContent_Space * kXScal + kView_LeftMargin  * kXScal, self.prescriptionTF.frame.origin.y  + self.searchBgView.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    [self.trainingPositionMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.trainingPositionMenu.defualtStr = @"训练部位";
    self.trainingPositionMenu.delegate = self;
    NSMutableArray *positionArr = [NSMutableArray array];
    if (self.deviceTypeArr.count > 0) {
        for (NSDictionary *dict in self.deviceTypeArr) {
            [positionArr addObject:[dict valueForKey:@"name"]];
        }
    }
    self.trainingPositionMenu.titles = [positionArr copy];
    self.trainingPositionMenu.tag = 10;
    [self.view addSubview:self.trainingPositionMenu];
    
    self.trainingEquipmentMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingPositionMenu.frame) + KSearchContent_Space * kXScal, self.trainingPositionMenu.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    [self.trainingEquipmentMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.trainingEquipmentMenu.defualtStr = @"训练设备";
    self.trainingEquipmentMenu.delegate = self;
    NSMutableArray *trainingEquipMentArr = [NSMutableArray array];
    if (self.deviceTypeArr.count > 0) {
        for (NSDictionary *dict1 in self.deviceTypeArr) {
            NSArray *children = [dict1 valueForKey:@"children"];
            self.equipmentsArr = [children mutableCopy];
            if (children.count > 0) {
                for (NSDictionary *child in children) {
                    [trainingEquipMentArr addObject:[child valueForKey:@"name"]];
                }
            }
        }
    }
    self.trainingEquipmentMenu.titles = [trainingEquipMentArr copy];
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
    self.listView.separatorColor = [UIColor clearColor];
    [self.bottomView addSubview:self.listView];
    
    //添加头部的下拉刷新
    MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc] init];
    [header setRefreshingTarget:self refreshingAction:@selector(headerClick)];
    self.listView.mj_header = header;
    
    //添加底部的上拉加载
    MJRefreshBackNormalFooter *footer = [[MJRefreshBackNormalFooter alloc] init];
    [footer setRefreshingTarget:self refreshingAction:@selector(footerClick)];
    self.listView.mj_footer = footer;
    
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

- (void)headerClick {
    self.isFooterClick = NO;
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@0 forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    [parameter setValue:@1 forKey:@"type"];
    NSInteger userId = [[self.patientInfo valueForKey:@"userId"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@"-create_time" forKey:@"sort"];
    [self getUserPrescriptionList:parameter];
}

- (void)footerClick {
    self.isFooterClick = YES;
    self.offset += 10;
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@(self.offset) forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    [parameter setValue:@1 forKey:@"type"];
    NSInteger userId = [[self.patientInfo valueForKey:@"userId"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@"-create_time" forKey:@"sort"];
    [self getUserPrescriptionList:parameter];
}

- (NSDictionary *)getReportSummary {
    NSLog(@"prescription:%@",self.precriptionsArr);
    NSInteger sumPrescriptionCount = 0;
    NSInteger sumSportDays = 0;
    NSInteger sumReportCount = 0;
    if (self.isSearch) {
        if (self.searchResults.count > 0) {
            for (NSDictionary *prescription in self.searchResults) {
                sumPrescriptionCount += 1;
                sumSportDays += [[prescription valueForKey:@"sportDays"] integerValue];
                sumReportCount += [[prescription valueForKey:@"reportNum"] integerValue];
            }
        }
    } else {
        if (self.precriptionsArr.count > 0) {
            for (NSDictionary *prescription in self.precriptionsArr) {
                sumPrescriptionCount += 1;
                sumSportDays += [[prescription valueForKey:@"sportDays"] integerValue];
                sumReportCount += [[prescription valueForKey:@"reportNum"] integerValue];
            }
        }
    }
    return @{@"sumPrescriptionCount":@(sumPrescriptionCount),@"sumSportDays":@(sumSportDays),@"sumReportCount":@(sumReportCount)};
}

#pragma mark - UITableViewDelegate && UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.isSearch) {
        return self.searchResults.count;
    } else {
        return self.precriptionsArr.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 67 * kYScal;
    if (self.isSearch) {
        BOOL close = [[self.searchCloseArr objectAtIndex:indexPath.section] boolValue];
        if (close) {
            return 67 * kYScal;
        } else {
            return (67 + 200)* kYScal;
        }
    } else {
        BOOL close = [[self.closeArr objectAtIndex:indexPath.section] boolValue];
        if (close) {
            return 67 * kYScal;
        } else {
            return (67 + 200)* kYScal;
        }
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
    NSString *reuseCellStr = [NSString stringWithFormat:@"AerobicReportCellId%d%d",indexPath.section,indexPath.row];
    AerobicReportCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellStr];
    if (cell == nil) {
        cell = [[AerobicReportCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellStr];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (self.isSearch) {
        if (self.searchResults.count > 0) {
            NSDictionary *dict = [self.searchResults objectAtIndex:indexPath.section];
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
            if (typeList.count > 2) {
                NSDictionary *equipmentDict = [typeList objectAtIndex:2];
                cell.trainingEquipmentNameLbl.text = [equipmentDict valueForKey:@"name"];
            }
            cell.prescriptionNameLbl.text = [dict valueForKey:@"title"];
            NSInteger type2 = [[dict valueForKey:@"type2"] integerValue];
            if (type2 == 1) {
                cell.typeNameLbl.text = @"强度";
            } else {
                cell.typeNameLbl.text = @"功率";
            }
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
    } else {
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
            if (typeList.count > 2) {
                NSDictionary *equipmentDict = [typeList objectAtIndex:2];
                cell.trainingEquipmentNameLbl.text = [equipmentDict valueForKey:@"name"];
            }
            cell.prescriptionNameLbl.text = [dict valueForKey:@"title"];
            NSInteger type2 = [[dict valueForKey:@"type2"] integerValue];
            if (type2 == 1) {
                cell.typeNameLbl.text = @"强度";
            } else {
                cell.typeNameLbl.text = @"功率";
            }
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
    }
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self hideAllDropDownMenu];
    [[NSNotificationCenter defaultCenter] postNotificationName:kHideCellDropDownNotification object:nil];
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self hideAllDropDownMenu];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)search:(UIButton*)sender {
    NSString *prescriptionName = self.prescriptionTF.text;
    NSString *trainingPositionStr = self.trainingPositionMenu.mainBtn.titleLabel.text;
    NSString *trainingDeviceStr = self.trainingEquipmentMenu.mainBtn.titleLabel.text;
    if (prescriptionName.length == 0 && self.startTimeStr.length == 0 && [trainingPositionStr isEqualToString:@"训练部位"] && [trainingDeviceStr isEqualToString:@"训练设备"]) {
        self.isSearch = NO;
        self.noDataLbl.hidden = YES;
        [self.listView reloadData];
        NSDictionary *summarydict = [self getReportSummary];
        self.summaryLbl.text = [NSString stringWithFormat:@"累积处方数：%d  累积运动天数：%d  累积报告数：%d",[[summarydict valueForKey:@"sumPrescriptionCount"] integerValue],[[summarydict valueForKey:@"sumSportDays"] integerValue],[[summarydict valueForKey:@"sumReportCount"] integerValue]];
    } else {
        self.isSearch = YES;
        if (self.searchResults.count > 0) {
            [self.searchResults removeAllObjects];
        }
        if (self.searchCloseArr.count > 0) {
            [self.searchCloseArr removeAllObjects];
        }
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.title CONTAINS[c] %@ || self.createTime = %@",prescriptionName,self.startTimeStr];
        self.searchResults = [NSMutableArray arrayWithArray:[self.precriptionsArr filteredArrayUsingPredicate:predicate]];
        if (self.trainingEquipmentStr.length > 0) {
            NSMutableArray *tempArr = [NSMutableArray array];
            if (self.searchResults.count > 0) {
                for (NSDictionary *dict in self.searchResults) {
                    NSArray *typeList = [dict valueForKey:@"typeList"];
                    if (typeList.count > 0) {
                        for (NSString *typeDict in typeList) {
                            NSString *name = [typeDict valueForKey:@"name"];
                            if ([name isEqualToString:self.trainingEquipmentStr]) {
                                [tempArr addObject:dict];
                            }
                        }
                    }
                }
            } else {
                if (self.precriptionsArr.count > 0) {
                    for (NSDictionary *dict in self.precriptionsArr) {
                        NSArray *typeList = [dict valueForKey:@"typeList"];
                        if (typeList.count > 0) {
                            for (NSString *typeDict in typeList) {
                                NSString *name = [typeDict valueForKey:@"name"];
                                if ([name isEqualToString:self.trainingEquipmentStr]) {
                                    [tempArr addObject:dict];
                                }
                            }
                        }
                    }
                }
            }
            self.searchResults = [tempArr mutableCopy];
        }
        for (NSInteger i = 0; i < self.searchResults.count; i++) {
            [self.searchCloseArr addObject:[NSNumber numberWithBool:YES]];
        }
        [self.listView reloadData];
        NSDictionary *summarydict = [self getReportSummary];
        self.summaryLbl.text = [NSString stringWithFormat:@"累积处方数：%d  累积运动天数：%d  累积报告数：%d",[[summarydict valueForKey:@"sumPrescriptionCount"] integerValue],[[summarydict valueForKey:@"sumSportDays"] integerValue],[[summarydict valueForKey:@"sumReportCount"] integerValue]];
    }
}

- (void)chooseStartTime:(UIButton *)sender {
    self.datePickManager = [[PGDatePickManager alloc]init];
    self.datePickManager.isShadeBackground = true;
    self.datePickManager.style = PGDatePickManagerStyleAlertBottomButton;
    self.datePickManager.delegate = self;
    PGDatePicker *datePicker = self.datePickManager.datePicker;
    datePicker.delegate = self;
    datePicker.isHiddenMiddleText = false;
    datePicker.datePickerType = PGDatePickerTypeSegment;
    datePicker.datePickerMode = PGDatePickerModeDate;
    [self presentViewController:self.datePickManager animated:false completion:nil];
}

- (void)showReport:(UIButton*)sender {
    NSInteger index = sender.tag - 1000;
    NSDictionary *dict = [self.precriptionsArr objectAtIndex:index];
    NSInteger reportNum = [[dict valueForKey:@"reportNum"] integerValue];
    if (reportNum > 0) {
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        [parameter setValue:@0 forKey:@"offset"];
        [parameter setValue:@(reportNum) forKey:@"rows"];
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
        NSDictionary *precriptionDict = [self.precriptionsArr objectAtIndex:index];
        NSInteger type2 = [[precriptionDict valueForKey:@"type2"] integerValue];
        [self showReportList:parameter index:index type2:type2];
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

#pragma mark - PGDatePickerDelegate

- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents {
    self.startTimeStr = [NSString stringWithFormat:@"%d-%02d-%02d",dateComponents.year,dateComponents.month,dateComponents.day];
    [self.startTimeTF setTitle:self.startTimeStr forState:UIControlStateNormal];
    [self.startTimeTF setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

#pragma mark - PGDatePickManagerDelegate

- (void)resetDatePicker{
    [self.datePickManager dismiss];
    [self.startTimeTF setTitle:@"开始时间" forState:UIControlStateNormal];
    [self.startTimeTF setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.startTimeStr = @"";
}

#pragma mark - XXTGDropdownMenuDelegate
- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellNumber:(NSInteger)number {
    if (menu == self.trainingPositionMenu) { //训练部位
        
    }else if (menu == self.trainingEquipmentMenu){ //训练设备
        
    }
}

- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string
{
    
    if (menu == self.trainingPositionMenu) { //训练部位
        if (![self isBlankString:string]) {

        }
        
    }else if (menu == self.trainingEquipmentMenu){ //训练设备
        self.trainingEquipmentStr = string;
    }
}

- (void)dropdownMenu:(KTDropDownMenus *)menu mainBtnClick:(UIButton *)sender {
    [self hideOtherMenuExcept:menu];
    if (menu == self.trainingPositionMenu) { //训练部位
        [self.trainingEquipmentMenu hiddenCityList];
    }else if (menu == self.trainingEquipmentMenu){ //训练设备
        [self.trainingPositionMenu hiddenCityList];
        if ([self.trainingPositionMenu.mainBtn.titleLabel.text isEqualToString:@"训练部位"]) {
            [STTextHudTool showText:@"请先选择训练部位"];
            [menu hiddenCityList];
        }
    }
}

- (void)hideOtherMenuExcept:(KTDropDownMenus*)menu {
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[KTDropDownMenus class]]) {
            KTDropDownMenus *ktMenu = (KTDropDownMenus*)view;
            if (ktMenu != menu) {
                [ktMenu hiddenCityList];
            }
        }
    }
}

#pragma mark - netFunctions

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

- (void)showReportList:(NSMutableDictionary*)parameter index:(NSInteger)index type2:(NSInteger)type2{
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
                cell.reportsArr = [datas mutableCopy];
                cell.type2 = type2;
                cell.patientInfo = self.patientInfo;
                BOOL close = NO;
                if (weakSelf.isSearch) {
                    close = [[self.searchCloseArr objectAtIndex:index] boolValue];
                    [weakSelf.searchCloseArr replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:!close]];
                } else {
                    close = [[self.closeArr objectAtIndex:index] boolValue];
                    [weakSelf.closeArr replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:!close]];
                }
                [cell.reportListview reloadData];
                NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:index];
                [weakSelf.listView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
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

- (void)getUserPrescriptionList:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USER_PRESCRIPTION_LIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"******用户处方列表********%@**************",responseObject);
        if (code == 0) {
            NSArray *rows = [responseObject valueForKey:@"rows"];
            if (weakSelf.isFooterClick) {
                if (weakSelf.isSearch) {
                    [weakSelf.searchResults addObjectsFromArray:rows];
                    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.title CONTAINS[c] %@ || self.createTime = %@",self.prescriptionTF.text,self.startTimeStr];
                    self.searchResults = [NSMutableArray arrayWithArray:[self.searchResults filteredArrayUsingPredicate:predicate]];
                    if (weakSelf.searchCloseArr.count > 0) {
                        [weakSelf.searchCloseArr removeAllObjects];
                    }
                    for (NSInteger i = 0; i < weakSelf.searchResults.count; i++) {
                        [weakSelf.searchCloseArr addObject:[NSNumber numberWithBool:YES]];
                    }
                } else {
                    [weakSelf.precriptionsArr addObjectsFromArray:rows];
                    if (weakSelf.closeArr.count > 0) {
                        [weakSelf.closeArr removeAllObjects];
                    }
                    for (NSInteger i = 0; i < weakSelf.precriptionsArr.count; i++) {
                        [weakSelf.closeArr addObject:[NSNumber numberWithBool:YES]];
                    }
                }
                [weakSelf.listView.mj_footer endRefreshing];
            } else {
                if (rows.count > 0) {
                    if (weakSelf.isSearch) {
                        if (weakSelf.searchResults.count > 0) {//之前有数据
                            //替换前n个数据
                            NSMutableArray *tempArr = [NSMutableArray array];
                            [tempArr addObjectsFromArray:rows];
                            if (weakSelf.searchResults.count > rows.count) {//除去n个数据还有数据剩下
                                NSArray *afterArr = [weakSelf.searchResults subarrayWithRange:NSMakeRange(rows.count, weakSelf.searchResults.count - rows.count)];
                                [tempArr addObjectsFromArray:afterArr];
                            }
                            weakSelf.searchResults = [tempArr mutableCopy];
                        } else {
                            [weakSelf.searchResults addObjectsFromArray:rows];
                        }
                        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.title CONTAINS[c] %@ || self.createTime = %@",self.prescriptionTF.text,self.startTimeStr];
                        self.searchResults = [NSMutableArray arrayWithArray:[self.searchResults filteredArrayUsingPredicate:predicate]];
                        if (weakSelf.searchCloseArr.count > 0) {
                            [weakSelf.searchCloseArr removeAllObjects];
                        }
                        for (NSInteger i = 0; i < self.searchResults.count; i++) {
                            [self.searchCloseArr addObject:[NSNumber numberWithBool:YES]];
                        }
                    } else {
                        if (weakSelf.precriptionsArr.count > 0) {//之前有数据
                            //替换前n个数据
                            NSMutableArray *tempArr = [NSMutableArray array];
                            [tempArr addObjectsFromArray:rows];
                            if (weakSelf.precriptionsArr.count > rows.count) {//除去n个数据还有数据剩下
                                NSArray *afterArr = [weakSelf.precriptionsArr subarrayWithRange:NSMakeRange(rows.count, weakSelf.precriptionsArr.count - rows.count)];
                                [tempArr addObjectsFromArray:afterArr];
                            }
                            weakSelf.precriptionsArr = [tempArr mutableCopy];
                        } else {
                            [weakSelf.precriptionsArr addObjectsFromArray:rows];
                        }
                        if (weakSelf.closeArr.count > 0) {
                            [weakSelf.closeArr removeAllObjects];
                        }
                        for (NSInteger i = 0; i < weakSelf.precriptionsArr.count; i++) {
                            [weakSelf.closeArr addObject:[NSNumber numberWithBool:YES]];
                        }
                    }
                }
                [weakSelf.listView.mj_header endRefreshing];
            }
            [weakSelf.listView reloadData];
            NSDictionary *summarydict = [self getReportSummary];
            self.summaryLbl.text = [NSString stringWithFormat:@"累积处方数：%d  累积运动天数：%d  累积报告数：%d",[[summarydict valueForKey:@"sumPrescriptionCount"] integerValue],[[summarydict valueForKey:@"sumSportDays"] integerValue],[[summarydict valueForKey:@"sumReportCount"] integerValue]];
            if (weakSelf.isSearch) {
                if (weakSelf.searchResults.count == 0) {
                    weakSelf.noDataLbl.hidden = NO;
                } else {
                    weakSelf.noDataLbl.hidden = YES;
                }
            } else {
                if (weakSelf.precriptionsArr.count == 0) {
                    weakSelf.noDataLbl.hidden = NO;
                } else {
                    weakSelf.noDataLbl.hidden = YES;
                }
            }
        } else if (code == 10011) {
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
@end
