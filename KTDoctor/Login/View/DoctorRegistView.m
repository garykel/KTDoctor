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
#import "KTDropDownMenus.h"
#import "WHC_PhotoListCell.h"
#import "WHC_PictureListVC.h"
#import "WHC_CameraVC.h"
#import "UIImagePickerController+MyImagePicker.h"
#import <AFNetworking/AFURLSessionManager.h>

#define kRegistView_LeftMargin 200
#define kRegistView_TopMargin 150
#define kRegistView_TopView_Height 80
#define kRegistView_TitleLbl_FontSize 30.0
#define kRegistView_ExitBtn_Width 50
#define kRegistView_ExitBtn_RightMargin 20
#define kRegistView_HeadImg_TopMargin 30
#define kRegistView_HeadImg_Width 80
#define kRegistView_HeadImg_LeftMargin 20
#define kRegistView_HeadLbl_TopMargin 15
#define kRegistView_HeadLbl_Width 50
#define kRegistView_HeadLbl_Height 20
#define kRegistView_Lbl_FontSize 14.0
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

@interface DoctorRegistView()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,XXTGDropdownMenuDelegate,UITextViewDelegate,WHC_ChoicePictureVCDelegate,WHC_CameraVCDelegate>
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
@property (nonatomic,strong)KTDropDownMenus *sexMenu;
@property (nonatomic,strong)UILabel *birthLbl;
@property (nonatomic,strong)UIImageView *birthRedStar;
@property (nonatomic,strong)UIButton *birthTF;
@property (nonatomic,strong)UILabel *organizeLbl;
@property (nonatomic,strong)UIImageView *organizeRedStar;
@property (nonatomic,strong)UITextField *organizeTF;
@property (nonatomic,strong)UILabel *skillsLbl;
@property (nonatomic,strong)UIImageView *skillsRedStar;
@property (nonatomic,strong)UITextView *skillsView;
@property (nonatomic,strong)UILabel *placeholderLbl;
@property (nonatomic,strong)UIButton *okBtn;
@property (nonatomic,strong)NSDictionary *basicinfo;
@property (nonatomic,strong)NSArray *sexArr;
@property (nonatomic,copy)NSString *sex;
@property (nonatomic,copy)NSString *birthday;
@property (nonatomic,strong)UIImage *selectedImg;
@property (nonatomic,assign)DocotorReistPopViewType type;
@property (nonatomic,strong)UserModel *userInfo;
@property (nonatomic,strong)UIView *topView;
@end

@implementation DoctorRegistView

