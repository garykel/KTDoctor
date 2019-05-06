//
//  OpenAerobicPrescriptionCell.m
//  KTDoctor
//
//  Created by 张敬 on 2019/4/30.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "OpenAerobicPrescriptionCell.h"

@interface OpenAerobicPrescriptionCell()<XXTGDropdownMenuDelegate>

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *canvasView;

@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, strong) UIButton *deleteBtn;

@end


@implementation OpenAerobicPrescriptionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addSubview:self.backView];
        [self addSubview:self.canvasView];
        
    }
    return self;
}


#pragma mark - response methods

//MARK:  - LMJDropdownMenu Delegate
- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string // 当选择某个选项时调用
{
    
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

#pragma mark - setter and getter methods

//footerBackView
- (UIView *)backView{
    
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.size = CGSizeMake(KScreenWidth - 40, [self fitSize:133]);
        _backView.mj_x = 20;
        _backView.mj_y = 0;
        _backView.backgroundColor = mDefindColor;
    }
    return _backView;
}

//canvasView
- (UIView *)canvasView{
    
    if (!_canvasView) {
        _canvasView = [[UIView alloc] init];
        _canvasView.size = CGSizeMake(KScreenWidth - 106, [self fitSize:118]);
        _canvasView.mj_x = 36;
        _canvasView.mj_y = [self fitSize:15];
        _canvasView.backgroundColor = mCanvasColor;
        [self addShadowAndCircleCorner:_canvasView.layer corner:5];
        
        
        //第几组
        [_canvasView addSubview:self.groupLab];

        
        //强度百分比
        [_canvasView addSubview:self.percentStrengthLab];
        [_canvasView addSubview:self.percentStrengthGapLab];
        [_canvasView addSubview:self.icon];
        [_canvasView addSubview:self.dropdownMenu_PSL];
        [_canvasView addSubview:self.dropdownMenu_PSR];


        //训练时长
        [_canvasView addSubview:self.trainingTimeLab];
        [_canvasView addSubview:self.trainingTimeGapLab];
        [_canvasView addSubview:self.dropdownMenu_TTL];
        [_canvasView addSubview:self.dropdownMenu_TTR];

        //强度
        [_canvasView addSubview:self.strengthLab];
        [_canvasView addSubview:self.dropdownMenu_ST];


        //RPE区间
        [_canvasView addSubview:self.RPELab];
        [_canvasView addSubview:self.RPEGapLab];
        [_canvasView addSubview:self.dropdownMenu_RPEL];
        [_canvasView addSubview:self.dropdownMenu_RPER];


        //组间休息
        [_canvasView addSubview:self.restTimeLab];
        [_canvasView addSubview:self.restTimeGapLab];
        [_canvasView addSubview:self.dropdownMenu_RTL];
        [_canvasView addSubview:self.dropdownMenu_RTR];

    }
    return _canvasView;
}

//第几组
- (UILabel *)groupLab{
    if (!_groupLab) {
        _groupLab = [self createLabel];
        _groupLab.textColor = UIColorFromRGB(0x0FAAC9);
        _groupLab.text = @"第一组";
        _groupLab.font = mFont([self fitSize:17]);
    }
    return _groupLab;
}

//强度百分比
- (UILabel *)percentStrengthLab{
    if (!_percentStrengthLab) {
        _percentStrengthLab = [self createLabel];
        _percentStrengthLab.text = @"强度百分比";
        [_percentStrengthLab sizeToFit];

    }
    return _percentStrengthLab;
}


- (UILabel *)percentStrengthGapLab{
    if (!_percentStrengthGapLab) {
        _percentStrengthGapLab = [self createLabel];
        _percentStrengthGapLab.text = @"～";
        _percentStrengthGapLab.width = [self fitSize:25];
        _percentStrengthGapLab.textAlignment = NSTextAlignmentCenter;
        
    }
    return _percentStrengthGapLab;
}


