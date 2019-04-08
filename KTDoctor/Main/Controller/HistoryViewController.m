//
//  HistoryViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/4/4.
//  Copyright © 2019 dz. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryDetailViewController.h"
#import "HistoryCell.h"

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

@interface HistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *timeLbl;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIView *searchBgView;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UIButton *startTimeTF;
@property (nonatomic,strong)UITextField *nameTF;
@property (nonatomic,strong)UITextField *prescriptionTF;
@property (nonatomic,strong)UIButton *searchBtn;
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.dataArr = [NSMutableArray array];
    self.dataArr = [NSMutableArray arrayWithObjects:@"section1",@"section2",@"section3",@"section4", nil];
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
    [self.startTimeTF setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 35)];
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
    self.listView.delegate = self;
    self.listView.dataSource = self;
    [self.bottomView addSubview:self.listView];
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
    return self.dataArr.count;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor whiteColor];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == self.dataArr.count - 1) {
        return 0;
    } else {
        return kListView_FooterView_Height * kYScal;
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
    cell.nameLbl.text = [NSString stringWithFormat:@"Andrew:%d",indexPath.section + 1];
    cell.startTimeLbl.text = @"开始时间:2019-04-08 18:03:55";
    [cell.patientTypeBtn setTitle:@"高风险用户初次体验" forState:UIControlStateNormal];
    cell.idLbl.text = [NSString stringWithFormat:@"%d",indexPath.section + 1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    HistoryDetailViewController *detail = [[HistoryDetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:NO];
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)search:(UIButton*)sender {
    NSLog(@"搜索");
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
