//
//  DoctorRegistView.m
//  KTDoctor
//
//  Created by duwei on 2019/3/18.
//  Copyright © 2019 dz. All rights reserved.
//

#import "DoctorRegistView.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import "LoginViewController.h"
#import "DropdownMenu.h"

#define kRegistView_LeftMargin 200
#define kRegistView_TopMargin 150
#define kRegistView_TopView_Height 80
#define kRegistView_TitleLbl_FontSize 40.0
#define kRegistView_ExitBtn_Width 50
#define kRegistView_ExitBtn_RightMargin 20
#define kRegistView_HeadImg_TopMargin 30
#define kRegistView_HeadImg_Width 80
#define kRegistView_HeadImg_LeftMargin 20
#define kRegistView_HeadLbl_TopMargin 15
#define kRegistView_HeadLbl_Width 50
#define kRegistView_HeadLbl_Height 20
#define kRegistView_Lbl_FontSize 18.0
#define kRegistView_RedStar_LeftMargin 2
#define kRegistView_RedStar_Width 10
#define kRegistView_NameLbl_TopMargin 15
#define kRegistView_NameLbl_Width 80
#define kRegistView_LblLeftMargin 20
#define kRegistView_TextField_Height 40
#define kRegistView_TextField_Width 150
#define kRegistView_Vertical_Space 10
#define kRegistView_TextField_LeftMargin 15
#define kRegistView_SexSelect_Width 80
#define kRegistView_BirthSelect_Width 180
#define kRegistView_SkillsLbl_Height 50
#define kRegistView_SkillsView_Height 130
#define kRegistView_SkillsView_Width 220
#define kRegistView_SkillsView_RigthMargin 20
#define KRegistView_OKBtn_Width 150
#define kRegistView_OKBtn_TopMargin 20
#define kRegistView_OKBtn_Height 44

@interface DoctorRegistView()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,DropdownMenuDelegate>
@property (nonatomic,assign)CGRect contentFrame;
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *endTitle;
@property (nonatomic,strong)UIImageView *headImg;
@property (nonatomic,strong)UILabel *headLbl;
@property (nonatomic,strong)UIImageView *headRedStar;
@property (nonatomic,strong)UILabel *usernameLbl;
@property (nonatomic,strong)UIImageView *usernameRedStar;
@property (nonatomic,strong)UITextField *usernameTF;
@property (nonatomic,strong)UILabel *sexLbl;
@property (nonatomic,strong)UIImageView *sexRedStar;
@property (nonatomic,strong)DropdownMenu *sexMenu;
@property (nonatomic,strong)UILabel *birthLbl;
@property (nonatomic,strong)UIImageView *birthRedStar;
@property (nonatomic,strong)UIButton *birthTF;
@property (nonatomic,strong)UILabel *organizeLbl;
@property (nonatomic,strong)UIImageView *organizeRedStar;
@property (nonatomic,strong)UITextField *organizeTF;
@property (nonatomic,strong)UILabel *skillsLbl;
@property (nonatomic,strong)UIImageView *skillsRedStar;
@property (nonatomic,strong)UITextView *skillsView;
@property (nonatomic,strong)UIButton *okBtn;
@property (nonatomic,strong)NSArray *sexArr;
@property (nonatomic,copy)NSString *sex;
@end

@implementation DoctorRegistView

