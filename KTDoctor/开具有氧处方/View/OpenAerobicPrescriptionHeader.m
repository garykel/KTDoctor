//
//  OpenAerobicPrescriptionHeader.m
//  KTDoctor
//
//  Created by 张敬 on 2019/4/30.
//  Copyright © 2019年 dz. All rights reserved.
//

#define selfH [self fitSize:196]

#import "OpenAerobicPrescriptionHeader.h"

@interface OpenAerobicPrescriptionHeader ()<XXTGDropdownMenuDelegate>

@property (nonatomic, strong) UIView *headerBackView;
@property (nonatomic, strong) UIView *footerBackView;

@end


@implementation OpenAerobicPrescriptionHeader

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
    self.backgroundColor = mBackgroudColor;
    
    [self addSubview:self.headerBackView];
    [self addSubview:self.footerBackView];
    
    [kNotificationCenter addObserver:self selector:@selector(hiddenAllCityList) name:kHideDropDownNotification object:nil];

}


#pragma mark - response methods

//MARK:  - LMJDropdownMenu Delegate
- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string
{
    
    if (menu == self.dropdownMenu_TS) { //训练部位
        if (![self isBlankString:string]) {
            self.model.trainingSiteStr = string;
        }
        
    }else if (menu == self.dropdownMenu_TE){ //训练设备

        if (![self isBlankString:string]) {
            
            //条件 ：如果前面的训练部位没有选 后面的训练设备下拉框也不能选
            if ([self isBlankString:self.model.trainingSiteStr]) {
                [menu.mainBtn setTitle:@"请选择" forState:UIControlStateNormal];
                [menu.mainBtn setTitleColor:RGB(220, 220, 220) forState:UIControlStateNormal];
                self.model.trainingSiteStr = @"";
                [STTextHudTool showText:@"请先选择训练部位！"];
            }
            self.model.trainingEquipmentStr = string;
        }
        
    }else if (menu == self.dropdownMenu_R){ //推荐模版
        
        if (![self isBlankString:string]) {
            self.model.recommendStr = string;
        }
    }else if (menu == self.dropdownMenu_T){ //疗程
        
        if (![self isBlankString:string]) {
            self.model.treatmentStr = string;
        }
        
    }else if (menu == self.dropdownMenu_TF){ //周训练频次
        
        if (![self isBlankString:string]) {
            self.model.trainingFrequencyStr = string;
        }
        
    }else if (menu == self.dropdownMenu_PM){ //运动时间点
        
        if (![self isBlankString:string]) {
            self.model.pointMotionStr = string;
        }
    }
    
    //block
    if (self.block) {
        self.block(self.model);
    }
}

#pragma mark - private methods

- (UILabel *)createLabel{
    UILabel *label = [UILabel new];
    label.font = mFont([self fitSize:13]);
    label.textColor = UIColorFromRGB(0x5F5F5F);
    label.textAlignment = NSTextAlignmentLeft;
    label.height = [self fitSize:13];
    label.width = [self fitSize:100];
    return label;
}

- (UITextField *)creatTextField{
    UITextField *textField = [[UITextField alloc] init];
    textField.delegate = self;
    textField.font = mFont([self fitSize:15]);
    textField.returnKeyType = UIReturnKeyDone;
    textField.keyboardType = UIKeyboardTypeDefault;
    return textField;
}


#pragma mark - setter and getter

- (void)setTitles_R:(NSArray *)titles_R{
    
    _titles_R = titles_R;
    self.dropdownMenu_R.titles = titles_R;
}

