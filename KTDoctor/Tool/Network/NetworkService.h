//
//  NetworkService.h
//  CoolPlaySport
//
//  Created by duwei on 2018/6/1.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkService : NSObject

/**
 *  创建网络服务
 *
 *  @return 网络服务(单例)
 */
+(instancetype)sharedInstance;

/**
 *  网络请求
 *
 *  @param url     请求url
 *  @param params  参数
 *  @param success 成功
 *  @param fail    失败
 */
-(void)requestWithUrl:(NSString *)url
            andParams:(NSDictionary *)params
           andSucceed:(void (^)(NSDictionary* responseObject))success
             andFaild:(void (^)(NSError *error))fail;

/**
 *  网络请求
 *
 *  @param url     请求url
 *  @param params  参数
 *  @param progress 进度
 *  @param success 成功
 *  @param fail    失败
 */
-(void)requestWithUrl:(NSString *)url
            andParams:(NSDictionary *)params
          andProgress:(void (^)(NSProgress * progress))progress
           andSucceed:(void (^)(NSDictionary* responseObject))success
             andFaild:(void (^)(NSError *error))fail;
@end
