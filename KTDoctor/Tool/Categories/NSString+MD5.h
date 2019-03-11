//
//  NSString+MD5.h
//  CoolPlaySport
//
//  Created by duwei on 2018/11/5.
//  Copyright © 2018年 cdz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<CommonCrypto/CommonDigest.h>
@interface NSString (MD5)
+ (NSString *) md5:(NSString *) input;
@end
