//
//  HistoryViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/4.
//  Copyright © 2019 dz. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryDetailViewController.h"
#import "SortViewController.h"
#import "PGDatePickManager.h"
#import "HistoryCell.h"
#import "UserModel.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTimeLbl_LeftMargin 15
#define kTimeLbl_FontSize 16.0
#define kTimeLbl_Width 200
#define kTitle_FontSize 22
#define KSearchView_TopMargin 10
#define kSearchView_Height 60
#define kView_TopMargin 10
#define kView_BottomMargin 15
#define kView_LeftMargin 18
#define kStartTimeMenu_LeftMargin 15
#define kSearch_TF_Height 40
#define kSearch_TF_Width 150
#define kSearch_TF_HorizontalSpace 25
#define kSearch_Button_LeftMargin 15
#define kSearch_Button_RightMargin 13
#define kSearch_Button_Height 40
#define kSearch_Button_Width 157
#define kListView_TopMargin 14
#define kListView_LeftMargin 15
#define kListView_RowHeight 156
#define kListView_FooterView_Height 10
#define kNoDatLbl_Width 100
#define kNoDataLbl_FontSize 20
#define kNoDataLbl_Height 18

@interface HistoryViewController ()<UITableViewDelegate,UITableViewDataSource,PGDatePickerDelegate,PGDatePickManagerDelegate,SortDelegate>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *timeLbl;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIButton *sortBtn;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIView *searchBgView;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UIButton *startTimeTF;
@property (nonatomic,strong)UITextField *nameTF;
@property (nonatomic,strong)UITextField *prescriptionTF;
@property (nonatomic,strong)UIButton *searchBtn;
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,strong)UILabel *noDataLbl;
@property (nonatomic,copy)NSString *startTimeStr;
@property (nonatomic,assign)NSInteger offset;
@property (nonatomic,assign)BOOL isFooterClick;
@property (nonatomic,strong)PGDatePickManager *datePickManager;
@property (nonatomic,assign)BOOL isSearch;
@property (nonatomic,strong)NSMutableArray *searchResults;
@property (nonatomic,strong)NSMutableArray *allUserSports;
@property (nonatomic,strong)SortViewController *sort;
@property (nonatomic,strong)UIPopoverPresentationController *popController;
@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.isFooterClick = NO;
    self.isSearch = NO;
    self.searchResults = [NSMutableArray array];
    self.allUserSports = [NSMutableArray array];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
    NSDictionary *dict = user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@0 forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    [parameter setValue:@"-create_time" forKey:@"sort"];
    [parameter setValue:@"" forKey:@"userKeyword"];
    [self getAllUserSportList:parameter];
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
    
    self.sortBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sortBtn setImage:[UIImage imageNamed:@"sort"] forState:UIControlStateNormal];
    self.sortBtn.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    self.sortBtn.frame = CGRectMake(kWidth - kButton_Height - kBackButton_LeftMargin, backButtonTop, kButton_Height, kButton_Height);
    self.sortBtn.layer.cornerRadius = kButton_Height / 2.0;
    self.sortBtn.layer.masksToBounds = YES;
    [self.sortBtn addTarget:self action:@selector(sort:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.sortBtn];
}

