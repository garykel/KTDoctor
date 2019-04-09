//
//  MonitorViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/3/25.
//  Copyright © 2019 dz. All rights reserved.
//

#import "MonitorViewController.h"
#import "SortViewController.h"
#import "MonitorDetailViewController.h"
#import "PatientListView.h"
#import "SportDataModel.h"
#import "EqualCellSqpceFlowLayout.h"
#import "PatientCell1.h"
#import "PatientCell2.h"
#import "PatientCell3.h"
#import "PatientCell4.h"
#import "PatientCell6.h"
#import "PatientCell9.h"
#import "PatientCell12.h"
#import "PatientCell16.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTimeLbl_LeftMargin 15
#define kTimeLbl_FontSize 16.0
#define kTimeLbl_Width 150
#define kTitle_FontSize 22
#define kAddPersonBtn_Width 25
#define kAlertView_LeftMargin 200
#define kAlertViewTopMargin 150

#define SizingOne CGSizeMake(kWidth - 2 * 105, kHeight - (CGRectGetMaxY(self.navView.frame) + 100) - 100 - 10)
#define SizingTwo CGSizeMake((kWidth - 2 * 19 - 7)/2, kHeight - (CGRectGetMaxY(self.navView.frame) + 167) - 167 - 10)
#define SizingThree CGSizeMake((kWidth - 2 * 17 - 2 * 7)/3, kHeight - (CGRectGetMaxY(self.navView.frame) + 181) - 181 - 10)
#define SizingFour CGSizeMake((kWidth - 2 * 19 - 7)/2, (kHeight - (CGRectGetMaxY(self.navView.frame) + 17) - 17 - 2 * 7)/2 + 2)
#define SizingSix CGSizeMake((kWidth - 2 * 17 - 2 * 7)/3, (kHeight - (CGRectGetMaxY(self.navView.frame) + 46) - 46 - 7) / 2)
#define SizingNine CGSizeMake((kWidth - 2 * 19 - 2 * 7)/3, (kHeight - (CGRectGetMaxY(self.navView.frame) + 20) - 20 - 2 * 7) / 3)
#define SizingTwelve CGSizeMake((kWidth - 2 * 17 - 3 * 7)/4, (kHeight - (CGRectGetMaxY(self.navView.frame) + 17) - 17 - 2 * 7) / 3)
#define SizingSixteen CGSizeMake((kWidth - 2 * 17 - 3 * 7)/4, (kHeight - (CGRectGetMaxY(self.navView.frame) + 17) - 17 - 3 * 7) / 4)

NSMutableArray *patientsArr;
@interface MonitorViewController ()<SortDelegate,GCDAsyncUdpSocketDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *timeLbl;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIButton *addPersonBtn;
@property (nonatomic,strong)UIButton *sortBtn;
@property (nonatomic,strong)SortViewController *sort;
@property (nonatomic,strong)UIPopoverPresentationController *popController;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)GCDAsyncUdpSocket *udpClient;
@property (nonatomic,strong)UICollectionView *patientListview;
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation MonitorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    patientsArr = [NSMutableArray array];
    self.dataArr = [NSMutableArray array];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePatient) name:@"RefreshPatientNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tokenExpire) name:@"TokenExpiredNotification" object:nil];
//    SportDataModel *model = [[SportDataModel alloc] init];
//    model.name = @"Andrew";
//    model.userId = 7;
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
//    [patientsArr addObject:model];
    self.udpClient = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    NSError *err = nil;
    [self.udpClient enableBroadcast:YES error:&err];
    [self.udpClient bindToPort:5946 error:&err];
    if (err) {
        NSLog(@"err is :%@",err);
    } else {
        [self.udpClient beginReceiving:&err];
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showCurrentTime) userInfo:nil repeats:YES];
    [self setNavBar];
    [self setupPatientListview];
}

