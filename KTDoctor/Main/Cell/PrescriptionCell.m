//
//  PrescriptionCell.m
//  KTDoctor
//
//  Created by duwei on 2019/5/6.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PrescriptionCell.h"
#define kGroupName_LeftMargin 15
#define kGroupName_TopMargin 15
#define kGroupName_Width 43
#define kGroupName_Height 16
#define kItemLbl_LeftMargin 16
#define kItemLbl_TopMargin 18
#define kItemLbl_RightMargin 5
#define kPercentImg_Width 13
extern CGSize prescriptionListviewSize;
@implementation PrescriptionCell

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
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
