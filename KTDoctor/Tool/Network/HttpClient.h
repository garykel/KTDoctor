//
//  HttpClient.h
//  CoolPlaySport
//
//  Created by duwei on 2018/6/1.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpClient : NSObject

/**
 *  发送网络请求
 *
 *  @param url     请求URL
 *  @param method  请求方式(GET/POST)
 *  @param params  请求参数
 *  @param success 请求成功时的回调
 *  @param failure 请求失败时的回调
 */
+ (void)sendRequestWithURL:(NSString *)url
                    method:(NSString *)method
                    params:(NSDictionary *)params
                   success:(void (^)(NSDictionary *responseObject))success
                   failure:(void (^)(NSError *error))failure;

+ (void)postJSONWithUrl:(NSString *)urlStr
             parameters:(id)parameters
                success:(void (^)(NSDictionary* responseObject))success
                   fail:(void (^)(NSError *error))fail;

+ (void)postJSONWithUrl:(NSString *)urlStr
             parameters:(id)parameters
               progress:(void (^)(NSProgress* progress))progress
                success:(void (^)(NSDictionary* responseObject))success
                   fail:(void (^)(NSError *error))fail;

+ (void)getJsonWithUrl:(NSString *)urlStr
            parameters:(id)parameters
               success:(void (^)(NSDictionary* responseObject))success
                  fail:(void (^)(NSError *error))fail;

+ (void)putJsonWithUrl:(NSString *)urlStr
            parameters:(id)parameters
               success:(void (^)(NSDictionary* responseObject))success
                  fail:(void (^)(NSError *error))fail;

+ (void)deleteJsonWithUrl:(NSString *)urlStr
               parameters:(id)parameters
                  success:(void (^)(NSDictionary* responseObject))success
                     fail:(void (^)(NSError *error))fail;

@end
