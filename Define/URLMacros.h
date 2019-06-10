
//
//  URLMacros.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#ifndef URLMacros_h
#define URLMacros_h

#define kAPPKEY @"100000"
#define kSECRET @"b6c1b3c02ad45546a4f4027d3ecbfb2d"
//#define kSERVER_URL @"http://srv.coolplay.tv:8090" //服务器地址
#define kSERVER_URL @"https://health-api.coolplay.tv/" //服务器地址
#define kDOCTOR_LOGIN_URL @"/doctor/password_login"//医师登陆
#define kDOCTOR_LOGOUT_URL @"/doctor/logout"//医师退出
#define kUSER_LOGIN_URL @"/user/password_login"//病人登录
#define kQR_DOCTOR_AUTH_URL @"/qr/doctor_auth"//医师扫码授权
#define kWX_GET_QR_URL @"/wx/get_qr_url"//获取扫码地址
#define kWX_USER_INFO_URL @"/wx/user_info"//获取扫码地址
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
#define kUSER_SPORT_DETAIL_URL @"/doctor/user_sport_detail" //医师查看用户运动结果详情
#define kDOCTOR_USERINFO_MORE_URL @"/doctor/user_info_more" //医师获取用户信息(多条)
#define kDOCTOR_USERINFO_URL @"/doctor/user_info" //医师获取用户信息
#define kDOCTOR_SAVE_USERINFO_URL @"/doctor/save_user_info" //医师修改用户信息
#define kDOCTOR_USER_PRESCRIPTION_LIST_URL @"/doctor/user_prescription_list" //医师获取用户处方列表
#define kDOCTOR_USER_REPORTLIST_URL @"/doctor/user_report_list" //医师获取用户处方报告及列表
#define kDOCTOR_PRESCRIPTION_DETAIL_URL @"/doctor/prescription/detail" //医师查看处方详情
#define kDOCTOR_PRESCRIPTION_CREATE_URL @"/doctor/prescription/create" //开具新处方
#define kDOCTOR_USER_PRIVATE_DEVICE_URL @"/doctor/user_private_device" //医师获取用户私有心率带
#define kDOCTOR_CHANGE_HR_DEVICE_URL @"/doctor/change_hr_device"//医师更换用户私有心率带
#define kDOCTOR_TEMPLATE_LIST_URL @"/doctor/template/list" //处方模板列表
#define kDOCTOR_TEMPLATE_DELETE_URL @"/doctor/template/delete" //删除模板
#define kDOCTOR_TEMPLATE_UPDATE_URL @"/doctor/template/update" //更新处方模板
#define kDOCTOR_TEMPLATE_RECOMMEND_URL @"/doctor/template/recommend" //获取推荐处方模板
#define kDOCTOR_TEMPLATE_CREATE_URL @"/doctor/template/create" //创建处方模板
#define kDOCTOR_PRESCRIPTION_CREATE_URL @"/doctor/prescription/create"//开具新处方
#define kDOCTOR_TEMPLATE_INFO_URL @"/doctor/template/info" //处方模板详细信息
#define kDEVICE_TYPE_LIST_URL @"/device_type/list" //设备类型列表
#define kDEVICE_TYPE_INFO_URL @"/device_type/info" //设备类型信息
#define kDOCTOR_USER_STAMINA_TEST_URL @"/doctor/user_stamina_test" //查看用户体能测试列表
#define kDOCTOR_USER_DEVICE_MEASURE_URL @"/doctor/user_device_measure" //医生查看用户设备测试结果
#endif /* URLMacros_h */
