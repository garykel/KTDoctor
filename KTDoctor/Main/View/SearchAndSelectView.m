//
//  SearchAndSelectView.m
//  KTDoctor
//
//  Created by garychen on 2019/4/9.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "SearchAndSelectView.h"
#define kSearchView_Height 52

@interface SearchAndSelectView()
@property (nonatomic,assign)CGRect contentFrame;
@end

@implementation SearchAndSelectView

- (instancetype)initWithFrame:(CGRect) frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentFrame = frame;
//        self.dataArr = [NSMutableArray array];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
    self.searchBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentFrame.size.width, kSearchView_Height * kYScal)];
    self.searchBgView.layer.cornerRadius = kSearchView_Height * kYScal / 2.0;
    self.searchBgView.layer.masksToBounds = YES;
    [self addSubview:self.searchBgView];
    
    self.contentTF = [[UITextField alloc] initWithFrame:CGRectMake(9, 0, self.contentFrame.size.width - 8 - 20 * kXScal - 20 * kXScal - 20 * kXScal - 15 * kXScal, kSearchView_Height * kYScal)];
    self.contentTF.borderStyle = UITextBorderStyleNone;
    [self.searchBgView addSubview:self.contentTF];
    
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.searchBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    CGFloat btn_TopMargin = (self.contentTF.frame.size.height - 20 * kYScal)/2;
    self.searchBtn.frame = CGRectMake(CGRectGetMaxX(self.contentTF.frame), btn_TopMargin, 20 * kYScal, 20 * kYScal);    
    [self.searchBgView addSubview:self.searchBtn];
    
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
    self.selectBtn.frame = CGRectMake(CGRectGetMaxX(self.searchBtn.frame) + 20 * kXScal, btn_TopMargin, 20 * kYScal, 20 * kYScal);
    [self.searchBgView addSubview:self.selectBtn];
}

@end
