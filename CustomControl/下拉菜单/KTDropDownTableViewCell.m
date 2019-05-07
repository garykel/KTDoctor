//
//  XXTGDropDownTableViewCell.m
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/8/1.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import "KTDropDownTableViewCell.h"

@implementation KTDropDownTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.cityLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _cityLabel.frame = CGRectMake([self fitSize:10],
                                  0,
                                  self.size.width - [self fitSize:20],
                                  self.size.height);
    
}

- (UILabel *)cityLabel
{
    if (!_cityLabel) {
        _cityLabel = [UILabel new];
        _cityLabel.textColor = RGB(51, 51, 51);
        _cityLabel.font = mFont([self fitSize:13]);
        _cityLabel.textAlignment = NSTextAlignmentCenter;
        _cityLabel.numberOfLines = 0;
    }
    
    return _cityLabel;
}

@end
