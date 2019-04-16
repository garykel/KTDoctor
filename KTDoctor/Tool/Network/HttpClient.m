//
//  HttpClient.m
//  CoolPlaySport
//
//  Created by duwei on 2018/6/1.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import "HttpClient.h"
#import "AFURLRequestSerialization.h"
#import "NSString+CPSignature.h"
#import "NSString+TimeConvert.h"
#import "DEFIN.h"
#import "AFHTTPSessionManager.h"
#import "UserModel.h"

static const NSString * POST_METHOD = @"POST";
static const NSString * PUT_METHOD =  @"PUT";
static const NSString * DEL_METHOD =  @"DELETE";
static const NSString * GET_METHOD =  @"GET";

static const NSString * LOADING =  @"加载中";
static const NSString * SUCCEEDSTR = @"加载成功";
static const NSString * ERROR_NET = @"网络连接失败";
@implementation HttpClient

+ (AFHTTPSessionManager *)sharedSessionManager {
    
    static dispatch_once_t once;
    static AFHTTPSessionManager *manager = nil;
    dispatch_once(&once, ^{
        manager = [AFHTTPSessionManager manager];
        
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = 10.0;
        // 设置返回格式
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",nil];
        //        [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        //        manager.responseSerializer.acceptableContentTypes=[[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
        //        [manager setSecurityPolicy:[self customSecurityPolicy]];
    });
    
    return manager;
}

/** 发送一个网络请求 */
+ (void)sendRequestWithURL:(NSString *)url
                    method:(NSString *)method
                    params:(NSDictionary *)params
                   success:(void (^)(NSDictionary *responseObject))success
                   failure:(void (^)(NSError *error))failure
{
    
    if ([method isEqualToString:POST_METHOD]) {
        [self postJSONWithUrl:url parameters:params success:success fail:failure];
    }
    if ([method isEqualToString:PUT_METHOD]) {
        [self putJsonWithUrl:url parameters:url success:success fail:failure];
    }
    if ([method isEqualToString:DEL_METHOD]) {
        [self deleteJsonWithUrl:url parameters:params success:success fail:failure];
    }
    if ([method isEqualToString:GET_METHOD]) {
        [self getJsonWithUrl:url parameters:params success:success fail:failure];
    }
}


+ (void)postJSONWithUrl:(NSString *)urlStr parameters:(id)parameters success:(void (^)(NSDictionary* responseObject))success fail:(void (^)(NSError *))fail
{
    
    AFHTTPSessionManager *manager = [HttpClient sharedSessionManager];
    NSString *token = @"";
    UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
    if (user) {
        token = [user valueForKey:@"token"];
    }
    NSString *signatureString = [[NSString signtureWithDict:parameters token:token] lowercaseString];
    NSLog(@"signature value:%@",signatureString);
    NSString *timestamp = [NSString obtainCurrentDateUTCTimeString];
    NSString *authString = [NSString stringWithFormat:@"sports-auth-v2/%@/%@/%@",kAPPKEY,timestamp,signatureString];
    NSLog(@"authString:%@",authString);
    
    [manager.requestSerializer setValue:authString forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    [manager POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary *jsonObject=[NSJSONSerialization
                                      JSONObjectWithData:responseObject
                                      options:NSJSONReadingMutableLeaves
                                      error:nil];
            success(jsonObject);
        } else{
            //            DLog(@"error = %@", responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
    
}

+ (void)postJSONWithUrl:(NSString *)urlStr
             parameters:(id)parameters
               progress:(void (^)(NSProgress* progress))progress
                success:(void (^)(NSDictionary* responseObject))success
                   fail:(void (^)(NSError *error))fail {
    AFHTTPSessionManager *manager = [HttpClient sharedSessionManager];
    NSString *token = @"";
    UserModel *user = [[UserModel sharedUserModel] getCurrentUser];
    if (user) {
        token = [user valueForKey:@"token"];
    }
    NSString *signatureString = [[NSString signtureWithDict:parameters token:token] lowercaseString];
    NSLog(@"signature value:%@",signatureString);
    NSString *timestamp = [NSString obtainCurrentDateUTCTimeString];
    NSString *authString = [NSString stringWithFormat:@"sports-auth-v2/%@/%@/%@",kAPPKEY,timestamp,signatureString];
    NSLog(@"authString:%@",authString);
    
    [manager.requestSerializer setValue:authString forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    [manager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSString *filePath = [parameters valueForKey:@"file"];
        NSLog(@"filePath :%@",filePath);
        UIImage *image  = [[UIImage alloc] initWithContentsOfFile:filePath];
        NSData *data = UIImagePNGRepresentation(image);
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // 设置时间格式
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
        [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary *jsonObject=[NSJSONSerialization
                                      JSONObjectWithData:responseObject
                                      options:NSJSONReadingMutableLeaves
                                      error:nil];
            success(jsonObject);
        } else{
            //            DLog(@"error = %@", responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
}

+ (void)getJsonWithUrl:(NSString *)urlStr
            parameters:(id)parameters
               success:(void (^)(NSDictionary* responseObject))success
                  fail:(void (^)(NSError *error))fail{
    
    [[HttpClient sharedSessionManager] GET:urlStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary *jsonObject=[NSJSONSerialization
                                      JSONObjectWithData:responseObject
                                      options:NSJSONReadingMutableLeaves
                                      error:nil];
            success(jsonObject);
        } else{
            //            DLog(@"error = %@", responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
}

+ (void)putJsonWithUrl:(NSString *)urlStr
            parameters:(id)parameters
               success:(void (^)(NSDictionary* responseObject))success
                  fail:(void (^)(NSError *error))fail{
    
    [[HttpClient sharedSessionManager] PUT:urlStr parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary *jsonObject=[NSJSONSerialization
                                      JSONObjectWithData:responseObject
                                      options:NSJSONReadingMutableLeaves
                                      error:nil];
            success(jsonObject);
        } else{
            //DLog(@"error = %@", responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
    
}

+ (void)deleteJsonWithUrl:(NSString *)urlStr
               parameters:(id)parameters
                  success:(void (^)(NSDictionary* responseObject))success
                     fail:(void (^)(NSError *error))fail{
    
    
    [[HttpClient sharedSessionManager] DELETE:urlStr parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary *jsonObject=[NSJSONSerialization
                                      JSONObjectWithData:responseObject
                                      options:NSJSONReadingMutableContainers
                                      error:nil];
            success(jsonObject);
        } else{
            //DLog(@"error = %@", responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
}

+(void)postMultipartFormRequest:(NSString *)urlStr
                           data:(NSData *)data
                     parameters:(id)parameters
                        success:(void (^)(NSDictionary *))success
                           fail:(void (^)(NSError *))fail{
    
    [[HttpClient sharedSessionManager] POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:@"Image" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary *jsonObject=[NSJSONSerialization
                                      JSONObjectWithData:responseObject
                                      options:NSJSONReadingMutableContainers
                                      error:nil];
            NSLog(@"jsonObject is %@",jsonObject);
            success(jsonObject);
        } else{
            // DLog(@"error = %@", responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
}


@end
