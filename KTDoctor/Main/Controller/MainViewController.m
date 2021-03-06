//
//  MainViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/3/13.
//  Copyright © 2019 dz. All rights reserved.
//

#import "MainViewController.h"
#import "IndexPopoverViewController.h"
#import "MonitorViewController.h"
#import "HistoryViewController.h"
#import "PatientManageViewController.h"
#import "AddPatientViewController.h"
#import "AddTemplateViewController.h"
#import "IntensionViewController.h"
#import "RegistOrResetView.h"
#import "DoctorRegistView.h"
#import "UserModel.h"
#import "OpenAerobicPrescriptionVC.h"

#define kMain_NavView_LogoutBtn_LeftMargin 15
#define kMain_NavView_LogoutBtn_Height 45
#define kMain_Organ_LogoView_Width 120
#define kMain_Organ_LogoView_RightMargin 60
#define kMain_Organ_LogoView_Height 25
#define kMain_NavView_LogoutBtn_Width 150
#define kMain_NavView_LogoutBtn_FontSize 18.0
#define kMain_NavView_LogoutBtn_ImgLeftMargin 15
#define kMain_Btn_TopMargin (kHeight - kNavView_TopMargin - kNavView_Height - 2 * kMain_Btn_Height * kYScal - kMain_Btn_VerticalSpace * kYScal)/2
#define kMain_Btn_LeftMargin (kWidth - kMain_Btn_Width * kXScal * 3 - 2 * kMain_Btn_HorizontalSpace * kXScal)/2
#define kMain_Btn_Height 83
#define kMain_Btn_Width 190
#define kMain_Btn_VerticalSpace 90
#define kMain_Btn_HorizontalSpace 80
#define kMain_Btn_RestPasswordView_LeftMargin 200
#define kMain_Btn_RestPasswordView_TopMargin 112

@interface MainViewController ()<IndexPopoverDelegate>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *logoutBtn;
@property (nonatomic,strong)UIImageView *organLogo;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIImageView *monitorBtn;
@property (nonatomic,strong)UIImageView *historyBtn;
@property (nonatomic,strong)UIImageView *patientManageBtn;
@property (nonatomic,strong)UIImageView *addPatientBtn;
@property (nonatomic,strong)UIImageView *customTemplateBtn;
@property (nonatomic,strong)UIImageView *intensionBtn;
@property (nonatomic,strong)UserModel *user;
@property (nonatomic,strong)IndexPopoverViewController *pop;
@property (nonatomic,strong)UIPopoverPresentationController *popController;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    self.user = [[UserModel sharedUserModel] getCurrentUser];
    [self setNavBar];
    [self setUpContentView];
}

- (void)setNavBar {
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, kNavView_TopMargin, kWidth, kNavView_Height)];
    self.navView.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.view addSubview:self.navView];
    
    self.logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *username = [self.user valueForKey:@"name"];
    [self.logoutBtn setTitle:username forState:UIControlStateNormal];
    self.logoutBtn.adjustsImageWhenHighlighted = NO;//取消图片的高亮状态
    CGFloat logoutBtnY = (self.navView.frame.size.height - kMain_NavView_LogoutBtn_Height) / 2;
    self.logoutBtn.frame = CGRectMake(kMain_NavView_LogoutBtn_LeftMargin, logoutBtnY, kMain_NavView_LogoutBtn_Width, kMain_NavView_LogoutBtn_Height);
    self.logoutBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.logoutBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.logoutBtn.imageEdgeInsets = UIEdgeInsetsMake(0, kMain_NavView_LogoutBtn_Height - 5, 0, 0);
    self.logoutBtn.titleEdgeInsets = UIEdgeInsetsMake(0, kMain_NavView_LogoutBtn_Height + 5, 0, 0);
    [self.logoutBtn setImage:[UIImage imageNamed:@"set"] forState:UIControlStateNormal];
    [self.logoutBtn.titleLabel setFont:[UIFont systemFontOfSize:kMain_NavView_LogoutBtn_FontSize]];
    self.logoutBtn.layer.masksToBounds = YES;
    [self.logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.logoutBtn addTarget:self action:@selector(logoutBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.logoutBtn];
    
    NSArray *organArr = (NSArray*)self.user.organ;
    NSString *logo = @"";
    if (organArr.count > 0) {
        NSDictionary *organDict = [organArr objectAtIndex:0];
        logo = [organDict valueForKey:@"logo"];
    }
    self.organLogo = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth - kMain_NavView_LogoutBtn_LeftMargin * kXScal - kMain_Organ_LogoView_Width * kXScal - kMain_Organ_LogoView_RightMargin * kXScal, 0 , kMain_Organ_LogoView_Width * kXScal, kNavView_Height)];
    [self.organLogo sd_setImageWithURL:[NSURL URLWithString:logo]];
    UIImage *orgLogo = self.organLogo.image;
    orgLogo = [self imageCompressWithSimple:orgLogo scaledToSize:CGSizeMake(kMain_Organ_LogoView_Width * kXScal, kNavView_Height)];
    self.organLogo.image = orgLogo;
    self.organLogo.center = CGPointMake(kWidth - kMain_NavView_LogoutBtn_LeftMargin * kXScal - kMain_Organ_LogoView_Width * kXScal - kMain_Organ_LogoView_RightMargin * kXScal + kMain_Organ_LogoView_Width * kXScal / 2.0, self.logoutBtn.center.y);
    [self.navView addSubview:self.organLogo];
}

