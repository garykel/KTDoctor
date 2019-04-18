//
//  BindHRBandView.m
//  KTDoctor
//
//  Created by garychen on 2019/4/9.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "BindHRBandView.h"
#import "SearchAndSelectView.h"
#import "UserModel.h"
#import "SportDataModel.h"

#define kTitleLbl_TopMargin 34
#define kTitleLbl_FontSize 25
#define kTitleLbl_Width 150
#define kTitleLbl_Height 20
#define kDoctorImg_TopMargin 42
#define kDoctorImg_LeftMargin 65
#define kDoctorImg_RightMargin 40
#define kDoctorImg_Width 163
#define kDoctorImg_Height 334
#define kLeftLbl_RightMargin 12
#define kLeftLbl_FontSize 22
#define kLeftLbl_Width 100
#define KRight_CustomView_TopMargin 126
#define kRight_CustomView_RightMargin 45
#define kRight_CustomView_Height 52
#define kRight_CustomView_BottomMargin 48
#define kBindBtn_RightMargin 32
#define kBindBtn_Title_FontSize 12
#define kBindBtn_TopMargin 40
#define kBindBtn_Width 120
#define kBindBtn_Height 48
#define kCancelBtn_RightMargin 53
#define kBindBtn_BottomMargin 68

#define kBindView_TopMargin 138
#define kBindView_LeftMargin 150
#define kBindView_BottomMargin 152

extern NSMutableArray *patientsArr;

@interface BindHRBandView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign)CGRect contentFrame;
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *doctorImg;
@property (nonatomic,strong)UILabel *nameTitleLbl;
@property (nonatomic,strong)SearchAndSelectView *nameView;
@property (nonatomic,strong)UITableView *nameTableview;
@property (nonatomic,strong)NSMutableArray *namesArr;
@property (nonatomic,strong)UILabel *hrDeviceTitleLbl;
@property (nonatomic,strong)SearchAndSelectView *hrDeviceView;
@property (nonatomic,strong)UITableView *deviceTableview;
@property (nonatomic,strong)NSMutableArray *devicesArr;
@property (nonatomic,strong)UIButton *bindBtn;
@property (nonatomic,strong)UIButton *cancelBtn;
@property (nonatomic,assign)NSInteger selectedUserIndex;
@property (nonatomic,assign)NSInteger selectedDeviceIndex;
@property (nonatomic,assign)NSInteger offset;
@property (nonatomic,assign)BOOL isFooterClick;
@end

@implementation BindHRBandView

- (instancetype)initWithFrame:(CGRect) frame {
    if (self = [super initWithFrame:frame]) {
        self.contentFrame = frame;
        self.namesArr = [NSMutableArray array];
        self.offset = 0;
        self.isFooterClick = NO;
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.85];
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 1;
    }];
    
    //弹窗主体内容
    self.contentView = [[UIView alloc] init];
    self.contentView.frame = CGRectMake(0, 0, kWidth - 2 * kBindView_LeftMargin * kXScal, kHeight -  kBindView_TopMargin * kYScal - kBindView_BottomMargin * kYScal);
    self.contentView.frame = self.contentFrame;
    self.contentView.layer.cornerRadius = 8;
    self.contentView.layer.masksToBounds = YES;
    CGPoint center = self.center;