- (void)setupPatientListview {
    EqualCellSqpceFlowLayout *flowLayout = [[EqualCellSqpceFlowLayout alloc] initWithType:AlignWithCenter betweenOfCell:3];
    self.patientListview.scrollEnabled = NO;
    self.patientListview = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.patientListview.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.patientListview];
    self.patientListview.delegate = self;
    self.patientListview.dataSource = self;
    self.patientListview.allowsSelection = YES;
    self.patientListview.allowsMultipleSelection = NO;
    self.patientListview.alwaysBounceVertical = YES;
    self.patientListview.backgroundColor = [UIColor clearColor];
    NSInteger count = patientsArr.count;
    if (count == 1) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 100);
            make.bottom.equalTo(self.view.mas_bottom).offset(-100);
            make.left.equalTo(self.view.mas_left).offset(105);
            make.right.equalTo(self.view.mas_right).offset(-105);
        }];
    } else if (count > 1 && count<=2) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 167);
            make.bottom.equalTo(self.view.mas_bottom).offset(-167);
            make.left.equalTo(self.view.mas_left).offset(17);
            make.right.equalTo(self.view.mas_right).offset(-17);
        }];
    } else if (count > 2 && count<=3) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 181);
            make.bottom.equalTo(self.view.mas_bottom).offset(-181);
            make.left.equalTo(self.view.mas_left).offset(17);
            make.right.equalTo(self.view.mas_right).offset(-17);
        }];
    } else if (count > 3 && count<=4) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 17);
            make.bottom.equalTo(self.view.mas_bottom).offset(-17);
            make.left.equalTo(self.view.mas_left).offset(17);
            make.right.equalTo(self.view.mas_right).offset(-17);
        }];
    } else if (count > 4 && count<=6) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 46);
            make.bottom.equalTo(self.view.mas_bottom).offset(-46);
            make.left.equalTo(self.view.mas_left).offset(17);
            make.right.equalTo(self.view.mas_right).offset(-17);
        }];
    } else if (count > 6 && count<=9) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 20);
            make.bottom.equalTo(self.view.mas_bottom).offset(-20);
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-20);
        }];
    } else if (count > 9 && count <= 12) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 17);
            make.bottom.equalTo(self.view.mas_bottom).offset(-17);
            make.left.equalTo(self.view.mas_left).offset(17);
            make.right.equalTo(self.view.mas_right).offset(-17);
        }];
    } else if (count > 12 && count <= 16) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 17);
            make.bottom.equalTo(self.view.mas_bottom).offset(-17);
            make.left.equalTo(self.view.mas_left).offset(17);
            make.right.equalTo(self.view.mas_right).offset(-17);
        }];
    }
}

