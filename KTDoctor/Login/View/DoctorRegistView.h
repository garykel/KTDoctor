//
//  DoctorRegistView.h
//  KTDoctor
//
//  Created by duwei on 2019/3/18.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger {
    DoctorRegistPopView = 0,//医师注册
    DoctorModifyInfoPopView //修改医师资料
} DocotorReistPopViewType;
@interface DoctorRegistView : UIView
- (instancetype)initWithFrame:(CGRect)frame basicInfo:(NSDictionary*)basicInfo type:(DocotorReistPopViewType)type;
- (void)show;
@end
