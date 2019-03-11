//
//  NSString+HMAC.h
//  CoolPlaySport
//
//  Created by duwei on 2018/6/1.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HMAC)
//plaintext 要加密的文本
//key 密钥
+(NSString*)hmac:(NSString*)plaintext withKey:(NSString*)key;
@end
