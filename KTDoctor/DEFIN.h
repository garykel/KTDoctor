//
//  DEFIN.h
//  KTDoctor
//
//  Created by duwei on 2019/3/11.
//  Copyright © 2019 dz. All rights reserved.
//

#ifndef DEFIN_h
#define DEFIN_h

#define kAPPKEY @"100000"
#define kSECRET @"b6c1b3c02ad45546a4f4027d3ecbfb2d"
//#define kSERVER_URL @"http://srv.coolplay.tv:8090" //服务器地址
#define kSERVER_URL @"https://health-api.coolplay.tv/" //服务器地址
#define kDOCTOR_LOGIN_URL @"/doctor/password_login"//医师登陆
#define kSEND_SMS_URL @"/send_sms"//发送短信验证码
#define kSMS_LOGIN_URL @"/doctor/sms_login"//短信验证码登录
#define kMODIFY_PASSWORD_URL @"/doctor/modify_password"//医师修改密码
#define kDOCTOR_REGISTER_URL @"/doctor/register"//医师注册
#define kUPLOAD_IMAGE_URL @"/file/upload_image"//上传图片
#define kUNBIND_HR_DEVICE @"/doctor/unbind_hr_device"//解绑心率设备
#define kDOCTOR_USERLIST_URL @"/doctor/user_list" //医师管理的用户列表
#define kDOCTOR_AVAILABLE_DEVICE_URL @"/doctor/available_device" //搜索可用的设备
#define kDOCTOR_BIND_HRDEVICE_URL @"/doctor/bind_hr_device" //绑定心率带设备
#define kDOCTOR_USER_SPORTLIST_URL @"/doctor/user_sport_list" //医师查看用户历史运动列表
#endif /* DEFIN_h */
