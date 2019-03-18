//
//  RegistOrResetView.h
//  KTDoctor
//
//  Created by garychen on 2019/3/14.
//  Copyright © 2019年 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSInteger {
    RegistPopView = 0,
    ResetPopView
} CustomAlertPopViewType;

@interface RegistOrResetView : UIView
- (instancetype)initWithFrame:(CGRect) frame title:(NSString*)title endTitle:(NSString*)endTitle type:(CustomAlertPopViewType)type;

- (void)show;
@end