- (void)setupUI {
    UIImage *bgImg = [UIImage imageNamed:@"history_bg"];
    bgImg = [self imageCompressWithSimple:bgImg scaledToSize:CGSizeMake(kWidth, kHeight - CGRectGetMaxY(self.navView.frame))];
    self.bgImg = [[UIImageView alloc] initWithImage:bgImg];
    self.bgImg.frame = CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWidth, kHeight - CGRectGetMaxY(self.navView.frame));
    [self.view addSubview:self.bgImg];
    self.bgImg.userInteractionEnabled = YES;
    
    self.searchBgView = [[UIView alloc] initWithFrame:CGRectMake(kView_LeftMargin * kXScal, KSearchView_TopMargin * kYScal, kWidth - 2 * kView_LeftMargin * kXScal, kSearchView_Height * kYScal)];
    self.searchBgView.backgroundColor = [UIColor colorWithHexString:@"#e6f5f8"];
    self.searchBgView.layer.cornerRadius = 4;
    self.searchBgView.layer.masksToBounds = YES;
    [self.bgImg addSubview:self.searchBgView];
    
    CGFloat TF_Width = (self.searchBgView.frame.size.width - kStartTimeMenu_LeftMargin * kXScal - 2 * kSearch_TF_HorizontalSpace * kXScal - kSearch_Button_LeftMargin * kXScal - kSearch_Button_Width * kXScal - kSearch_Button_RightMargin * kXScal)/3;
    self.startTimeTF = [[UIButton alloc] initWithFrame:CGRectMake(kStartTimeMenu_LeftMargin * kXScal, (kSearchView_Height * kYScal - kSearch_TF_Height * kYScal) / 2, TF_Width, kSearch_TF_Height * kYScal)];
    self.startTimeTF.backgroundColor = [UIColor whiteColor];
    [self.startTimeTF setImage:[UIImage imageNamed:@"calendar"] forState:UIControlStateNormal];
    [self.startTimeTF setTitle:@"开始时间" forState:UIControlStateNormal];
    [self.startTimeTF setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.startTimeTF setImageEdgeInsets:UIEdgeInsetsMake(0, self.startTimeTF.frame.size.width - 20, 0, 0)];
    [self.startTimeTF setTitleEdgeInsets:UIEdgeInsetsMake(0, -TF_Width * kXScal/2.0 - 20, 0, 0)];
    [self.startTimeTF addTarget:self action:@selector(chooseStartTime:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBgView addSubview:self.startTimeTF];
    
    self.nameTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.startTimeTF.frame) + kSearch_TF_HorizontalSpace * kXScal, self.startTimeTF.frame.origin.y, TF_Width, kSearch_TF_Height * kYScal)];
    self.nameTF.backgroundColor = [UIColor whiteColor];
    self.nameTF.placeholder = @"姓名/ID/手机号";
    [self.searchBgView addSubview:self.nameTF];
    
    self.prescriptionTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameTF.frame) + kSearch_TF_HorizontalSpace * kXScal, self.startTimeTF.frame.origin.y, TF_Width, kSearch_TF_Height * kYScal)];
    self.prescriptionTF.backgroundColor = [UIColor whiteColor];
    self.prescriptionTF.placeholder = @"处方名称";
    [self.searchBgView addSubview:self.prescriptionTF];
    
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat searchBtn_TopMargin = (kSearchView_Height * kYScal - kSearch_Button_Height * kYScal)/2;
    self.searchBtn.frame = CGRectMake(CGRectGetMaxX(self.prescriptionTF.frame) + kSearch_Button_LeftMargin * kXScal, searchBtn_TopMargin, kSearch_Button_Width * kXScal, kSearch_Button_Height * kYScal);
    self.searchBtn.backgroundColor = [UIColor colorWithHexString:@"#0eabc9"];
    [self.searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    self.searchBtn.layer.cornerRadius = kSearch_Button_Height * kYScal / 2.0;
    self.searchBtn.layer.masksToBounds = YES;
    [self.searchBtn setTitleColor:[UIColor colorWithHexString:@"#e5ffff"] forState:UIControlStateNormal];
    [self.searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBgView addSubview:self.searchBtn];
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(self.searchBgView.frame.origin.x, CGRectGetMaxY(self.searchBgView.frame) + kView_TopMargin * kYScal, self.searchBgView.frame.size.width, kHeight - CGRectGetMaxY(self.navView.frame) - KSearchView_TopMargin * kYScal - self.searchBgView.frame.size.height - (kView_BottomMargin + kView_TopMargin) * kYScal)];
    self.bottomView.backgroundColor = [UIColor colorWithHexString:@"#e6f5f8"];
    self.bottomView.layer.cornerRadius = 4;
    self.bottomView.layer.masksToBounds = YES;
    [self.bgImg addSubview:self.bottomView];
    
    CGFloat listView_Width = self.bottomView.frame.size.width - 2 * kListView_LeftMargin * kXScal;
    CGFloat listView_Height = self.bottomView.frame.size.height - 2 * kListView_TopMargin * kYScal;
    self.listView = [[UITableView alloc] initWithFrame:CGRectMake(kListView_LeftMargin * kXScal, kListView_TopMargin * kYScal, listView_Width, listView_Height) style:UITableViewStylePlain];
    self.listView.tableFooterView = [[UIView alloc] init];
    self.listView.backgroundColor = [UIColor colorWithHexString:@"#e6f5f8"];
    self.listView.delegate = self;
    self.listView.dataSource = self;
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
    
    //添加头部的下拉刷新
    MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc] init];
    [header setRefreshingTarget:self refreshingAction:@selector(headerClick)];
    self.listView.mj_header = header;
    
    //添加底部的上拉加载
    MJRefreshBackNormalFooter *footer = [[MJRefreshBackNormalFooter alloc] init];
    [footer setRefreshingTarget:self refreshingAction:@selector(footerClick)];
    self.listView.mj_footer = footer;
}