- (void)dealloc {
    [self.timer invalidate];
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
    self.titleLbl.text = @"实时监控";
    [self.navView addSubview:self.titleLbl];
    
    self.addPersonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat addPersonBtn_LeftMargin = kWidth -  kAddPersonBtn_Width - kButton_Height - 2 * kTimeLbl_LeftMargin;
    CGFloat addPersonBtn_TopMargin = (kNavView_Height - kAddPersonBtn_Width)/2;
    self.addPersonBtn.frame = CGRectMake(addPersonBtn_LeftMargin, addPersonBtn_TopMargin, kAddPersonBtn_Width, kAddPersonBtn_Width);
    self.addPersonBtn.adjustsImageWhenDisabled = NO;
    [self.addPersonBtn setImage:[UIImage imageNamed:@"addPerson"] forState:UIControlStateNormal];
    [self.addPersonBtn addTarget:self action:@selector(addPerson:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.addPersonBtn];
    
    self.sortBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat sortBtn_LeftMargin = kWidth - kButton_Height - kTimeLbl_LeftMargin;
    self.sortBtn.frame = CGRectMake(sortBtn_LeftMargin, self.titleLbl.frame.origin.y, kButton_Height, kButton_Height);
    self.sortBtn.layer.cornerRadius = kButton_Height / 2.0;
    self.sortBtn.layer.masksToBounds = YES;
    self.sortBtn.adjustsImageWhenDisabled = NO;
    [self.sortBtn setImage:[UIImage imageNamed:@"sort"] forState:UIControlStateNormal];
    [self.sortBtn addTarget:self action:@selector(sort:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.sortBtn];
}

- (NSString *)getCurrentTimeString{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.AMSymbol = @"上午";
    format.PMSymbol = @"下午";
    format.dateFormat = @"aaa HH:mm";
    NSDate *currentDate = [NSDate date];
    NSString *currentDateStr = [format stringFromDate:currentDate];
    return currentDateStr;
}

- (void)showCurrentTime {
    NSString *timeStr = [self getCurrentTimeString];
    NSString *lastTimeStr = self.timeLbl.text;
    if (![timeStr isEqualToString:lastTimeStr]) {
        self.timeLbl.text = timeStr;
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout

// 定义每个UICollectionViewCell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count = patientsArr.count;
    if (count == 1) {
        return SizingOne;
    } else if (count > 1 && count<=2) {
        return SizingTwo;
    } else if (count > 2 && count<=3) {
        return SizingThree;
    } else if (count > 3 && count<=4) {
        return SizingFour;
    } else if (count > 4 && count<=6) {
        return SizingSix;
    } else if (count > 6 && count <= 9) {
        return SizingNine;
    } else if (count > 9 && count <= 12) {
        return SizingTwelve;
    } else if (count > 12 && count <= 16) {
        return SizingSixteen;
    } else {
        return CGSizeZero;
    }
}

// 定义每个UICollectionViewCell的margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(3, 3, 0, 3);
}

// UICollectionViewCell最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 3.0;
}
//
// UICollectionViewCell最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 3.0;
}

#pragma mark - UICollectionViewDelegate

// UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    MonitorDetailViewController *detail = [[MonitorDetailViewController alloc] init];
    detail.selectedIndex = indexPath.row;
    [self.navigationController pushViewController:detail animated:NO];
}

