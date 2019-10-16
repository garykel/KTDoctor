//
//  AerobicPrescriptionAndReportViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/23.
//  Copyright © 2019 dz. All rights reserved.
//

#import "AerobicPrescriptionAndReportViewController.h"
#import "PrescriptionDetailViewController.h"
#import "HistoryDetailViewController.h"
#import "KTDropDownMenus.h"
#import "CustomTextField.h"
#import "AerobicReportCell.h"
#import "ReportListCell.h"
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
#define kInfoView_Height 67
#define kReportCell_Height 200

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
@property (nonatomic,strong)KTDropDownMenus *deviceTF;
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
@property (nonatomic,assign)NSInteger type;
@end

@implementation AerobicPrescriptionAndReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.type = 1;
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
    self.titleLbl.text = @"查看历史处方及报告";
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
    [self.startTimeTF setTitleEdgeInsets:UIEdgeInsetsMake(0, -tfWidth * kXScal/2.0 + 10, 0, 0)];
    [self.startTimeTF addTarget:self action:@selector(chooseStartTime:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBgView addSubview:self.startTimeTF];
    
    self.deviceTF = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.startTimeTF.frame) + KSearchContent_Space * kXScal, self.prescriptionTF.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    [self.deviceTF setDropdownHeight:kDropdownHeight * kYScal];
    self.deviceTF.defualtStr = @"有氧设备";
    self.deviceTF.delegate = self;
    self.deviceTF.backgroundColor = [UIColor whiteColor];
    NSMutableArray *devices = [NSMutableArray array];
    if (self.deviceTypeArr.count > 0) {
        for (NSDictionary *dict in self.deviceTypeArr) {
            [devices addObject:[dict valueForKey:@"name"]];
        }
    }
    self.deviceTF.titles = [devices copy];
    self.deviceTF.tag = 100;
    [self.searchBgView addSubview:self.deviceTF];
    
    self.trainingPositionMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deviceTF.frame) + KSearchContent_Space * kXScal + kView_LeftMargin  * kXScal, self.prescriptionTF.frame.origin.y  + self.searchBgView.frame.origin.y, tfWidth, kSearch_TF_Height * kYScal)];
    [self.trainingPositionMenu setDropdownHeight:kDropdownHeight * kYScal];
    self.trainingPositionMenu.defualtStr = @"训练部位";
    self.trainingPositionMenu.delegate = self;
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
            for (NSDictionary *dict in self.searchResults) {
                NSDictionary *prescription = [dict valueForKey:@"prescription"];
                sumPrescriptionCount += 1;
                sumSportDays += [[prescription valueForKey:@"sportDays"] integerValue];
                sumReportCount += [[prescription valueForKey:@"reportNum"] integerValue];
            }
        }
    } else {
        if (self.precriptionsArr.count > 0) {
            for (NSDictionary *dict in self.precriptionsArr) {
                NSDictionary *prescription = [dict valueForKey:@"prescription"];
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
    if (self.isSearch) {
        BOOL close = [[self.searchCloseArr objectAtIndex:section] boolValue];
        if (close) {
            return 1;
        } else {
            NSDictionary *dict = [self.searchResults objectAtIndex:section];
            NSArray *reportsArr = [dict valueForKey:@"reports"];
            return reportsArr.count + 1;
        }
    } else {
        BOOL close = [[self.closeArr objectAtIndex:section] boolValue];
        if (close) {
            return 1;
        } else {
            NSDictionary *dict = [self.precriptionsArr objectAtIndex:section];
            NSArray *reportsArr = [dict valueForKey:@"reports"];
            return reportsArr.count + 1;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return kInfoView_Height * kYScal;
    } else {
        return kReportCell_Height * kYScal;
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
    if (indexPath.row == 0) {
        NSString *reuseCellStr = [NSString stringWithFormat:@"AerobicReportCellId%d%d",indexPath.section,indexPath.row];
        AerobicReportCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellStr];
        if (cell == nil) {
            cell = [[AerobicReportCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellStr];
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        if (self.isSearch) {
            if (self.searchResults.count > 0) {
                NSDictionary *prescriptionDict = [self.searchResults objectAtIndex:indexPath.section];
                NSDictionary *dict = [prescriptionDict valueForKey:@"prescription"];
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
                NSDictionary *prescriptionDict = [self.precriptionsArr objectAtIndex:indexPath.section];
                NSDictionary *dict = [prescriptionDict valueForKey:@"prescription"];
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
    } else {
        NSString *reuseCellStr = [NSString stringWithFormat:@"reportListCell%d%d",indexPath.section,indexPath.row];
        ReportListCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellStr];
        if (cell == nil) {
            cell = [[ReportListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellStr];
            cell.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        NSDictionary *dict = nil;
        if (self.isSearch) {
            dict = [self.searchResults objectAtIndex:indexPath.section];
        } else {
            dict = [self.precriptionsArr objectAtIndex:indexPath.section];
        }
        NSArray *reports = [dict valueForKey:@"reports"];
        NSDictionary *reportDict = [reports objectAtIndex:(indexPath.row - 1)];
        cell.sequenceLbl.text = [NSString stringWithFormat:@"%d",reports.count - (indexPath.row - 1)];
        NSInteger completePercent = [[reportDict valueForKey:@"completePercent"] integerValue];
        cell.percentLbl.text = [NSString stringWithFormat:@"%d%%",completePercent];
        cell.startTimeLbl.text = [NSString stringWithFormat:@"开始时间:%@",[reportDict valueForKey:@"startTime"]];
        NSInteger totalTime = [[reportDict valueForKey:@"totalTime"] integerValue];
        NSString *totalTimeStr = [self getTimeString:totalTime];
        cell.totalTimeValLbl.text = totalTimeStr;
        NSInteger avgHr = [[reportDict valueForKey:@"avgHr"] integerValue];
        cell.avgHrValLbl.text = [NSString stringWithFormat:@"%d Bpm",avgHr];
        NSInteger maxHr = [[reportDict valueForKey:@"maxHr"] integerValue];
        cell.maxHrValLbl.text = [NSString stringWithFormat:@"%d Bpm",maxHr];
        CGFloat totalMileage = [[reportDict valueForKey:@"totalMileage"] floatValue];
        cell.mileValLbl.text = [NSString stringWithFormat:@"%.1f Km",totalMileage];
        CGFloat calorie = [[reportDict valueForKey:@"calorie"] floatValue];
        cell.calorieValLbl.text = [NSString stringWithFormat:@"%.1f Kcal",calorie];
        CGFloat met = [[reportDict valueForKey:@"mets"] floatValue];
        cell.metsValLbl.text = [NSString stringWithFormat:@"%.1f METs",met];
        CGFloat speed = [[reportDict valueForKey:@"speed"] floatValue];
        cell.avgSpeedValLbl.text = [NSString stringWithFormat:@"%.1f Km/h",speed];
        NSInteger avgDifficulty = [[reportDict valueForKey:@"avgDifficulty"] integerValue];
        NSInteger type2 = [[reportDict valueForKey:@"type2"] integerValue];
        if (type2 == 2) {
            cell.avgDifficultyLbl.text = @"平均功率";
            cell.avgDifficultyValLbl.text = [NSString stringWithFormat:@"%dW",avgDifficulty];
        } else {
            cell.avgDifficultyLbl.text = @"平均强度";
            cell.avgDifficultyValLbl.text = [NSString stringWithFormat:@"%d",avgDifficulty];
        }
        NSString *rpeSample = [reportDict valueForKey:@"rpeSample"];
        NSLog(@"rpeSample is :%@",rpeSample);
        NSMutableArray *results = [NSMutableArray array];
        if (rpeSample.length > 0) {
            NSArray *arr = [rpeSample componentsSeparatedByString:@","];
            if (arr.count > 0) {
                for (NSString *str in arr) {
                    NSArray *rpeArr = [str componentsSeparatedByString:@"|"];
                    if (rpeArr.count > 0) {
                        [results addObject:rpeArr[0]];
                    }
                }
                if (arr.count < 12) {
                    for (NSInteger i = 0; i< 12 - arr.count; i++) {
                        [results addObject:@""];
                    }
                }
            } else {
                for (NSInteger j = 0; j< 12; j++) {
                    [results addObject:@""];
                }
            }
            NSLog(@"results is :%@",results);
            
        } else {
            for (NSInteger j = 0; j< 12; j++) {
                [results addObject:@""];
            }
        }
        if (results.count > 0) {
            cell.rpe1Lbl.text = results[0];
            cell.rpe2Lbl.text = results[1];
            cell.rpe3Lbl.text = results[2];
            cell.rpe4Lbl.text = results[3];
            cell.rpe5Lbl.text = results[4];
            cell.rpe6Lbl.text = results[5];
            cell.rpe7Lbl.text = results[6];
            cell.rpe8Lbl.text = results[7];
            cell.rpe9Lbl.text = results[8];
            cell.rpe10Lbl.text = results[9];
            cell.rpe11Lbl.text = results[10];
            cell.rpe12Lbl.text = results[11];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row > 0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kHideDropDownNotification object:nil];
        NSDictionary *dictonary = nil;
        if (self.isSearch) {
            dictonary = [self.searchResults objectAtIndex:indexPath.section];
        } else {
            dictonary = [self.precriptionsArr objectAtIndex:indexPath.section];
        }
        NSArray *reports = [dictonary valueForKey:@"reports"];
        if (reports.count > 0) {
            if (indexPath.row > 0) {
                NSDictionary *dict = [reports objectAtIndex:(indexPath.row - 1)];
                NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
                NSInteger sid = [[dict valueForKey:@"id"] integerValue];
                NSDictionary *userDict = self.user.organ;
                NSArray *orgCodeArr = [userDict valueForKey:@"orgCode"];
                NSString *orgCode = orgCodeArr[0];
                [parameter setValue:orgCode forKey:@"orgCode"];
                [parameter setValue:@(sid) forKey:@"id"];
                [self getUserSportDetail:parameter reports:[[reports reverseObjectEnumerator] allObjects]];
            }
        }
    }
}

- (NSString *)getTimeString:(NSInteger)seconds {
    NSString *timeStr = @"";
    NSInteger minute = seconds / 60;
    NSInteger second = seconds % 60;
    timeStr = [NSString stringWithFormat:@"%02ld:%02ld",(long)minute,(long)second];
    return timeStr;
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
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@0 forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    NSString *title = self.prescriptionTF.text;
    if (title.length > 0) {
        [parameter setValue:title forKey:@"title"];
    }
    NSString *startTime = self.startTimeTF.titleLabel.text;
    if (![startTime isEqualToString:@"开始时间"]) {
        [parameter setValue:startTime forKey:@"createTime"];
    }
    [parameter setValue:@(self.type) forKey:@"type"];
    NSInteger userId = [[self.patientInfo valueForKey:@"userId"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@"-create_time" forKey:@"sort"];
    [self searchPrescriptions:parameter];
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
    NSDictionary *prescriptionDict = nil;
    if (self.isSearch) {
        prescriptionDict = [self.searchResults objectAtIndex:index];
    } else {
        prescriptionDict = [self.precriptionsArr objectAtIndex:index];
    }
    NSDictionary *dictonary = [prescriptionDict valueForKey:@"prescription"];
    NSInteger reportNum = [[dictonary valueForKey:@"reportNum"] integerValue];
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
        NSInteger prescriptionId = [[dictonary valueForKey:@"id"] integerValue];
        [parameter setValue:@(prescriptionId) forKey:@"prescriptionId"];
        [parameter setValue:@"-create_time" forKey:@"sort"];
        NSInteger type2 = [[dictonary valueForKey:@"type2"] integerValue];
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
    NSDictionary *dictonary = nil;
    if (self.isSearch) {
        dictonary = [self.searchResults objectAtIndex:index];
    } else {
        dictonary = [self.precriptionsArr objectAtIndex:index];
    }
    NSDictionary *prescriptionDict = [dictonary valueForKey:@"prescription"];
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
    if (menu == self.deviceTF) {//设备类型
        [self.trainingPositionMenu.mainBtn setTitle:@"训练部位" forState:UIControlStateNormal];
        [self.trainingEquipmentMenu.mainBtn setTitle:@"训练设备" forState:UIControlStateNormal];
        if (self.deviceTypeArr.count > 0) {
            NSString *deviceStr = self.deviceTF.mainBtn.titleLabel.text;
            for (NSDictionary *dict in self.deviceTypeArr) {
                NSString *deviceTypeStr = [dict valueForKey:@"name"];
                if ([deviceStr isEqualToString:deviceTypeStr]) {
                    NSInteger id = [[dict valueForKey:@"id"] integerValue];
                    self.type = id;
                    NSMutableArray *positionsArr = [NSMutableArray array];
                    NSArray *positionChildren = [dict valueForKey:@"children"];
                    if (positionChildren.count > 0) {
                        for (NSDictionary *positionDict in positionChildren) {
                            NSString *position = [positionDict valueForKey:@"name"];
                            [positionsArr addObject:position];
                        }
                    }
                    self.trainingPositionMenu.titles = [positionsArr copy];
                    [self.trainingPositionMenu.mTableView reloadData];
                    break;
                }
            }
        }
    } else if (menu == self.trainingPositionMenu) { //训练部位
        if (![self isBlankString:string]) {
            NSMutableArray *equipmentsArr = [NSMutableArray array];
            if (self.deviceTypeArr.count > 0) {
                for (NSDictionary *dict in self.deviceTypeArr) {
                    NSString *name = [dict valueForKey:@"name"];
                    NSString *deviceTypeName = self.deviceTF.mainBtn.titleLabel.text;
                    if ([name isEqualToString:deviceTypeName]) {
                        NSArray *children = [dict valueForKey:@"children"];
                        if (children.count > 0) {
                            for (NSDictionary *positionDict in children) {
                                NSString *positionName = [positionDict valueForKey:@"name"];
                                if ([positionName isEqualToString:string]) {
                                    NSInteger id = [[positionDict valueForKey:@"id"] integerValue];
                                    self.type = id;
                                    NSArray *positionChildren = [positionDict valueForKey:@"children"];
                                    if (positionChildren.count > 0) {
                                        for (NSDictionary *equipDict in positionChildren) {
                                            NSString *equipmentName = [equipDict valueForKey:@"name"];
                                            [equipmentsArr addObject:equipmentName];
                                        }
                                    }
                                    break;
                                }
                            }
                            self.trainingEquipmentMenu.titles = [equipmentsArr mutableCopy];
                            [self.trainingEquipmentMenu.mTableView reloadData];
                        }
                        break;
                    }
                }
            }
        }
        
    }else if (menu == self.trainingEquipmentMenu){ //训练设备
        self.trainingEquipmentStr = string;
        if (self.deviceTypeArr.count > 0) {
            for (NSDictionary *dict in self.deviceTypeArr) {
                NSString *name = [dict valueForKey:@"name"];
                NSString *deviceTypeName = self.deviceTF.mainBtn.titleLabel.text;
                if ([name isEqualToString:deviceTypeName]) {
                    NSArray *children = [dict valueForKey:@"children"];
                    if (children.count > 0) {
                        for (NSDictionary *positionDict in children) {
                            NSString *positionName = [positionDict valueForKey:@"name"];
                            NSString *position = self.trainingPositionMenu.mainBtn.titleLabel.text;
                            if ([positionName isEqualToString:position]) {
                                NSArray *positionChildren = [positionDict valueForKey:@"children"];
                                if (positionChildren.count > 0) {
                                    for (NSDictionary *equipDict in positionChildren) {
                                        NSString *equipmentName = [equipDict valueForKey:@"name"];
                                        if ([string isEqualToString:equipmentName]) {
                                            NSInteger id = [[equipDict valueForKey:@"id"] integerValue];
                                            self.type = id;
                                            break;
                                        }
                                    }
                                }
                                break;
                            }
                        }
                    }
                    break;
                }
            }
        }
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
                cell.type2 = type2;
                cell.patientInfo = self.patientInfo;
                BOOL close = NO;
                if (weakSelf.isSearch) {
                    NSDictionary *dict = [self.searchResults objectAtIndex:index];
                    NSDictionary *prescriptionDict = [dict valueForKey:@"prescription"];
                    NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
                    [tempDict setValue:prescriptionDict forKey:@"prescription"];
                    [tempDict setValue:datas forKey:@"reports"];
                    [self.searchResults replaceObjectAtIndex:index withObject:tempDict];
                    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:index];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.listView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                    });
                    
                    close = [[self.searchCloseArr objectAtIndex:index] boolValue];
                    [weakSelf.searchCloseArr replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:!close]];
                } else {
                    NSDictionary *dict = [self.precriptionsArr objectAtIndex:index];
                    NSDictionary *prescriptionDict = [dict valueForKey:@"prescription"];
                    NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
                    [tempDict setValue:prescriptionDict forKey:@"prescription"];
                    [tempDict setValue:datas forKey:@"reports"];
                    [self.precriptionsArr replaceObjectAtIndex:index withObject:tempDict];
                    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:index];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.listView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                    });
                    
                    close = [[self.closeArr objectAtIndex:index] boolValue];
                    [weakSelf.closeArr replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:!close]];
                }
            }
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

- (void)getUserSportDetail:(NSMutableDictionary*)parameter reports:(NSArray*)reports {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kUSER_SPORT_DETAIL_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"sport detail :%@",responseObject);
        if (code == 0) {
            NSDictionary *data = [responseObject valueForKey:@"data"];
            NSLog(@"data is :%@",data);
            HistoryDetailViewController *detail = [[HistoryDetailViewController alloc] init];
            detail.sportDict = data;
            detail.reports = reports;
            [weakSelf.navigationController pushViewController:detail animated:NO];
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

//搜索处方结果
- (void)searchPrescriptions:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
       [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USER_PRESCRIPTION_LIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
           NSInteger code = [[responseObject valueForKey:@"code"] longValue];
           NSString *msg = [responseObject valueForKey:@"msg"];
           NSLog(@"******搜索用户处方结果列表********%@**************",responseObject);
           if (code == 0) {
               NSArray *rows = [responseObject valueForKey:@"rows"];
               NSMutableArray *tempArr = [NSMutableArray array];
               NSMutableArray *results = [NSMutableArray array];
               if (rows.count > 0) {
                   for (NSDictionary *dictonary in rows) {
                       [tempArr addObject:dictonary];
                   }
               }
               if (tempArr.count > 0) {
                   for (NSDictionary *dict in tempArr) {
                       NSMutableDictionary *prescriptionDict = [NSMutableDictionary dictionary];
                       [prescriptionDict setValue:dict forKey:@"prescription"];
                       [prescriptionDict setValue:@[] forKey:@"reports"];
                       [results addObject:prescriptionDict];
                   }
               }
               weakSelf.precriptionsArr = [results mutableCopy];
               if (weakSelf.closeArr.count > 0) {
                   [weakSelf.closeArr removeAllObjects];
               }
               for (NSInteger i = 0; i < weakSelf.precriptionsArr.count; i++) {
                   [weakSelf.closeArr addObject:[NSNumber numberWithBool:YES]];
               }
               [weakSelf.listView reloadData];
               NSDictionary *summarydict = [self getReportSummary];
               weakSelf.summaryLbl.text = [NSString stringWithFormat:@"累积处方数：%d  累积运动天数：%d  累积报告数：%d",[[summarydict valueForKey:@"sumPrescriptionCount"] integerValue],[[summarydict valueForKey:@"sumSportDays"] integerValue],[[summarydict valueForKey:@"sumReportCount"] integerValue]];
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

//获取用户处方列表
- (void)getUserPrescriptionList:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USER_PRESCRIPTION_LIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"******用户处方列表********%@**************",responseObject);
        if (code == 0) {
            NSArray *rows = [responseObject valueForKey:@"rows"];
            NSString *prescriptionName = self.prescriptionTF.text;
            NSString *trainingPositionStr = self.trainingPositionMenu.mainBtn.titleLabel.text;
            NSString *trainingDeviceStr = self.trainingEquipmentMenu.mainBtn.titleLabel.text;
            if (weakSelf.isFooterClick) {
                if (weakSelf.isSearch) {
                    NSMutableArray *results = [NSMutableArray array];
                    NSMutableArray *tempArr = [NSMutableArray array];
                    if (weakSelf.searchResults.count > 0) {
                        for (NSDictionary *dictonary in weakSelf.searchResults) {
                            NSDictionary *prescription = [dictonary valueForKey:@"prescription"];
                            [tempArr addObject:prescription];
                        }
                    }
                    if (rows.count > 0) {
                        for (NSDictionary *dictonary in rows) {
                            [tempArr addObject:dictonary];
                        }
                    }
                    //处方名称
                    if (prescriptionName.length > 0) {
                        NSMutableArray *tempArr = [NSMutableArray array];
                        if (tempArr.count > 0) {
                            for (NSDictionary *dictonary in tempArr) {
                                NSString *name = [dictonary valueForKey:@"title"];
                                if ([[name lowercaseString] containsString:[prescriptionName lowercaseString]]) {
                                    [tempArr addObject:dictonary];
                                }
                            }
                        }
                        tempArr = [tempArr mutableCopy];
                    }
                    //开始时间
                    if (self.startTimeStr.length > 0) {
                        NSMutableArray *tempArr = [NSMutableArray array];
                        if (tempArr.count > 0) {
                            for (NSDictionary *dictonary in tempArr) {
                                NSString *startTime = [dictonary valueForKey:@"startTime"];
                                if ([startTime containsString:self.startTimeStr]) {
                                    [tempArr addObject:dictonary];
                                }
                            }
                        }
                        tempArr = [tempArr mutableCopy];
                    }
                    //训练部位
                    if (![trainingPositionStr isEqualToString:@"训练部位"]) {
                        NSMutableArray *tempArr = [NSMutableArray array];
                        if (tempArr.count > 0) {
                            for (NSDictionary *dictonary in tempArr) {
                                NSArray *typeList = [dictonary valueForKey:@"typeList"];
                                if (typeList.count > 2) {
                                    NSDictionary *typeDict = typeList[1];
                                    NSString *position = [typeDict valueForKey:@"name"];
                                    if ([trainingPositionStr isEqualToString:position]) {
                                        [tempArr addObject:dictonary];
                                    }
                                }
                            }
                        }
                        tempArr = [tempArr mutableCopy];
                    }
                    //训练设备
                    if (![trainingDeviceStr isEqualToString:@"训练设备"]) {
                        NSMutableArray *tempArr = [NSMutableArray array];
                        if (tempArr.count > 0) {
                            for (NSDictionary *dictonary in tempArr) {
                                NSArray *typeList = [dictonary valueForKey:@"typeList"];
                                if (typeList.count > 2) {
                                    NSDictionary *typeDict = typeList[2];
                                    NSString *device = [typeDict valueForKey:@"name"];
                                    if ([trainingDeviceStr isEqualToString:device]) {
                                        [tempArr addObject:dictonary];
                                    }
                                }
                            }
                        }
                        tempArr = [tempArr mutableCopy];
                    }
                    if (tempArr.count > 0) {
                        for (NSDictionary *dict in tempArr) {
                            NSMutableDictionary *prescriptionDict = [NSMutableDictionary dictionary];
                            [prescriptionDict setValue:dict forKey:@"prescription"];
                            [prescriptionDict setValue:@[] forKey:@"reports"];
                            [results addObject:prescriptionDict];
                        }
                    }
                    weakSelf.searchResults = [results mutableCopy];
                    if (weakSelf.searchCloseArr.count > 0) {
                        [weakSelf.searchCloseArr removeAllObjects];
                    }
                    for (NSInteger i = 0; i < weakSelf.searchResults.count; i++) {
                        [weakSelf.searchCloseArr addObject:[NSNumber numberWithBool:YES]];
                    }
                } else {
                    NSMutableArray *tempArr = [NSMutableArray array];
                    NSMutableArray *results = [NSMutableArray array];
                    if (weakSelf.precriptionsArr.count > 0) {
                        for (NSDictionary *dictonary in weakSelf.precriptionsArr) {
                            NSDictionary *prescription = [dictonary valueForKey:@"prescription"];
                            [tempArr addObject:prescription];
                        }
                    }
                    if (rows.count > 0) {
                        for (NSDictionary *dictonary in rows) {
                            [tempArr addObject:dictonary];
                        }
                    }
                    if (tempArr.count > 0) {
                        for (NSDictionary *dict in tempArr) {
                            NSMutableDictionary *prescriptionDict = [NSMutableDictionary dictionary];
                            [prescriptionDict setValue:dict forKey:@"prescription"];
                            [prescriptionDict setValue:@[] forKey:@"reports"];
                            [results addObject:prescriptionDict];
                        }
                    }
                    weakSelf.precriptionsArr = [results mutableCopy];
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
                        NSMutableArray *results = [NSMutableArray array];
                        NSMutableArray *tempArr = [NSMutableArray array];
                        if (weakSelf.searchResults.count > 0) {//之前有数据
                            //替换前n个数据
                            NSMutableArray *originArr = [NSMutableArray array];
                            for (NSDictionary *dictonary in weakSelf.searchResults) {
                                NSDictionary *prescription = [dictonary valueForKey:@"prescription"];
                                [originArr addObject:prescription];
                            }
                            [tempArr addObjectsFromArray:rows];
                            if (originArr.count > rows.count) {//除去n个数据还有数据剩下
                                NSArray *afterArr = [originArr subarrayWithRange:NSMakeRange(rows.count, originArr.count - rows.count)];
                                [tempArr addObjectsFromArray:afterArr];
                            }
                        } else {
                            [tempArr addObjectsFromArray:rows];
                        }
                        //处方名称
                        if (prescriptionName.length > 0) {
                            NSMutableArray *tempArrs = [NSMutableArray array];
                            if (tempArr.count > 0) {
                                for (NSDictionary *dictonary in tempArr) {
                                    NSString *name = [dictonary valueForKey:@"title"];
                                    if ([[name lowercaseString] containsString:[prescriptionName lowercaseString]]) {
                                        [tempArrs addObject:dictonary];
                                    }
                                }
                            }
                            tempArr = [tempArrs mutableCopy];
                        }
                        //开始时间
                        if (self.startTimeStr.length > 0) {
                            NSMutableArray *tempArrs = [NSMutableArray array];
                            if (tempArr.count > 0) {
                                for (NSDictionary *dictonary in tempArr) {
                                    NSString *startTime = [dictonary valueForKey:@"startTime"];
                                    if ([startTime containsString:self.startTimeStr]) {
                                        [tempArrs addObject:dictonary];
                                    }
                                }
                            }
                            tempArr = [tempArrs mutableCopy];
                        }
                        //训练部位
                        if (![trainingPositionStr isEqualToString:@"训练部位"]) {
                            NSMutableArray *tempArrs = [NSMutableArray array];
                            if (tempArr.count > 0) {
                                for (NSDictionary *dictonary in tempArr) {
                                    NSArray *typeList = [dictonary valueForKey:@"typeList"];
                                    if (typeList.count > 2) {
                                        NSDictionary *typeDict = typeList[1];
                                        NSString *position = [typeDict valueForKey:@"name"];
                                        if ([trainingPositionStr isEqualToString:position]) {
                                            [tempArrs addObject:dictonary];
                                        }
                                    }
                                }
                            }
                            tempArr = [tempArrs mutableCopy];
                        }
                        //训练设备
                        if (![trainingDeviceStr isEqualToString:@"训练设备"]) {
                            NSMutableArray *tempArrs = [NSMutableArray array];
                            if (tempArr.count > 0) {
                                for (NSDictionary *dictonary in tempArr) {
                                    NSArray *typeList = [dictonary valueForKey:@"typeList"];
                                    if (typeList.count > 2) {
                                        NSDictionary *typeDict = typeList[2];
                                        NSString *device = [typeDict valueForKey:@"name"];
                                        if ([trainingDeviceStr isEqualToString:device]) {
                                            [tempArrs addObject:dictonary];
                                        }
                                    }
                                }
                            }
                            tempArr = [tempArrs mutableCopy];
                        }
                        if (tempArr.count > 0) {
                            for (NSDictionary *dictonary in tempArr) {
                                NSMutableDictionary *prescriptionDict = [NSMutableDictionary dictionary];
                                [prescriptionDict setValue:dictonary forKey:@"prescription"];
                                [prescriptionDict setValue:@[] forKey:@"reports"];
                                [results addObject:prescriptionDict];
                            }
                        }
                        weakSelf.searchResults = [results mutableCopy];
                        if (weakSelf.searchCloseArr.count > 0) {
                            [weakSelf.searchCloseArr removeAllObjects];
                        }
                        for (NSInteger i = 0; i < self.searchResults.count; i++) {
                            [self.searchCloseArr addObject:[NSNumber numberWithBool:YES]];
                        }
                    } else {
                        NSMutableArray *results = [NSMutableArray array];
                        NSMutableArray *tempArr = [NSMutableArray array];
                        if (weakSelf.precriptionsArr.count > 0) {//之前有数据
                            //替换前n个数据
                            NSMutableArray *originArr = [NSMutableArray array];
                            for (NSDictionary *dictonary in weakSelf.precriptionsArr) {
                                NSDictionary *prescription = [dictonary valueForKey:@"prescription"];
                                [originArr addObject:prescription];
                            }
                            [tempArr addObjectsFromArray:rows];
                            if (originArr.count > rows.count) {//除去n个数据还有数据剩下
                                NSArray *afterArr = [originArr subarrayWithRange:NSMakeRange(rows.count, originArr.count - rows.count)];
                                [tempArr addObjectsFromArray:afterArr];
                            }
                        } else {
                            [tempArr addObjectsFromArray:rows];
                        }
                        if (tempArr.count > 0) {
                            for (NSDictionary *dictonary in tempArr) {
                                NSMutableDictionary *prescriptionDict = [NSMutableDictionary dictionary];
                                [prescriptionDict setValue:dictonary forKey:@"prescription"];
                                [prescriptionDict setValue:@[] forKey:@"reports"];
                                [results addObject:prescriptionDict];
                            }
                        }
                        weakSelf.precriptionsArr = [results mutableCopy];
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
