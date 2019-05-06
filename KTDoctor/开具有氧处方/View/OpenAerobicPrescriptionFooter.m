//
//  OpenAerobicPrescriptionFooter.m
//  KTDoctor
//
//  Created by 张敬 on 2019/4/30.
//  Copyright © 2019年 dz. All rights reserved.
//

#define selfH [self fitSize:370]

#import "OpenAerobicPrescriptionFooter.h"

@interface OpenAerobicPrescriptionFooter ()

@property (nonatomic, strong) UIView *headerBackView;
@property (nonatomic, strong) UIButton *headerBtn;

@property (nonatomic, strong) UIView *footerBackView;
@property (nonatomic, strong) UILabel *prescriptionNameLab; //处方名称
@property (nonatomic, strong) UILabel *doctorAdviceLab; //医嘱

@property (nonatomic, strong) UIButton *openPrescriptionBtn; //开具处方
@property (nonatomic, strong) UIButton *giveupBtn; //放弃

@end


@implementation OpenAerobicPrescriptionFooter

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, KScreenWidth, selfH)];
    
    if (self) {
        [self setupContent];
    }
    return self;
}

- (void)setupContent
{
    self.backgroundColor = KWhiteColor;
    
    [self addSubview:self.headerBackView];
    [self addSubview:self.footerBackView];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    _footerBackView.mj_y = _headerBackView.bottom;
    
    CGFloat gap = [self fitSize:62];
    _openPrescriptionBtn.mj_y = _doctorAdviceTextView.bottom + [self fitSize:30];
    _openPrescriptionBtn.mj_x = (self.width - gap - _openPrescriptionBtn.width *2)/2.0;
    
    _giveupBtn.mj_x = _openPrescriptionBtn.right + gap;
    _giveupBtn.mj_y = _openPrescriptionBtn.mj_y;
    
}

#pragma mark - setter and getter

//headerBackView
- (UIView *)headerBackView{
    
    if (!_headerBackView) {
        _headerBackView = [[UIView alloc] init];
        _headerBackView.size = CGSizeMake(KScreenWidth - 40, [self fitSize:98]);
        _headerBackView.mj_x = 20;
        _headerBackView.mj_y = 0;
        _headerBackView.backgroundColor = mDefindColor;
        
        //设置 view 四个角的 某个角 为圆角
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_headerBackView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = _headerBackView.bounds;
        maskLayer.path = maskPath.CGPath;
        _headerBackView.layer.mask = maskLayer;
        
        CGFloat gap = _headerBackView.width / 6.0;
        
        for (NSInteger i = 0; i < 6; i++) {
            
            UILabel *lab = [UILabel new];
            lab.frame = CGRectMake(i *gap, [self fitSize:16], gap, [self fitSize:13]);
            
            if (i%2==0) {
                lab.textAlignment = NSTextAlignmentRight;
                lab.font = mFont([self fitSize:13]);
                lab.textColor = UIColorFromRGB(0x5F5F5F);
                
            }else{
                lab.textAlignment = NSTextAlignmentLeft;
                lab.font = mFont([self fitSize:15]);
                lab.textColor = UIColorFromRGB(0x333333);
            }
            
            lab.text = self.titles[i];
            
            [_headerBackView addSubview:lab];
        }
        
        [_headerBackView addSubview:self.headerBtn];
        _headerBtn.mj_x = (_headerBackView.width - _headerBtn.width)/2.0;
        _headerBtn.mj_y = [self fitSize:56];

    }
    return _headerBackView;
}


- (UIButton *)headerBtn{
    
    if (!_headerBtn) {
        _headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headerBtn.backgroundColor = mNavViewColor;
        [_headerBtn setTitle:@"保存为自定义模板" forState:UIControlStateNormal];
        [_headerBtn setTitleColor:KWhiteColor forState:UIControlStateNormal];
        _headerBtn.titleLabel.font = mFont([self fitSize:15]);
        [self addShadowAndCircleCorner:_headerBtn.layer corner:5];
        _headerBtn.size = CGSizeMake([self fitSize:144], [self fitSize:27]);
        
        kWeakSelf(self);
        _headerBtn.block = ^(UIButton *btn) {
            
        };
    }
    return _headerBtn;
}


- (NSArray *)titles{
    
    if (!_titles) {
        _titles = @[@"训练总时长：", @"04:58", @"训练组数：",  @"2", @"平均强度：", @"5"];
    }
    return _titles;
}

- (NSArray *)vaules{
    
    if (!_vaules) {
        _vaules = @[@"04:58", @"2", @"5"];
    }
    return _vaules;
}



