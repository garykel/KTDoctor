//
//  PatientCell4.m
//  KTDoctor
//
//  Created by duwei on 2019/3/28.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientCell4.h"

#define kBigLbl_Height 25
#define kNameLbl_FontSize 23.0
#define KNameLbl_Width 130
#define kIdLbl_LeftMargin 19
#define kHeadImage_TopMargin 35
#define kHeadImage_LeftMargin 25
#define kHeadImage_Width 75
#define kHeartImage_Width 95
#define kHeartImage_BottomMargin 50
#define kCurrentHRLbl_FontSize 14.0
#define KCurrentHRLbl_Width 65
#define kCurrentHRLbl_Height 14
#define kTimeImage_RightMargin 18
#define kTimeImage_Width 18
#define kTimeLbl_Width 65
#define kTimeLbl_RightMargin 25
#define kAvgHRLbl_TopMargin 140
#define kAvgHRLbl_LeftMargin 30
#define kLeftLbl_Width 100
#define kLeftLbl_BottomMargin 20
#define kLeftValueLbl_LeftMargin 30
#define kValueLbl_Width 75
#define kUnitLbl_Width 65

@interface PatientCell4 ()

@end

@implementation PatientCell4

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    self.bgImg = [[UIImageView alloc] init];
    self.bgImg.layer.cornerRadius = 8;
    self.bgImg.image = [UIImage imageNamed:@"bg_gray"];
    self.layer.masksToBounds =  YES;
    self.bgImg.userInteractionEnabled = YES;
    [self.contentView addSubview:self.bgImg];
    
    self.headImg = [[UIImageView alloc] init];
    self.headImg.layer.cornerRadius = kHeadImage_Width * kXScal / 2.0;
    self.headImg.layer.masksToBounds = YES;
    [self.bgImg addSubview:self.headImg];
    
    self.nameLbl = [[UILabel alloc] init];
    self.nameLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.nameLbl.textColor = [UIColor whiteColor];
    [self.bgImg addSubview:self.nameLbl];
    
    self.idLbl = [[UILabel alloc] init];
    self.idLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.idLbl.textColor = [UIColor whiteColor];
    [self.bgImg addSubview:self.idLbl];
    
    self.heartImg = [[UIImageView alloc] init];
    self.heartImg.image = [UIImage imageNamed:@"heart_blue"];
    [self.bgImg addSubview:self.heartImg];
    
    self.currentHrLbl = [[UILabel alloc] init];
    self.currentHrLbl.font = [UIFont systemFontOfSize:kCurrentHRLbl_FontSize * kYScal];
    self.currentHrLbl.textAlignment = NSTextAlignmentCenter;
    self.currentHrLbl.textColor = [UIColor blackColor];
    [self.bgImg addSubview:self.currentHrLbl];
    
    self.avgHRLbl = [[UILabel alloc] init];
    self.avgHRLbl.text = @"平均心率";
    self.avgHRLbl.textColor = [UIColor whiteColor];
    self.avgHRLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.bgImg addSubview:self.avgHRLbl];
    
    self.avgHRValueLbl = [[UILabel alloc] init];
    self.avgHRValueLbl.textColor = [UIColor whiteColor];
    self.avgHRValueLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.avgHRValueLbl.textAlignment = NSTextAlignmentRight;
    [self.bgImg addSubview:self.avgHRValueLbl];
    
    self.avgHRUnitLbl = [[UILabel alloc] init];
    self.avgHRUnitLbl.textAlignment = NSTextAlignmentRight;
    self.avgHRUnitLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.avgHRUnitLbl.textColor = [UIColor whiteColor];
    self.avgHRUnitLbl.text = @"bpm";
    [self.bgImg addSubview:self.avgHRUnitLbl];
    
    self.maxHRLbl = [[UILabel alloc] init];
    self.maxHRLbl.text = @"最大心率";
    self.maxHRLbl.textColor = [UIColor whiteColor];
    self.maxHRLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.bgImg addSubview:self.maxHRLbl];
    
    self.maxHRValueLbl = [[UILabel alloc] init];
    self.maxHRValueLbl.textColor = [UIColor whiteColor];
    self.maxHRValueLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.maxHRValueLbl.textAlignment = NSTextAlignmentRight;
    [self.bgImg addSubview:self.maxHRValueLbl];
    
    self.maxHRUnitLbl = [[UILabel alloc] init];
    self.maxHRUnitLbl.textAlignment = NSTextAlignmentRight;
    self.maxHRUnitLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.maxHRUnitLbl.textColor = [UIColor whiteColor];
    self.maxHRUnitLbl.text = @"bpm";
    [self.bgImg addSubview:self.maxHRUnitLbl];
    
    self.speedLbl = [[UILabel alloc] init];
    self.speedLbl.text = @"速         度";
    self.speedLbl.textColor = [UIColor whiteColor];
    self.speedLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.bgImg addSubview:self.speedLbl];
    
    self.speedValueLbl = [[UILabel alloc] init];
    self.speedValueLbl.textColor = [UIColor whiteColor];
    self.speedValueLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.speedValueLbl.textAlignment = NSTextAlignmentRight;
    [self.bgImg addSubview:self.speedValueLbl];
    
    self.speedUnitLbl = [[UILabel alloc] init];
    self.speedUnitLbl.textAlignment = NSTextAlignmentRight;
    self.speedUnitLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.speedUnitLbl.textColor = [UIColor whiteColor];
    self.speedUnitLbl.text = @"km/h";
    [self.bgImg addSubview:self.speedUnitLbl];
    
    self.intensionLbl = [[UILabel alloc] init];
    self.intensionLbl.text = @"强         度";
    self.intensionLbl.textColor = [UIColor whiteColor];
    self.intensionLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.bgImg addSubview:self.intensionLbl];
    
    self.intensionValueLbl = [[UILabel alloc] init];
    self.intensionValueLbl.textColor = [UIColor whiteColor];
    self.intensionValueLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.intensionValueLbl.textAlignment = NSTextAlignmentRight;
    [self.bgImg addSubview:self.intensionValueLbl];
    
    self.timeImg = [[UIImageView alloc] init];
    self.timeImg.image = [UIImage imageNamed:@"time"];
    [self.bgImg addSubview:self.timeImg];
    
    self.timeLbl = [[UILabel alloc] init];
    self.timeLbl.textColor = [UIColor whiteColor];
    self.timeLbl.text = @"00:00";
    self.timeLbl.textAlignment = NSTextAlignmentRight;
    self.timeLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.bgImg addSubview:self.timeLbl];
    [self setupAutoLayout];
}

