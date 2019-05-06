//
//  CustomBtn.h
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/11/13.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef  void (^dealChickOperation) (void);

@interface CustomBtn : UIButton

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) float cornerAngle;
@property (nonatomic, assign) float fontSize;

@property (nonatomic, strong) UIFont *mFont;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *backColor;

@property (nonatomic, copy) dealChickOperation block;

@end

NS_ASSUME_NONNULL_END
