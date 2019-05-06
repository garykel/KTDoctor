//
//  UIButton+TargetEnable.h
//  XiuXiuTuanGou
//
//  Created by 王克博 on 2019/3/5.
//  Copyright © 2019 XiuXiuTuanGou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

#define defaultInterval 0.5//默认时间间隔

@interface UIButton (TargetEnable)

@property(nonatomic,assign) NSTimeInterval timeInterval;//用这个给重复点击加间隔
@property(nonatomic,assign) BOOL isIgnoreEvent;//YES不允许点击NO允许点击

//- (void)setEnableAfterDelayOpenEnable;

@end

NS_ASSUME_NONNULL_END