// 返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return patientsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger count = patientsArr.count;
    SportDataModel *model = [patientsArr objectAtIndex:indexPath.row];
    NSString *range = model.percentum;
    NSLog(@"range is :%@",range);
    NSArray *rangeArr;
    NSInteger lowHR = 0;
    NSInteger maxHR = 0;
    if (range.length > 0) {
        rangeArr  = [range componentsSeparatedByString:@"-"];
        if (rangeArr.count > 0) {
            lowHR = (NSInteger)rangeArr[0];
            maxHR = (NSInteger)rangeArr[1];
        }
    }
    if (count == 1) {
        NSString *reuseCellId = [NSString stringWithFormat:@"patientsCell1Id:%ld%ld",(long)indexPath.section,(long)indexPath.row];
        [collectionView registerClass:[PatientCell1 class] forCellWithReuseIdentifier:reuseCellId];
        PatientCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCellId forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[PatientCell1 alloc] initWithFrame:CGRectZero];
        }
        NSArray *imgUrlArr = [model.headUrl componentsSeparatedByString:@"://"];
        NSString *headUrl = model.headUrl;
        if (imgUrlArr.count > 0) {
            NSString *forwardStr = imgUrlArr[0];
            NSString *backwardStr = imgUrlArr[1];
            backwardStr = [backwardStr stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
            headUrl = [NSString stringWithFormat:@"%@://%@",forwardStr,backwardStr];
        }

        if (rangeArr.count > 0) {
            if (model.currHr < lowHR) {
                cell.bgImg.image = [UIImage imageNamed:@"bg_gray"];
                cell.heartImg.image = [UIImage imageNamed:@"heart_blue"];
            } else if (model.currHr >= lowHR && model.currHr <=maxHR) {
                cell.bgImg.image = [UIImage imageNamed:@"bg_green"];
                cell.heartImg.image = [UIImage imageNamed:@"heart_green"];
            } else {
                cell.bgImg.image = [UIImage imageNamed:@"bg_red"];
                cell.heartImg.image = [UIImage imageNamed:@"heart_red"];
            }
        }
        if (model.currHr >= model.alHr) {
            [cell setAlpha:1];
            [UIView beginAnimations:@"flash screen" context:nil];
            [UIView setAnimationDuration:1.5];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [cell setAlpha:0.2];
            [UIView commitAnimations];
        }
        [cell.headImg sd_setImageWithURL:[NSURL URLWithString:model.headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
        cell.nameLbl.text = model.name;
        cell.idLbl.text = [NSString stringWithFormat:@"ID:%ld",(long)model.userId];
        cell.currentHrLbl.text = [NSString stringWithFormat:@"%ld bpm",(long)model.currHr];
        cell.avgHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.avgHr];
        cell.maxHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.maxHr];
        cell.speedValueLbl.text = [NSString stringWithFormat:@"%.1f",model.speed];
        cell.intensionValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.diff];
        cell.timeLbl.text = [self getTimeString:model.time];
        return cell;
    } else if (count <= 2) {
        NSString *reuseCellId = [NSString stringWithFormat:@"patientsCell2Id:%ld%ld",(long)indexPath.section,(long)indexPath.row];
        [collectionView registerClass:[PatientCell2 class] forCellWithReuseIdentifier:reuseCellId];
        PatientCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCellId forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[PatientCell2 alloc] initWithFrame:CGRectZero];
        }
        NSArray *imgUrlArr = [model.headUrl componentsSeparatedByString:@"://"];
        NSString *headUrl = model.headUrl;
        if (imgUrlArr.count > 0) {
            NSString *forwardStr = imgUrlArr[0];
            NSString *backwardStr = imgUrlArr[1];
            backwardStr = [backwardStr stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
            headUrl = [NSString stringWithFormat:@"%@://%@",forwardStr,backwardStr];
        }
        [cell.headImg sd_setImageWithURL:[NSURL URLWithString:model.headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
        cell.nameLbl.text = model.name;
        cell.idLbl.text = [NSString stringWithFormat:@"ID:%ld",(long)model.userId];
        cell.currentHrLbl.text = [NSString stringWithFormat:@"%ld bpm",(long)model.currHr];
        cell.avgHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.avgHr];
        cell.maxHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.maxHr];
        cell.speedValueLbl.text = [NSString stringWithFormat:@"%.1f",model.speed];
        cell.intensionValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.diff];
        cell.timeLbl.text = [self getTimeString:model.time];
        return cell;
    } else if (count <= 3) {
        NSString *reuseCellId = [NSString stringWithFormat:@"patientsCell3Id:%ld%ld",(long)indexPath.section,(long)indexPath.row];
        [collectionView registerClass:[PatientCell3 class] forCellWithReuseIdentifier:reuseCellId];
        PatientCell3 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCellId forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[PatientCell3 alloc] initWithFrame:CGRectZero];
        }
        NSArray *imgUrlArr = [model.headUrl componentsSeparatedByString:@"://"];
        NSString *headUrl = model.headUrl;
        if (imgUrlArr.count > 0) {
            NSString *forwardStr = imgUrlArr[0];
            NSString *backwardStr = imgUrlArr[1];
            backwardStr = [backwardStr stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
            headUrl = [NSString stringWithFormat:@"%@://%@",forwardStr,backwardStr];
        }
        [cell.headImg sd_setImageWithURL:[NSURL URLWithString:model.headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
        cell.nameLbl.text = model.name;
        cell.idLbl.text = [NSString stringWithFormat:@"ID:%ld",(long)model.userId];
        cell.currentHrLbl.text = [NSString stringWithFormat:@"%ld bpm",(long)model.currHr];
        cell.avgHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.avgHr];
        cell.maxHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.maxHr];
        cell.speedValueLbl.text = [NSString stringWithFormat:@"%.1f",model.speed];
        cell.intensionValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.diff];
        cell.timeLbl.text = [self getTimeString:model.time];
        return cell;
    } else if (count <= 4) {
        NSString *reuseCellId = [NSString stringWithFormat:@"patientsCell4Id:%ld%ld",(long)indexPath.section,(long)indexPath.row];
        [collectionView registerClass:[PatientCell4 class] forCellWithReuseIdentifier:reuseCellId];
        PatientCell4 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCellId forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[PatientCell4 alloc] initWithFrame:CGRectZero];
        }
        NSArray *imgUrlArr = [model.headUrl componentsSeparatedByString:@"://"];
        NSString *headUrl = model.headUrl;
        if (imgUrlArr.count > 0) {
            NSString *forwardStr = imgUrlArr[0];
            NSString *backwardStr = imgUrlArr[1];
            backwardStr = [backwardStr stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
            headUrl = [NSString stringWithFormat:@"%@://%@",forwardStr,backwardStr];
        }
        [cell.headImg sd_setImageWithURL:[NSURL URLWithString:model.headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
        cell.nameLbl.text = model.name;
        cell.idLbl.text = [NSString stringWithFormat:@"ID:%ld",(long)model.userId];
        cell.currentHrLbl.text = [NSString stringWithFormat:@"%ld bpm",(long)model.currHr];
        cell.avgHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.avgHr];
        cell.maxHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.maxHr];
        cell.speedValueLbl.text = [NSString stringWithFormat:@"%.1f",model.speed];
        cell.intensionValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.diff];
        cell.timeLbl.text = [self getTimeString:model.time];
        return cell;
    } else if (count <= 6) {
        NSString *reuseCellId = [NSString stringWithFormat:@"patientsCell6Id:%ld%ld",(long)indexPath.section,(long)indexPath.row];
        [collectionView registerClass:[PatientCell6 class] forCellWithReuseIdentifier:reuseCellId];
        PatientCell6 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCellId forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[PatientCell6 alloc] initWithFrame:CGRectZero];
        }
        NSArray *imgUrlArr = [model.headUrl componentsSeparatedByString:@"://"];
        NSString *headUrl = model.headUrl;
        if (imgUrlArr.count > 0) {
            NSString *forwardStr = imgUrlArr[0];
            NSString *backwardStr = imgUrlArr[1];
            backwardStr = [backwardStr stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
            headUrl = [NSString stringWithFormat:@"%@://%@",forwardStr,backwardStr];
        }
        [cell.headImg sd_setImageWithURL:[NSURL URLWithString:model.headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
        cell.nameLbl.text = model.name;
        cell.idLbl.text = [NSString stringWithFormat:@"ID:%ld",(long)model.userId];
        cell.currentHrLbl.text = [NSString stringWithFormat:@"%ld bpm",(long)model.currHr];
        cell.avgHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.avgHr];
        cell.maxHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.maxHr];
        cell.speedValueLbl.text = [NSString stringWithFormat:@"%.1f",model.speed];
        cell.intensionValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.diff];
        cell.timeLbl.text = [self getTimeString:model.time];
        return cell;
    } else if (count <= 9) {
        NSString *reuseCellId = [NSString stringWithFormat:@"patientsCell9Id:%ld%ld",(long)indexPath.section,(long)indexPath.row];
        [collectionView registerClass:[PatientCell9 class] forCellWithReuseIdentifier:reuseCellId];
        PatientCell9 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCellId forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[PatientCell9 alloc] initWithFrame:CGRectZero];
        }
        NSArray *imgUrlArr = [model.headUrl componentsSeparatedByString:@"://"];
        NSString *headUrl = model.headUrl;
        if (imgUrlArr.count > 0) {
            NSString *forwardStr = imgUrlArr[0];
            NSString *backwardStr = imgUrlArr[1];
            backwardStr = [backwardStr stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
            headUrl = [NSString stringWithFormat:@"%@://%@",forwardStr,backwardStr];
        }
        [cell.headImg sd_setImageWithURL:[NSURL URLWithString:model.headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
        cell.nameLbl.text = model.name;
        cell.idLbl.text = [NSString stringWithFormat:@"ID:%ld",(long)model.userId];
        cell.currentHrLbl.text = [NSString stringWithFormat:@"%ld bpm",(long)model.currHr];
        cell.avgHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.avgHr];
        cell.maxHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.maxHr];
        cell.speedValueLbl.text = [NSString stringWithFormat:@"%.1f",model.speed];
        cell.intensionValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.diff];
        cell.timeLbl.text = [self getTimeString:model.time];
        return cell;
    } else if (count <= 12) {
        NSString *reuseCellId = [NSString stringWithFormat:@"patientsCell12Id:%ld%ld",(long)indexPath.section,(long)indexPath.row];
        [collectionView registerClass:[PatientCell12 class] forCellWithReuseIdentifier:reuseCellId];
        PatientCell12 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCellId forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[PatientCell12 alloc] initWithFrame:CGRectZero];
        }
        NSArray *imgUrlArr = [model.headUrl componentsSeparatedByString:@"://"];
        NSString *headUrl = model.headUrl;
        if (imgUrlArr.count > 0) {
            NSString *forwardStr = imgUrlArr[0];
            NSString *backwardStr = imgUrlArr[1];
            backwardStr = [backwardStr stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
            headUrl = [NSString stringWithFormat:@"%@://%@",forwardStr,backwardStr];
        }
        [cell.headImg sd_setImageWithURL:[NSURL URLWithString:model.headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
        cell.nameLbl.text = model.name;
        cell.idLbl.text = [NSString stringWithFormat:@"ID:%ld",(long)model.userId];
        cell.currentHrLbl.text = [NSString stringWithFormat:@"%ld bpm",(long)model.currHr];
        cell.avgHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.avgHr];
        cell.maxHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.maxHr];
        cell.speedValueLbl.text = [NSString stringWithFormat:@"%.1f",model.speed];
        cell.intensionValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.diff];
        cell.timeLbl.text = [self getTimeString:model.time];
        return cell;
    } else {
        NSString *reuseCellId = [NSString stringWithFormat:@"patientsCell16Id:%ld%ld",(long)indexPath.section,(long)indexPath.row];
        [collectionView registerClass:[PatientCell16 class] forCellWithReuseIdentifier:reuseCellId];
        PatientCell16 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCellId forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[PatientCell16 alloc] initWithFrame:CGRectZero];
        }
        NSArray *imgUrlArr = [model.headUrl componentsSeparatedByString:@"://"];
        NSString *headUrl = model.headUrl;
        if (imgUrlArr.count > 0) {
            NSString *forwardStr = imgUrlArr[0];
            NSString *backwardStr = imgUrlArr[1];
            backwardStr = [backwardStr stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
            headUrl = [NSString stringWithFormat:@"%@://%@",forwardStr,backwardStr];
        }
        [cell.headImg sd_setImageWithURL:[NSURL URLWithString:model.headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
        cell.nameLbl.text = model.name;
        cell.idLbl.text = [NSString stringWithFormat:@"ID:%ld",(long)model.userId];
        cell.currentHrLbl.text = [NSString stringWithFormat:@"%ld bpm",(long)model.currHr];
        cell.avgHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.avgHr];
        cell.maxHRValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.maxHr];
        cell.speedValueLbl.text = [NSString stringWithFormat:@"%.1f",model.speed];
        cell.intensionValueLbl.text = [NSString stringWithFormat:@"%ld",(long)model.diff];
        cell.timeLbl.text = [self getTimeString:model.time];
        return cell;
    }
}

