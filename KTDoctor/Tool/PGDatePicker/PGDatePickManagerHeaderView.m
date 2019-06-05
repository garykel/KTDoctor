//
//  PGDatePickManagerHeaderView.m
//
//  Created by piggybear on 2018/1/7.
//  Copyright © 2018年 piggybear. All rights reserved.
//

#import "PGDatePickManagerHeaderView.h"
#import "NSBundle+PGDatePicker.h"
#import "UIColor+PGHex.h"

@interface PGDatePickManagerHeaderView()
@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, weak) UIView *middleLineView;
@property (nonatomic, weak) UIView *middleLineView2;
@property (nonatomic, assign) CGSize titleLabelSize;
@property (nonatomic, assign) BOOL isSubViewLayouted;
@end

@implementation PGDatePickManagerHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupButton];
    }
    return self;
}

- (void)dealloc {
    if (self.titleLabel) {
        [self.titleLabel removeObserver:self forKeyPath:@"text"];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.isSubViewLayouted) {
        return;
    }
    self.isSubViewLayouted = true;
    [self setupButton];
    self.titleLabel.frame = CGRectMake((self.bounds.size.width - self.titleLabelSize.width) / 2,
                                       0,
                                       self.titleLabelSize.width,
                                       self.bounds.size.height);
    if (self.style == PGDatePickManagerStyleSheet) {
        self.lineView.hidden = true;
        [self setyle1];
    }else if (self.style == PGDatePickManagerStyleAlertTopButton) {
        [self setyle1];
    }else if (self.style == PGDatePickManagerStyleAlertBottomButton) {
        [self setyle2];
    }
}

- (void)setyle1 {
    CGFloat lineViewHeight = 0.5;
    self.lineView.frame = CGRectMake(0,
                                     self.bounds.size.height - lineViewHeight,
                                     self.bounds.size.width,
                                     lineViewHeight);
    CGFloat buttonWidth = 80;
    CGFloat buttonHeight = 30;
    CGFloat space = 15;
    self.cancelButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.confirmButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.cancelButton.frame = CGRectMake(space,
                                         (self.bounds.size.height - buttonHeight) / 2,
                                         buttonWidth,
                                         buttonHeight);
    self.confirmButton.frame = CGRectMake(self.bounds.size.width - buttonWidth - space,
                                          (self.bounds.size.height - buttonHeight) / 2,
                                          buttonWidth,
                                          buttonHeight);
}

- (void)setyle2 {
    CGFloat lineViewHeight = 0.5;
    self.lineView.frame = CGRectMake(0,
                                     0,
                                     self.bounds.size.width,
                                     lineViewHeight);
    CGFloat buttonWidth = self.bounds.size.width / 3;
    CGFloat buttonHeight = 30;
    self.cancelButton.frame = CGRectMake(0,
                                         (self.bounds.size.height - buttonHeight) / 2,
                                         buttonWidth,
                                         buttonHeight);
    self.resetButton.frame = CGRectMake(self.bounds.size.width / 3,
                                          (self.bounds.size.height - buttonHeight) / 2,
                                          buttonWidth,
                                          buttonHeight);
    
    self.confirmButton.frame = CGRectMake(self.bounds.size.width / 3 * 2,
                                          (self.bounds.size.height - buttonHeight) / 2,
                                          buttonWidth,
                                          buttonHeight);
    self.middleLineView.frame = CGRectMake(self.bounds.size.width / 3, 5, 0.5, self.bounds.size.height - 10);
    self.middleLineView.frame = CGRectMake(self.bounds.size.width * 2 / 3, 5, 0.5, self.bounds.size.height - 10);
}

- (void)setupButton {
    self.cancelButton.titleLabel.font = self.cancelButtonFont;
    [self.cancelButton setTitleColor:self.cancelButtonTextColor forState:UIControlStateNormal];
    [self.cancelButton setTitle:self.cancelButtonText forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancelButtonHandler) forControlEvents:UIControlEventTouchUpInside];
    
    self.resetButton.titleLabel.font = self.resetButtonFont;
    [self.resetButton setTitleColor:self.resetButtonTextColor forState:UIControlStateNormal];
    [self.resetButton setTitle:self.resetButtonText forState:UIControlStateNormal];
    [self.resetButton addTarget:self action:@selector(resetButtonHandler) forControlEvents:UIControlEventTouchUpInside];
    
    self.confirmButton.titleLabel.font = self.confirmButtonFont;
    [self.confirmButton setTitleColor:self.confirmButtonTextColor forState:UIControlStateNormal];
    [self.confirmButton setTitle:self.confirmButtonText forState:UIControlStateNormal];
    [self.confirmButton addTarget:self action:@selector(confirmButtonHandler) forControlEvents:UIControlEventTouchUpInside];
}

