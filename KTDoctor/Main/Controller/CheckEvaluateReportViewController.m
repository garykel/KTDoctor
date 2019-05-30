//
//  CheckEvaluateReportViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/5/30.
//  Copyright © 2019 dz. All rights reserved.
//

#import "CheckEvaluateReportViewController.h"
#import "UserModel.h"
#import "EvaluateReportCell.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 150
#define KSearchView_TopMargin 15
#define kSearchView_Height 46
#define kDateBtn_LeftMargin 15
#define kDateBtn_Height 20
#define kDateBtn_Width 300.0
#define kDateBtn_Font 13.0
#define kSearch_Button_Width 150
#define kSearch_Button_LeftMargin 15
#define kSearch_Button_RightMargin 16
#define kSearch_Button_Height 22
#define kSearch_Button_Font 11.0
#define kCountLbl_TopMargin 20
#define kCountLbl_FontSize 13.0
#define kCountLbl_Height 13
#define kCountLbl_Width 200
#define kListBgView_TopMargin 5
#define kListBgView_LeftMargin 5
#define kListView_TopMargin 5
#define kListView_LeftMargin 5
#define kListView_Header_Height 44
#define kListView_Header_Lbl_FontSize 13.0
#define kListView_Header_Lbl_LineWidth 1
#define kView_TopMargin 20
#define kView_BottomMargin 15
#define kView_LeftMargin 20
#define kNoDatLbl_Width 100
#define kNoDataLbl_FontSize 20
#define kNoDataLbl_Height 18
#define kListView_RowHeight 44
#define kListView_FooterView_Height 10

CGSize evaluateReportListviewSize;

@interface CheckEvaluateReportViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIView *searchBgView;
@property (nonatomic,strong)UIButton *dateBtn;
@property (nonatomic,strong)UIButton *searchBtn;
@property (nonatomic,strong)UILabel *countLbl;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UIView *listBgView;
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,strong)UIView *headerView;
@property (nonatomic,strong)UILabel *noDataLbl;
@property (nonatomic,strong)NSMutableArray *reports;
@property (nonatomic,assign)NSInteger offset;
@property (nonatomic,assign)BOOL isFooterClick;
@property (nonatomic,copy)NSString *sportTimeStr;
@property (nonatomic,strong)UserModel *user;
@end

@implementation CheckEvaluateReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.reports = [NSMutableArray array];
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setValue:@"2019-04-03 16:55:05" forKey:@"createTime"];
    [dict1 setValue:@90 forKey:@"totalTime"];
    [dict1 setValue:@(23.5) forKey:@"avgSpeed"];
    [dict1 setValue:@90 forKey:@"avgPower"];
    [dict1 setValue:@178 forKey:@"maxHr"];
    [dict1 setValue:@99 forKey:@"avgHr"];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setValue:@"2019-05-03 16:55:05" forKey:@"createTime"];
    [dict2 setValue:@120 forKey:@"totalTime"];
    [dict2 setValue:@(23.5) forKey:@"avgSpeed"];
    [dict2 setValue:@90 forKey:@"avgPower"];
    [dict2 setValue:@178 forKey:@"maxHr"];
    [dict2 setValue:@99 forKey:@"avgHr"];
    
    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    [dict3 setValue:@"2018-04-03 16:55:05" forKey:@"createTime"];
    [dict3 setValue:@390 forKey:@"totalTime"];
    [dict3 setValue:@(23.5) forKey:@"avgSpeed"];
    [dict3 setValue:@90 forKey:@"avgPower"];
    [dict3 setValue:@178 forKey:@"maxHr"];
    [dict3 setValue:@99 forKey:@"avgHr"];
    
    NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
    [dict4 setValue:@"2015-04-05 16:55:05" forKey:@"createTime"];
    [dict4 setValue:@290 forKey:@"totalTime"];
    [dict4 setValue:@(23.5) forKey:@"avgSpeed"];
    [dict4 setValue:@90 forKey:@"avgPower"];
    [dict4 setValue:@178 forKey:@"maxHr"];
    [dict4 setValue:@99 forKey:@"avgHr"];
    