//    CGFloat x = center.x;
//    CGFloat y = center.y;
//    self.contentView.center = CGPointMake(x, y - 50);
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 6;
    [self addSubview:self.contentView];
    
    CGFloat titleLbl_LeftMargin = (self.contentFrame.size.width - kTitleLbl_Width * kXScal)/2;
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(titleLbl_LeftMargin, kTitleLbl_TopMargin * kYScal, kTitleLbl_Width * kXScal, kTitleLbl_Height * kYScal)];
    self.titleLbl.textColor = [UIColor blackColor];
    self.titleLbl.font = [UIFont systemFontOfSize:kTitleLbl_FontSize * kYScal];
    self.titleLbl.textAlignment = NSTextAlignmentCenter;
    self.titleLbl.text = @"绑定心率带";
    [self.contentView addSubview:self.titleLbl];
    
    CGFloat doctorImg_TopMargin = (self.contentFrame.size.height - kDoctorImg_Height * kYScal)/2;
    self.doctorImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"doctor1"]];
    self.doctorImg.frame = CGRectMake(kDoctorImg_LeftMargin * kXScal, doctorImg_TopMargin, kDoctorImg_Width * kXScal, kDoctorImg_Height * kYScal);
    [self.contentView addSubview:self.doctorImg];
    
    self.nameTitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.doctorImg.frame) + kDoctorImg_RightMargin * kXScal, self.contentFrame.origin.y, kLeftLbl_Width * kXScal, kRight_CustomView_Height * kYScal)];
    self.nameTitleLbl.text = @"姓 名/ID";
    self.nameTitleLbl.textColor = [UIColor blackColor];
    self.nameTitleLbl.font = [UIFont systemFontOfSize:kLeftLbl_FontSize * kYScal];
    [self.contentView addSubview:self.nameTitleLbl];
    
    CGFloat right_Width = self.contentFrame.size.width - CGRectGetMaxX(self.nameTitleLbl.frame) - kLeftLbl_RightMargin * kXScal - kRight_CustomView_RightMargin * kXScal;
    self.nameView = [[SearchAndSelectView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameTitleLbl.frame) + kLeftLbl_RightMargin * kXScal, KRight_CustomView_TopMargin * kYScal, right_Width, kRight_CustomView_Height * kYScal)];
    self.nameView.searchBgView.backgroundColor = [UIColor colorWithHexString:@"#88dbed"];
    [self.nameView.searchBtn addTarget:self action:@selector(searchUser:) forControlEvents:UIControlEventTouchUpInside];
    [self.nameView.selectBtn addTarget:self action:@selector(showUsers:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.nameView];
    
    self.hrDeviceTitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.nameTitleLbl.frame.origin.x, CGRectGetMaxY(self.nameView.frame) + kRight_CustomView_BottomMargin * kYScal, kLeftLbl_Width * kXScal, kRight_CustomView_Height * kYScal)];
    self.hrDeviceTitleLbl.textColor = [UIColor blackColor];
    self.hrDeviceTitleLbl.text = @"心率带ID";
    self.hrDeviceTitleLbl.font =  [UIFont systemFontOfSize:kLeftLbl_FontSize * kYScal];
    [self.contentView addSubview:self.hrDeviceTitleLbl];
    
    self.hrDeviceView = [[SearchAndSelectView alloc] initWithFrame:CGRectMake(self.nameView.frame.origin.x, self.hrDeviceTitleLbl.frame.origin.y, right_Width, kRight_CustomView_Height * kYScal)];
    self.hrDeviceView.searchBgView.backgroundColor = [UIColor colorWithHexString:@"#88dbed"];
    [self.hrDeviceView.searchBtn addTarget:self action:@selector(searchDevices:) forControlEvents:UIControlEventTouchUpInside];
    [self.hrDeviceView.selectBtn addTarget:self action:@selector(showDevices:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.hrDeviceView];
    
    self.bindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bindBtn setTitle:@"绑定" forState:UIControlStateNormal];
    [self.bindBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CGFloat bindBtn_LeftMargin = self.contentFrame.size.width - 2 * kBindBtn_Width * kXScal - kBindBtn_RightMargin * kXScal - kCancelBtn_RightMargin * kXScal;
    CGFloat bindBtn_TopMargin = self.contentFrame.size.height - kBindBtn_Height * kYScal - kBindBtn_BottomMargin * kYScal;
    self.bindBtn.frame = CGRectMake(bindBtn_LeftMargin, bindBtn_TopMargin, kBindBtn_Width * kXScal, kBindBtn_Height * kYScal);
    self.bindBtn.backgroundColor = [UIColor colorWithHexString:@"#109bba"];
    [self.bindBtn addTarget:self action:@selector(bind:) forControlEvents:UIControlEventTouchUpInside];
    self.bindBtn.layer.cornerRadius = 10;
    self.bindBtn.layer.masksToBounds = YES;
    [self.contentView addSubview:self.bindBtn];
    
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    self.cancelBtn.frame = CGRectMake(CGRectGetMaxX(self.bindBtn.frame) + kBindBtn_RightMargin * kXScal, self.bindBtn.frame.origin.y, kBindBtn_Width * kXScal, kBindBtn_Height * kYScal);
    self.cancelBtn.backgroundColor = [UIColor colorWithHexString:@"#9b9b9b"];
    self.cancelBtn.layer.cornerRadius = 10;
    self.cancelBtn.layer.masksToBounds = YES;
    [self.cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.cancelBtn];
}