- (void)cancelButtonHandler {
    if (self.cancelButtonHandlerBlock) {
        self.cancelButtonHandlerBlock();
    }
}

- (void)confirmButtonHandler {
    if (self.confirmButtonHandlerBlock) {
        self.confirmButtonHandlerBlock();
    }
}

- (void)resetButtonHandler {
    if (self.resetButtonHandlerBlock) {
        self.resetButtonHandlerBlock();
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    UILabel *label = object;
    NSString *newString = change[@"new"];
    CGSize size = [newString sizeWithAttributes:@{NSFontAttributeName: [label font]}];
    self.titleLabelSize = size;
}

#pragma Setter

- (void)setLanguage:(NSString *)language {
    _language = language;
    NSString *cancelButtonText = [NSBundle pg_localizedStringForKey:@"cancelButtonText" language:self.language];
    [self.cancelButton setTitle:cancelButtonText forState:UIControlStateNormal];
    
    NSString *resetButtonText = [NSBundle pg_localizedStringForKey:@"resetButtonText" language:self.language];
    [self.resetButton setTitle:resetButtonText forState:UIControlStateNormal];
    
    NSString *confirmButtonText = [NSBundle pg_localizedStringForKey:@"confirmButtonText" language:self.language];
    [self.confirmButton setTitle:confirmButtonText forState:UIControlStateNormal];
}

#pragma Getter

- (UIView *)lineView {
    if (!_lineView) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view];
        _lineView = view;
    }
    return _lineView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc]init];
        [self addSubview:label];
        label.textColor = [UIColor pg_colorWithHexString:@"#848484"];
        label.font = [UIFont boldSystemFontOfSize:17];
        [label addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UIView *)middleLineView {
    if (!_middleLineView) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view];
        _middleLineView = view;
    }
    return _middleLineView;
}

- (UIView *)middleLineView2 {
    if (!_middleLineView2) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view];
        _middleLineView2 = view;
    }
    return _middleLineView2;
}

- (UIButton *)confirmButton {
    if (!_confirmButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:button];
        _confirmButton = button;
    }
    return _confirmButton;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:button];
        _cancelButton = button;
    }
    return _cancelButton;
}

- (UIButton *)resetButton {
    if (!_resetButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:button];
        _resetButton = button;
    }
    return _resetButton;
}

- (NSString *)cancelButtonText {
    if (!_cancelButtonText) {
        NSString *cancelButtonText = [NSBundle pg_localizedStringForKey:@"cancelButtonText" language:self.language];
        _cancelButtonText = cancelButtonText;
    }
    return _cancelButtonText;
}

- (UIFont *)cancelButtonFont {
    if (!_cancelButtonFont) {
        _cancelButtonFont = [UIFont systemFontOfSize:18];
    }
    return _cancelButtonFont;
}

- (UIColor *)cancelButtonTextColor {
    if (!_cancelButtonTextColor) {
        _cancelButtonTextColor = [UIColor lightGrayColor];
    }
    return _cancelButtonTextColor;
}

- (NSString *)confirmButtonText {
    if (!_confirmButtonText) {
        NSString *confirmButtonText = [NSBundle pg_localizedStringForKey:@"confirmButtonText" language:self.language];
        _confirmButtonText = confirmButtonText;
    }
    return _confirmButtonText;
}

- (UIFont *)confirmButtonFont {
    if (!_confirmButtonFont) {
        _confirmButtonFont = [UIFont systemFontOfSize:18];
    }
    return _confirmButtonFont;
}

- (UIColor *)confirmButtonTextColor {
    if (!_confirmButtonTextColor) {
        _confirmButtonTextColor = [UIColor lightGrayColor];
    }
    return _confirmButtonTextColor;
}

- (NSString *)resetButtonText {
    if (!_resetButtonText) {
        NSString *resetButtonText = [NSBundle pg_localizedStringForKey:@"resetButtonText" language:self.language];
        _resetButtonText = resetButtonText;
    }
    return _resetButtonText;
}

- (UIFont *)resetButtonFont {
    if (!_resetButtonFont) {
        _resetButtonFont = [UIFont systemFontOfSize:18];
    }
    return _resetButtonFont;
}

- (UIColor *)resetButtonTextColor {
    if (!_resetButtonTextColor) {
        _resetButtonTextColor = [UIColor lightGrayColor];
    }
    return _resetButtonTextColor;
}

@end
