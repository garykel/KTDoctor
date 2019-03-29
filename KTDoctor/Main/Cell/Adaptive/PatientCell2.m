//
//  PatientCell2.m
//  KTDoctor
//
//  Created by duwei on 2019/3/28.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientCell2.h"

#define kInnerContentView_TopMargin 10
#define kInnerContentView_LeftMargin 10
#define kInnerContentView_RightMargin 10
#define kInnerContentView_BottomMargin 10
#define kBigLbl_Height 30
#define kNameLbl_FontSize 20.0
#define KNameLbl_Width 100
#define kIdLbl_LeftMargin 10
#define kIdLbl_FontSize 16.0
#define kCurrentHRLbl_FontSize 14.0
#define kHeadImage_TopMargin 20
#define kHeadImage_LeftMargin 15
#define kHeadImage_Width 80
#define KCurrentHRLbl_Width 80
#define kCurrentHRLbl_Height 20
#define kTimeImage_TopMargin 80
#define kTimeImage_RightMargin 10
#define kTimeImage_Width 30
#define kTimeLbl_TopMargin 5
#define kTimeLbl_Width 100
#define kAvgHRLbl_TopMargin 150
#define kAvgHRLbl_LeftMargin 100
#define kLeftLbl_Width 100
#define kLeftLbl_BottomMargin 50
#define kLeftValueLbl_LeftMargin 100
#define kValueLbl_Width 80
#define kUnitLbl_Width 80
#define kHeartImage_BottomMargin 50

@interface PatientCell2 ()
@property (nonatomic,strong)UIView *innerContentView;
@end

@implementation PatientCell2
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    self.contentView.backgroundColor = [UIColor clearColor];
    self.contentView.layer.borderColor = [UIColor greenColor].CGColor;
    self.contentView.layer.borderWidth = 1.0;
    self.contentView.layer.cornerRadius = 8;
    self.contentView.layer.masksToBounds = YES;
    
    self.innerContentView = [[UIView alloc] init];
    self.innerContentView.layer.cornerRadius = 4;
    self.innerContentView.backgroundColor = [UIColor blueColor];
    self.layer.masksToBounds =  YES;
    [self.contentView addSubview:self.innerContentView];
    
    self.headImg = [[UIImageView alloc] init];
    self.headImg.layer.cornerRadius = kHeadImage_Width * kXScal / 2.0;
    self.headImg.layer.masksToBounds = YES;
    [self.innerContentView addSubview:self.headImg];
    
    self.nameLbl = [[UILabel alloc] init];
    self.nameLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.nameLbl.textColor = [UIColor blackColor];
    [self.innerContentView addSubview:self.nameLbl];
    
    self.idLbl = [[UILabel alloc] init];
    self.idLbl.font = [UIFont systemFontOfSize:kIdLbl_FontSize * kYScal];
    self.idLbl.textColor = [UIColor blackColor];
    [self.innerContentView addSubview:self.idLbl];
    
    self.heartImg = [[UIImageView alloc] init];
    self.heartImg.image = [UIImage imageNamed:@"heart_blue"];
    [self.innerContentView addSubview:self.heartImg];
    
    self.currentHrLbl = [[UILabel alloc] init];
    self.currentHrLbl.font = [UIFont systemFontOfSize:kCurrentHRLbl_FontSize * kYScal];
    self.currentHrLbl.textAlignment = NSTextAlignmentCenter;
    self.currentHrLbl.textColor = [UIColor blackColor];
    [self.innerContentView addSubview:self.currentHrLbl];
    
    self.avgHRLbl = [[UILabel alloc] init];
    self.avgHRLbl.text = @"平均心率";
    self.avgHRLbl.textColor = [UIColor blackColor];
    self.avgHRLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.innerContentView addSubview:self.avgHRLbl];
    
    self.avgHRValueLbl = [[UILabel alloc] init];
    self.avgHRValueLbl.textColor = [UIColor blackColor];
    self.avgHRValueLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.avgHRValueLbl.textAlignment = NSTextAlignmentRight;
    [self.innerContentView addSubview:self.avgHRValueLbl];
    
    self.avgHRUnitLbl = [[UILabel alloc] init];
    self.avgHRUnitLbl.textAlignment = NSTextAlignmentRight;
    self.avgHRUnitLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.avgHRUnitLbl.textColor = [UIColor blackColor];
    self.avgHRUnitLbl.text = @"bpm";
    [self.innerContentView addSubview:self.avgHRUnitLbl];
    
    self.maxHRLbl = [[UILabel alloc] init];
    self.maxHRLbl.text = @"最大心率";
    self.maxHRLbl.textColor = [UIColor blackColor];
    self.maxHRLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.innerContentView addSubview:self.maxHRLbl];
    
    self.maxHRValueLbl = [[UILabel alloc] init];
    self.maxHRValueLbl.textColor = [UIColor blackColor];
    self.maxHRValueLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.maxHRValueLbl.textAlignment = NSTextAlignmentRight;
    [self.innerContentView addSubview:self.maxHRValueLbl];
    
    self.maxHRUnitLbl = [[UILabel alloc] init];
    self.maxHRUnitLbl.textAlignment = NSTextAlignmentRight;
    self.maxHRUnitLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.maxHRUnitLbl.textColor = [UIColor blackColor];
    self.maxHRUnitLbl.text = @"bpm";
    [self.innerContentView addSubview:self.maxHRUnitLbl];
    
    self.speedLbl = [[UILabel alloc] init];
    self.speedLbl.text = @"速       度";
    self.speedLbl.textColor = [UIColor blackColor];
    self.speedLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.innerContentView addSubview:self.speedLbl];
    
    self.speedValueLbl = [[UILabel alloc] init];
    self.speedValueLbl.textColor = [UIColor blackColor];
    self.speedValueLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.speedValueLbl.textAlignment = NSTextAlignmentRight;
    [self.innerContentView addSubview:self.speedValueLbl];
    
    self.speedUnitLbl = [[UILabel alloc] init];
    self.speedUnitLbl.textAlignment = NSTextAlignmentRight;
    self.speedUnitLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.speedUnitLbl.textColor = [UIColor blackColor];
    self.speedUnitLbl.text = @"km/h";
    [self.innerContentView addSubview:self.speedUnitLbl];
    
    self.intensionLbl = [[UILabel alloc] init];
    self.intensionLbl.text = @"强       度";
    self.intensionLbl.textColor = [UIColor blackColor];
    self.intensionLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.innerContentView addSubview:self.intensionLbl];
    
    self.intensionValueLbl = [[UILabel alloc] init];
    self.intensionValueLbl.textColor = [UIColor blackColor];
    self.intensionValueLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    self.intensionValueLbl.textAlignment = NSTextAlignmentRight;
    [self.innerContentView addSubview:self.intensionValueLbl];
    
    self.timeImg = [[UIImageView alloc] init];
    self.timeImg.image = [UIImage imageNamed:@"time"];
    [self.innerContentView addSubview:self.timeImg];
    
    self.timeLbl = [[UILabel alloc] init];
    self.timeLbl.textColor = [UIColor blackColor];
    self.timeLbl.text = @"00:00";
    self.timeLbl.textAlignment = NSTextAlignmentRight;
    self.timeLbl.font = [UIFont systemFontOfSize:kNameLbl_FontSize * kYScal];
    [self.innerContentView addSubview:self.timeLbl];
    [self setupAutoLayout];
}