- (instancetype)initWithFrame:(CGRect)frame basicInfo:(NSDictionary*)basicInfo {
    if (self = [super init]) {
        self.contentFrame = frame;
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
    self.contentView.frame = CGRectMake(0, 0, kWidth - 2 * kRegistView_LeftMargin * kXScal, kHeight - 2 * kRegistView_TopMargin * kYScal);
    self.contentView.frame = self.contentFrame;
    self.contentView.layer.cornerRadius = 2;
    self.contentView.layer.masksToBounds = YES;
    CGPoint center = self.center;
    CGFloat x = center.x;
    CGFloat y = center.y;
    self.contentView.center = CGPointMake(x, y - 50);
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 6;
    [self addSubview:self.contentView];
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, kRegistView_TopView_Height * kYScal)];
    topView.backgroundColor = [UIColor colorWithHexString:@"#d0dce3"];
    [self.contentView addSubview:topView];
    
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, topView.frame.size.width, kRegistView_TitleLbl_FontSize * kYScal)];
    titleLbl.center = topView.center;
    titleLbl.text = @"医师注册";
    titleLbl.font = [UIFont systemFontOfSize:kRegistView_TitleLbl_FontSize * kYScal];
    titleLbl.textColor = [UIColor blackColor];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:titleLbl];
    
    UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [exitBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    exitBtn.layer.cornerRadius = kRegistView_ExitBtn_Width * kXScal / 2.0;
    exitBtn.layer.masksToBounds = YES;
    CGFloat exitBtnTop = (topView.frame.size.height - kRegistView_ExitBtn_Width * kXScal)/2;
    exitBtn.frame = CGRectMake(topView.frame.size.width - kRegistView_ExitBtn_RightMargin * kXScal - kRegistView_ExitBtn_Width * kXScal, exitBtnTop, kRegistView_ExitBtn_Width * kXScal, kRegistView_ExitBtn_Width * kXScal);
    
    [exitBtn addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:exitBtn];
    
    self.headImg = [[UIImageView alloc] initWithFrame:CGRectMake(kRegistView_HeadImg_LeftMargin * kXScal,CGRectGetMaxY(topView.frame) + kRegistView_HeadImg_TopMargin * kYScal, kRegistView_HeadImg_Width * kXScal, kRegistView_HeadImg_Width * kXScal)];
    self.headImg.image = [UIImage imageNamed:@"default_head"];
    self.headImg.layer.cornerRadius = kRegistView_HeadImg_Width * kXScal / 2.0;
    self.headImg.layer.masksToBounds = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changePhoto:)];
    self.headImg.userInteractionEnabled = YES;
    [self.headImg addGestureRecognizer:tap];
    [self.contentView addSubview:self.headImg];
    
    self.headLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headImg.frame) + kRegistView_HeadLbl_TopMargin * kYScal, kRegistView_HeadLbl_Width * kXScal, kRegistView_HeadLbl_Height * kYScal)];
    self.headLbl.text = @"头像";
    CGFloat headLblX = self.headImg.center.x;
    CGFloat headLblY = CGRectGetMaxY(self.headImg.frame) + kRegistView_HeadLbl_TopMargin * kYScal + kRegistView_HeadLbl_Height * kYScal / 2.0;
    self.headLbl.center = CGPointMake(headLblX, headLblY);
    self.headLbl.textColor = [UIColor blackColor];
    self.headLbl.font = [UIFont systemFontOfSize:kRegistView_Lbl_FontSize * kYScal];
    [self.contentView addSubview:self.headLbl];
    
    self.headRedStar = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headLbl.frame) + kRegistView_RedStar_LeftMargin * kXScal, self.headLbl.frame.origin.y, kRegistView_RedStar_Width * kXScal, kRegistView_RedStar_Width * kXScal)];
    CGFloat headRedStarX = CGRectGetMaxX(self.headLbl.frame) + kRegistView_RedStar_LeftMargin * kXScal;
    CGFloat headRedStarY = self.headLbl.center.y;
    self.headRedStar.center = CGPointMake(headRedStarX, headRedStarY);
    self.headRedStar.image = [UIImage imageNamed:@"redStar"];
    [self.contentView addSubview:self.headRedStar];
    
    self.usernameLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImg.frame) + kRegistView_LblLeftMargin * kXScal, CGRectGetMaxY(topView.frame) + kRegistView_NameLbl_TopMargin * kYScal, kRegistView_NameLbl_Width * kXScal, kRegistView_TextField_Height * kYScal)];
    self.usernameLbl.text = @"姓       名";
    self.usernameLbl.font = [UIFont systemFontOfSize:kRegistView_Lbl_FontSize * kYScal];
    self.usernameLbl.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.usernameLbl];
    
    self.usernameRedStar = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.usernameLbl.frame) + kRegistView_RedStar_LeftMargin * kXScal, self.usernameLbl.frame.origin.y, kRegistView_RedStar_Width * kXScal, kRegistView_RedStar_Width * kXScal)];
    CGFloat usernameStarX = CGRectGetMaxX(self.usernameLbl.frame) + kRegistView_RedStar_LeftMargin * kXScal;
    CGFloat usernameRedStarY = self.usernameLbl.center.y;
    self.usernameRedStar.center = CGPointMake(usernameStarX, usernameRedStarY);
    self.usernameRedStar.image = [UIImage imageNamed:@"redStar"];
    [self.contentView addSubview:self.usernameRedStar];
    
    self.usernameTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.usernameRedStar.frame) + kRegistView_TextField_LeftMargin * kXScal, self.usernameLbl.frame.origin.y, kRegistView_TextField_Width * kXScal, kRegistView_TextField_Height * kYScal)];
    self.usernameTF.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    self.usernameTF.placeholder = @"请输入姓名";
    [self.contentView addSubview:self.usernameTF];
    
    self.sexLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.usernameLbl.frame.origin.x, CGRectGetMaxY(self.usernameLbl.frame) + kRegistView_Vertical_Space * kYScal, kRegistView_NameLbl_Width * kXScal, kRegistView_TextField_Height * kYScal)];
    self.sexLbl.text = @"性       别";
    self.sexLbl.font = [UIFont systemFontOfSize:kRegistView_Lbl_FontSize * kYScal];
    self.sexLbl.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.sexLbl];
    
    self.sexRedStar = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.sexLbl.frame) + kRegistView_RedStar_LeftMargin * kXScal, self.sexLbl.frame.origin.y, kRegistView_RedStar_Width * kXScal, kRegistView_RedStar_Width * kXScal)];
    CGFloat sexStarX = CGRectGetMaxX(self.sexLbl.frame) + kRegistView_RedStar_LeftMargin * kXScal;
    CGFloat sexRedStarY = self.sexLbl.center.y;
    self.sexRedStar.center = CGPointMake(sexStarX, sexRedStarY);
    self.sexRedStar.image = [UIImage imageNamed:@"redStar"];
    [self.contentView addSubview:self.sexRedStar];

    self.sexArr = @[@"男",@"女"];
    self.sexMenu = [[DropdownMenu alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.sexRedStar.frame) + kRegistView_TextField_LeftMargin * kXScal, self.sexLbl.frame.origin.y, kRegistView_SexSelect_Width * kXScal, kRegistView_TextField_Height * kYScal)];
    [self.sexMenu setMenuTitlesWithMainTitle:@"请选择" bgColor:[UIColor colorWithHexString:@"#c6eff2"] titleArr:self.sexArr rowHeight:kRegistView_TextField_Height * kYScal];
    self.sexMenu.delegate = self;
    [self.contentView addSubview:self.sexMenu];
    
    self.birthLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.usernameLbl.frame.origin.x, CGRectGetMaxY(self.sexLbl.frame) + kRegistView_Vertical_Space * kYScal, kRegistView_NameLbl_Width * kXScal, kRegistView_TextField_Height * kYScal)];
    self.birthLbl.text = @"出生日期";
    self.birthLbl.font = [UIFont systemFontOfSize:kRegistView_Lbl_FontSize * kYScal];
    self.birthLbl.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.birthLbl];
    
    self.birthRedStar = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.birthLbl.frame) + kRegistView_RedStar_LeftMargin * kXScal, self.birthLbl.frame.origin.y, kRegistView_RedStar_Width * kXScal, kRegistView_RedStar_Width * kXScal)];
    CGFloat birthStarX = CGRectGetMaxX(self.birthLbl.frame) + kRegistView_RedStar_LeftMargin * kXScal;
    CGFloat birthRedStarY = self.birthLbl.center.y;
    self.birthRedStar.center = CGPointMake(birthStarX, birthRedStarY);
    self.birthRedStar.image = [UIImage imageNamed:@"redStar"];
    [self.contentView addSubview:self.birthRedStar];
    
    self.birthTF = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.birthRedStar.frame) + kRegistView_TextField_LeftMargin * kXScal, self.birthLbl.frame.origin.y, kRegistView_BirthSelect_Width * kXScal, kRegistView_TextField_Height * kYScal)];
    self.birthTF.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    [self.birthTF setImage:[UIImage imageNamed:@"dropdownMenu"] forState:UIControlStateNormal];
    [self.birthTF setTitle:@"请选择出生日期" forState:UIControlStateNormal];
    [self.birthTF setTitleColor:[UIColor colorWithHexString:@"#9fb5bd"] forState:UIControlStateNormal];
    [self.birthTF setImageEdgeInsets:UIEdgeInsetsMake(0, self.birthTF.frame.size.width - 20, 0, 0)];
    [self.birthTF setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 35)];
    [self.birthTF addTarget:self action:@selector(chooseBirthDay:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.birthTF];
    
    self.organizeLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.usernameLbl.frame.origin.x, CGRectGetMaxY(self.birthLbl.frame) + kRegistView_Vertical_Space * kYScal, kRegistView_NameLbl_Width * kXScal, kRegistView_TextField_Height * kYScal)];
    self.organizeLbl.text = @"所属机构";
    self.organizeLbl.font = [UIFont systemFontOfSize:kRegistView_Lbl_FontSize * kYScal];
    self.organizeLbl.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.organizeLbl];
    
    self.organizeRedStar = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.organizeLbl.frame) + kRegistView_RedStar_LeftMargin * kXScal, self.organizeLbl.frame.origin.y, kRegistView_RedStar_Width * kXScal, kRegistView_RedStar_Width * kXScal)];
    CGFloat organizeStarX = CGRectGetMaxX(self.organizeLbl.frame) + kRegistView_RedStar_LeftMargin * kXScal;
    CGFloat organizeRedStarY = self.organizeLbl.center.y;
    self.organizeRedStar.center = CGPointMake(organizeStarX, organizeRedStarY);
    self.organizeRedStar.image = [UIImage imageNamed:@"redStar"];
    [self.contentView addSubview:self.organizeRedStar];
    
    self.organizeTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.sexRedStar.frame) + kRegistView_TextField_LeftMargin * kXScal, self.organizeLbl.frame.origin.y, kRegistView_TextField_Width * kXScal, kRegistView_TextField_Height * kYScal)];
    self.organizeTF.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    self.organizeTF.placeholder = @"请填写机构ID";
    [self.contentView addSubview:self.organizeTF];
    
    self.skillsLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.usernameLbl.frame.origin.x, CGRectGetMaxY(self.organizeLbl.frame) + kRegistView_Vertical_Space * kYScal, kRegistView_NameLbl_Width * kXScal, kRegistView_SkillsLbl_Height * kYScal)];
    self.skillsLbl.text = @"擅长治疗病症";
    self.skillsLbl.numberOfLines = 2;
    self.skillsLbl.font = [UIFont systemFontOfSize:kRegistView_Lbl_FontSize * kYScal];
    self.skillsLbl.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.skillsLbl];
    
    self.skillsRedStar = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.skillsLbl.frame) + kRegistView_RedStar_LeftMargin * kXScal, self.skillsLbl.frame.origin.y, kRegistView_RedStar_Width * kXScal, kRegistView_RedStar_Width * kXScal)];
    CGFloat skillsStarX = CGRectGetMaxX(self.skillsLbl.frame) + kRegistView_RedStar_LeftMargin * kXScal;
    CGFloat skillsRedStarY = self.skillsLbl.center.y;
    self.skillsRedStar.center = CGPointMake(skillsStarX, skillsRedStarY);
    self.skillsRedStar.image = [UIImage imageNamed:@"redStar"];
    [self.contentView addSubview:self.skillsRedStar];
    
    self.skillsView = [[UITextView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.skillsRedStar.frame) + kRegistView_TextField_LeftMargin * kXScal, self.skillsLbl.frame.origin.y, kRegistView_SkillsView_Width * kXScal, kRegistView_SkillsView_Height * kYScal)];
    self.skillsView.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    [self.contentView addSubview:self.skillsView];
    UILabel *placeholderLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.skillsView.frame.size.width, kRegistView_TextField_Height * kYScal)];
    placeholderLbl.textColor = [UIColor colorWithHexString:@"#9fb5bd"];
    placeholderLbl.textColor = [UIColor lightGrayColor];
    placeholderLbl.text = @"限制400字";
    placeholderLbl.font = [UIFont systemFontOfSize:kRegistView_Lbl_FontSize * kYScal];
    [placeholderLbl setEnabled:NO];
    [self.skillsView addSubview:placeholderLbl];
    
    self.okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.okBtn.backgroundColor = [UIColor colorWithHexString:@"#0fa8cb"];
    [self.okBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CGFloat okBtn_x = topView.center.x;
    CGFloat okBtn_y = CGRectGetMaxY(self.skillsView.frame) + kRegistView_OKBtn_TopMargin * kYScal + kRegistView_OKBtn_Height * kYScal / 2;
    self.okBtn.frame = CGRectMake(0, 0, KRegistView_OKBtn_Width * kXScal, kRegistView_OKBtn_Height * kYScal);
    self.okBtn.layer.cornerRadius = kRegistView_OKBtn_Height * kYScal / 2.0;
    self.okBtn.layer.masksToBounds = YES;
    self.okBtn.center = CGPointMake(okBtn_x, okBtn_y);
    [self.okBtn addTarget:self action:@selector(finish:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.okBtn];
}

- (void)changePhoto:(UITapGestureRecognizer*)gesture {
    BOOL useable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    if (useable) {
        UIImagePickerController *photoPicker = [UIImagePickerController new];
        photoPicker.delegate = self;
        photoPicker.allowsEditing = NO;
        photoPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        photoPicker.allowsEditing = NO;
//        photoPicker.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
        [[self currentViewController] presentViewController:photoPicker animated:YES completion:nil];
    }
}

- (UIViewController *)currentViewController
{
    UIWindow *keyWindow  = [UIApplication sharedApplication].keyWindow;
    UIViewController *vc = keyWindow.rootViewController;
    while (vc.presentedViewController)
    {
        vc = vc.presentedViewController;
        
        if ([vc isKindOfClass:[UINavigationController class]])
        {
            vc = [(UINavigationController *)vc visibleViewController];
        }
        else if ([vc isKindOfClass:[UITabBarController class]])
        {
            vc = [(UITabBarController *)vc selectedViewController];
        }
    }
    return vc;
}

#pragma mark - button click events
- (void)chooseBirthDay:(UIButton*)sender {
    NSLog(@"选择出生日期");
}

- (void)finish:(UIButton*)sender {
    NSLog(@"完成！！！！");
}

- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
}

- (void)exit:(UIButton*)sender {
    [self dismiss];
}

- (void)dismiss {
    [self removeFromSuperview];
}

#pragma mark - DropdownMenuDelegate Delegate

- (void)dropdownMenu:(DropdownMenu *)menu selectedCellNumber:(NSInteger)number{
    NSLog(@"你选择了：%@",self.sexArr[number]);
    NSString *selectedStr = self.sexArr[number];
    if ([selectedStr isEqualToString:@"男"]) {
        self.sex = @"1";
    } else {
        self.sex = @"2";
    }
}

@end