//headerBackView
- (UIView *)headerBackView{
    
    if (!_headerBackView) {
        _headerBackView = [[UIView alloc] init];
        _headerBackView.backgroundColor = mDefindColor;
        _headerBackView.size = CGSizeMake(KScreenWidth - 40, [self fitSize:151]);
        _headerBackView.mj_x = 20;
        _headerBackView.mj_y = [self fitSize:20];
        
        [self addShadowAndCircleCorner:_headerBackView.layer corner:5];
        
        //适用病症
        [_headerBackView addSubview:self.useConditionsLab];
        [_headerBackView addSubview:self.useConditionsTextField];
        
        
        //风险等级
        [_headerBackView addSubview:self.riskLevelLab];
        [_headerBackView addSubview:self.riskLevelTextField];
        
        
        //设备类型
        [_headerBackView addSubview:self.deviceTypeLab];
        [_headerBackView addSubview:self.deviceTypeTextField];
        
        
        //训练部位
        [_headerBackView addSubview:self.trainingSiteLab];
        [_headerBackView addSubview:self.dropdownMenu_TS];
        
        
        //训练设备
        [_headerBackView addSubview:self.trainingEquipmentLab];
        [_headerBackView addSubview:self.dropdownMenu_TE];



        //推荐模版
        [_headerBackView addSubview:self.recommendLab];
        [_headerBackView addSubview:self.dropdownMenu_R];
        
        
        
        //疗程
        [_headerBackView addSubview:self.treatmentLab];
        [_headerBackView addSubview:self.treatmentGapLab];
        [_headerBackView addSubview:self.dropdownMenu_T];
        
        
        //周训练频次
        [_headerBackView addSubview:self.trainingFrequencyLab];
        [_headerBackView addSubview:self.trainingFrequencyGapLab];
        [_headerBackView addSubview:self.dropdownMenu_TF];
        
        
        //运动时间点
        [_headerBackView addSubview:self.pointMotionLab];
        [_headerBackView addSubview:self.dropdownMenu_PM];

    }
    return _headerBackView;
}

//适用病症
- (UILabel *)useConditionsLab{
    if (!_useConditionsLab) {
        _useConditionsLab = [self createLabel];
        _useConditionsLab.textColor = UIColorFromRGB(0x5F5F5F);
        _useConditionsLab.text = @"适用病症";
        _useConditionsLab.font = mFont([self fitSize:13]);
    }
    return _useConditionsLab;
}

- (UITextField *)useConditionsTextField{
    if (!_useConditionsTextField) {
        _useConditionsTextField = [self creatTextField];
        _useConditionsTextField.placeholder = @"请输入使用病症";
        _useConditionsTextField.backgroundColor = KWhiteColor;
        _useConditionsTextField.font = mFont([self fitSize:13]);
        [self addShadowAndCircleCorner:_useConditionsTextField.layer corner:3];
    }
    return _useConditionsTextField;
}


//风险等级
- (UILabel *)riskLevelLab{
    if (!_riskLevelLab) {
        _riskLevelLab = [self createLabel];
        _riskLevelLab.textColor = UIColorFromRGB(0x5F5F5F);
        _riskLevelLab.text = @"风 险 等 级";
        _riskLevelLab.font = mFont([self fitSize:13]);
    }
    return _riskLevelLab;
}

- (UITextField *)riskLevelTextField{
    if (!_riskLevelTextField) {
        _riskLevelTextField = [self creatTextField];
        _riskLevelTextField.placeholder = @"请输入风险等级";
        _riskLevelTextField.backgroundColor = KWhiteColor;
        _riskLevelTextField.font = mFont([self fitSize:13]);
        [self addShadowAndCircleCorner:_riskLevelTextField.layer corner:3];
    }
    return _riskLevelTextField;
}


//设备类型
- (UILabel *)deviceTypeLab{
    if (!_deviceTypeLab) {
        _deviceTypeLab = [self createLabel];
        _deviceTypeLab.textColor = UIColorFromRGB(0x5F5F5F);
        _deviceTypeLab.text = @"设备类型";
        _deviceTypeLab.font = mFont([self fitSize:13]);
    }
    return _deviceTypeLab;
}

- (UITextField *)deviceTypeTextField{
    if (!_deviceTypeTextField) {
        _deviceTypeTextField = [self creatTextField];
        _deviceTypeTextField.placeholder = @"请输入设备类型";
        _deviceTypeTextField.backgroundColor = KWhiteColor;
        _deviceTypeTextField.font = mFont([self fitSize:13]);
        [self addShadowAndCircleCorner:_deviceTypeTextField.layer corner:3];
    }
    return _deviceTypeTextField;
}


//训练部位
- (UILabel *)trainingSiteLab{
    if (!_trainingSiteLab) {
        _trainingSiteLab = [self createLabel];
        _trainingSiteLab.textColor = UIColorFromRGB(0x5F5F5F);
        _trainingSiteLab.text = @"训 练 部 位";
        _trainingSiteLab.font = mFont([self fitSize:13]);
    }
    return _trainingSiteLab;
}

