//
//  UserModel.h
//  CoolPlaySport
//
//  Created by duwei on 2018/6/5.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)NSInteger schoolId;
@property (nonatomic,copy)NSString *schoolName;
@property (nonatomic,copy)NSString *loginTime;
@property (nonatomic,copy)NSString *userId;
@property (nonatomic,assign)NSInteger groupType;//1=学校管理员，2=老师
@property (nonatomic,copy)NSString *token;
@property (nonatomic,copy)NSString *username;
@property (nonatomic,copy)NSString *password;
@property (nonatomic,assign)NSInteger state;//用户状态 0 正常 1 封禁
+ (instancetype)sharedUserModel;
- (UserModel*)getCurrentUser;
@end