- (UIImageView *)icon{
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.size = CGSizeMake([self fitSize:13], [self fitSize:13]);
        _icon.image = [UIImage imageNamed:@"difficulty"];
    }
    return _icon;
}


- (KTDropDownMenus *)dropdownMenu_PSL
{
    if (!_dropdownMenu_PSL) {
        
        _dropdownMenu_PSL = [[KTDropDownMenus alloc] init];
        _dropdownMenu_PSL.size = CGSizeMake([self fitSize:60], [self fitSize:20]);
        
        [_dropdownMenu_PSL setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_PSL.titles = self.titles_PSL;
        _dropdownMenu_PSL.delegate = self;
    }
    return _dropdownMenu_PSL;
}


- (KTDropDownMenus *)dropdownMenu_PSR
{
    if (!_dropdownMenu_PSR) {
        
        _dropdownMenu_PSR = [[KTDropDownMenus alloc] init];
        _dropdownMenu_PSR.size = CGSizeMake([self fitSize:60], [self fitSize:20]);
        [_dropdownMenu_PSR setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_PSR.titles = self.titles_PSR;
        _dropdownMenu_PSR.delegate = self;
    }
    return _dropdownMenu_PSR;
}



- (NSMutableArray *)titles_PSR{
    if (!_titles_PSR) {
        _titles_PSR = [NSMutableArray array];
        for (NSInteger i = 1; i <= 20; i++) {
            
            NSString * str = [NSString stringWithFormat:@"%ld", i*5];
            [_titles_PSR addObject:str];
        }
    }
    return _titles_PSR;
}


- (NSMutableArray *)titles_PSL{
    if (!_titles_PSL) {
        _titles_PSL = [NSMutableArray array];
        for (NSInteger i = 1; i <= 20; i++) {
            
            NSString * str = [NSString stringWithFormat:@"%ld", i*5];
            [_titles_PSL addObject:str];
        }
    }
    return _titles_PSL;
}


//训练时长
- (UILabel *)trainingTimeLab{
    if (!_trainingTimeLab) {
        _trainingTimeLab = [self createLabel];
        _trainingTimeLab.text = @"训练时长";
        [_trainingTimeLab sizeToFit];

    }
    return _trainingTimeLab;
}

- (UILabel *)trainingTimeGapLab{
    if (!_trainingTimeGapLab) {
        _trainingTimeGapLab = [self createLabel];
        _trainingTimeGapLab.text = @"min";
        _trainingTimeGapLab.width = [self fitSize:40];
        _trainingTimeGapLab.textAlignment = NSTextAlignmentCenter;
        
    }
    return _trainingTimeGapLab;
}


- (KTDropDownMenus *)dropdownMenu_TTL
{
    if (!_dropdownMenu_TTL) {
        
        _dropdownMenu_TTL = [[KTDropDownMenus alloc] init];
        _dropdownMenu_TTL.size = CGSizeMake([self fitSize:45], [self fitSize:20]);
        
        [_dropdownMenu_TTL setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_TTL.titles = self.titles_TTL;
        _dropdownMenu_TTL.delegate = self;
    }
    return _dropdownMenu_TTL;
}


- (KTDropDownMenus *)dropdownMenu_TTR
{
    if (!_dropdownMenu_TTR) {
        
        _dropdownMenu_TTR = [[KTDropDownMenus alloc] init];
        _dropdownMenu_TTR.size = CGSizeMake([self fitSize:45], [self fitSize:20]);
        [_dropdownMenu_TTR setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_TTR.titles = self.titles_TTR;
        _dropdownMenu_TTR.delegate = self;
    }
    return _dropdownMenu_TTR;
}


- (NSMutableArray *)titles_TTL{
    if (!_titles_TTL) {
        _titles_TTL = [NSMutableArray array];
        for (NSInteger i = 0; i <60; i++) {
            
            NSString * str = [NSString stringWithFormat:@"%ld", i];
            [_titles_TTL addObject:str];
        }
    }
    return _titles_TTL;
}


- (NSMutableArray *)titles_TTR{
    if (!_titles_TTR) {
        _titles_TTR = [NSMutableArray array];
        for (NSInteger i = 0; i <60; i++) {
            
            NSString * str = [NSString stringWithFormat:@"%ld", i];
            [_titles_TTR addObject:str];
        }
    }
    return _titles_TTR;
}



//强度
- (UILabel *)strengthLab{
    if (!_strengthLab) {
        _strengthLab = [self createLabel];
        _strengthLab.text = @"强   度";
        [_strengthLab sizeToFit];

    }
    return _strengthLab;
}

- (KTDropDownMenus *)dropdownMenu_ST
{
    if (!_dropdownMenu_ST) {
        
        _dropdownMenu_ST = [[KTDropDownMenus alloc] init];
        _dropdownMenu_ST.size = CGSizeMake([self fitSize:45], [self fitSize:20]);
        
        [_dropdownMenu_ST setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_ST.titles = self.titles_ST;
        _dropdownMenu_ST.delegate = self;
    }
    return _dropdownMenu_ST;
}

- (NSMutableArray *)titles_ST{
    if (!_titles_ST) {
        _titles_ST = [NSMutableArray array];
        for (NSInteger i = 1; i < 17; i++) {
            
            NSString * str = [NSString stringWithFormat:@"%ld", i];
            [_titles_ST addObject:str];
        }
    }
    return _titles_ST;
}


//RPE区间
- (UILabel *)RPELab{
    if (!_RPELab) {
        _RPELab = [self createLabel];
        _RPELab.text = @"RPE区间";
        [_RPELab sizeToFit];

    }
    return _RPELab;
}

- (UILabel *)RPEGapLab{
    if (!_RPEGapLab) {
        _RPEGapLab = [self createLabel];
        _RPEGapLab.text = @"～";
        _RPEGapLab.width = [self fitSize:25];
        _RPEGapLab.textAlignment = NSTextAlignmentCenter;
        
    }
    return _RPEGapLab;
}


- (KTDropDownMenus *)dropdownMenu_RPEL
{
    if (!_dropdownMenu_RPEL) {
        
        _dropdownMenu_RPEL = [[KTDropDownMenus alloc] init];
        _dropdownMenu_RPEL.size = CGSizeMake([self fitSize:60], [self fitSize:20]);
        [_dropdownMenu_RPEL setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_RPEL.titles = self.titles_RPEL;
        _dropdownMenu_RPEL.delegate = self;
    }
    return _dropdownMenu_RPEL;
}


- (KTDropDownMenus *)dropdownMenu_RPER
{
    if (!_dropdownMenu_RPER) {
        
        _dropdownMenu_RPER = [[KTDropDownMenus alloc] init];
        _dropdownMenu_RPER.size = CGSizeMake([self fitSize:60], [self fitSize:20]);
        [_dropdownMenu_RPER setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_RPER.titles = self.titles_RPER;
        _dropdownMenu_RPER.delegate = self;
    }
    return _dropdownMenu_RPER;
}

- (NSMutableArray *)titles_RPEL{
    if (!_titles_RPEL) {
        _titles_RPEL = [NSMutableArray array];
        for (NSInteger i = 0; i < 20; i++) {
            
            NSString * str = [NSString stringWithFormat:@"%.2f", i*0.5];
            [_titles_RPEL addObject:str];
        }
    }
    return _titles_RPEL;
}


- (NSMutableArray *)titles_RPER{
    if (!_titles_RPER) {
        _titles_RPER = [NSMutableArray array];
        for (NSInteger i = 1; i < 17; i++) {
            
            NSString * str = [NSString stringWithFormat:@"%.2f", i*0.5];
            [_titles_RPER addObject:str];
        }
    }
    return _titles_RPER;
}


//组间休息
- (UILabel *)restTimeLab{
    if (!_restTimeLab) {
        _restTimeLab = [self createLabel];
        _restTimeLab.text = @"组间休息";
        [_restTimeLab sizeToFit];
    }
    return _restTimeLab;
}

- (UILabel *)restTimeGapLab{
    if (!_restTimeGapLab) {
        _restTimeGapLab = [self createLabel];
        _restTimeGapLab.text = @"min";
        _restTimeGapLab.width = [self fitSize:40];
        _restTimeGapLab.textAlignment = NSTextAlignmentCenter;
        
    }
    return _restTimeGapLab;
}


- (KTDropDownMenus *)dropdownMenu_RTL
{
    if (!_dropdownMenu_RTL) {
        
        _dropdownMenu_RTL = [[KTDropDownMenus alloc] init];
        _dropdownMenu_RTL.size = CGSizeMake([self fitSize:45], [self fitSize:20]);
        
        [_dropdownMenu_RTL setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_RTL.titles = self.titles_RTL;
        _dropdownMenu_RTL.delegate = self;
    }
    return _dropdownMenu_RTL;
}


- (KTDropDownMenus *)dropdownMenu_RTR
{
    if (!_dropdownMenu_RTR) {
        
        _dropdownMenu_RTR = [[KTDropDownMenus alloc] init];
        _dropdownMenu_RTR.size = CGSizeMake([self fitSize:45], [self fitSize:20]);
        [_dropdownMenu_RTR setDropdownHeight:[self fitSize:30]];
        
        _dropdownMenu_RTR.titles = self.titles_RTR;
        _dropdownMenu_RTR.delegate = self;
    }
    return _dropdownMenu_RTR;
}


- (NSMutableArray *)titles_RTL{
    if (!_titles_RTL) {
        _titles_RTL = [NSMutableArray array];
        for (NSInteger i = 0; i <10; i++) {
            
            NSString * str = [NSString stringWithFormat:@"%ld", i];
            [_titles_RTL addObject:str];
        }
    }
    return _titles_RTL;
}


- (NSMutableArray *)titles_RTR{
    if (!_titles_RTR) {
        _titles_RTR = [NSMutableArray array];
        for (NSInteger i = 0; i <60; i++) {
            
            NSString * str = [NSString stringWithFormat:@"%ld", i];
            [_titles_RTR addObject:str];
        }
    }
    return _titles_RTR;
}


- (UIButton *)addBtn{
    if (!_addBtn) {
       
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBtn.size = CGSizeMake([self fitSize:18], [self fitSize:18]);
        [_addBtn setImage:[UIImage imageNamed:@"addGroup"] forState:UIControlStateNormal];
        
        kWeakSelf(self);
        _addBtn.block = ^(UIButton *btn) {
            
        };
    }
    return _addBtn;
}

- (UIButton *)deleteBtn{
    if (!_deleteBtn) {
        
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteBtn.size = CGSizeMake([self fitSize:18], [self fitSize:18]);
        [_deleteBtn setImage:[UIImage imageNamed:@"removeGroup"] forState:UIControlStateNormal];
        
        kWeakSelf(self);
        _deleteBtn.block = ^(UIButton *btn) {
            
        };
    }
    return _deleteBtn;
}

#pragma mark - other methods
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat gap = (_backView.width - 30)/4.0;
    CGFloat dropdownMenu_gap = 2.0;

    
    //第几组
    _groupLab.mj_x = 15;
    _groupLab.mj_y = 15;
    
    //强度百分比
    _percentStrengthLab.mj_x = 15;
    _percentStrengthLab.mj_y = _groupLab.bottom + [self fitSize:18];

    _icon.mj_x = _percentStrengthLab.right + 5;
    _icon.mj_y = _percentStrengthLab.mj_y + 2;
    
    _dropdownMenu_PSL.mj_x = _icon.right + 20;
    _dropdownMenu_PSL.mj_y = _percentStrengthLab.mj_y - dropdownMenu_gap;
    
    _percentStrengthGapLab.mj_x = _dropdownMenu_PSL.right ;
    _percentStrengthGapLab.mj_y = _percentStrengthLab.mj_y + 2;

    _dropdownMenu_PSR.mj_x = _percentStrengthGapLab.right;
    _dropdownMenu_PSR.mj_y = _percentStrengthLab.mj_y - dropdownMenu_gap;

    
    //训练时长
    _trainingTimeLab.mj_x = 15 + gap*1.5;
    _trainingTimeLab.mj_y = _percentStrengthLab.mj_y;
    
    _dropdownMenu_TTL.mj_x = _trainingTimeLab.right + 20;
    _dropdownMenu_TTL.mj_y = _percentStrengthLab.mj_y - dropdownMenu_gap;
    
    _trainingTimeGapLab.mj_x = _dropdownMenu_TTL.right ;
    _trainingTimeGapLab.mj_y = _percentStrengthLab.mj_y + 2;
    
    _dropdownMenu_TTR.mj_x = _trainingTimeGapLab.right;
    _dropdownMenu_TTR.mj_y = _percentStrengthLab.mj_y - dropdownMenu_gap;
    
    
    //强度
    _strengthLab.mj_x = 15 + 3*gap;
    _strengthLab.mj_y = _percentStrengthLab.mj_y;
    
    _dropdownMenu_ST.mj_x = _strengthLab.right + 20 ;
    _dropdownMenu_ST.mj_y = _percentStrengthLab.mj_y - dropdownMenu_gap;
    
    //RPE区间
    _RPELab.mj_x = _percentStrengthLab.mj_x;
    _RPELab.mj_y = _percentStrengthLab.bottom + [self fitSize:26];
    
    _dropdownMenu_RPEL.mj_x = _icon.right + 20;
    _dropdownMenu_RPEL.mj_y = _RPELab.mj_y - dropdownMenu_gap;
    
    _RPEGapLab.mj_x = _dropdownMenu_RPEL.right ;
    _RPEGapLab.mj_y = _RPELab.mj_y + 2;
    
    _dropdownMenu_RPER.mj_x = _RPEGapLab.right;
    _dropdownMenu_RPER.mj_y = _RPELab.mj_y - dropdownMenu_gap;

    
    //组间休息
    _restTimeLab.mj_x = _trainingTimeLab.mj_x;
    _restTimeLab.mj_y = _RPELab.mj_y;
    
    _dropdownMenu_RTL.mj_x = _restTimeLab.right + 20;
    _dropdownMenu_RTL.mj_y = _restTimeLab.mj_y - dropdownMenu_gap;
    
    _restTimeGapLab.mj_x = _dropdownMenu_RTL.right ;
    _restTimeGapLab.mj_y = _restTimeLab.mj_y +2;
    
    _dropdownMenu_RTR.mj_x = _restTimeGapLab.right;
    _dropdownMenu_RTR.mj_y = _restTimeLab.mj_y - dropdownMenu_gap;
}

- (void)dealloc{
    
    //强度百分比
    if (_dropdownMenu_PSL) {
        [_dropdownMenu_PSL hiddenCityList];
    }
    
    if (_dropdownMenu_PSR) {
        [_dropdownMenu_PSR hiddenCityList];
    }
    
    
    //训练时长
    if (_dropdownMenu_TTL) {
        [_dropdownMenu_TTL hiddenCityList];
    }
    
    if (_dropdownMenu_TTR) {
        [_dropdownMenu_TTR hiddenCityList];
    }


    //强度
    if (_dropdownMenu_ST) {
        [_dropdownMenu_ST hiddenCityList];
    }
    


    //RPE区间
    if (_dropdownMenu_RPEL) {
        [_dropdownMenu_RPEL hiddenCityList];
    }
    
    if (_dropdownMenu_RPER) {
        [_dropdownMenu_RPER hiddenCityList];
    }


    //组间休息
    if (_dropdownMenu_RTL) {
        [_dropdownMenu_RTL hiddenCityList];
    }
    
    if (_dropdownMenu_RTR) {
        [_dropdownMenu_RTR hiddenCityList];
    }

}


@end