- (void)setupAutoLayout {
    [self.innerContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(kInnerContentView_TopMargin);
        make.left.equalTo(self.contentView.mas_left).offset(kInnerContentView_LeftMargin);
        make.right.equalTo(self.contentView.mas_right).offset(-kInnerContentView_RightMargin);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-kInnerContentView_BottomMargin);
    }];
    
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.innerContentView.mas_top).offset(kHeadImage_TopMargin * kYScal);
        make.left.equalTo(self.innerContentView.mas_left).offset(kHeadImage_LeftMargin * kXScal);
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
        make.bottom.equalTo(self.innerContentView.mas_bottom).offset(-kHeartImage_BottomMargin * kYScal);
        make.left.equalTo(self.headImg.mas_left);
        make.width.height.equalTo(@(kHeadImage_Width * kXScal));
    }];
    
    [self.currentHrLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.heartImg.mas_centerY).offset(-kCurrentHRLbl_Height * kYScal/2);
        make.centerX.equalTo(self.heartImg.mas_centerX);
        make.width.equalTo(@(KCurrentHRLbl_Width * kXScal));
        make.height.equalTo(@(kCurrentHRLbl_Height * kYScal));
    }];
    
    [self.timeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.innerContentView.mas_top).offset(kTimeImage_TopMargin * kYScal);
        make.right.equalTo(self.innerContentView.mas_right).offset(-kTimeImage_RightMargin * kXScal);
        make.width.height.equalTo(@(kTimeImage_Width * kXScal));
    }];
    
    [self.timeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeImg.mas_bottom).offset(kTimeLbl_TopMargin * kYScal);
        make.right.equalTo(self.innerContentView.mas_right).offset(0);
        make.width.equalTo(@(kTimeLbl_Width * kXScal));
        make.height.equalTo(@(kBigLbl_Height * kYScal));
    }];
    
    [self.avgHRLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.innerContentView.mas_top).offset(kAvgHRLbl_TopMargin * kYScal);
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
        make.right.equalTo(self.innerContentView.mas_right).offset(0);
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
        make.right.equalTo(self.innerContentView.mas_right).offset(0);
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
        make.right.equalTo(self.innerContentView.mas_right).offset(0);
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

