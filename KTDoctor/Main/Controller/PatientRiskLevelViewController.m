//
//  PatientRiskLevelViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/5/14.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientRiskLevelViewController.h"
#import "PatientManageViewController.h"
#import "CreateAerobicPrescriptionViewController.h"
#import "CreatePowerPrescriptionViewController.h"
#import "MainViewController.h"
#import "UserModel.h"

#define kBackButton_LeftMargin 15
#define kButton_Height 30
#define kTitle_FontSize 22
#define kTitleLbl_Width 150
#define kInfoView_TopMargin 40
#define kInfoView_LeftMargin 20
#define kInfoView_BottomMargin 30
#define kBottomButton_Height 30
#define kBottomButton_Width 130
#define kBottom_BottomMargin 35
#define kBottomButton_Space 50
#define kBottomButton_FontSize 15.0
#define kResultLbl_TopMargin 140
#define kResultLbl_LeftMargin 56
#define kResultLbl_Height 37
#define kResultLbl_Width 260
#define kResultLbl_FontSize 15.0
#define kRiskImg_Width 159
#define kRiskImg_TopMargin 23
#define kRiskLevelLbl_Width 57
#define kRiskLevelLbl_Height 55
#define kRiskLevelLbl_FontSize 40
#define kSummaryView_TopMargin 25
#define kSummaryView_FontSize 14
#define kSummaryView_BottomMargin 25
#define kSummaryView_LeftMargin 100
#define kSummaryView_RightMargin 25
@interface PatientRiskLevelViewController ()
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *backButton;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIView *infoView;
@property (nonatomic,strong)UILabel *resultLbl;
@property (nonatomic,strong)UIImageView *riskImg;
@property (nonatomic,strong)UILabel *riskLevelLbl;
@property (nonatomic,strong)UITextView *summaryView;
@property (nonatomic,strong)UIButton *createAerobicPrescriptionBtn;
@property (nonatomic,strong)UIButton *createPowerPrescriptionBtn;
@property (nonatomic,strong)UIButton *finishBtn;
@property (nonatomic,strong)UserModel *user;
@end

@implementation PatientRiskLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.user = [[UserModel sharedUserModel] getCurrentUser];
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
    self.titleLbl.text = @"风险评级";
    [self.navView addSubview:self.titleLbl];
}

