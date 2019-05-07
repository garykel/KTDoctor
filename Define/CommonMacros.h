
//
//  CommonMacros.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#ifndef CommonMacros_h
#define CommonMacros_h


#pragma mark ------- 微信/QQ登陆注册ID ----------
//新版本 休休商业版 对应的 id和secret
#define WXApi_ID  @"wx7c11b083c7c0d016"
#define WXApi_Secret @"7a1678f14e1d8e770c4ccb72f7f3c776"


#define WXApi_BaseUrl @"https:api.weixin.qq.com/sns"

#define WXApi_Key_AccessToken @"access_token"
#define WXApi_Key_OpenId @"openid"
#define WXApi_Key_RefreshToken @"refresh_token"


#define QQ_ID @"1106924847"
#define QQ_Secret @"D6WFjVwvcI8nFEgF"

#define GAODE_MAP_Key @"ccae558bb68b77598ac6650ec06b2594"


#pragma mark ------- 友盟  ----------

#define UMAppKey @"5bfcfc95f1f5564b3600009c"//友盟appkey



//MARK   ------ 用户信息字段 ------

//新版本使用手机号登陆的 用户信息字段
#define kIsLoginUserDefaultKey      @"xxtg_boss_isLogin_new_1.2.0-19_1_23"
#define kUserPhone                  @"xxtg_boss_userPhone"      //手机号
#define kUserSid                    @"xxtg_boss_userSid"        //sid
#define kUserSidPhone               @"xxtg_boss_userSidPhone"   //sid对应管理员电话
#define kUserNickName               @"xxtg_boss_userNickName"   //昵称
#define kUserCookie                 @"xxtg_boss_userCookie"     //webView的cookie
#define kUserAvatar                 @"xxtg_boss_userAvatar"     //头像地址
#define kUserId                     @"xxtg_boss_userId"         //用户id
#define kUserCurrentSid             @"xxtg_boss_userCurrentSid" //当前sid，我的模块可以切换店铺
#define kUserCurrentSidMobile       @"xxtg_boss_userCurrentSidMobile"    //当前sid对应的管理员电话，用于切换店铺时切换电话
#define kUserCurrentSidTelephone        @"xxtg_boss_userCurrentSidTelephone"    //当前sid对应的商户经理电话，用于切换店铺时切换商户经理电话
#define kUserShopName               @"xxtg_boss_userShopName"   //店铺名字数组
#define kUserCurrentShopName        @"xxtg_boss_userCurrentShopName" //当前所在店铺的名称
#define kUserSidTelephone           @"xxtg_boss_userSidTelephone"   //商户经理电话数组


#define kLocationTitleKey           @"xxtgLocationTitle"             //当前定位存储的key
#define kLocationDetailAddressKey   @"xxtgLocationDetailAddress"    //当前定位存储的key
#define kLocationLongitudeKey       @"xxtgLocationLongitude"             //当前定位存储的key
#define kLocationLatitudeKey        @"xxtgLocationLatitude"             //当前定位存储的key

#define kHomeIsNeedNoticeAlertFlagKey   @"xxtgHomeIsNeedNoticeAlertFlagKey" //首页是否需要弹框标记版本值的key
#define kUserOpenId                 @"xxtgBossUserOpenId"
#define kUserAccessToken            @"xxtgBossUserAccessToken"
#define kUserOpenKey                @"xxtgBossOpenKey"  //根据店铺sid设置加密机制生成的key

#define kUserIsLookedHomeGuide      @"xxtgBossUserIsLookedNHomeGuide" //是否显示过首页demo数据引导

#define kUserLoginPhone             @"xxtgBossUserLoginPhone" //
#define kUserLoginPassword          @"xxtgBossUserLoginPassword" //注册成功保存密码，用于创建店铺成功后调用登录


#pragma mark - 通知
//通知名
#define kLoginSuccessNotification   @"xxtgLoginSuccessNotification"     //登陆成功通知
#define kLogoutSuccessNotification  @"xxtgLogoutSuccessNotification"    //退出登录通知
#define kHideDropDownNotification   @"ktHideDropDownNotification"       //隐藏下拉菜单通知


#endif /* CommonMacros_h */
