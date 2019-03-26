//
//  PatientCell.m
//  KTDoctor
//
//  Created by duwei on 2019/3/26.
//  Copyright © 2019 dz. All rights reserved.
//

#define kRightButton_Width 40
#define kRightButton_RightMargin 15
#define kFunctionButton_TopMargin 10
#define kFunctionButton_LeftMargin 20
#define kFunctionButton_Height 40
#define kRemoveBtn_LeftMargin 30
#define kRightButton_Width 35
#define kSeperateLine_Width 1

#import "PatientCell.h"

@implementation PatientCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.hrDeviceIdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.hrDeviceIdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.hrDeviceIdBtn.titleLabel setFont:[UIFont systemFontOfSize:18.0]];
    CGFloat width = (self.contentView.frame.size.width - kRemoveBtn_LeftMargin - kRightButton_Width - kRightButton_RightMargin - 3 * kSeperateLine_Width)/4;
//    self.hrDeviceIdBtn.frame = CGRectMake(0, 0, width, kFunctionButton_Height);
    [self.contentView addSubview:self.hrDeviceIdBtn];
    
    self.seperateLine1 = [[UIView alloc] init];
    self.seperateLine1.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.contentView addSubview:self.seperateLine1];
    
    self.deviceIdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.deviceIdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.deviceIdBtn.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
//    self.deviceIdBtn.frame = CGRectMake(CGRectGetMaxX(self.seperateLine1.frame), 0, width, kFunctionButton_Height);
    [self.contentView addSubview:self.deviceIdBtn];
    
    self.seperateLine2 = [[UIView alloc] init];
    self.seperateLine2.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.contentView addSubview:self.seperateLine2];
    
    self.nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.nameBtn.titleLabel setFont:[UIFont systemFontOfSize:18.0]];
//    self.nameBtn.frame = CGRectMake(CGRectGetMaxX(self.seperateLine2.frame), 0, width, kFunctionButton_Height);
    [self.contentView addSubview:self.nameBtn];
    
    self.seperateLine3 = [[UIView alloc] init];
    self.seperateLine3.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.contentView addSubview:self.seperateLine3];
    
    self.idBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.idBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.idBtn.titleLabel setFont:[UIFont systemFontOfSize:18.0]];
//    self.idBtn.frame = CGRectMake(CGRectGetMaxX(self.seperateLine3.frame), 0, width, kFunctionButton_Height);
    [self.contentView addSubview:self.idBtn];
    [self setupAutoLayout];
}

- (void)setupAutoLayout {
    CGFloat width = (self.contentView.frame.size.width)/4;
    [self.hrDeviceIdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.width.equalTo(@(width));
        make.height.equalTo(@(kFunctionButton_Height));
    }];
    
    [self.seperateLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.hrDeviceIdBtn.mas_right).offset(0);
        make.width.equalTo(@(kSeperateLine_Width));
        make.height.equalTo(@(kFunctionButton_Height));
    }];
    
    [self.deviceIdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.seperateLine1.mas_left).offset(0);
        make.width.equalTo(@(width));
        make.height.equalTo(@(kFunctionButton_Height));
    }];
    
    [self.seperateLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.deviceIdBtn.mas_right).offset(0);
        make.width.equalTo(@(kSeperateLine_Width));
        make.height.equalTo(@(kFunctionButton_Height));
    }];
    
    [self.nameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.seperateLine2.mas_right).offset(0);
        make.width.equalTo(@(width));
        make.height.equalTo(@(kFunctionButton_Height));
    }];
    
    [self.seperateLine3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.nameBtn.mas_right).offset(0);
        make.width.equalTo(@(kSeperateLine_Width));
        make.height.equalTo(@(kFunctionButton_Height));
    }];
    
    [self.nameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.seperateLine3.mas_right).offset(0);
        make.width.equalTo(@(width));
        make.height.equalTo(@(kFunctionButton_Height));
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