- (void)setupUI {
    UIImage *bgImg = [UIImage imageNamed:@"history_bg"];
    bgImg = [self imageCompressWithSimple:bgImg scaledToSize:CGSizeMake(kWidth, kHeight - CGRectGetMaxY(self.navView.frame))];
    self.bgImg = [[UIImageView alloc] initWithImage:bgImg];
    self.bgImg.frame = CGRectMake(0, CGRectGetMaxY(self.navView.frame), kWidth, kHeight - CGRectGetMaxY(self.navView.frame));
    [self.view addSubview:self.bgImg];
    self.bgImg.userInteractionEnabled = YES;
    
    self.infoView = [[UIView alloc] initWithFrame:CGRectMake(kInfoView_LeftMargin * kXScal, kInfoView_TopMargin * kYScal, kWidth - 2 * kInfoView_LeftMargin * kXScal, self.bgImg.frame.size.height - (kInfoView_TopMargin + kInfoView_BottomMargin + kBottomButton_Height + kBottom_BottomMargin) * kYScal)];
    self.infoView.backgroundColor = [UIColor colorWithHexString:@"#E8F5F5"];
    self.infoView.layer.cornerRadius = 4;
    self.infoView.layer.masksToBounds = YES;
    [self.bgImg addSubview:self.infoView];
    
    self.resultLbl = [[UILabel alloc] initWithFrame:CGRectMake(kResultLbl_LeftMargin * kXScal, kResultLbl_TopMargin * kYScal, kResultLbl_Width * kXScal, kResultLbl_Height * kYScal)];
    self.resultLbl.textColor = [UIColor colorWithHexString:@"#444444"];
    self.resultLbl.font = [UIFont systemFontOfSize:kResultLbl_FontSize * kYScal];
    self.resultLbl.text = @"根据美国糖尿病医学会，中国糖尿病的相关研究评定您目前的风险等级为：";
    self.resultLbl.textAlignment = NSTextAlignmentCenter;
    self.resultLbl.numberOfLines = 2;
    [self.infoView addSubview:self.resultLbl];
    
    self.riskImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"risk"]];
    self.riskImg.frame = CGRectMake(0, 0, kRiskImg_Width * kXScal, kRiskImg_Width * kXScal);
    self.riskImg.center = CGPointMake(self.resultLbl.center.x, CGRectGetMaxY(self.resultLbl.frame) + kRiskImg_TopMargin * kYScal + kRiskImg_Width * kXScal/2.0);
    [self.infoView addSubview:self.riskImg];
    
    NSInteger riskLevel = [[self.userInfo valueForKey:@"riskLevel"] integerValue];
    NSString *riskLevelStr = @"低";
    if (riskLevel == 1) {
        riskLevelStr = @"低";
    } else if (riskLevel == 2) {
        riskLevelStr = @"中";
    } else if (riskLevel == 3) {
        riskLevelStr = @"高";
    }
    self.riskLevelLbl = [[UILabel alloc] initWithFrame:CGRectMake((self.riskImg.frame.size.width - kRiskLevelLbl_Width * kXScal)/2.0, (self.riskImg.frame.size.height - kRiskLevelLbl_Height * kYScal)/2.0, kRiskLevelLbl_Width * kXScal, kRiskLevelLbl_Height * kYScal)];
    self.riskLevelLbl.textColor = [UIColor whiteColor];
    self.riskLevelLbl.textAlignment = NSTextAlignmentCenter;
    self.riskLevelLbl.font = [UIFont systemFontOfSize:kRiskLevelLbl_FontSize * kYScal];
    self.riskLevelLbl.text = riskLevelStr;
    [self.riskImg addSubview:self.riskLevelLbl];

    NSString *summaryStr = @"";
    if (riskLevel == 1) {
        summaryStr = @"      低风险下面，您已经做好准备开始一个更加阳光有活力的生活方式了！但运动开始时候，请您循序渐进，不要操之过急。我们仍然建议您在开始运动前咨询专业的医生，物理治疗师或者科学锻炼师。低风险等级下面，意味着我们可以使用更多的形式的运动来帮助您做好糖尿病的运动康复计划。在开始锻炼前，锻炼中和锻炼后，希望您能严格按照运动处方执行。您的运动处方，我们为您推荐如下。为了更准确的完成您的个性化运动处方，请您在医生，或者物理治疗师，科学锻炼指导师的帮助下完成病历收集量表，并听从他们的指示完成自己的运动处方。";
    } else if (riskLevel == 2) {
        summaryStr = @"      中风险下面，在您开始运动之前，您可能有一些问题是需要注意的，建议您在开始运动前要咨询专业的医生，物理治疗师或者科学锻炼师。中风险等级下面，意味着我们会针对您的问题，避免使用一些动作来防止可能出现的风险。在开始锻炼前，锻炼中和锻炼后，都有需要额外注意的地方，这体现在我们给您的运动处方中。请您在照着处方执行时小心。为了更准确的完成您的个性化运动处方，请您在医生，或者物理治疗师，科学锻炼指导师的帮助下完成病历收集量表，并听从他们的指示完成自己的运动处方。";
    } else if (riskLevel == 3) {
        summaryStr = @"      高风险下面，在您开始运动之前，您有一些问题是需要额外注意的，您在开始运动前必须，一定要咨询专业的医生，物理治疗师或者科学锻炼师。高风险等级下面，意味着我们会用全部的力量和小心去帮助您去规避一些可能对您造成危险的运动，循序渐进的开始。在开始锻炼前，锻炼中和锻炼后，都有需要额外注意的地方，我们给您的一个运动处方会告诉您，什么地方需要额外注意。并且会推荐一些运动。但目前您的高风险等级下，请在模仿处方中的运动时格外小心。为了更准确的完成您的个性化运动处方，并且尽量规避存在的风险，请您在医生，或者物理治疗师，科学锻炼指导师的帮助下完成病历收集量表，并听从他们的指示完成自己的运动处方。";
    }
    
    self.summaryView = [[UITextView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskImg.frame) + kSummaryView_LeftMargin * kXScal, kSummaryView_TopMargin * kYScal, self.infoView.frame.size.width - CGRectGetMaxX(self.riskImg.frame) - kSummaryView_LeftMargin * kXScal - kSummaryView_RightMargin * kXScal, self.infoView.frame.size.height - 2 * kSummaryView_TopMargin * kYScal) textContainer:nil];
    self.summaryView.backgroundColor = [UIColor whiteColor];
    self.summaryView.text = summaryStr;
    self.summaryView.textColor = [UIColor colorWithHexString:@"#444444"];
    self.summaryView.font =  [UIFont systemFontOfSize:kSummaryView_FontSize * kYScal];
    self.summaryView.editable = NO;
    [self.infoView addSubview:self.summaryView];
    
    CGFloat button_LeftMargin = (kWidth - 3 * kBottomButton_Width * kXScal - 2 * kBottomButton_Space * kXScal)/2;
    self.createAerobicPrescriptionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.createAerobicPrescriptionBtn.frame = CGRectMake(button_LeftMargin * kXScal, CGRectGetMaxY(self.infoView.frame) + kInfoView_BottomMargin * kYScal, kBottomButton_Width * kXScal, kBottomButton_Height * kYScal);
    self.createAerobicPrescriptionBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    [self.createAerobicPrescriptionBtn.titleLabel setFont:[UIFont systemFontOfSize:kBottomButton_FontSize * kYScal]];
    [self.createAerobicPrescriptionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.createAerobicPrescriptionBtn setTitle:@"开具有氧处方" forState:UIControlStateNormal];
    [self.createAerobicPrescriptionBtn addTarget:self action:@selector(createAerobicPrescription:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgImg addSubview:self.createAerobicPrescriptionBtn];
    
    self.createPowerPrescriptionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.createPowerPrescriptionBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    self.createPowerPrescriptionBtn.frame = CGRectMake(CGRectGetMaxX(self.createAerobicPrescriptionBtn.frame) + kBottomButton_Space * kXScal, CGRectGetMaxY(self.infoView.frame) + kInfoView_BottomMargin * kYScal, kBottomButton_Width * kXScal, kBottomButton_Height * kYScal);
    [self.createPowerPrescriptionBtn.titleLabel setFont:[UIFont systemFontOfSize:kBottomButton_FontSize * kYScal]];
    [self.createPowerPrescriptionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.createPowerPrescriptionBtn setTitle:@"开具力量处方" forState:UIControlStateNormal];
    [self.createPowerPrescriptionBtn addTarget:self action:@selector(createPowerPrescription:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgImg addSubview:self.createPowerPrescriptionBtn];
    
    self.finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.finishBtn.backgroundColor = [UIColor colorWithHexString:@"#0FAAC9"];
    self.finishBtn.frame = CGRectMake(CGRectGetMaxX(self.createPowerPrescriptionBtn.frame) + kBottomButton_Space * kXScal, CGRectGetMaxY(self.infoView.frame) + kInfoView_BottomMargin * kYScal, kBottomButton_Width * kXScal, kBottomButton_Height * kYScal);
    [self.finishBtn.titleLabel setFont:[UIFont systemFontOfSize:kBottomButton_FontSize * kYScal]];
    [self.finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.finishBtn addTarget:self action:@selector(finish:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgImg addSubview:self.finishBtn];
}

- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - button click events
- (void)back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

//获取设备类型列表
- (void)getDeviceTypeList:(NSMutableDictionary *)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDEVICE_TYPE_LIST_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"**************%@**************",responseObject);
        if (code == 0) {
            NSArray *data = [responseObject valueForKey:@"data"];
            CreateAerobicPrescriptionViewController *create = [[CreateAerobicPrescriptionViewController alloc] init];
            create.prescriptionDict = weakSelf.userInfo;
            if (data.count > 0) {
                for (NSDictionary *dict in data) {
                    NSString *name = [dict valueForKey:@"name"];
                    if ([name isEqualToString:@"有氧设备"]) {
                        create.deviceTypeArr = [[dict valueForKey:@"children"] mutableCopy];
                    }
                }
            }
            [weakSelf.navigationController pushViewController:create animated:NO];
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

//开具有氧处方
- (void)createAerobicPrescription:(UIButton*)sender {
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setValue:orgCode forKey:@"orgCode"];
    [self getDeviceTypeList:para];
}

//开具力量处方
- (void)createPowerPrescription:(UIButton*)sender {
    CreatePowerPrescriptionViewController *create = [[CreatePowerPrescriptionViewController alloc] init];
    create.prescriptionDict = self.userInfo;
    [self.navigationController pushViewController:create animated:NO];
}

//完成
- (void)finish:(UIButton*)sender {
    NSMutableDictionary *parameter = [NSMutableDictionary dictionaryWithDictionary:self.userInfo];
    NSDictionary *dict = self.user.organ;
    NSArray *orgCodeArr = [dict valueForKey:@"orgCode"];
    NSString *orgCode = orgCodeArr[0];
    [parameter setValue:orgCode forKey:@"orgCode"];
    [self doctorSaveUserInfo:parameter];
}

#pragma mark - networkFunctions
- (void)doctorSaveUserInfo:(NSMutableDictionary*)parameter {
    __weak typeof (self)weakSelf = self;
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_SAVE_USERINFO_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        if (code == 0) {
            BOOL hasManagePage = NO;
            NSArray *tempCVs = [self.navigationController viewControllers];
            for (UIViewController *vc in tempCVs) {
                if ([vc isKindOfClass:[PatientManageViewController class]]) {
                    [self.navigationController popToViewController:vc animated:NO];
                    hasManagePage = YES;
                    break;
                }
            }
            if (!hasManagePage) {
                MainViewController *main = [[MainViewController alloc] init];
                [self.navigationController pushViewController:main animated:NO];
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
@end
