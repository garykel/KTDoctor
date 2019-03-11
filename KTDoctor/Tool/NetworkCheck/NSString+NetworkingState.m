//
//  NSString+NetworkingState.m
//  CoolPlaySport
//
//  Created by duwei on 2018/6/1.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import "NSString+NetworkingState.h"
#import <Reachability.h>
@implementation NSString (NetworkingState)
+ (NSString *)networkingStatesFromStatebar {
    Reachability *reachability   = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    NSString *net = @"WIFI";
    switch (internetStatus) {
        case ReachableViaWiFi:
            net = @"WIFI";
            break;
            
        case ReachableViaWWAN:
            net = @"GPS";
            //            net = [self getNetType ];   //判断具体类型
            break;
            
        case NotReachable:
            net = @"notReachable";
            
        default:
            break;
    }
    NSLog(@"current network state :%@",net);
    return net;
}

@end
