//
//  CustomBtn.m
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/11/13.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import "CustomBtn.h"

@implementation CustomBtn

- (instancetype)init{
    
    self = [super init];
    if (self) {

        self.mj_y = 0;
        self.mj_x = [self fitSize:15];
        self.width = KScreenWidth - [self fitSize:30];
        self.height = 42;


        self.fontSize = [self fitSize:18];
        
        [self addTarget:self action:@selector(chicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)chicked:(id)sender{
    if (self.block) {
        self.block();
    }
}

#pragma mark - setter
- (void)setTitle:(NSString *)title{
    _title = title;
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

- (void)setBackColor:(UIColor *)backColor{
    _backColor = backColor;
    [self setBackgroundColor:backColor];
}

- (void)setCornerAngle:(float)cornerAngle{
    _cornerAngle = cornerAngle;
    [self addShadowAndCircleCorner:self.layer corner:cornerAngle];
}

- (void)setFontSize:(float)fontSize{
    _fontSize = fontSize;
    self.titleLabel.font = mFont(self.fontSize);
}

- (void)setMFont:(UIFont *)mFont{
    _mFont = mFont;
    self.titleLabel.font = mFont;
}

@end
