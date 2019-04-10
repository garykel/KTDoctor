//
//  SearchAndSelectView.m
//  KTDoctor
//
//  Created by garychen on 2019/4/9.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "SearchAndSelectView.h"

@interface SearchAndSelectView()
@property (nonatomic,assign)CGRect contentFrame;
@end

@implementation SearchAndSelectView

- (instancetype)initWithFrame:(CGRect) frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentFrame = frame;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.contentTF = [[UITextField alloc] initWithFrame:CGRectMake(9, 0, self.contentFrame.size.width - 8 - 20 * kXScal - 20 * kXScal - 20 * kXScal - 15 * kXScal, self.contentFrame.size.height)];
    self.contentTF.borderStyle = UITextBorderStyleNone;
    self.contentTF.placeholder = @"姓 名/ID";
    [self addSubview:self.contentTF];
    
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.searchBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    CGFloat btn_TopMargin = (self.contentFrame.size.height - 20 * kYScal)/2;
    self.searchBtn.frame = CGRectMake(CGRectGetMaxX(self.contentTF.frame), btn_TopMargin, 20 * kYScal, 20 * kYScal);
    [self addSubview:self.searchBtn];
    
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
    self.selectBtn.frame = CGRectMake(CGRectGetMaxX(self.searchBtn.frame) + 20 * kXScal, btn_TopMargin, 20 * kYScal, 20 * kYScal);
    [self addSubview:self.selectBtn];
}

@end