- (void)setupAutoLayout {
    [self.bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
    }];
    
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgImg.mas_top).offset(kHeadImage_TopMargin * kYScal);
        make.left.equalTo(self.bgImg.mas_left).offset(kHeadImage_LeftMargin * kXScal);
        make.width.height.equalTo(@(kHeadImage_Width * kXScal));
    }];
    
    [self.nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImg.mas_centerY);
        make.left.equalTo(self.headImg.mas_right).offset(kIdLbl_LeftMargin * kXScal);
        make.width.equalTo(@(KNameLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.idLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headImg.mas_bottom).offset(0);
        make.left.equalTo(self.nameLbl.mas_left);
        make.width.equalTo(@(KNameLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.heartImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgImg.mas_bottom).offset(-kHeartImage_BottomMargin * kYScal);
        make.left.equalTo(self.headImg.mas_left);
        make.width.height.equalTo(@(kHeartImage_Width * kXScal));
    }];
    
    [self.currentHrLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.heartImg.mas_centerY).offset(-kCurrentHRLbl_Height * kYScal/2);
        make.centerX.equalTo(self.heartImg.mas_centerX);
        make.width.equalTo(@(KCurrentHRLbl_Width * kXScal));
        make.height.equalTo(@(kCurrentHRLbl_Height * kYScal));
    }];
    
    [self.timeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.idLbl.mas_centerY);
        make.right.equalTo(self.bgImg.mas_right).offset(- kTimeLbl_RightMargin * kXScal);
        make.width.equalTo(@(kTimeLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.timeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLbl.mas_centerY);
        //        make.right.equalTo(self.bgImg.mas_right).offset(-kTimeImage_RightMargin * kXScal);
        make.centerX.equalTo(self.timeLbl.mas_centerX).offset(kTimeImage_Width * kXScal / 2.0);
        make.width.height.equalTo(@(kTimeImage_Width * kXScal));
    }];
    
    [self.avgHRLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgImg.mas_top).offset(kAvgHRLbl_TopMargin * kYScal);
        make.left.equalTo(self.heartImg.mas_right).offset(kAvgHRLbl_LeftMargin * kXScal);
        make.width.equalTo(@(kLeftLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.avgHRValueLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avgHRLbl.mas_top);
        make.left.equalTo(self.avgHRLbl.mas_right).offset(kLeftValueLbl_LeftMargin * kXScal);
        make.width.equalTo(@(kValueLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.avgHRUnitLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avgHRLbl.mas_top);
        make.right.equalTo(self.timeLbl.mas_right);
        make.width.equalTo(@(kUnitLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.maxHRLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avgHRLbl.mas_bottom).offset(kLeftLbl_BottomMargin * kYScal);
        make.left.equalTo(self.avgHRLbl.mas_left);
        make.width.equalTo(@(kLeftLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.maxHRValueLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.maxHRLbl.mas_top);
        make.left.equalTo(self.avgHRValueLbl.mas_left);
        make.width.equalTo(@(kValueLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.maxHRUnitLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.maxHRLbl.mas_top);
        make.right.equalTo(self.timeLbl.mas_right);
        make.width.equalTo(@(kUnitLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.speedLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.maxHRLbl.mas_bottom).offset(kLeftLbl_BottomMargin * kYScal);
        make.left.equalTo(self.avgHRLbl.mas_left);
        make.width.equalTo(@(kLeftLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.speedValueLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.speedLbl.mas_top);
        make.left.equalTo(self.avgHRValueLbl.mas_left);
        make.width.equalTo(@(kValueLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.speedUnitLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.speedLbl.mas_top);
        make.right.equalTo(self.timeLbl.mas_right);
        make.width.equalTo(@(kUnitLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.intensionLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.speedLbl.mas_bottom).offset(kLeftLbl_BottomMargin * kYScal);
        make.left.equalTo(self.avgHRLbl.mas_left);
        make.width.equalTo(@(kLeftLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.intensionValueLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.intensionLbl.mas_top);
        make.left.equalTo(self.avgHRValueLbl.mas_left);
        make.width.equalTo(@(kValueLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
}

@end