- (NSString *)getTimeString:(NSInteger)seconds {
    NSString *timeStr = @"";
    NSInteger minute = seconds / 60;
    NSInteger second = seconds % 60;
    timeStr = [NSString stringWithFormat:@"%02ld:%02ld",(long)minute,(long)second];
    return timeStr;
}

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)addPerson:(UIButton*)sender {
    NSLog(@"患者管理");
    PatientListView *listView = [[PatientListView alloc] initWithFrame:CGRectMake(0, 0, kWidth - 2 * kAlertView_LeftMargin, kHeight - 2 * kAlertViewTopMargin)];
    listView.dataArr = [patientsArr mutableCopy];
    [listView show];
}

- (void)sort:(UIButton*)sender {
    NSLog(@"排序");
    NSMutableArray *sortArr = [NSMutableArray array];
    NSMutableDictionary *nameDict = [NSMutableDictionary dictionary];
    [nameDict setValue:@"姓名" forKey:@"sortkey"];
    [nameDict setValue:[NSNumber numberWithBool:NO] forKey:@"hasSelected"];
    [sortArr addObject:nameDict];
    
    NSMutableDictionary *targetDict = [NSMutableDictionary dictionary];
    [targetDict setValue:@"心率带ID" forKey:@"sortkey"];
    [targetDict setValue:[NSNumber numberWithBool:NO] forKey:@"hasSelected"];
    [sortArr addObject:targetDict];
    
    NSMutableDictionary *heartRateDict = [NSMutableDictionary dictionary];
    [heartRateDict setValue:@"设备ID" forKey:@"sortkey"];
    [heartRateDict setValue:[NSNumber numberWithBool:NO] forKey:@"hasSelected"];
    [sortArr addObject:heartRateDict];
    
    NSMutableDictionary *masHRDict = [NSMutableDictionary dictionary];
    [masHRDict setValue:@"当前心率" forKey:@"sortkey"];
    [masHRDict setValue:[NSNumber numberWithBool:NO] forKey:@"hasSelected"];
    [sortArr addObject:masHRDict];
    
    self.sort = [[SortViewController alloc] init];
    self.sort.preferredContentSize = CGSizeMake(245, 308);
    self.sort.titleName = @"排序方式";
    self.sort.conditionsArr = sortArr;
    self.sort.modalPresentationStyle = UIModalPresentationPopover;
    self.popController = [self.sort popoverPresentationController];
    self.popController.sourceView = self.sortBtn;
    self.popController.sourceRect = self.sortBtn.bounds;
    self.sort.delegate = self;
    self.popController.backgroundColor = [UIColor whiteColor];
    
    [self presentViewController:self.sort animated:YES completion:nil];
}