- (void)headerClick {
    self.isFooterClick = NO;
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
    NSDictionary *dict = user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@0 forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    [parameter setValue:@"-create_time" forKey:@"sort"];
    [parameter setValue:self.nameTF.text forKey:@"userKeyword"];
    [self getUsersSportList:parameter];
}

- (void)footerClick {
    self.isFooterClick = YES;
    self.offset += 10;
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
    NSDictionary *dict = user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@(self.offset) forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    [parameter setValue:@"-create_time" forKey:@"sort"];
    [parameter setValue:self.nameTF.text forKey:@"userKeyword"];
    [self getUsersSportList:parameter];
    [self.listView.mj_footer endRefreshing];
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
//    self.datePickManager = [[PGDatePickManager alloc]init];
//    self.datePickManager.isShadeBackground = true;
//    self.datePickManager.style = PGDatePickManagerStyleAlertBottomButton;
//    self.datePickManager.delegate = self;
//    PGDatePicker *datePicker = self.datePickManager.datePicker;
//    datePicker.delegate = self;
//    //    datePicker.datePickerType = PGDatePickerTypeVertical;
//    datePicker.isHiddenMiddleText = false;
//    //    datePicker.isCycleScroll = true;
//    datePicker.datePickerType = PGDatePickerTypeSegment;
//    datePicker.datePickerMode = PGDatePickerModeDate;
//    [self presentViewController:self.datePickManager animated:false completion:nil];
}

