//
//  NSString+MD5.m
//  CoolPlaySport
//
//  Created by duwei on 2018/11/5.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import "NSString+MD5.h"

@implementation NSString (MD5)
+ (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr,strlen(cStr), digest ); // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}

@end
