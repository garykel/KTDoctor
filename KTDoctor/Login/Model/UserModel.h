//
//  UserModel.h
//  CoolPlaySport
//
//  Created by duwei on 2018/6/5.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic,copy)NSString *birthdate;
@property (nonatomic,copy)NSString *email;
@property (nonatomic,copy)NSString *headUrl;
@property (nonatomic,copy)NSString *mobile;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,strong)NSDictionary *organ;
@property (nonatomic,copy)NSString *sex;
@property (nonatomic,copy)NSString *speciality;
@property (nonatomic,copy)NSString *token;
@property (nonatomic,copy)NSString *password;
@property (nonatomic,copy)NSString *userId;
@property (nonatomic,assign)NSInteger state;//用户状态 0 正常 1 封禁
+ (instancetype)sharedUserModel;
- (UserModel*)getCurrentUser;
@end