#pragma mark - button click events

- (void)showUsers:(UIButton*)sender {
    NSLog(@"显示用户");
    [self.deviceTableview removeFromSuperview];
    [self.nameTableview removeFromSuperview];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    self.nameTableview = [[UITableView alloc] initWithFrame:CGRectMake(kBindView_LeftMargin * kXScal + self.nameView.frame.origin.x + 10, CGRectGetMaxY(self.nameView.frame) + kBindView_TopMargin * kYScal, self.nameView.contentTF.frame.size.width - 20, 160) style:UITableViewStylePlain];
    self.nameTableview.dataSource = self;
    self.nameTableview.delegate = self;
    self.nameTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.nameTableview.tableFooterView = [[UIView alloc] init];
    self.nameTableview.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    [keyWindow addSubview:self.nameTableview];
    
    MJRefreshBackNormalFooter *footer = [[MJRefreshBackNormalFooter alloc] init];
    [footer setRefreshingTarget:self refreshingAction:@selector(footerClick)];
    self.nameTableview.mj_footer = footer;
    [self showUserListWithKeyword:@""];
}

- (void)footerClick {
    self.isFooterClick = YES;
    self.offset += 10;
    [self showUserListWithKeyword:@""];
}
- (void)searchUser:(UIButton*)sender {
    NSLog(@"搜索用户");
    [self.deviceTableview removeFromSuperview];
    [self.nameTableview removeFromSuperview];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    self.nameTableview = [[UITableView alloc] initWithFrame:CGRectMake(kBindView_LeftMargin * kXScal + self.nameView.frame.origin.x + 10, CGRectGetMaxY(self.nameView.frame) + kBindView_TopMargin * kYScal, self.nameView.contentTF.frame.size.width - 20, 160) style:UITableViewStylePlain];
    self.nameTableview.dataSource = self;
    self.nameTableview.delegate = self;
    self.nameTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.nameTableview.tableFooterView = [[UIView alloc] init];
    self.nameTableview.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    [keyWindow addSubview:self.nameTableview];
    self.nameTableview.mj_footer = nil;
    [self showUserListWithKeyword:self.nameView.contentTF.text];
}

- (void)showDevices:(UIButton*)sender {
    NSLog(@"显示设备");
    [self.deviceTableview removeFromSuperview];
    [self.nameTableview removeFromSuperview];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    self.deviceTableview = [[UITableView alloc] initWithFrame:CGRectMake(kBindView_LeftMargin * kXScal + self.hrDeviceView.frame.origin.x + 10, CGRectGetMaxY(self.hrDeviceView.frame) + kBindView_TopMargin * kYScal, self.hrDeviceView.contentTF.frame.size.width - 20, 160) style:UITableViewStylePlain];
    self.deviceTableview.dataSource = self;
    self.deviceTableview.delegate = self;
    self.deviceTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.deviceTableview.tableFooterView = [[UIView alloc] init];
    self.deviceTableview.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    [keyWindow addSubview:self.deviceTableview];
    [self showAvailableDevicesWithKeyword:@""];
}

- (void)searchDevices:(UIButton*)sender {
    NSLog(@"搜索设备");
    [self.deviceTableview removeFromSuperview];
    [self.nameTableview removeFromSuperview];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    self.deviceTableview = [[UITableView alloc] initWithFrame:CGRectMake(kBindView_LeftMargin * kXScal + self.hrDeviceView.frame.origin.x + 10, CGRectGetMaxY(self.hrDeviceView.frame) + kBindView_TopMargin * kYScal, self.hrDeviceView.contentTF.frame.size.width - 20, 160) style:UITableViewStylePlain];
    self.deviceTableview.dataSource = self;
    self.deviceTableview.delegate = self;
    self.deviceTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.deviceTableview.tableFooterView = [[UIView alloc] init];
    self.deviceTableview.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    [keyWindow addSubview:self.deviceTableview];
    [self showAvailableDevicesWithKeyword:self.hrDeviceView.contentTF.text];
}