- (void)setUpContentView {
    UIImage *bgImg = [UIImage imageNamed:@"main_bg"];
    bgImg = [self imageCompressWithSimple:bgImg scaledToSize:CGSizeMake(kWidth, kHeight - CGRectGetMaxY(self.navView.frame))];
    self.bgImg = [[UIImageView alloc] initWithImage:bgImg];
    self.bgImg.frame = CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWidth, kHeight - CGRectGetMaxY(self.navView.frame));
    [self.view addSubview:self.bgImg];
    self.bgImg.userInteractionEnabled = YES;
    
    self.monitorBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"monitor"]];
    self.monitorBtn.frame = CGRectMake(kMain_Btn_LeftMargin, kMain_Btn_TopMargin, kMain_Btn_Width * kXScal, kMain_Btn_Height * kYScal);
    UITapGestureRecognizer *monitorTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(monitor:)];
    self.monitorBtn.userInteractionEnabled = YES;
    [self.monitorBtn addGestureRecognizer:monitorTap];
    [self.bgImg addSubview:self.monitorBtn];
    
    self.historyBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"history"]];
    self.historyBtn.frame = CGRectMake(CGRectGetMaxX(self.monitorBtn.frame) + kMain_Btn_HorizontalSpace * kXScal, self.monitorBtn.frame.origin.y, kMain_Btn_Width * kXScal, kMain_Btn_Height * kYScal);
    self.historyBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer *historyTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(history:)];
    [self.historyBtn addGestureRecognizer:historyTap];
    [self.bgImg addSubview:self.historyBtn];
    
    self.patientManageBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"patientManage"]];
    self.patientManageBtn.frame = CGRectMake(CGRectGetMaxX(self.historyBtn.frame) + kMain_Btn_HorizontalSpace * kXScal, self.monitorBtn.frame.origin.y, kMain_Btn_Width * kXScal, kMain_Btn_Height * kYScal);
    self.patientManageBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer *patientManageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(patientManage:)];
    [self.patientManageBtn addGestureRecognizer:patientManageTap];
    [self.bgImg addSubview:self.patientManageBtn];
    
    self.addPatientBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"addPatient"]];
    self.addPatientBtn.frame = CGRectMake(self.monitorBtn.frame.origin.x, CGRectGetMaxY(self.monitorBtn.frame) + kMain_Btn_VerticalSpace * kYScal, kMain_Btn_Width * kXScal, kMain_Btn_Height * kYScal);
    self.addPatientBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer *addPatientTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addPatient:)];
    [self.addPatientBtn addGestureRecognizer:addPatientTap];
    [self.bgImg addSubview:self.addPatientBtn];
    
    self.customTemplateBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"customTemplate"]];
    self.customTemplateBtn.userInteractionEnabled = YES;
    self.customTemplateBtn.frame = CGRectMake(CGRectGetMaxX(self.addPatientBtn.frame) + kMain_Btn_HorizontalSpace * kXScal, self.addPatientBtn.frame.origin.y, kMain_Btn_Width * kXScal, kMain_Btn_Height * kYScal);
    UITapGestureRecognizer *customTemplateTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(customTemplateTap:)];
    [self.customTemplateBtn addGestureRecognizer:customTemplateTap];
    [self.bgImg addSubview:self.customTemplateBtn];
    
    self.intensionBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"intensionAuthorization"]];
    self.intensionBtn.userInteractionEnabled = YES;
    self.intensionBtn.frame = CGRectMake(CGRectGetMaxX(self.customTemplateBtn.frame) + kMain_Btn_HorizontalSpace * kXScal, self.addPatientBtn.frame.origin.y, kMain_Btn_Width * kXScal, kMain_Btn_Height * kYScal);
    UITapGestureRecognizer *intensionTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(intensionTest:)];
    [self.intensionBtn addGestureRecognizer:intensionTap];
    [self.bgImg addSubview:self.intensionBtn];    
}

#pragma mark - click events

- (void)logoutBtnClick:(UIButton*)sender {
    self.pop = [[IndexPopoverViewController alloc] init];
    self.pop.preferredContentSize = CGSizeMake(120, 120);
    self.pop.delegate = self;
    self.pop.contentArr = @[@{@"title":@"资料修改",@"icon":@"profilePhoto"},@{@"title":@"密码修改",@"icon":@"password"},@{@"title":@"退出登录",@"icon":@"logout"}];
    self.pop.modalPresentationStyle = UIModalPresentationPopover;
    self.popController = [self.pop popoverPresentationController];
    self.popController.sourceView = self.logoutBtn;
    self.popController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    self.popController.sourceRect = CGRectMake(self.logoutBtn.bounds.origin.x, (kNavView_Height - kMain_NavView_LogoutBtn_Height)/2, self.logoutBtn.bounds.size.width, self.logoutBtn.bounds.size.height);
    [self presentViewController:self.pop animated:YES completion:nil];
}

