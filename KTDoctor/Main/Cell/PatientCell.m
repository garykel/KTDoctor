//
//  PatientCell.m
//  KTDoctor
//
//  Created by duwei on 2019/3/26.
//  Copyright © 2019 dz. All rights reserved.
//
#define kAlertView_LeftMargin 200
#define kRightButton_RightMargin 15
#define kFunctionButton_TopMargin 10
#define kFunctionButton_LeftMargin 20
#define kFunctionButton_Height 40
#define kRemoveBtn_LeftMargin 30
#define kRemoveBtn_Width 20
#define kRemoveBtn_RightMargin 15
#define kRightButton_Width 30
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

- (void)setFrame:(CGRect)frame {
    frame.size.width = kWidth - 2 * kAlertView_LeftMargin;
    [super setFrame:frame];
}

- (void)setUI {
    self.contentView.backgroundColor = [UIColor clearColor];
    CGFloat width = (self.contentView.frame.size.width - kRemoveBtn_LeftMargin - kRightButton_Width - kRightButton_RightMargin - 3 * kSeperateLine_Width)/4;
    self.hrDeviceIdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.hrDeviceIdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.hrDeviceIdBtn.titleLabel setFont:[UIFont systemFontOfSize:18.0]];
    self.hrDeviceIdBtn.frame = CGRectMake(0, 0, width, kFunctionButton_Height);
    self.hrDeviceIdBtn.layer.borderColor = [UIColor colorWithHexString:@"#f39795"].CGColor;
    self.hrDeviceIdBtn.layer.borderWidth = 1;
    [self.contentView addSubview:self.hrDeviceIdBtn];
    
    self.deviceIdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.deviceIdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.deviceIdBtn.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    self.deviceIdBtn.layer.borderColor = [UIColor colorWithHexString:@"#f39795"].CGColor;
    self.deviceIdBtn.layer.borderWidth = 1;
    self.deviceIdBtn.frame = CGRectMake(CGRectGetMaxX(self.hrDeviceIdBtn.frame), 0, width, kFunctionButton_Height);
    [self.contentView addSubview:self.deviceIdBtn];
    
    self.nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.nameBtn.titleLabel setFont:[UIFont systemFontOfSize:18.0]];
    self.nameBtn.layer.borderColor = [UIColor colorWithHexString:@"#f39795"].CGColor;
    self.nameBtn.layer.borderWidth = 1;
    self.nameBtn.frame = CGRectMake(CGRectGetMaxX(self.deviceIdBtn.frame), 0, width, kFunctionButton_Height);
    [self.contentView addSubview:self.nameBtn];
    
    self.idBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.idBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.idBtn.titleLabel setFont:[UIFont systemFontOfSize:18.0]];
    self.idBtn.layer.borderColor = [UIColor colorWithHexString:@"#f39795"].CGColor;
    self.idBtn.layer.borderWidth = 1;
    self.idBtn.frame = CGRectMake(CGRectGetMaxX(self.nameBtn.frame), 0, width, kFunctionButton_Height);
    [self.contentView addSubview:self.idBtn];
    
    self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.deleteBtn setImage:[UIImage imageNamed:@"remove"] forState:UIControlStateNormal];
    CGFloat deleteBtn_LeftMargin = self.contentView.frame.size.width - kFunctionButton_LeftMargin - kRightButton_Width - kRightButton_RightMargin;
    CGFloat deleteBtn_TopMargin = (kFunctionButton_Height - kRightButton_Width)/2;
    self.deleteBtn.frame = CGRectMake(deleteBtn_LeftMargin, deleteBtn_TopMargin, kRightButton_Width, kRightButton_Width);
    [self.contentView addSubview:self.deleteBtn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
