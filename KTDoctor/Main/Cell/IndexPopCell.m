//
//  IndexPopCell.m
//  KTDoctor
//
//  Created by duwei on 2019/3/22.
//  Copyright © 2019 dz. All rights reserved.
//

#import "IndexPopCell.h"

@implementation IndexPopCell

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
    self.icon = [[UIImageView alloc] init];
    [self.contentView addSubview:self.icon];
    
    self.titleLbl = [[UILabel alloc] init];
    self.titleLbl.textColor = [UIColor blackColor];
    self.titleLbl.font = [UIFont systemFontOfSize:17.0];
//    self.titleLbl.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.titleLbl];
    
    [self setupAutoLayout];
}

- (void)setupAutoLayout {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.width.height.equalTo(@15);
    }];
    
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.icon.mas_right).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.height.equalTo(@25);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
