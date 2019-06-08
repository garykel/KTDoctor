//
//  TestResultsCell.m
//  KTDoctor
//
//  Created by garychen on 2019/6/8.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "TestResultsCell.h"
#define kLbl_Height 29
#define kLbl_FontSize 13.0
#define kSeperateLine_Height 1

extern CGSize testResultsListViewSize;

@interface TestResultsCell()
@property (nonatomic,strong)UIView *seperateLine;
@end

@implementation TestResultsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    CGFloat lbl_width = (testResultsListViewSize.width - 2 * 1)/3;
    self.deviceNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, lbl_width, kLbl_Height * kYScal)];
    self.deviceNameLbl.textColor = [UIColor blackColor];
    self.deviceNameLbl.textAlignment = NSTextAlignmentCenter;
    self.deviceNameLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    [self.contentView addSubview:self.deviceNameLbl];
    
    self.attributeNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deviceNameLbl.frame) + 1, 0, lbl_width, kLbl_Height * kYScal)];
    self.attributeNameLbl.textColor = [UIColor blackColor];
    self.attributeNameLbl.textAlignment = NSTextAlignmentCenter;
    self.attributeNameLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    [self.contentView addSubview:self.attributeNameLbl];
    
    self.attributeValLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.attributeNameLbl.frame) + 1, 0, lbl_width, kLbl_Height * kYScal)];
    self.attributeValLbl.textColor = [UIColor blackColor];
    self.attributeValLbl.textAlignment = NSTextAlignmentCenter;
    self.attributeValLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    [self.contentView addSubview:self.attributeValLbl];
    
    self.seperateLine = [[UIView alloc] initWithFrame:CGRectMake(0, kLbl_Height * kYScal - kSeperateLine_Height, testResultsListViewSize.width, kSeperateLine_Height)];
    self.seperateLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.seperateLine];
}

@end
