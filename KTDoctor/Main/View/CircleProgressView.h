//
//  CircleProgressView.h
//  CircleProgressView
//
//  Created by garychen on 2019/7/3.
//  Copyright © 2019年 garychen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CircleProgressView : UIView
- (instancetype)initWithFrame:(CGRect)frame percent:(NSInteger)percent color:(UIColor*)color;
@end

NS_ASSUME_NONNULL_END
