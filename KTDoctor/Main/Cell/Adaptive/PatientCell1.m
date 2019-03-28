//
//  PatientCell1.m
//  KTDoctor
//
//  Created by duwei on 2019/3/28.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientCell1.h"

@interface PatientCell1 ()
@property (nonatomic,strong)UIView *innerContentView;
@end


@implementation PatientCell1

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    self.contentView.backgroundColor = [UIColor clearColor];
    self.layer.borderColor = [UIColor greenColor].CGColor;
    self.layer.borderWidth = 1.0;
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
    
    self.innerContentView = [[UIView alloc] init];
    self.innerContentView.layer.cornerRadius = 4;
    self.innerContentView.backgroundColor = [UIColor blueColor];
    self.layer.masksToBounds =  YES;
    [self.contentView addSubview:self.innerContentView];
    
    self.headImg = [[UIImageView alloc] init];
    self.headImg.layer.cornerRadius = 40;
    self.headImg.layer.masksToBounds = YES;
    [self.innerContentView addSubview:self.headImg];
    
    self.nameLbl = [[UILabel alloc] init];
    self.nameLbl.font = [UIFont systemFontOfSize:20.0];
    self.nameLbl.textColor = [UIColor blackColor];
    [self.innerContentView addSubview:self.nameLbl];
    
    self.idLbl = [[UILabel alloc] init];
    self.idLbl.font = [UIFont systemFontOfSize:16.0];
    self.idLbl.textColor = [UIColor blackColor];
    [self.innerContentView addSubview:self.idLbl];
    
    self.heartImg = [[UIImageView alloc] init];
    self.heartImg.image = [UIImage imageNamed:@"heart_blue"];
    [self.innerContentView addSubview:self.heartImg];
    
    self.currentHrLbl = [[UILabel alloc] init];
    self.currentHrLbl.font = [UIFont systemFontOfSize:14.0];
    self.currentHrLbl.textAlignment = NSTextAlignmentCenter;
    self.currentHrLbl.textColor = [UIColor blackColor];
    [self.innerContentView addSubview:self.currentHrLbl];
    
    self.avgHRLbl = [[UILabel alloc] init];
    self.avgHRLbl.text = @"平均心率";
    self.avgHRLbl.textColor = [UIColor blackColor];
    self.avgHRLbl.font = [UIFont systemFontOfSize:20.0];
    [self.innerContentView addSubview:self.avgHRLbl];
    
    self.avgHRValueLbl = [[UILabel alloc] init];
    self.avgHRValueLbl.textColor = [UIColor blackColor];
    self.avgHRValueLbl.font = [UIFont systemFontOfSize:20.0];
    self.avgHRValueLbl.textAlignment = NSTextAlignmentRight;
    [self.innerContentView addSubview:self.avgHRValueLbl];
    
    self.avgHRUnitLbl = [[UILabel alloc] init];
    self.avgHRUnitLbl.textAlignment = NSTextAlignmentRight;
    self.avgHRUnitLbl.font = [UIFont systemFontOfSize:16.0];
    self.avgHRUnitLbl.textColor = [UIColor blackColor];
    self.avgHRUnitLbl.text = @"bpm";
    [self.innerContentView addSubview:self.avgHRUnitLbl];
    
    self.maxHRLbl = [[UILabel alloc] init];
    self.maxHRLbl.text = @"最大心率";
    self.maxHRLbl.textColor = [UIColor blackColor];
    self.maxHRLbl.font = [UIFont systemFontOfSize:20.0];
    [self.innerContentView addSubview:self.maxHRLbl];
    
    self.maxHRValueLbl = [[UILabel alloc] init];
    self.maxHRValueLbl.textColor = [UIColor blackColor];
    self.maxHRValueLbl.font = [UIFont systemFontOfSize:20.0];
    self.maxHRValueLbl.textAlignment = NSTextAlignmentRight;
    [self.innerContentView addSubview:self.maxHRValueLbl];
    
    self.maxHRUnitLbl = [[UILabel alloc] init];
    self.maxHRUnitLbl.textAlignment = NSTextAlignmentRight;
    self.maxHRUnitLbl.font = [UIFont systemFontOfSize:16.0];
    self.maxHRUnitLbl.textColor = [UIColor blackColor];
    self.maxHRUnitLbl.text = @"bpm";
    [self.innerContentView addSubview:self.maxHRUnitLbl];
    
    self.speedLbl = [[UILabel alloc] init];
    self.speedLbl.text = @"速      度";
    self.speedLbl.textColor = [UIColor blackColor];
    self.speedLbl.font = [UIFont systemFontOfSize:20.0];
    [self.innerContentView addSubview:self.speedLbl];
    
    self.speedValueLbl = [[UILabel alloc] init];
    self.speedValueLbl.textColor = [UIColor blackColor];
    self.speedValueLbl.font = [UIFont systemFontOfSize:20.0];
    self.speedValueLbl.textAlignment = NSTextAlignmentRight;
    [self.innerContentView addSubview:self.speedValueLbl];
    
    self.speedUnitLbl = [[UILabel alloc] init];
    self.speedUnitLbl.textAlignment = NSTextAlignmentRight;
    self.speedUnitLbl.font = [UIFont systemFontOfSize:16.0];
    self.speedUnitLbl.textColor = [UIColor blackColor];
    self.speedUnitLbl.text = @"km/h";
    [self.innerContentView addSubview:self.speedUnitLbl];
    
    self.intensionLbl = [[UILabel alloc] init];
    self.intensionLbl.text = @"强      度";
    self.intensionLbl.textColor = [UIColor blackColor];
    self.intensionLbl.font = [UIFont systemFontOfSize:20.0];
    [self.innerContentView addSubview:self.intensionLbl];
    
    self.intensionValueLbl = [[UILabel alloc] init];
    self.intensionValueLbl.textColor = [UIColor blackColor];
    self.intensionValueLbl.font = [UIFont systemFontOfSize:20.0];
    self.intensionValueLbl.textAlignment = NSTextAlignmentRight;
    [self.innerContentView addSubview:self.intensionValueLbl];
    
    self.timeImg = [[UIImageView alloc] init];
    self.timeImg.image = [UIImage imageNamed:@"time"];
    [self.innerContentView addSubview:self.timeImg];
    
    self.timeLbl = [[UILabel alloc] init];
    self.timeLbl.textColor = [UIColor blackColor];
    self.timeLbl.text = @"00:00";
    self.timeLbl.textAlignment = NSTextAlignmentRight;
    self.timeLbl.font = [UIFont systemFontOfSize:16.0];
    [self.innerContentView addSubview:self.timeLbl];
    [self setupAutoLayout];
}

