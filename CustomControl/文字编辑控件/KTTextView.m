//
//  KTTextView.m
//  KTDoctor
//
//  Created by 张敬 on 2019/5/5.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "KTTextView.h"

@interface KTTextView()



@end


@implementation KTTextView

- (instancetype)init{
    
    self = [super init];
    if (self) {
      
        [self addSubview:self.textview];
        [self addSubview:self.tipLab];
        [self addShadowAndCircleCorner:self.layer corner:2];
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _textview.size = self.size;
    _textview.mj_x = 0;
    _textview.mj_y = 0;
    
    _tipLab.size = CGSizeMake([self fitSize:50], [self fitSize:13]);
    _tipLab.mj_x = self.width - _tipLab.width - 10;
    _tipLab.mj_y = self.height - _tipLab.height - 5;
}


#pragma mark - delegate methods

//当编辑时动态判断是否超过规定字数，这里限制20字
- (void)textViewDidChange:(UITextField *)textView{
    
    if (textView.text.length > _textNumber) {
        textView.text = [textView.text substringToIndex:_textNumber];
    }
    //这里的_strLengthLbl为动态显示已输入字数，可按情况添加
    _tipLab.text = [NSString stringWithFormat:@"%lu/%ld",textView.text.length, _textNumber];
}


#pragma mark  - setter and getter

- (UITextView *)textview{
    if (!_textview) {
        _textview = [UITextView new];
        _textview.delegate = self;
        _textview.backgroundColor = mDefindColor;
    }
    return _textview;
}

- (UILabel *)tipLab{
    if (!_tipLab) {
        _tipLab = [UILabel makeLabelWithFrame:CGRectZero text:@"" textColor:UIColorFromRGB(0x999999) font:mFont([self fitSize:12]) textAliment:NSTextAlignmentRight bgColor:KClearColor];
    }
    return _tipLab;
}


- (void)setTextNumber:(NSInteger)textNumber{
    _textNumber = textNumber;
    _tipLab.text = [NSString stringWithFormat:@"0/%ld",_textNumber];
}


@end
