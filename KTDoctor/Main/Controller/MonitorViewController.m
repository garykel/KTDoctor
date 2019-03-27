//
//  MonitorViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/3/25.
//  Copyright © 2019 dz. All rights reserved.
//

#import "MonitorViewController.h"
#import "SortViewController.h"
#import "PatientListView.h"
#import "SportDataModel.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTimeLbl_LeftMargin 15
#define kTimeLbl_FontSize 16.0
#define kTimeLbl_Width 150
#define kTitle_FontSize 22
#define kAddPersonBtn_Width 25
#define kAlertView_LeftMargin 200
#define kAlertViewTopMargin 150

NSMutableArray *patientsArr;
@interface MonitorViewController ()<SortDelegate,GCDAsyncUdpSocketDelegate>
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
@end

@implementation MonitorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    patientsArr = [NSMutableArray array];
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
}

- (void)dealloc {
    [self.timer invalidate];
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

#pragma mark - button click events

- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)addPerson:(UIButton*)sender {
    NSLog(@"患者管理");
    PatientListView *listView = [[PatientListView alloc] initWithFrame:CGRectMake(0, 0, kWidth - 2 * kAlertView_LeftMargin, kHeight - 2 * kAlertViewTopMargin)];
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
    NSLog(@"fieldName :%@ isAsc :%hhd",fieldName,isAsc);
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
        for (NSInteger i = 0; i < patientsArr.count; i++) {
            SportDataModel *model = patientsArr[i];
            if (data.userId == model.userId) {
                [patientsArr replaceObjectAtIndex:i withObject:model];
            } else {
                [patientsArr addObject:model];
            }
        }
    }
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