- (void)setupAutoLayout {
    [self.innerContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.innerContentView.mas_top).offset(20);
        make.left.equalTo(self.innerContentView.mas_left).offset(10);
        make.width.height.equalTo(@80);
    }];

    [self.nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImg.mas_centerY);
        make.left.equalTo(self.headImg.mas_right).offset(5);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    
    [self.idLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headImg.mas_bottom).offset(0);
        make.left.equalTo(self.nameLbl.mas_left);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
    
    [self.heartImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.innerContentView.mas_bottom).offset(-50);
        make.left.equalTo(self.headImg.mas_left);
        make.width.height.equalTo(@(80));
    }];
    
    [self.currentHrLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.heartImg.mas_centerY).offset(-20/2);
        make.centerX.equalTo(self.heartImg.mas_centerX);
        make.width.equalTo(@(80));
        make.height.equalTo(@20);
    }];
    
    [self.timeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.innerContentView.mas_top).offset(100);
        make.right.equalTo(self.innerContentView.mas_right).offset(-10);
        make.width.height.equalTo(@30);
    }];
    
    [self.timeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeImg.mas_bottom).offset(5);
        make.right.equalTo(self.innerContentView.mas_right).offset(0);
        make.width.equalTo(@100);
        make.height.equalTo(@20);
    }];
    
    [self.avgHRLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.innerContentView.mas_top).offset(150);
        make.left.equalTo(self.heartImg.mas_right).offset(100);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    
    [self.avgHRValueLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avgHRLbl.mas_top);
        make.left.equalTo(self.avgHRLbl.mas_right).offset(100);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
    
    [self.avgHRUnitLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avgHRLbl.mas_top);
        make.right.equalTo(self.innerContentView.mas_right).offset(0);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
    
    [self.maxHRLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avgHRLbl.mas_bottom).offset(50);
        make.left.equalTo(self.avgHRLbl.mas_left);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    
    [self.maxHRValueLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.maxHRLbl.mas_top);
        make.left.equalTo(self.maxHRLbl.mas_right).offset(100);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
    
    [self.maxHRUnitLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.maxHRLbl.mas_top);
        make.right.equalTo(self.innerContentView.mas_right).offset(0);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
    
    [self.speedLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.maxHRLbl.mas_bottom).offset(50);
        make.left.equalTo(self.avgHRLbl.mas_left);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    
    [self.speedValueLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.speedLbl.mas_top);
        make.left.equalTo(self.speedLbl.mas_right).offset(100);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
    
    [self.speedUnitLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.speedLbl.mas_top);
        make.right.equalTo(self.innerContentView.mas_right).offset(0);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
    
    [self.intensionLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.speedLbl.mas_bottom).offset(50);
        make.left.equalTo(self.avgHRLbl.mas_left);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    
    [self.intensionValueLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.intensionLbl.mas_top);
        make.left.equalTo(self.intensionLbl.mas_right).offset(100);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
}

@end