//    [self.reports addObject:dict1];
//    [self.reports addObject:dict2];
//    [self.reports addObject:dict3];
//    [self.reports addObject:dict4];
    self.user = [[UserModel sharedUserModel] getCurrentUser];;
    self.isFooterClick = NO;
    self.offset = 0;
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
    self.titleLbl.text = @"体能评估报告";
    [self.navView addSubview:self.titleLbl];
}

- (void)setupUI {
    UIImage *bgImg = [UIImage imageNamed:@"history_bg"];
    bgImg = [self imageCompressWithSimple:bgImg scaledToSize:CGSizeMake(kWidth, kHeight - CGRectGetMaxY(self.navView.frame))];
    self.bgImg = [[UIImageView alloc] initWithImage:bgImg];
    self.bgImg.frame = CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWidth, kHeight - CGRectGetMaxY(self.navView.frame));
    [self.view addSubview:self.bgImg];
    self.bgImg.userInteractionEnabled = YES;
    
    self.searchBgView = [[UIView alloc] initWithFrame:CGRectMake(kView_LeftMargin * kXScal, KSearchView_TopMargin * kYScal, kWidth - 2 * kView_LeftMargin * kXScal, kSearchView_Height * kYScal)];
    self.searchBgView.backgroundColor = [UIColor colorWithHexString:@"#e4f7f8"];
    self.searchBgView.layer.cornerRadius = 4;
    self.searchBgView.layer.masksToBounds = YES;
    [self.bgImg addSubview:self.searchBgView];
    
    self.dateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.dateBtn.backgroundColor = [UIColor whiteColor];
    [self.dateBtn setTitle:@"请选择运动日期" forState:UIControlStateNormal];
    self.dateBtn.frame = CGRectMake(0, 0, kDateBtn_Width * kXScal, kDateBtn_Height * kYScal);
    [self.dateBtn.titleLabel setFont:[UIFont systemFontOfSize:kDateBtn_Font * kYScal]];
    [self.dateBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.dateBtn.center = CGPointMake(kDateBtn_LeftMargin * kXScal + kDateBtn_Width * kXScal/2.0, self.searchBgView.frame.size.height/2.0);
    [self.dateBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.dateBtn.frame.size.width - 20, 0, 0)];
    [self.dateBtn setImage:[UIImage imageNamed:@"calendar"] forState:UIControlStateNormal];
    [self.dateBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -kDateBtn_Width * kXScal/2.0 - 10, 0, 0)];
    [self.dateBtn addTarget:self action:@selector(chooseTime:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBgView addSubview:self.dateBtn];
    
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat searchBtn_TopMargin = (kSearchView_Height * kYScal - kSearch_Button_Height * kYScal)/2;
    self.searchBtn.frame = CGRectMake(CGRectGetMaxX(self.dateBtn.frame) + kSearch_Button_LeftMargin * kXScal, searchBtn_TopMargin, kSearch_Button_Width * kXScal, kSearch_Button_Height * kYScal);
    self.searchBtn.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    self.searchBtn.layer.cornerRadius = kSearch_Button_Height * kYScal / 2.0;
    self.searchBtn.layer.masksToBounds = YES;
    [self.searchBtn setTitleColor:[UIColor colorWithHexString:@"#e5ffff"] forState:UIControlStateNormal];
    [self.searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBgView addSubview:self.searchBtn];
    
    self.countLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.searchBgView.frame.origin.x, CGRectGetMaxY(self.searchBgView.frame) + kCountLbl_TopMargin * kYScal, kCountLbl_Width * kXScal, kCountLbl_Height * kYScal)];
    self.countLbl.text = @"结果列表(0)";
    self.countLbl.textColor = [UIColor blackColor];
    self.countLbl.font = [UIFont systemFontOfSize:kCountLbl_FontSize * kYScal];
    [self.bgImg addSubview:self.countLbl];
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(self.searchBgView.frame.origin.x, CGRectGetMaxY(self.countLbl.frame) + kView_TopMargin * kYScal, self.searchBgView.frame.size.width, kHeight - CGRectGetMaxY(self.navView.frame) - KSearchView_TopMargin * kYScal - self.searchBgView.frame.size.height - (self.countLbl.frame.size.height + kCountLbl_TopMargin * kYScal) - (kView_BottomMargin + kView_TopMargin) * kYScal)];
    self.bottomView.backgroundColor = [UIColor colorWithHexString:@"#e4f7f8"];
    self.bottomView.layer.cornerRadius = 4;
    self.bottomView.layer.masksToBounds = YES;
    [self.bgImg addSubview:self.bottomView];
    
    self.listBgView = [[UIView alloc] initWithFrame:CGRectMake(kListBgView_LeftMargin * kXScal, kListBgView_TopMargin * kYScal, self.bottomView.frame.size.width - 2 * kListBgView_LeftMargin * kXScal, self.bottomView.frame.size.height - 2 * kListBgView_TopMargin * kYScal)];
    self.listBgView.backgroundColor = [UIColor colorWithHexString:@"#a4e0eb"];
    self.listBgView.layer.cornerRadius = 4;
    self.listBgView.layer.masksToBounds = YES;
    [self.bottomView addSubview:self.listBgView];
    
    CGFloat listView_Width = self.listBgView.frame.size.width - 2 * kListView_LeftMargin * kXScal;
    
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(kListView_LeftMargin * kXScal, kListView_TopMargin * kYScal, listView_Width, kListView_Header_Height * kYScal)];
    self.headerView.backgroundColor = [UIColor whiteColor];
    self.headerView.layer.cornerRadius = 4;
    self.headerView.layer.masksToBounds = YES;
    [self.listBgView addSubview:self.headerView];
    
    evaluateReportListviewSize = self.headerView.frame.size;
    
    CGFloat lbl_Width = (self.headerView.frame.size.width - 5 * kListView_Header_Lbl_LineWidth)/6;
    UILabel *sportDateLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, lbl_Width, self.headerView.frame.size.height)];
    sportDateLbl.text = @"运动日期";
    sportDateLbl.textColor = [UIColor blackColor];
    sportDateLbl.font = [UIFont systemFontOfSize:kListView_Header_Lbl_FontSize * kYScal];
    sportDateLbl.textAlignment = NSTextAlignmentCenter;
    [self.headerView addSubview:sportDateLbl];
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(sportDateLbl.frame), 0, kListView_Header_Lbl_LineWidth, self.headerView.frame.size.height)];
    line1.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.headerView addSubview:line1];
    
    UILabel *timeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(line1.frame), 0, lbl_Width, self.headerView.frame.size.height)];
    timeLbl.text = @"累计时长";
    timeLbl.textColor = [UIColor blackColor];
    timeLbl.font = [UIFont systemFontOfSize:kListView_Header_Lbl_FontSize * kYScal];
    timeLbl.textAlignment = NSTextAlignmentCenter;
    [self.headerView addSubview:timeLbl];
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(timeLbl.frame), 0, kListView_Header_Lbl_LineWidth, self.headerView.frame.size.height)];
    line2.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.headerView addSubview:line2];
    
    UILabel *avgPowerLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(line2.frame), 0, lbl_Width, self.headerView.frame.size.height)];
    avgPowerLbl.text = @"平均功率";
    avgPowerLbl.textColor = [UIColor blackColor];
    avgPowerLbl.font = [UIFont systemFontOfSize:kListView_Header_Lbl_FontSize * kYScal];
    avgPowerLbl.textAlignment = NSTextAlignmentCenter;
    [self.headerView addSubview:avgPowerLbl];
    
    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(avgPowerLbl.frame), 0, kListView_Header_Lbl_LineWidth, self.headerView.frame.size.height)];
    line3.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.headerView addSubview:line3];
    
    UILabel *avgSpeedLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(line3.frame), 0, lbl_Width, self.headerView.frame.size.height)];
    avgSpeedLbl.text = @"平均速度";
    avgSpeedLbl.textColor = [UIColor blackColor];
    avgSpeedLbl.font = [UIFont systemFontOfSize:kListView_Header_Lbl_FontSize * kYScal];
    avgSpeedLbl.textAlignment = NSTextAlignmentCenter;
    [self.headerView addSubview:avgSpeedLbl];
    
    UIView *line4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(avgSpeedLbl.frame), 0, kListView_Header_Lbl_LineWidth, self.headerView.frame.size.height)];
    line4.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.headerView addSubview:line4];
    
    UILabel *maxHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(line4.frame), 0, lbl_Width, self.headerView.frame.size.height)];
    maxHRLbl.text = @"最大心率";
    maxHRLbl.textColor = [UIColor blackColor];
    maxHRLbl.font = [UIFont systemFontOfSize:kListView_Header_Lbl_FontSize * kYScal];
    maxHRLbl.textAlignment = NSTextAlignmentCenter;
    [self.headerView addSubview:maxHRLbl];
    
    UIView *line5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(maxHRLbl.frame), 0, kListView_Header_Lbl_LineWidth, self.headerView.frame.size.height)];
    line5.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.headerView addSubview:line5];
    
    UILabel *avgHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(line5.frame), 0, lbl_Width, self.headerView.frame.size.height)];
    avgHRLbl.text = @"平均心率";
    avgHRLbl.textColor = [UIColor blackColor];
    avgHRLbl.font = [UIFont systemFontOfSize:kListView_Header_Lbl_FontSize * kYScal];
    avgHRLbl.textAlignment = NSTextAlignmentCenter;
    [self.headerView addSubview:avgHRLbl];
    
    CGFloat listView_Height = self.listBgView.frame.size.height - self.headerView.frame.size.height - 2 * kListView_TopMargin * kYScal;
    self.listView = [[UITableView alloc] initWithFrame:CGRectMake(kListView_LeftMargin * kXScal,CGRectGetMaxY(self.headerView.frame) + kListView_TopMargin * kYScal, listView_Width, listView_Height) style:UITableViewStylePlain];
    self.listView.tableFooterView = [[UIView alloc] init];
    self.listView.backgroundColor = [UIColor clearColor];
    self.listView.delegate = self;
    self.listView.dataSource = self;
    self.listView.separatorColor = [UIColor clearColor];
    [self.listBgView addSubview:self.listView];
    
    CGFloat noDataLbl_LeftMargin = (self.bottomView.frame.size.width - kNoDatLbl_Width * kXScal)/2.0;
    CGFloat noDataLbl_TopMargin = (self.bottomView.frame.size.height - self.headerView.frame.size.height - kNoDataLbl_Height * kYScal)/2.0;
    self.noDataLbl = [[UILabel alloc] initWithFrame:CGRectMake(noDataLbl_LeftMargin, noDataLbl_TopMargin, kNoDatLbl_Width * kXScal, kNoDataLbl_Height * kYScal)];
    self.noDataLbl.textColor = [UIColor grayColor];
    self.noDataLbl.textAlignment = NSTextAlignmentCenter;
    self.noDataLbl.text = @"数据为空";
    self.noDataLbl.font = [UIFont systemFontOfSize:kNoDataLbl_FontSize * kYScal];
    self.noDataLbl.hidden = YES;
    [self.listView addSubview:self.noDataLbl];
    
    //添加头部的下拉刷新
    MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc] init];
    [header setRefreshingTarget:self refreshingAction:@selector(headerClick)];
    self.listView.mj_header = header;
    
    //添加底部的上拉加载
    MJRefreshBackNormalFooter *footer = [[MJRefreshBackNormalFooter alloc] init];
    [footer setRefreshingTarget:self refreshingAction:@selector(footerClick)];
    self.listView.mj_footer = footer;
}

- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - UITableViewDelegate && UITableViewDatasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kListView_RowHeight * kYScal;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.reports.count;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor whiteColor];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == self.reports.count - 1) {
        return 0;
    } else {
        return kListView_FooterView_Height * kYScal;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseCellIdStr = [NSString stringWithFormat:@"EvaluateReportCell%ld%ld",(long)indexPath.section,(long)indexPath.row];
    EvaluateReportCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellIdStr];
    if (cell == nil) {
        cell = [[EvaluateReportCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellIdStr];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    }
    NSDictionary *dict = [self.reports objectAtIndex:indexPath.section];
    NSString *createTime = [dict valueForKey:@"createTime"];
    if (createTime.length > 0) {
        cell.dateLbl.text = [self getDateString:createTime];
    }
    NSInteger totalTime = [[dict valueForKey:@"totalTime"] integerValue];
    cell.timeLbl.text = [self getTimeString:totalTime];
    NSInteger avgPower = [[dict valueForKey:@"avgPower"] integerValue];
    cell.avgPowerLbl.text = [NSString stringWithFormat:@"%d w",avgPower];
    CGFloat avgSpeed = [[dict valueForKey:@"avgSpeed"] floatValue];
    cell.avgSpeedLbl.text = [NSString stringWithFormat:@"%.1f km/h",avgSpeed];
    NSInteger maxHr = [[dict valueForKey:@"maxHr"] integerValue];
    cell.maxHRLbl.text = [NSString stringWithFormat:@"%d bpm",maxHr];
    NSInteger avgHr = [[dict valueForKey:@"avgHr"] integerValue];
    cell.avgHRLbl.text = [NSString stringWithFormat:@"%d bpm",avgHr];
    return cell;
}

