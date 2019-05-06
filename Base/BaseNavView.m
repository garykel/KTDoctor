//
//  BaseNavView.m
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/11/6.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import "BaseNavView.h"

@implementation BaseNavView

- (instancetype)initWithTitle:(NSString *)string{
    
    self = [super initWithFrame:CGRectMake(0, 20, KScreenWidth, XXTG_NavBarHeight)];
    if (self) {
        
        self.backgroundColor = mNavViewColor;
        _navTitleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _navTitleLabel.text = string;
        _navTitleLabel.textColor = KWhiteColor;
        _navTitleLabel.font = mMediumFont([self fitSize:19]);
        //_navTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-BoldItalic" size:18];
        _navTitleLabel.adjustsFontSizeToFitWidth = YES;
        _navTitleLabel.textAlignment = NSTextAlignmentCenter;
        _rightNavBtnW = 44;
        
        [self addSubview:_navTitleLabel];
        [self.layer addSublayer:self.line];
        [self addSubview:self.leftNavBtn];
        [self addSubview:self.leftCancelNavBtn];
        [self addSubview:self.rightNavBtn];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.frame = CGRectMake(0, 20, KScreenWidth, XXTG_NavBarHeight);
    
    CGFloat topHeight = 0;
    _navTitleLabel.frame = CGRectMake((KScreenWidth-200)/2.0, topHeight, 200, XXTG_NavBarHeight-topHeight);
    _leftNavBtn.frame = CGRectMake([self fitSize:18],(XXTG_NavBarHeight - 30)/2.0 , 30, 30);
    _leftCancelNavBtn.frame = _leftNavBtn.frame;
    _leftCancelNavBtn.mj_x = _leftNavBtn.right;
    _rightNavBtn.frame = _leftNavBtn.frame;
    
    _rightNavBtn.width = 55;
    _rightNavBtn.mj_x = KScreenWidth - _rightNavBtn.width;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, XXTG_NavBarHeight - 0.5, KScreenWidth, 0.5)];
    _line.path = path.CGPath;
    
}

#pragma mark - response methods
- (void)didClickedBackButton{
    
    if (_leftBlock) {
        self.leftBlock();
    }else{
        [self.viewController.navigationController popViewControllerAnimated:YES];
    }
}


- (void)didClickedRightButton{
    if (self.rightBlock) {
        self.rightBlock();
    }
}


- (void)didClickedCancelButton{
    [self.viewController.navigationController popViewControllerAnimated:YES];
}


#pragma mark - setter and getter

- (void)setRightNavBtnW:(float)rightNavBtnW{
    _rightNavBtnW = rightNavBtnW;
}

- (CAShapeLayer *)line
{
    if (!_line) {
        _line = [CAShapeLayer layer];
        _line.fillColor = mIconLineColor.CGColor;
        //_line.hidden = YES;
    }
    return _line;
}

- (UIButton *)leftNavBtn{
    if (!_leftNavBtn) {
        
        _leftNavBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftNavBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        _leftNavBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_leftNavBtn addTarget:self action:@selector(didClickedBackButton) forControlEvents:UIControlEventTouchUpInside];
        _leftNavBtn.hidden = YES;
        _leftNavBtn.timeInterval = 0.5;
    }
    
    return _leftNavBtn;
}

- (UIButton *)leftCancelNavBtn{
    if (!_leftCancelNavBtn) {
        
        _leftCancelNavBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftCancelNavBtn setImage:[UIImage imageNamed:@"nav_off"] forState:UIControlStateNormal];
        _leftCancelNavBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_leftCancelNavBtn addTarget:self action:@selector(didClickedCancelButton) forControlEvents:UIControlEventTouchUpInside];
        _leftCancelNavBtn.hidden = YES;
    }
    
    return _leftCancelNavBtn;
}


- (UIButton *)rightNavBtn{
    if (!_rightNavBtn) {
        
        _rightNavBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightNavBtn setImage:[UIImage imageNamed:@"mine_setting"] forState:UIControlStateNormal];
        [_rightNavBtn addTarget:self action:@selector(didClickedRightButton) forControlEvents:UIControlEventTouchUpInside];
        [_rightNavBtn setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _rightNavBtn.titleLabel.font = mFont([self fitSize:16]);
        _rightNavBtn.hidden = YES;
    }
    
    return _rightNavBtn;
}


@end