- (instancetype)initWithFrame:(CGRect)frame basicInfo:(NSDictionary*)basicInfo userInfo:(UserModel*)userInfo type:(DocotorReistPopViewType)type{
    if (self = [super init]) {
        self.contentFrame = frame;
        self.basicinfo = [NSDictionary dictionaryWithDictionary:basicInfo];
        self.type = type;
        self.userInfo = userInfo;
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
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, kRegistView_TopView_Height * kYScal)];
    self.topView.backgroundColor = [UIColor colorWithHexString:@"#d0dce3"];
    [self.contentView addSubview:self.topView];
    
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.topView.frame.size.width, kRegistView_TitleLbl_FontSize * kYScal)];
    titleLbl.center = self.topView.center;
    NSString *title = @"";
    if (self.type == DoctorRegistPopView) {
        title = @"医师注册";
    } else {
        title = @"医师资料修改";
    }
    titleLbl.text = title;
    titleLbl.font = [UIFont systemFontOfSize:kRegistView_TitleLbl_FontSize * kYScal];
    titleLbl.textColor = [UIColor blackColor];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    [self.topView addSubview:titleLbl];
    
    UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [exitBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    exitBtn.layer.cornerRadius = kRegistView_ExitBtn_Width * kXScal / 2.0;
    exitBtn.layer.masksToBounds = YES;
    CGFloat exitBtnTop = (self.topView.frame.size.height - kRegistView_ExitBtn_Width * kXScal)/2;
    exitBtn.frame = CGRectMake(self.topView.frame.size.width - kRegistView_ExitBtn_RightMargin * kXScal - kRegistView_ExitBtn_Width * kXScal, exitBtnTop, kRegistView_ExitBtn_Width * kXScal, kRegistView_ExitBtn_Width * kXScal);
    
    [exitBtn addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:exitBtn];
    
    self.headImg = [[UIImageView alloc] initWithFrame:CGRectMake(kRegistView_HeadImg_LeftMargin * kXScal,CGRectGetMaxY(self.topView.frame) + kRegistView_HeadImg_TopMargin * kYScal, kRegistView_HeadImg_Width * kXScal, kRegistView_HeadImg_Width * kXScal)];
    if (self.type == DoctorModifyInfoPopView) {
        if (self.userInfo !=nil) {
            NSString *headUrl = [self.userInfo valueForKey:@"headUrl"];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.headImg sd_setImageWithURL:[NSURL URLWithString:headUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
            });
        }
    } else {
        self.headImg.image = [UIImage imageNamed:@"default_head"];
    }
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
    
    self.usernameLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImg.frame) + kRegistView_LblLeftMargin * kXScal, CGRectGetMaxY(self.topView.frame) + kRegistView_NameLbl_TopMargin * kYScal, kRegistView_NameLbl_Width * kXScal, kRegistView_TextField_Height * kYScal)];
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
    if (self.type == DoctorModifyInfoPopView) {
        if (self.userInfo !=nil) {
            NSString *name = [self.userInfo valueForKey:@"name"];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.usernameTF.text = name;
            });
        }
    }
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
    self.sexMenu = [[KTDropDownMenus alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.sexRedStar.frame) + kRegistView_TextField_LeftMargin * kXScal, self.sexLbl.frame.origin.y, kRegistView_SexSelect_Width * kXScal, kRegistView_TextField_Height * kYScal)];
    [self.sexMenu setDropdownHeight:kRegistView_TextField_Height * kYScal];
    if (self.type == DoctorModifyInfoPopView) {
        if (self.userInfo !=nil) {
            NSInteger sex = [[self.userInfo valueForKey:@"sex"] integerValue];
            NSString *sexStr = @"";
            if (sex == 2) {
                sexStr = @"女";
            } else {
                sexStr = @"男";
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.sexMenu.defualtStr = sexStr;
                self.sex = sexStr;
            });
        }
    } else {
        self.sexMenu.defualtStr = @"男";
    }
    self.sexMenu.delegate = self;
    self.sexMenu.dropDownImage.image = [UIImage imageNamed:@"dropdownMenu"];
    [self.sexMenu.mainBtn.titleLabel setFont:[UIFont systemFontOfSize:kRegistView_Lbl_FontSize * kYScal]];
//    self.sexMenu.mainBtn.backgroundColor = [UIColor colorWithHexString:@"#c6eff2"];
    self.sexMenu.titles = @[@"男",@"女"];

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
    if (self.type == DoctorModifyInfoPopView) {
        if (self.userInfo !=nil) {
            NSString *birthdate = [self.userInfo valueForKey:@"birthdate"];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.birthTF setTitle:birthdate forState:UIControlStateNormal];
                self.birthday = birthdate;
            });
        }
    } else {
        [self.birthTF setTitle:@"请选择出生日期" forState:UIControlStateNormal];
    }
    self.birthTF.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.birthTF setTitleColor:[UIColor colorWithHexString:@"#9fb5bd"] forState:UIControlStateNormal];
    [self.birthTF setImageEdgeInsets:UIEdgeInsetsMake(0, self.birthTF.frame.size.width - 20, 0, 0)];
    [self.birthTF setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.birthTF.frame.size.width/2 + 10, 0, 0)];
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
    if (self.type == DoctorModifyInfoPopView) {
        if (self.userInfo !=nil) {
            NSArray *organs = [self.userInfo valueForKey:@"organ"];
            if (organs.count > 0) {
                NSDictionary *organDict = [organs firstObject];
                if (organDict) {
                    NSString *organCode = [organDict valueForKey:@"orgCode"];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.organizeTF.text = organCode;
                    });
                }
            }
        }
    }
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
    self.skillsView.font = [UIFont systemFontOfSize:kRegistView_Lbl_FontSize * kYScal];
    self.skillsView.delegate = self;
    [self.contentView addSubview:self.skillsView];
    self.placeholderLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, -5, self.skillsView.frame.size.width, kRegistView_TextField_Height * kYScal)];
    self.placeholderLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.placeholderLbl.textColor = [UIColor lightGrayColor];
    self.placeholderLbl.text = @"限制400字";
    if (self.type == DoctorModifyInfoPopView) {
        if (self.userInfo !=nil) {
            NSString *speciality = [self.userInfo valueForKey:@"speciality"];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.skillsView.text = speciality;
                self.placeholderLbl.text = @"";
            });
        }
    } else {
        self.placeholderLbl.text = @"限制400字";
    }
    self.placeholderLbl.font = [UIFont systemFontOfSize:kRegistView_Lbl_FontSize * kYScal];
    [self.placeholderLbl setEnabled:NO];
    [self.skillsView addSubview:self.placeholderLbl];
    
    self.okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.okBtn.backgroundColor = [UIColor colorWithHexString:@"#0fa8cb"];
    [self.okBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CGFloat okBtn_x = self.topView.center.x;
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
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                       message:@"获取头像"
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDestructive
                                                             handler:^(UIAlertAction * action) {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            imagePicker.allowsEditing = YES;
            imagePicker.view.transform  =   CGAffineTransformMakeRotation(M_PI*2);
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [[self currentViewController] presentViewController:imagePicker animated:YES completion:nil];
//                [self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
            }];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