- (void)bind:(UIButton*)sender {
    [self.nameTableview removeFromSuperview];
    [self.deviceTableview removeFromSuperview];
    if (self.nameView.contentTF.text.length > 0 || self.hrDeviceView.contentTF.text.length > 0) {
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        NSDictionary *userDict = [self.namesArr objectAtIndex:self.selectedUserIndex];
        NSDictionary *deviceDict = [self.devicesArr objectAtIndex:self.selectedDeviceIndex];
        NSInteger userId = [[userDict valueForKey:@"id"] integerValue];
        NSString *deviceCode = [deviceDict valueForKey:@"deviceCode"];
        [parameter setValue:@(userId) forKey:@"userId"];
        [parameter setValue:[userDict valueForKey:@"name"] forKey:@"name"];
        [parameter setValue:deviceCode forKey:@"deviceCode"];
        UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
        NSDictionary *dict = user.organ;
        NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
        NSString *orgCode = orgCodeArr[0];
        [parameter setValue:orgCode forKey:@"orgCode"];
        [self bindHRDevice:parameter];
    }
}

- (void)cancel:(UIButton*)sender {
    self.offset = 0;
    [self.nameTableview removeFromSuperview];
    [self.deviceTableview removeFromSuperview];
    [self dismiss];
}

- (void)show  {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
}

- (void)dismiss {
    [self.deviceTableview removeFromSuperview];
    [self.nameTableview removeFromSuperview];
    [self removeFromSuperview];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    if (self.nameTableview) {
        point = [self.nameTableview.layer convertPoint:point fromLayer:self.layer];
        if (![self.nameTableview.layer containsPoint:point]) {
            [self.nameTableview removeFromSuperview];
        }
    }
    if (self.deviceTableview) {
        point = [self.deviceTableview.layer convertPoint:point fromLayer:self.layer];
        if (![self.deviceTableview.layer containsPoint:point]) {
            [self.deviceTableview removeFromSuperview];
        }
    }
}

#pragma mark - UITableviewDataSource && UITableviewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.nameTableview) {
        return self.namesArr.count;
    } else {
        return self.devicesArr.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160/6.0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.nameTableview) {
        NSString *reuseCellId = @"nameReuseCellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellId];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor clearColor];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.font = [UIFont systemFontOfSize:14.0];
            cell.textLabel.textColor = [UIColor blackColor];
        }
        NSDictionary *dict = [self.namesArr objectAtIndex:indexPath.row];
        cell.textLabel.text = [dict valueForKey:@"name"];
        return cell;
    } else {
        NSString *reuseCellId = @"deviceReuseCellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellId];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor clearColor];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.textColor = [UIColor blackColor];
            cell.textLabel.font = [UIFont systemFontOfSize:14.0];
        }
        NSDictionary *dict = [self.devicesArr objectAtIndex:indexPath.row];
        cell.textLabel.text = [dict valueForKey:@"deviceCode"];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (tableView == self.nameTableview) {
        NSDictionary *dict = [self.namesArr objectAtIndex:indexPath.row];
        NSString *name = [dict valueForKey:@"name"];
        self.selectedUserIndex = indexPath.row;
        self.nameView.contentTF.text = name;
        [self.nameTableview removeFromSuperview];
    } else {
        NSDictionary *dict = [self.devicesArr objectAtIndex:indexPath.row];
        NSString *deviceId = [dict valueForKey:@"deviceCode"];
        self.selectedDeviceIndex = indexPath.row;
        self.hrDeviceView.contentTF.text = deviceId;
        [self.deviceTableview removeFromSuperview];
    }
}

#pragma mark - netFunctions