- (NSString *)getDateString:(NSString*)timeStr {
    NSString *result = @"";
    if (timeStr.length > 0) {
        result = [timeStr substringToIndex:10];
    }
    return result;
}

- (NSString *)getTimeString:(NSInteger)duration {
    NSString *result = @"";
    NSInteger min = duration / 60;
    NSInteger sec = duration % 60;
    result = [NSString stringWithFormat:@"%d分%d秒",min,sec];
    return result;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)chooseTime:(UIButton *)sender {
    __weak typeof (self)weakSelf = self;
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {
        NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd"];
        [weakSelf.dateBtn setTitle:date forState:UIControlStateNormal];
        weakSelf.sportTimeStr = date;
    }];
    datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.doneButtonColor = [UIColor grayColor];//确定按钮的颜色
    [datepicker show];
}

- (void)search:(UIButton*)sender {
    if (self.reports.count > 0) {
        [self.reports removeAllObjects];
    }
    self.isFooterClick = NO;
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@0 forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    NSInteger userId = [[self.userInfo valueForKey:@"userId"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:self.sportTimeStr forKey:@"startTime"];
    [parameter setValue:@"" forKey:@"endTime"];
    [parameter setValue:@"" forKey:@"sort"];
    [self getUserStaminaTestList:parameter];
}

- (void)headerClick {
    self.isFooterClick = NO;
    [self.listView.mj_header endRefreshing];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@0 forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    NSInteger userId = [[self.userInfo valueForKey:@"userId"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:self.sportTimeStr forKey:@"startTime"];
    [parameter setValue:@"" forKey:@"endTime"];
    [parameter setValue:@"" forKey:@"sort"];
    [self getUserStaminaTestList:parameter];
}

- (void)footerClick {
    self.isFooterClick = YES;
    self.offset += 10;
    [self.listView.mj_footer endRefreshing];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@(self.offset) forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    NSInteger userId = [[self.userInfo valueForKey:@"userId"] integerValue];
    [parameter setValue:@(userId) forKey:@"userId"];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:self.sportTimeStr forKey:@"startTime"];
    [parameter setValue:@"" forKey:@"endTime"];
    [parameter setValue:@"" forKey:@"sort"];
    [self getUserStaminaTestList:parameter];
}

#pragma mark - networkFunctions

- (void)getUserStaminaTestList:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USER_STAMINA_TEST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSString *result = [weakSelf convertToJSONData:responseObject];
        NSLog(@"result is :%@",result);
        if (code == 0) {
            NSArray *rows = [responseObject valueForKey:@"rows"];
            if (weakSelf.isFooterClick) {
                [weakSelf.reports addObjectsFromArray:rows];
                [weakSelf.listView.mj_footer endRefreshing];
            } else {
                if (rows.count > 0) {
                    if (weakSelf.reports.count > 0) {//之前有数据
                        //替换前n个数据
                        NSMutableArray *tempArr = [NSMutableArray array];
                        [tempArr addObjectsFromArray:rows];
                        if (weakSelf.reports.count > rows.count) {//除去n个数据还有数据剩下
                            NSArray *afterArr = [weakSelf.reports subarrayWithRange:NSMakeRange(rows.count, weakSelf.reports.count - rows.count)];
                            [tempArr addObjectsFromArray:afterArr];
                        }
                        weakSelf.reports = [tempArr mutableCopy];
                    } else {
                        [weakSelf.reports addObjectsFromArray:rows];
                    }
                }
                [weakSelf.listView.mj_header endRefreshing];
            }
            if (weakSelf.reports.count == 0) {
                weakSelf.noDataLbl.hidden = NO;
            } else {
                weakSelf.noDataLbl.hidden = YES;
                weakSelf.reports = [rows mutableCopy];
                [weakSelf.listView reloadData];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