//            });
                                                             }];
        UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action) {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.videoQuality = UIImagePickerControllerQualityTypeHigh;
            imagePicker.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            imagePicker.allowsEditing = YES;
            imagePicker.view.transform  =   CGAffineTransformMakeRotation(M_PI*2);
            [[self currentViewController] presentViewController:imagePicker animated:YES completion:nil];
        }];
        
        [alert addAction:saveAction];
        [alert addAction:deleteAction];
        UIPopoverPresentationController *popover = alert.popoverPresentationController;
        if (popover) {
            popover.sourceView = self.topView;
            popover.permittedArrowDirections = UIPopoverArrowDirectionUp;
            popover.sourceRect = CGRectMake(self.topView.bounds.origin.x, -self.topView.frame.size.height, self.topView.frame.size.width, self.topView.frame.size.height);
        }
        [[self currentViewController] presentViewController:alert animated:YES completion:nil]; 
    }
}

- (void)showImagePicker:(UIImagePickerControllerSourceType)type{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeDirection" object:@"1"];
    UIImagePickerController *myPicker = [[UIImagePickerController alloc] init];
    myPicker.delegate = self;
    myPicker.sourceType = type;
    myPicker.allowsEditing = YES;
    [[self currentViewController] presentViewController:myPicker animated:YES completion:nil];
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

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSLog(@"info is :%@",info);
    __weak typeof (self)weakSelf = self;
    [[self currentViewController] dismissViewControllerAnimated:YES completion:^{
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (image!=nil) {
            UIImage *resImg = [self imageCompressToData:image];
            if (resImg !=nil) {
                weakSelf.headImg.image = resImg;
                weakSelf.selectedImg = resImg;
            }
        }
    }];
}


//图片压缩
- (UIImage *)imageCompressToData:(UIImage *)image{
    NSData *data=UIImageJPEGRepresentation(image, 1.0);
    if (data.length>300*1024) {
        if (data.length>1024*1024) {//1M以及以上
            data=UIImageJPEGRepresentation(image, 0.1);
        }else if (data.length>512*1024) {//0.5M-1M
            data=UIImageJPEGRepresentation(image, 0.5);
        }else if (data.length>300*1024) {//0.25M-0.5M
            data=UIImageJPEGRepresentation(image, 0.9);
        }
    }
    UIImage *resImage = [UIImage imageWithData:data];
    return resImage;
}
#pragma mark - button click events
- (void)chooseBirthDay:(UIButton*)sender {
    NSLog(@"选择出生日期");
//    self.hidden = YES;
    __weak typeof (self)weakSelf = self;
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {
        
        NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd"];
        NSLog(@"选择的日期：%@",date);
        [weakSelf.birthTF setTitle:date forState:UIControlStateNormal];
        weakSelf.birthday = date;
//        weakSelf.hidden = NO;
    }];
    datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.doneButtonColor = [UIColor grayColor];//确定按钮的颜色
    [datepicker show];
}

- (void)dateChange:(UIDatePicker*)datesender {
    UIDatePicker *picker = (UIDatePicker*)datesender;
    NSDate *date = picker.date;
    NSLog(@"选择了:%@",date);
}