- (NSString *)getCurrentTimeString{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *currentDate = [NSDate date];
    NSString *currentDateStr = [format stringFromDate:currentDate];
    return currentDateStr;
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
    if (self.isSearch) {
        return self.searchResults.count;
    } else {
        return self.sportlists.count;
    }
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor whiteColor];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.isSearch) {
        if (section == self.searchResults.count - 1) {
            return 0;
        } else {
            return kListView_FooterView_Height * kYScal;
        }
    } else {
        if (section == self.sportlists.count - 1) {
            return 0;
        } else {
            return kListView_FooterView_Height * kYScal;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseCellIdStr = [NSString stringWithFormat:@"HistoryCellId%ld%ld",(long)indexPath.section,(long)indexPath.row];
    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellIdStr];
    if (cell == nil) {
        cell = [[HistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellIdStr];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorWithHexString:@"#a7e0ec"];
    }
    if (self.isSearch) {
        if (self.searchResults.count > 0) {
            NSDictionary *sportDict = [self.searchResults objectAtIndex:indexPath.section];
            cell.idLbl.text = [NSString stringWithFormat:@"ID:%@",[sportDict valueForKey:@"userId"]];
            cell.nameLbl.text = [NSString stringWithFormat:@"%@",[sportDict valueForKey:@"userName"]];
            [cell.headImg sd_setImageWithURL:[NSURL URLWithString:[sportDict valueForKey:@"headUrl"]] placeholderImage:[UIImage imageNamed:@"default_head"]];
            [cell.patientTypeBtn setTitle:[sportDict valueForKey:@"title"] forState:UIControlStateNormal];
            cell.startTimeLbl.text = [NSString stringWithFormat:@"开始时间:%@",[sportDict valueForKey:@"startTime"]];
            NSInteger completePercent = [[sportDict valueForKey:@"completePercent"] integerValue];
            cell.accomplishValLbl.text = [NSString stringWithFormat:@"%ld %%",completePercent];
            cell.maxHrValLbl.text = [NSString stringWithFormat:@"%@ Bpm",[sportDict valueForKey:@"maxHr"]];
            cell.avgHrValLbl.text = [NSString stringWithFormat:@"%@ Bpm",[sportDict valueForKey:@"avgHr"]];
            CGFloat calorie = [[sportDict valueForKey:@"calorie"] floatValue];
            cell.calorieValLbl.text = [NSString stringWithFormat:@"%.1f Kcal",calorie];
            CGFloat totalMileage = [[sportDict valueForKey:@"totalMileage"] floatValue];
            cell.mileValLbl.text = [NSString stringWithFormat:@"%.1f Km",totalMileage];
            CGFloat met = [[sportDict valueForKey:@"mets"] floatValue];
            cell.metsValLbl.text = [NSString stringWithFormat:@"%.1f METs",met];
            CGFloat speed = [[sportDict valueForKey:@"speed"] floatValue];
            cell.avgSpeedValLbl.text = [NSString stringWithFormat:@"%.1f Km/h",speed];
            NSInteger type2 = [[sportDict valueForKey:@"type2"] integerValue];
            if (type2 == 1) {
                cell.avgIntensityLbl.text = @"平均强度";
            } else {
                cell.avgIntensityLbl.text = @"平均功率";
            }
            cell.avgIntensityValLbl.text = [NSString stringWithFormat:@"%@",[sportDict valueForKey:@"avgDifficulty"]];
            NSInteger totalTime = [[sportDict valueForKey:@"totalTime"] integerValue];
            NSString *totalTimeStr = [self getTimeString:totalTime];
            cell.totalTimeValLbl.text = totalTimeStr;
            NSString *rpeSample = [sportDict valueForKey:@"rpeSample"];
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
                cell.preValLbl1.text = results[0];
                cell.preValLbl2.text = results[1];
                cell.preValLbl3.text = results[2];
                cell.preValLbl4.text = results[3];
                cell.preValLbl5.text = results[4];
                cell.preValLbl6.text = results[5];
                cell.preValLbl7.text = results[6];
                cell.preValLbl8.text = results[7];
                cell.preValLbl9.text = results[8];
                cell.preValLbl10.text = results[9];
                cell.preValLbl11.text = results[10];
                cell.preValLbl12.text = results[11];
            }
        }
    } else {
        if (self.sportlists.count > 0) {
            NSDictionary *sportDict = [self.sportlists objectAtIndex:indexPath.section];
            cell.idLbl.text = [NSString stringWithFormat:@"ID:%@",[sportDict valueForKey:@"userId"]];
            cell.nameLbl.text = [NSString stringWithFormat:@"%@",[sportDict valueForKey:@"userName"]];
            [cell.headImg sd_setImageWithURL:[NSURL URLWithString:[sportDict valueForKey:@"headUrl"]] placeholderImage:[UIImage imageNamed:@"default_head"]];
            [cell.patientTypeBtn setTitle:[sportDict valueForKey:@"title"] forState:UIControlStateNormal];
            cell.startTimeLbl.text = [NSString stringWithFormat:@"开始时间:%@",[sportDict valueForKey:@"startTime"]];
            NSInteger completePercent = [[sportDict valueForKey:@"completePercent"] integerValue];
            cell.accomplishValLbl.text = [NSString stringWithFormat:@"%ld %%",completePercent];
            cell.maxHrValLbl.text = [NSString stringWithFormat:@"%@ Bpm",[sportDict valueForKey:@"maxHr"]];
            cell.avgHrValLbl.text = [NSString stringWithFormat:@"%@ Bpm",[sportDict valueForKey:@"avgHr"]];
            CGFloat calorie = [[sportDict valueForKey:@"calorie"] floatValue];
            cell.calorieValLbl.text = [NSString stringWithFormat:@"%.1f Kcal",calorie];
            CGFloat totalMileage = [[sportDict valueForKey:@"totalMileage"] floatValue];
            cell.mileValLbl.text = [NSString stringWithFormat:@"%.1f Km",totalMileage];
            CGFloat met = [[sportDict valueForKey:@"mets"] floatValue];
            cell.metsValLbl.text = [NSString stringWithFormat:@"%.1f METs",met];
            CGFloat speed = [[sportDict valueForKey:@"speed"] floatValue];
            cell.avgSpeedValLbl.text = [NSString stringWithFormat:@"%.1f Km/h",speed];
            NSInteger type2 = [[sportDict valueForKey:@"type2"] integerValue];
            if (type2 == 1) {
                cell.avgIntensityLbl.text = @"平均强度";
                cell.avgIntensityValLbl.text = [NSString stringWithFormat:@"%@",[sportDict valueForKey:@"avgDifficulty"]];
            } else {
                cell.avgIntensityLbl.text = @"平均功率";
                cell.avgIntensityValLbl.text = [NSString stringWithFormat:@"%@ W",[sportDict valueForKey:@"avgDifficulty"]];
            }
            NSInteger totalTime = [[sportDict valueForKey:@"totalTime"] integerValue];
            NSString *totalTimeStr = [self getTimeString:totalTime];
            cell.totalTimeValLbl.text = totalTimeStr;
            NSString *rpeSample = [sportDict valueForKey:@"rpeSample"];
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
                cell.preValLbl1.text = results[0];
                cell.preValLbl2.text = results[1];
                cell.preValLbl3.text = results[2];
                cell.preValLbl4.text = results[3];
                cell.preValLbl5.text = results[4];
                cell.preValLbl6.text = results[5];
                cell.preValLbl7.text = results[6];
                cell.preValLbl8.text = results[7];
                cell.preValLbl9.text = results[8];
                cell.preValLbl10.text = results[9];
                cell.preValLbl11.text = results[10];
                cell.preValLbl12.text = results[11];
            }
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *sportDict;
    if (self.isSearch) {
        sportDict = [self.searchResults objectAtIndex:indexPath.section];
    } else {
        sportDict = [self.sportlists objectAtIndex:indexPath.section];
    }
    NSInteger sid = [[sportDict valueForKey:@"id"] integerValue];
    UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
    NSDictionary *dict = user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@(sid) forKey:@"id"];
    [self getUserSportDetail:parameter sportDict:sportDict];
}