- (KTDropDownMenus *)dropdownMenu_TS
{
    if (!_dropdownMenu_TS) {
        
        _dropdownMenu_TS = [[KTDropDownMenus alloc] init];
        _dropdownMenu_TS.size = CGSizeMake([self fitSize:140], [self fitSize:20]);
        
        [_dropdownMenu_TS setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_TS.titles = self.titles_TS;
        _dropdownMenu_TS.defualtStr = @"请选择";
        _dropdownMenu_TS.delegate = self;
    }
    return _dropdownMenu_TS;
}

- (NSMutableArray *)titles_TS{
    if (!_titles_TS) {
        
        _titles_TS = [NSMutableArray array];
        [_titles_TS addObject:@"心肺"];
        
    }
    return _titles_TS;
}


//训练设备
- (UILabel *)trainingEquipmentLab{
    if (!_trainingEquipmentLab) {
        _trainingEquipmentLab = [self createLabel];
        _trainingEquipmentLab.textColor = UIColorFromRGB(0x5F5F5F);
        _trainingEquipmentLab.text = @"训 练 设 备";
        _trainingEquipmentLab.font = mFont([self fitSize:13]);
    }
    return _trainingEquipmentLab;
}


- (KTDropDownMenus *)dropdownMenu_TE
{
    if (!_dropdownMenu_TE) {
        
        _dropdownMenu_TE = [[KTDropDownMenus alloc] init];
        _dropdownMenu_TE.size = CGSizeMake([self fitSize:140], [self fitSize:20]);
        
        [_dropdownMenu_TE setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_TE.titles = self.titles_TE;
        _dropdownMenu_TE.defualtStr = @"请选择";
        _dropdownMenu_TE.delegate = self;
    }
    return _dropdownMenu_TE;
}


- (NSMutableArray *)titles_TE{
    if (!_titles_TE) {
        
        _titles_TE = [NSMutableArray array];
        [_titles_TE addObject:@"功率车"];
        [_titles_TE addObject:@"椭圆机"];
    }
    return _titles_TE;
}


//推荐模版
- (UILabel *)recommendLab{
    if (!_recommendLab) {
        _recommendLab = [self createLabel];
        _recommendLab.text = @"推荐模版";
        [_recommendLab sizeToFit];
        
    }
    return _recommendLab;
}


- (KTDropDownMenus *)dropdownMenu_R
{
    if (!_dropdownMenu_R) {
        
        _dropdownMenu_R = [[KTDropDownMenus alloc] init];
        _dropdownMenu_R.size = CGSizeMake([self fitSize:60], [self fitSize:20]);
        
        [_dropdownMenu_R setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_R.titles = self.titles_R;
        _dropdownMenu_R.defualtStr = @"请选择推荐模版";
        _dropdownMenu_R.delegate = self;
    }
    return _dropdownMenu_R;
}

//
//- (NSMutableArray *)titles_R{
//    if (!_titles_R) {
//        _titles_R = [NSMutableArray array];
//        for (NSInteger i = 1; i <= 20; i++) {
//            
//            NSString * str = [NSString stringWithFormat:@"%ld", i*5];
//            [_titles_R addObject:str];
//        }
//    }
//    return _titles_R;
//}


//疗程
- (UILabel *)treatmentLab{
    if (!_treatmentLab) {
        _treatmentLab = [self createLabel];
        _treatmentLab.text = @"疗程";
        [_treatmentLab sizeToFit];
        
    }
    return _treatmentLab;
}

- (UILabel *)treatmentGapLab{
    if (!_treatmentGapLab) {
        _treatmentGapLab = [self createLabel];
        _treatmentGapLab.text = @"周";
        _treatmentGapLab.width = [self fitSize:25];
        _treatmentGapLab.textAlignment = NSTextAlignmentCenter;
        
    }
    return _treatmentGapLab;
}


- (KTDropDownMenus *)dropdownMenu_T
{
    if (!_dropdownMenu_T) {
        
        _dropdownMenu_T = [[KTDropDownMenus alloc] init];
        _dropdownMenu_T.size = CGSizeMake([self fitSize:60], [self fitSize:20]);
        [_dropdownMenu_T setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_T.titles = self.titles_T;
        _dropdownMenu_T.defualtStr = @"请选择";
        _dropdownMenu_T.delegate = self;
    }
    return _dropdownMenu_T;
}


- (NSMutableArray *)titles_T{
    if (!_titles_T) {
        _titles_T = [NSMutableArray array];
        for (NSInteger i = 1; i <= 12; i++) {
            
            NSString * str = [NSString stringWithFormat:@"%ld", i];
            [_titles_T addObject:str];
        }
        
        [_titles_T addObject:@"无限制"];
    }
    return _titles_T;
}



//周训练频次
- (UILabel *)trainingFrequencyLab{
    if (!_trainingFrequencyLab) {
        _trainingFrequencyLab = [self createLabel];
        _trainingFrequencyLab.text = @"周训练频次";
        [_trainingFrequencyLab sizeToFit];
    }
    return _trainingFrequencyLab;
}

- (UILabel *)trainingFrequencyGapLab{
    if (!_trainingFrequencyGapLab) {
        _trainingFrequencyGapLab = [self createLabel];
        _trainingFrequencyGapLab.text = @"天";
        _trainingFrequencyGapLab.width = [self fitSize:40];
        _trainingFrequencyGapLab.textAlignment = NSTextAlignmentCenter;
        
    }
    return _trainingFrequencyGapLab;
}


- (KTDropDownMenus *)dropdownMenu_TF
{
    if (!_dropdownMenu_TF) {
        
        _dropdownMenu_TF = [[KTDropDownMenus alloc] init];
        _dropdownMenu_TF.size = CGSizeMake([self fitSize:45], [self fitSize:20]);
        
        [_dropdownMenu_TF setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_TF.titles = self.titles_TF;
        _dropdownMenu_TF.defualtStr = @"请选择";
        _dropdownMenu_TF.delegate = self;
    }
    return _dropdownMenu_TF;
}


- (NSMutableArray *)titles_TF{
    if (!_titles_TF) {
        _titles_TF = [NSMutableArray array];
        for (NSInteger i = 1; i <=7; i++) {
            
            NSString * str = [NSString stringWithFormat:@"%ld", i];
            [_titles_TF addObject:str];
        }
        
        [_titles_TF addObject:@"无限制"];

    }
    return _titles_TF;
}


//运动时间点
- (UILabel *)pointMotionLab{
    if (!_pointMotionLab) {
        _pointMotionLab = [self createLabel];
        _pointMotionLab.text = @"运动时间点";
        [_pointMotionLab sizeToFit];
    }
    return _pointMotionLab;
}


- (KTDropDownMenus *)dropdownMenu_PM
{
    if (!_dropdownMenu_PM) {
        
        _dropdownMenu_PM = [[KTDropDownMenus alloc] init];
        _dropdownMenu_PM.size = CGSizeMake([self fitSize:45], [self fitSize:20]);
        [_dropdownMenu_PM setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_PM.titles = self.titles_PM;
        _dropdownMenu_PM.defualtStr = @"请选择";
        _dropdownMenu_PM.delegate = self;
        
    }
    return _dropdownMenu_PM;
}

- (NSMutableArray *)titles_PM{
    if (!_titles_PM) {
        
        _titles_PM = [NSMutableArray array];
        [_titles_PM addObject:@"任意"];
        [_titles_PM addObject:@"三餐前半小时"];
        [_titles_PM addObject:@"三餐后一小时"];
        [_titles_PM addObject:@"无条件限制"];

    }
    return _titles_PM;
}


//footerBackView
- (UIView *)footerBackView{
    
    if (!_footerBackView) {
        _footerBackView = [[UIView alloc] init];
        _footerBackView.backgroundColor = mDefindColor;
        _footerBackView.size = CGSizeMake(KScreenWidth - 40, [self fitSize:5]);
        _footerBackView.mj_x = 20;
        
        //设置 view 四个角的 某个角 为圆角
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_footerBackView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = _footerBackView.bounds;
        maskLayer.path = maskPath.CGPath;
        _footerBackView.layer.mask = maskLayer;
    }
    return _footerBackView;
}


- (KTOpenAerobicModel *)model{
    if (!_model) {
        _model = [[KTOpenAerobicModel alloc] init];
    }
    return _model;
}


#pragma mark - other methods
- (void)layoutSubviews{
    [super layoutSubviews];
    
    _footerBackView.mj_y = _headerBackView.bottom + [self fitSize:20];

    CGFloat width = (KScreenWidth - 40)/3.0 - 140;
    CGFloat dropdownMenu_gap = 2.0;
    
    
    //适用病症
    _useConditionsLab.mj_x = 15;
    _useConditionsLab.mj_y = 15;
    [_useConditionsLab sizeToFit];
    
    _useConditionsTextField.width = width;
    _useConditionsTextField.height = [self fitSize:19];
    _useConditionsTextField.mj_x = _useConditionsLab.right + 10;
    _useConditionsTextField.mj_y = 15;
    
    
    //风险等级
    _riskLevelLab.mj_x = _useConditionsTextField.right + 62;
    _riskLevelLab.mj_y = 15;
    [_riskLevelLab sizeToFit];
    
    _riskLevelTextField.width = width;
    _riskLevelTextField.height = [self fitSize:19];
    _riskLevelTextField.mj_x = _riskLevelLab.right + 10;
    _riskLevelTextField.mj_y = 15;
    
    
    //设备类型
    _deviceTypeLab.mj_x = 15;
    _deviceTypeLab.mj_y = _useConditionsLab.bottom + 20;
    [_deviceTypeLab sizeToFit];
    
    _deviceTypeTextField.width = width;
    _deviceTypeTextField.height = [self fitSize:19];
    _deviceTypeTextField.mj_x = _deviceTypeLab.right + 10;
    _deviceTypeTextField.mj_y = _deviceTypeLab.mj_y;
    
    
    //训练部位
    _trainingSiteLab.mj_x = _deviceTypeTextField.right + 62;
    _trainingSiteLab.mj_y = _deviceTypeLab.mj_y;
    [_trainingSiteLab sizeToFit];
    
    _dropdownMenu_TS.mj_x = _riskLevelLab.right + 10;
    _dropdownMenu_TS.mj_y = _deviceTypeLab.mj_y;
    
    
    //训练设备
    _trainingEquipmentLab.mj_x = _riskLevelTextField.right + 62;
    _trainingEquipmentLab.mj_y = _deviceTypeLab.mj_y;
    [_trainingEquipmentLab sizeToFit];
    
    _dropdownMenu_TE.mj_x = _trainingEquipmentLab.right + 10;
    _dropdownMenu_TE.mj_y = _deviceTypeLab.mj_y;
    _dropdownMenu_TE.width = width;
    

    //推荐模版
    _recommendLab.mj_x = 15;
    _recommendLab.mj_y = _deviceTypeLab.bottom + 20;
    [_recommendLab sizeToFit];

    _dropdownMenu_R.mj_x = _recommendLab.right + 10;
    _dropdownMenu_R.mj_y = _recommendLab.mj_y;
    _dropdownMenu_R.width = [self fitSize:356];
    
    
    //疗程
    _treatmentLab.mj_x = _recommendLab.mj_x;
    _treatmentLab.mj_y = _recommendLab.bottom + 20;
    
    _dropdownMenu_T.mj_x = _dropdownMenu_R.mj_x;
    _dropdownMenu_T.mj_y = _treatmentLab.mj_y;
    _dropdownMenu_T.width = width;
    
    _treatmentGapLab.mj_x = _dropdownMenu_T.right +10 ;
    _treatmentGapLab.mj_y = _treatmentLab.mj_y + 2;
    
    
    
    //周训练频次
    _trainingFrequencyLab.mj_x = _trainingSiteLab.mj_x;
    _trainingFrequencyLab.mj_y = _treatmentLab.mj_y;
    
    _dropdownMenu_TF.mj_x = _trainingFrequencyLab.right + 20;
    _dropdownMenu_TF.mj_y = _trainingFrequencyLab.mj_y - dropdownMenu_gap;
    _dropdownMenu_TF.width = _dropdownMenu_TS.width;
    
    _trainingFrequencyGapLab.mj_x = _dropdownMenu_TF.right ;
    _trainingFrequencyGapLab.mj_y = _trainingFrequencyLab.mj_y +2;
    
    
    //运动时间点
    _pointMotionLab.mj_x = _trainingEquipmentLab.mj_x;
    _pointMotionLab.mj_y = _treatmentLab.mj_y;
    
    _dropdownMenu_PM.mj_x = _pointMotionLab.right + 20;
    _dropdownMenu_PM.mj_y = _treatmentLab.mj_y - dropdownMenu_gap;
    _dropdownMenu_PM.width = width;
}



- (void)hiddenAllCityList{
    
    //训练部位
    if (_dropdownMenu_TS) {
        [_dropdownMenu_TS hiddenCityList];
    }
    
    //训练设备
    if (_dropdownMenu_TE) {
        [_dropdownMenu_TE hiddenCityList];
    }
    
    //推荐模板
    if (_dropdownMenu_R) {
        [_dropdownMenu_R hiddenCityList];
    }
    
    
    //疗程
    if (_dropdownMenu_T) {
        [_dropdownMenu_T hiddenCityList];
    }
    
    
    //周训练频次
    if (_dropdownMenu_TF) {
        [_dropdownMenu_TF hiddenCityList];
    }
    
    
    //运动时间点
    if (_dropdownMenu_PM) {
        [_dropdownMenu_PM hiddenCityList];
    }

}

- (void)dealloc{
    
    //[self hiddenAllCityList];
    [kNotificationCenter removeObserver:self name:kHideDropDownNotification object:nil];
}


@end