- (void)showUserListWithKeyword:(NSString *)keyword{
    __weak typeof (self)weakSelf = self;
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
    NSDictionary *dict = user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@(self.offset) forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    [parameter setValue:keyword forKey:@"keyword"];
    [parameter setValue:@1 forKey:@"allUser"];
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USERLIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"************** 1:%@**************",responseObject);
        if (code == 0) {
            NSArray *rows = [responseObject valueForKey:@"rows"];
            if (weakSelf.isFooterClick) {
                [weakSelf.namesArr addObjectsFromArray:rows];
                [weakSelf.nameTableview.mj_footer endRefreshing];
            } else {
                weakSelf.namesArr = [NSMutableArray arrayWithArray:rows];
            }
            [weakSelf.nameTableview reloadData];
        } else if (code == 10011) {
            [weakSelf dismiss];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"HidePatientListViewNotification" object:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TokenExpiredNotification" object:nil];
        }  else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)handPatientData:(NSArray *)data {
    if (self.namesArr.count > 0) {
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *originDict in self.namesArr) {
            NSInteger originId = [[originDict valueForKey:@"id"] integerValue];
            for (NSDictionary *dict in data) {
                NSInteger userid = [[dict valueForKey:@"id"] integerValue];
                if (originId != userid) {
                    [tempArr addObject:dict];
                }
            }
        }
        self.namesArr = [tempArr mutableCopy];
        [self.nameTableview reloadData];
    } else {
        [self.namesArr addObjectsFromArray:data];
    }
    [self.nameTableview reloadData];
}

- (void)showAvailableDevicesWithKeyword:(NSString*)keyword {
    __weak typeof (self)weakSelf = self;
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
    NSDictionary *dict = user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@14 forKey:@"deviceType"];
    [parameter setValue:keyword forKey:@"keyword"];

    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_AVAILABLE_DEVICE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"************** 2:%@**************",responseObject);
        if (code == 0) {
            NSArray *datas = [responseObject valueForKey:@"data"];
            if (datas.count > 0) {
                weakSelf.devicesArr = [NSMutableArray arrayWithArray:datas];
                NSLog(@"devicesArr :%@ ^^^^^^^^^^^^^^^^^^",weakSelf.devicesArr);
                [weakSelf.deviceTableview reloadData];
            } else {
                [STTextHudTool showText:@"无闲置心率带"];
            }
            [weakSelf.deviceTableview reloadData];
        } else if (code == 10011) {
            [weakSelf dismiss];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"HidePatientListViewNotification" object:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TokenExpiredNotification" object:nil];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)bindHRDevice:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_BIND_HRDEVICE_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSString *error = [responseObject valueForKey:@"error"];
        NSLog(@"bind device :%@ :%@",responseObject,error);
        if (code == 0) {
            UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
            SportDataModel *model = [[SportDataModel alloc] init];
            model.name = [parameter valueForKey:@"name"];
            model.userId = [[parameter valueForKey:@"userId"] integerValue];
            model.xId = [parameter valueForKey:@"deviceCode"];
            model.dId = @"0";
            model.dqxjzxj = @"0";
            model.alHr = 100;
            NSMutableArray *tempArr = [NSMutableArray arrayWithArray:patientsArr];
            if (patientsArr.count > 0) {
                NSInteger index = -1;
                for (NSInteger m = 0; m < patientsArr.count; m++) {
                    SportDataModel *data = (SportDataModel*)[patientsArr objectAtIndex:m];
                    if (data.userId == model.userId) {
                        index = m;
                    }
                }
                if (index > -1) {
                    [tempArr replaceObjectAtIndex:index withObject:model];
                    model.doctorId = user.userId;
                    model.bg_tableName = @"tb_monitor_patient";
                    [model bg_saveOrUpdate];
                } else {
                    [tempArr addObject:model];
                    model.doctorId = user.userId;
                    model.bg_tableName = @"tb_monitor_patient";
                    [model bg_saveOrUpdate];
                }
            } else {
                [tempArr addObject:model];
                model.doctorId = user.userId;
                model.bg_tableName = @"tb_monitor_patient";
                [model bg_saveOrUpdate];
            }
            patientsArr = [tempArr mutableCopy];
            NSLog(@"now patientArr is :%@",patientsArr);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdatePatientDataNotification" object:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"RefreshPatientNotification" object:nil];
            [weakSelf dismiss];
        } else if (code == 10011) {
            [weakSelf dismiss];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"HidePatientListViewNotification" object:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TokenExpiredNotification" object:nil];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (BOOL)checkHasExistPatient:(SportDataModel*)patient {
    BOOL hasExist = NO;
    if (patientsArr.count > 0) {
        for (SportDataModel *model in patientsArr) {
            if (model.userId == patient.userId) {
                hasExist = YES;
            }
        }
    }
    return hasExist;
}
@end