- (NSString *)getTimeString:(NSInteger)seconds {
    NSString *timeStr = @"";
    NSInteger minute = seconds / 60;
    NSInteger second = seconds % 60;
    timeStr = [NSString stringWithFormat:@"%02ld:%02ld",(long)minute,(long)second];
    return timeStr;
}

#pragma mark - net functions

- (void)getAllUserSportList:(NSMutableDictionary *)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USER_SPORTLIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"user sport lists :%@",[weakSelf convertToJSONData:responseObject]);
        if (code == 0) {
            NSArray *rows = [responseObject valueForKey:@"rows"];
            NSInteger total = [[responseObject valueForKey:@"total"] integerValue];
            if (rows.count > 0) {
                [weakSelf.allUserSports addObjectsFromArray:rows];
                if (weakSelf.allUserSports.count == total) {
                    NSLog(@"allUserSports count is :%d",weakSelf.allUserSports.count);
                } else {
                    if (weakSelf.allUserSports.count > 0) {
                        [weakSelf.allUserSports removeAllObjects];
                    }
                    dispatch_async(dispatch_get_global_queue(0, 0), ^{
                        NSMutableDictionary *para = [NSMutableDictionary dictionary];
                        UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
                        NSDictionary *dict = user.organ;
                        NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
                        NSString *orgCode = orgCodeArr[0];
                        [para setValue:orgCode forKey:@"orgCode"];
                        [para setValue:@0 forKey:@"offset"];
                        [para setValue:@(total) forKey:@"rows"];
                        [para setValue:@"-create_time" forKey:@"sort"];
                        [para setValue:@"" forKey:@"userKeyword"];
                        [weakSelf getAllUserSportList:para];
                    });
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

- (void)getUsersSportList:(NSMutableDictionary *)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USER_SPORTLIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"user sport lists :%@",[weakSelf convertToJSONData:responseObject]);
        if (code == 0) {
            NSArray *rows = [responseObject valueForKey:@"rows"];
            if (weakSelf.isFooterClick) {
                if (weakSelf.isSearch) {
                    [weakSelf.searchResults addObjectsFromArray:rows];
                } else {
                    [weakSelf.sportlists addObjectsFromArray:rows];
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
                    } else {
                        if (weakSelf.sportlists.count > 0) {//之前有数据
                            //替换前n个数据
                            NSMutableArray *tempArr = [NSMutableArray array];
                            [tempArr addObjectsFromArray:rows];
                            if (weakSelf.sportlists.count > rows.count) {//除去n个数据还有数据剩下
                                NSArray *afterArr = [weakSelf.sportlists subarrayWithRange:NSMakeRange(rows.count, weakSelf.sportlists.count - rows.count)];
                                [tempArr addObjectsFromArray:afterArr];
                            }
                            weakSelf.sportlists = [tempArr mutableCopy];
                        } else {
                            [weakSelf.sportlists addObjectsFromArray:rows];
                        }
                    }
                }
                [weakSelf.listView.mj_header endRefreshing];
            }
            
            [weakSelf.listView reloadData];
            if (weakSelf.isSearch) {
                if (weakSelf.searchResults.count == 0) {
                    weakSelf.noDataLbl.hidden = NO;
                } else {
                    weakSelf.noDataLbl.hidden = YES;
                }
            } else {
                if (weakSelf.sportlists.count == 0) {
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

- (void)getUserSportDetail:(NSMutableDictionary*)parameter sportDict:(NSDictionary*)sportDict {
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
            if (weakSelf.allUserSports.count > 0) {
                NSInteger userId = [[sportDict valueForKey:@"userId"] integerValue];
                NSString *title = [sportDict valueForKey:@"title"];
                NSMutableArray *results = [NSMutableArray array];
                for (NSDictionary *dict in weakSelf.allUserSports) {
                    NSInteger userid = [[dict valueForKey:@"userId"] integerValue];
                    NSString *titleStr = [dict valueForKey:@"title"];
                    if (userid == userId && [titleStr isEqualToString:title]) {
                        [results addObject:dict];
                    }
                }
                detail.reports = [[results reverseObjectEnumerator] allObjects];
            }
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

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sort:(UIButton*)sender {
    NSLog(@"排序");
    self.sort = [[SortViewController alloc] init];
    self.sort.preferredContentSize = CGSizeMake(245, 233);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.sort.titleName = @"排序方式";
    NSMutableArray *sortArr = [NSMutableArray array];
    NSMutableDictionary *nameDict = [NSMutableDictionary dictionary];
    [nameDict setValue:@"姓名" forKey:@"sortkey"];
    [nameDict setValue:[NSNumber numberWithBool:NO] forKey:@"hasSelected"];
    [sortArr addObject:nameDict];
    
    NSMutableDictionary *prescriptionDict = [NSMutableDictionary dictionary];
    [prescriptionDict setValue:@"处方名称" forKey:@"sortkey"];
    [prescriptionDict setValue:[NSNumber numberWithBool:NO] forKey:@"hasSelected"];
    [sortArr addObject:prescriptionDict];
    
    NSMutableDictionary *startTimeDict = [NSMutableDictionary dictionary];
    [startTimeDict setValue:@"开始时间" forKey:@"sortkey"];
    [startTimeDict setValue:[NSNumber numberWithBool:NO] forKey:@"hasSelected"];
    [sortArr addObject:startTimeDict];
    
    [defaults setValue:sortArr forKey:@"classSort"];
    
    self.sort.conditionsArr = sortArr;
    self.sort.modalPresentationStyle = UIModalPresentationPopover;
    self.popController = [self.sort popoverPresentationController];
    self.popController.sourceView = self.sortBtn;
    self.popController.sourceRect = self.sortBtn.bounds;
    self.sort.delegate = self;
    self.popController.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    
    [self presentViewController:self.sort animated:YES completion:nil];
}

- (void)search:(UIButton*)sender {
    [self.nameTF resignFirstResponder];
    [self.prescriptionTF resignFirstResponder];
    if (self.searchResults.count > 0) {
        [self.searchResults removeAllObjects];
    }
    self.isFooterClick = NO;
    if (self.startTimeStr.length == 0 && self.nameTF.text.length == 0 && self.prescriptionTF.text.length == 0) {
        self.isSearch = NO;
        self.noDataLbl.hidden = YES;
        [self.listView reloadData];
        NSLog(@"list datasource :%@",self.sportlists);
    } else {
        self.isSearch = YES;
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
        NSDictionary *dict = user.organ;
        NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
        NSString *orgCode = orgCodeArr[0];
        [parameter setValue:orgCode forKey:@"orgCode"];
        [parameter setValue:@0 forKey:@"offset"];
        [parameter setValue:@10 forKey:@"rows"];
        [parameter setValue:self.startTimeStr forKey:@"startTime"];
        [parameter setValue:self.nameTF.text forKey:@"userKeyword"];
        [parameter setValue:self.prescriptionTF.text forKey:@"title"];
        [self getUsersSportList:parameter];
    }
}

#pragma makr - SortDelegate

- (void)conditionChoose:(NSDictionary *)condition {
    NSLog(@"sort condition is :%@",condition);
    NSString *field = [condition valueForKey:@"sortField"];
    BOOL isAsc = [[condition valueForKey:@"sortType"] boolValue];
    if (self.isSearch) {
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:field ascending:isAsc];
        self.searchResults = [[self.searchResults sortedArrayUsingDescriptors:@[sort]] mutableCopy];
    } else {
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:field ascending:isAsc];
        self.sportlists = [[self.sportlists sortedArrayUsingDescriptors:@[sort]] mutableCopy];
    }
    [self.listView reloadData];
    [self.sort dismissViewControllerAnimated:NO completion:nil];
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
