//
//  AutoLayerMacros.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/28.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#ifndef AutoLayerMacros_h
#define AutoLayerMacros_h

#pragma mark - 获取屏幕宽高
#define KScreenWidth            ([[UIScreen mainScreen] bounds].size.width)
#define KScreenHeight           [[UIScreen mainScreen] bounds].size.height

#pragma mark - 根据ip6的屏幕来拉伸

//当前设备宽度与iphone6宽度比例
#define kRatioWidth             KScreenWidth/375.0

//适配5s小屏幕手机尺寸
#define kRatioWidth_ipad        XXTG_ISIpad ? 1.0 : KScreenWidth/375.0

//判断设备类型是否iPhoneX系列
#define XXTG_ISIphoneX    ((KScreenWidth >= 375.f && KScreenHeight >= 812.f && XXTG_ISIpad  == NO)  ? YES : NO)

//判断设备是否是iPad
#define XXTG_ISIpad (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)

//导航栏高度
#define XXTG_NavBarHeight (XXTG_ISIphoneX ? 88.f : 64.f)
//#define XXTG_NavBarHeight 60.f


//状态栏高度
#define XXTG_StatusBarHeight (XXTG_ISIphoneX ? 44.f : 20.f)
#define XXTG_StatusBarHeight_Define (XXTG_ISIphoneX ? 34.f : 20.f)

//导航栏内容高度
#define XXTG_NavBarContentHeight (XXTG_ISIphoneX ? 54.f : 44.f)

//底部tabbar高度
#define XXTG_TabBarHeight (XXTG_ISIphoneX ? 83.f : 49.f)

//底部高度，如果是iPhone X 高度为34，其他为0
#define XXTG_SafeAreaBottomHeight (XXTG_ISIphoneX ? 34.f : 0)


#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kStatusBarHeight    [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight       self.navigationController.navigationBar.frame.size.height
#define kStatusBarTopMargin [[UIApplication sharedApplication] statusBarFrame].origin.y
#define kTopHeight          (kStatusBarHeight + kNavBarHeight + kStatusBarTopMargin)
#define kTabBarHeight       ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

#define kNavView_TopMargin 20
#define kNavView_Height 60

#define kIpadMiniSize CGSizeMake(1024, 768)
#define kXScal (kWidth / kIpadMiniSize.width)
#define kYScal (kHeight / kIpadMiniSize.height)

//iPhone X
#define IS_IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#endif /* AutoLayerMacros_h */