#pragma mark - SortDelegate

- (void)conditionChoose:(NSDictionary*)condition {
    NSString *fieldName = [condition valueForKey:@"sortField"];
    BOOL isAsc = [[condition valueForKey:@"sortType"] boolValue];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:fieldName ascending:isAsc];
    patientsArr = [[patientsArr sortedArrayUsingDescriptors:@[sort]] mutableCopy];
    [self.patientListview reloadData];
}

#pragma mark - GCDAsyncUdpSocketDelegate

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didConnectToAddress:(NSData *)address {
    NSLog(@"address :%@",address);
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data
      fromAddress:(NSData *)address
withFilterContext:(nullable id)filterContext {
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSDictionary *dict = [self dictionaryWithJsonString:str];
    SportDataModel *model = [[SportDataModel alloc] init];
    model.alHr = [[dict valueForKey:@"alHr"] integerValue];
    model.avgHr = [[dict valueForKey:@"avgHr"] integerValue];
    model.currHr = [[dict valueForKey:@"currHr"] integerValue];
    model.dId = [dict valueForKey:@"dId"];
    model.diff = [[dict valueForKey:@"diff"] integerValue];
    model.dqxjzxj = [[dict valueForKey:@"dqxjzxj"] integerValue];
    model.endTime = [dict valueForKey:@"endTime"];
    model.headUrl = [dict valueForKey:@"headUrl"];
    model.isEnd = [[dict valueForKey:@"isEnd"] integerValue];
    model.isxiuxi = [[dict valueForKey:@"isxiuxi"] integerValue];
    model.kcal = [[dict valueForKey:@"kcal"] floatValue];
    model.lc = [[dict valueForKey:@"lc"] floatValue];
    model.maxHr = [[dict valueForKey:@"maxHr"] integerValue];
    model.maxRestHr = [[dict valueForKey:@"maxRestHr"] integerValue];
    model.name = [dict valueForKey:@"name"];
    model.percentum = [dict valueForKey:@"percentum"];
    model.speed = [[dict valueForKey:@"speed"] floatValue];
    model.time = [[dict valueForKey:@"time"] integerValue];
    model.userId = [[dict valueForKey:@"userId"] integerValue];
    model.xId = [dict valueForKey:@"xId"];
    model.xiaojietime = [[dict valueForKey:@"xiaojietime"] integerValue];
    [self handlerPatient:model];
}

- (void)handlerPatient:(SportDataModel*)data {
    if (patientsArr.count > 0) {
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSInteger i = 0; i < patientsArr.count; i++) {
            SportDataModel *model = patientsArr[i];
            if (model.isEnd == 0) {
                [tempArr addObject:data];
            }
        }
        patientsArr = [tempArr mutableCopy];
    } else {
        [patientsArr addObject:data];
    }
    [self updatePatient];
    [self.patientListview reloadData];
}

