//
//  SortCell.m
//  KTDoctor
//
//  Created by duwei on 2019/6/18.
//  Copyright © 2019 dz. All rights reserved.
//

#import "SortCell.h"

@implementation SortCell

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
    self.nameLbl = [[UILabel alloc] init];
    self.nameLbl.textColor = [UIColor blackColor];
    self.nameLbl.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:self.nameLbl];
    
    self.markImg = [[UIImageView alloc] init];
    self.markImg.image = [UIImage imageNamed:@"ok"];
    [self.contentView addSubview:self.markImg];
    [self setupAutoLayout];
}

- (void)setupAutoLayout {
    [self.nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(25);
        make.right.equalTo(self.contentView.mas_right).offset(-25);
        make.height.equalTo(@15);
    }];
    
    [self.markImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.width.height.equalTo(@10);
    }];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