//footerBackView
- (UIView *)footerBackView{
    
    if (!_footerBackView) {
        _footerBackView = [[UIView alloc] init];
        _footerBackView.size = CGSizeMake(KScreenWidth - 40, [self fitSize:270]);
        _footerBackView.mj_x = 20;
        _footerBackView.backgroundColor = KWhiteColor;
        
        //处方名称
        [_footerBackView addSubview:self.prescriptionNameLab];
        [_footerBackView addSubview:self.prescriptionTextView];
        
        //医嘱
        [_footerBackView addSubview:self.doctorAdviceLab];
        [_footerBackView addSubview:self.doctorAdviceTextView];
        
        [_footerBackView addSubview:self.openPrescriptionBtn];
        [_footerBackView addSubview:self.giveupBtn];
        
    }
    return _footerBackView;
}

//处方名称
- (UILabel *)prescriptionNameLab{
    if (!_prescriptionNameLab) {
        CGRect rect = CGRectMake(0, 20, [self fitSize:51], [self fitSize:13]);
        _prescriptionNameLab = [UILabel makeLabelWithFrame:rect text:@"处方名称" textColor:mNavViewColor font:mFont(13) textAliment:NSTextAlignmentLeft bgColor:KWhiteColor];
    }
    return _prescriptionNameLab;
}

- (KTTextView *)prescriptionTextView{
    
    if (!_prescriptionTextView) {
        
        _prescriptionTextView = [[KTTextView alloc] init];
        _prescriptionTextView.textNumber = 20;
        _prescriptionTextView.frame = CGRectMake(62, 15, [self fitSize:276], [self fitSize:22]);
    }
    return _prescriptionTextView;
}

//医嘱
- (UILabel *)doctorAdviceLab{
    if (!_doctorAdviceLab) {
        CGRect rect = CGRectMake(0, 57, [self fitSize:51], [self fitSize:13]);

        _doctorAdviceLab = [UILabel makeLabelWithFrame:rect text:@"医       嘱" textColor:mNavViewColor font:mFont(13) textAliment:NSTextAlignmentLeft bgColor:KWhiteColor];
    }
    return _doctorAdviceLab;
}

- (KTTextView *)doctorAdviceTextView{
    
    if (!_doctorAdviceTextView) {
        
        _doctorAdviceTextView = [[KTTextView alloc] init];
        _doctorAdviceTextView.textNumber = 200;
        _doctorAdviceTextView.frame = CGRectMake(62, 52, KScreenWidth - 102, [self fitSize:147]);
    }
    return _doctorAdviceTextView;
}


//开具处方
- (UIButton *)openPrescriptionBtn{
    
    if (!_openPrescriptionBtn) {
        _openPrescriptionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _openPrescriptionBtn.backgroundColor = mNavViewColor;
        [_openPrescriptionBtn setTitle:@"开具处方" forState:UIControlStateNormal];
        [_openPrescriptionBtn setTitleColor:KWhiteColor forState:UIControlStateNormal];
        _openPrescriptionBtn.titleLabel.font = mFont([self fitSize:15]);
        [self addShadowAndCircleCorner:_openPrescriptionBtn.layer corner:5];
        _openPrescriptionBtn.size = CGSizeMake([self fitSize:144], [self fitSize:27]);
        
        kWeakSelf(self);
        _openPrescriptionBtn.block = ^(UIButton *btn) {
            
            if (weakself.openBlock) {
                weakself.openBlock();
            }
        };
    }
    return _openPrescriptionBtn;
}


//放弃
- (UIButton *)giveupBtn{
    
    if (!_giveupBtn) {
        _giveupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _giveupBtn.backgroundColor = RGB(153, 153, 153);
        [_giveupBtn setTitle:@"放弃" forState:UIControlStateNormal];
        [_giveupBtn setTitleColor:KWhiteColor forState:UIControlStateNormal];
        _giveupBtn.titleLabel.font = mFont([self fitSize:15]);
        [self addShadowAndCircleCorner:_giveupBtn.layer corner:5];
        _giveupBtn.size = CGSizeMake([self fitSize:144], [self fitSize:27]);
        
        kWeakSelf(self);
        _giveupBtn.block = ^(UIButton *btn) {
            
            if (weakself.giveupBlock) {
                weakself.giveupBlock();
            }
        };
    }
    return _giveupBtn;
}

- (KTOpenAerobicModel *)model{
    if (!_model) {
        _model = [[KTOpenAerobicModel alloc] init];
    }
    return _model;
}


@end