- (void)finish:(UIButton*)sender {
    NSString *username = self.usernameTF.text;
    NSString *organizeId = self.organizeTF.text;
    NSString *skills = self.skillsView.text;
    if (username.length > 0 && self.sex.length > 0 && self.birthday.length > 0 && organizeId.length > 0 && skills.length > 0) {
        [self upLoadImage];
    } else if (username.length == 0) {
        [STTextHudTool showText:@"请填写用户名"];
    } else if (self.sex.length == 0) {
        [STTextHudTool showText:@"请选择性别"];
    } else if (self.birthday.length == 0) {
        [STTextHudTool showText:@"请选择出生日期"];
    } else if (organizeId.length == 0) {
        [STTextHudTool showText:@"请填写组织机构ID"];
    } else if (skills.length == 0) {
        [STTextHudTool showText:@"请填写擅长治疗病症"];
    }
}

- (void)regist:(NSMutableDictionary *)parameter {
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_REGISTER_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSInteger code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        if (code == 0) {
            [self dismiss];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"HideRegistViewNotification" object:nil];
        } else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
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

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        self.placeholderLbl.hidden = YES;
    } else {
        self.placeholderLbl.hidden = NO;
    }
}

#pragma mark - XXTGDropdownMenuDelegate

- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string
{
    if (menu == self.sexMenu) {
        if ([string isEqualToString:@"男"]) {
            self.sex = @"1";
        } else {
            self.sex = @"2";
        }
    }
}

- (void)dropdownMenu:(KTDropDownMenus *)menu mainBtnClick:(UIButton *)sender {
    
}

#pragma mark - WHC_ChoicePictureVCDelegate
- (void)WHCChoicePictureVC:(WHC_ChoicePictureVC *)choicePictureVC didSelectedPhotoArr:(NSArray *)photoArr{
    NSLog(@"photoArr:%@",photoArr);
    if (photoArr.count > 0) {
        UIImage *image = photoArr[0];
        self.headImg.image = image;
        self.selectedImg = image;
    }
}

#pragma mark - WHC_CameraVCDelegate
- (void)WHCCameraVC:(WHC_CameraVC *)cameraVC didSelectedPhoto:(UIImage *)photo{
    if (photo) {
        self.headImg.image = photo;
        self.selectedImg = photo;
    }
    [self WHCChoicePictureVC:nil didSelectedPhotoArr:@[photo]];
}

- (void)upLoadImage {
    UIImage *image = self.selectedImg;
    if (image != nil) {
        NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Portrait.jpg"];
        BOOL success = [UIImageJPEGRepresentation(image, 0.5) writeToFile:jpgPath atomically:YES]; //其中0.5表示压缩比例，1表示不压缩，数值越小压缩比例越大
        if (success) {
            NSLog(@"写入本地成功");
            NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
            [parameter setObject:jpgPath forKey:@"file"];
            [self uploadPhoto:parameter];
        }
    } else {
        [self dismiss];
    }
}

//上传头像
- (void)uploadPhoto:(NSMutableDictionary*)parameter {
    [STTextHudTool loading];
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kUPLOAD_IMAGE_URL] andParams:parameter andProgress:^(NSProgress *progress) {
        
    } andSucceed:^(NSDictionary *responseObject) {
        [STTextHudTool loading];
        long code = [[responseObject valueForKey:@"code"] longValue];
        NSString *msg = [responseObject valueForKey:@"msg"];
        NSLog(@"msg is :%@",msg);
        NSLog(@"responseObject is:%@",responseObject);
        if (code == 0) {
            NSDictionary *dataDict = [responseObject valueForKey:@"data"];
            NSString *url = [dataDict valueForKey:@"url"];
            NSLog(@"image url is :%@",url);
            NSLog(@"上传成功");
            NSString *smsCode = [self.basicinfo valueForKey:@"smsCode"];
            NSString *mobile = [self.basicinfo valueForKey:@"mobile"];
            NSString *password = [self.basicinfo valueForKey:@"password"];
            NSMutableDictionary *para = [NSMutableDictionary dictionary];
            [para setValue:self.organizeTF.text forKey:@"orgCode"];
            [para setValue:smsCode forKey:@"smsCode"];
            [para setValue:mobile forKey:@"mobile"];
            [para setValue:password forKey:@"password"];
            [para setValue:self.usernameTF.text forKey:@"name"];
            [para setValue:self.sex forKey:@"sex"];
            [para setValue:self.birthday forKey:@"birthdate"];
            [para setValue:url forKey:@"headUrl"];
            [para setValue:self.skillsView.text forKey:@"speciality"];
            [para setValue:@"" forKey:@"openid"];
            [self regist:para];
        }  else {
            [STTextHudTool showText:msg];
        }
    } andFaild:^(NSError *error) {
        [STTextHudTool hideSTHud];
        NSLog(@"error :%@",error);
    }];
}
@end