- (void)monitor:(UITapGestureRecognizer*)sender {
    MonitorViewController *monitor = [[MonitorViewController alloc] init];
    [self.navigationController pushViewController:monitor animated:NO];
    
//    OpenAerobicPrescriptionVC *monitor = [[OpenAerobicPrescriptionVC alloc] init];
//    [self.navigationController pushViewController:monitor animated:NO];
}

- (void)history:(UITapGestureRecognizer*)sender {
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@0 forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    [parameter setValue:@"-create_time" forKey:@"sort"];
    [self getUserSportList:parameter];
}

- (void)patientManage:(UITapGestureRecognizer*)sender {
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [parameter setValue:@0 forKey:@"offset"];
    [parameter setValue:@10 forKey:@"rows"];
    [parameter setValue:@"" forKey:@"keyword"];
    [parameter setValue:@"" forKey:@"disease"];
    [parameter setValue:@0 forKey:@"risk"];
    [parameter setValue:@0 forKey:@"age"];
    [parameter setValue:@1 forKey:@"type"];
    [self getDoctorPatientList:parameter];
}

- (void)addPatient:(UITapGestureRecognizer*)sender {
    AddPatientViewController *add = [[AddPatientViewController alloc] init];
    [self.navigationController pushViewController:add animated:NO];
}

- (void)customTemplateTap:(UITapGestureRecognizer*)sender {
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [para setValue:orgCode forKey:@"orgCode"];
    [self getDeviceTypeList:para];
}

- (void)intensionTest:(UITapGestureRecognizer*)sender {
    IntensionViewController *intension = [[IntensionViewController alloc] init];
    [self.navigationController pushViewController:intension animated:NO];
}

- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - netFunctions

//获取设备类型列表
- (void)getDeviceTypeList:(NSMutableDictionary *)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDEVICE_TYPE_LIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************%@**************",responseObject);
        if (code == 0) {
            NSArray *data = [responseObject valueForKey:@"data"];
            AddTemplateViewController *template = [[AddTemplateViewController alloc] init];
            template.deviceTypeArr = [data mutableCopy];
            [self.navigationController pushViewController:template animated:NO];
        } else if (code == 10011) {
            [STTextHudTool showText:@"该账号已在其他设备登录或已过期"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [weakSelf.navigationController popToRootViewControllerAnimated:NO];
        }  else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}

- (void)getUserSportList:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USER_SPORTLIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSString *error = [responseObject valueForKey:@"error"];
        NSLog(@"sport lists :%@ :%@",responseObject,error);
        if (code == 0) {
            NSArray *rows = [responseObject valueForKey:@"rows"];
            HistoryViewController *history = [[HistoryViewController alloc] init];
            history.sportlists = [NSMutableArray arrayWithArray:rows];
            [weakSelf.navigationController pushViewController:history animated:NO];
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

- (void)getDoctorPatientList:(NSMutableDictionary *)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_USERLIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSString *error = [responseObject valueForKey:@"error"];
        NSLog(@"lists :%@ :%@",responseObject,error);
        if (code == 0) {
            NSArray *rows = [responseObject valueForKey:@"rows"];
            PatientManageViewController *manage = [[PatientManageViewController alloc] init];
            manage.datas = [rows mutableCopy];
            [weakSelf.navigationController pushViewController:manage animated:NO];
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

#pragma mark - IndexPopoverDelegate

- (void)conditionChoose:(NSInteger)index {
    if (index == 0) {//资料修改
        [self.pop dismissViewControllerAnimated:NO completion:nil];
        NSDictionary *dict = @{};
        DoctorRegistView *registView = [[DoctorRegistView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 2 * kMain_Btn_RestPasswordView_LeftMargin, kHeight - 2 * kMain_Btn_RestPasswordView_TopMargin) basicInfo:dict userInfo:self.user type:DoctorModifyInfoPopView];
        [registView show];
    } else if (index == 1) {//密码修改
        [self.pop dismissViewControllerAnimated:NO completion:nil];
        RegistOrResetView *registView = [[RegistOrResetView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 2 * kMain_Btn_RestPasswordView_LeftMargin, kHeight - 2 * kMain_Btn_RestPasswordView_TopMargin) title:@"设置新密码" endTitle:@"确定" type:ResetPopView];
        [registView show];
    } else if (index == 2) {//退出登录
        [self.pop dismissViewControllerAnimated:NO completion:nil];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否确认退出登录？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
            [self docotorLogOut:parameter];
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self.pop dismissViewControllerAnimated:NO completion:nil];
        }];
        [alert addAction:okAction];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:NO completion:nil];
    }
}

- (void)docotorLogOut:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_LOGOUT_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"%@",[weakSelf convertToJSONData:responseObject]);
        if (code == 0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClearLonginInfoNotification" object:nil];
            [weakSelf.navigationController popToRootViewControllerAnimated:NO];
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