- (void)updatePatient {
    NSInteger count = patientsArr.count;
    if (count == 1) {
        [self.patientListview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 100);
            make.bottom.equalTo(self.view.mas_bottom).offset(-100);
            make.left.equalTo(self.view.mas_left).offset(105);
            make.right.equalTo(self.view.mas_right).offset(-105);
        }];
    } else if (count > 1 && count<=2) {
        [self.patientListview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 167);
            make.bottom.equalTo(self.view.mas_bottom).offset(-167);
            make.left.equalTo(self.view.mas_left).offset(19);
            make.right.equalTo(self.view.mas_right).offset(-19);        }];
    } else if (count > 2 && count<=3) {
        [self.patientListview mas_updateConstraints:^(MASConstraintMaker *make) {
            [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 181);
                make.bottom.equalTo(self.view.mas_bottom).offset(-181);
                make.left.equalTo(self.view.mas_left).offset(17);
                make.right.equalTo(self.view.mas_right).offset(-17);
            }];
        }];
    } else if (count > 3 && count<=4) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 17);
            make.bottom.equalTo(self.view.mas_bottom).offset(-17);
            make.left.equalTo(self.view.mas_left).offset(17);
            make.right.equalTo(self.view.mas_right).offset(-17);
        }];
    } else if (count > 4 && count<=6) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 46);
            make.bottom.equalTo(self.view.mas_bottom).offset(-46);
            make.left.equalTo(self.view.mas_left).offset(17);
            make.right.equalTo(self.view.mas_right).offset(-17);
        }];
    } else if (count > 6 && count <= 9) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 20);
            make.bottom.equalTo(self.view.mas_bottom).offset(-20);
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-20);
        }];
    } else if (count > 9 && count <= 12) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 17);
            make.bottom.equalTo(self.view.mas_bottom).offset(-17);
            make.left.equalTo(self.view.mas_left).offset(17);
            make.right.equalTo(self.view.mas_right).offset(-17);
        }];
    } else if (count > 12 && count <= 16) {
        [self.patientListview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(CGRectGetMaxY(self.navView.frame) + 17);
            make.bottom.equalTo(self.view.mas_bottom).offset(-17);
            make.left.equalTo(self.view.mas_left).offset(17);
            make.right.equalTo(self.view.mas_right).offset(-17);
        }];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.patientListview reloadData];
    });
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didNotConnect:(NSError * _Nullable)error {
    NSLog(@"error is:%@",error);
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (void)tokenExpire {
    [STTextHudTool showText:@"改账号已在其他设备登录或已过期"];
    [self.navigationController popToRootViewControllerAnimated:NO];
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
