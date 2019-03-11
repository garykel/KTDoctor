//
//  UserModel.m
//  CoolPlaySport
//
//  Created by duwei on 2018/6/5.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+(NSArray *)bg_uniqueKeys{
    return @[@"userId"];
}

+ (instancetype)sharedUserModel {
    static UserModel *user = nil;
    static dispatch_once_t onece;
    dispatch_once(&onece, ^{
        user = [[UserModel alloc] init];
    });
    return user;
}

- (UserModel*)getCurrentUser {
    NSString *currentUserid = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentUserId"];
    NSString *conditionStr = [NSString stringWithFormat:@"where %@ =  %@",bg_sqlKey(@"userId"),bg_sqlValue(currentUserid)];
    NSArray *users = [UserModel bg_find:@"tb_user" where:conditionStr];
    if (users.count > 0) {
        return (UserModel*)users[0];
    }else {
        return nil;
    }
}

@end
