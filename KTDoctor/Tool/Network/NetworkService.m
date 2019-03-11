//
//  NetworkService.m
//  CoolPlaySport
//
//  Created by duwei on 2018/6/1.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import "NetworkService.h"
#import "HttpClient.h"

static const NSString * POST_METHOD = @"POST";
static const NSString * PUT_METHOD =  @"PUT";
static const NSString * DEL_METHOD =  @"DELETE";
static const NSString * GET_METHOD =  @"GET";

static const NSString * LOADING =  @"加载中";
static const NSString * SUCCEEDSTR = @"加载成功";
static const NSString * ERROR_NET = @"网络连接失败";

@interface NetworkService()

/** 网络请求客户端 */
@property (nonatomic, strong) HttpClient *restClient;

@end

@implementation NetworkService

/** 创建网络服务 */
+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static NetworkService *sharedInstance = nil;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - 懒加载

-(HttpClient *)restClient
{
    if (_restClient == nil) {
        _restClient = [[HttpClient alloc] init];
    }
    return _restClient;
}

#pragma mark - 网络请求
-(void)requestWithUrl:(NSString *)url
            andParams:(NSDictionary *)params
           andSucceed:(void (^)(NSDictionary* responseObject))success
             andFaild:(void (^)(NSError *error))fail{
    [HttpClient postJSONWithUrl:url parameters:params success:^(NSDictionary *responseObject) {
        //to do ....
        
        NSLog(@"url:%@ params:%@",url,params);
        success(responseObject);
    } fail:^(NSError *error) {
        fail(error);
        NSLog(@"url:%@",url);
    }];
}

@end
