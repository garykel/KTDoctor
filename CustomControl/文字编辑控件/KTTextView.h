//
//  KTTextView.h
//  KTDoctor
//
//  Created by 张敬 on 2019/5/5.
//  Copyright © 2019年 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KTTextView : UIView<UITextViewDelegate>

@property (nonatomic, strong) UILabel *tipLab; //提示Lab
@property (nonatomic, strong) UITextView *textview; //

@property (nonatomic, assign) CGSize mSize;
@property (nonatomic, assign) NSInteger textNumber;  //字数


@end

NS_ASSUME_NONNULL_END
