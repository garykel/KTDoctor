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
    self.contentTF = [[UITextField alloc] initWithFrame:CGRectMake(9, 0, self.contentFrame.size.width - 8 - 12 * kXScal - 10 * kXScal - 12 * kXScal - 9 * kXScal, self.contentFrame.size.height)];
    self.contentTF.borderStyle = UITextBorderStyleNone;
    self.contentTF.placeholder = @"姓名/ID";
    [self addSubview:self.contentTF];
    
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.searchBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    CGFloat btn_TopMargin = (self.contentFrame.size.height - 12 * kYScal)/2;
    self.searchBtn.frame = CGRectMake(CGRectGetMaxX(self.contentTF.frame), btn_TopMargin, 12 * kYScal, 12 * kYScal);
    [self addSubview:self.searchBtn];
    
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
    self.selectBtn.frame = CGRectMake(CGRectGetMaxX(self.searchBtn.frame) + 10 * kXScal, btn_TopMargin, 12 * kYScal, 12 * kYScal);
    [self addSubview:self.selectBtn];
}

@end
