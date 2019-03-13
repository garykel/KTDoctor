//
//  NSString+mobile.m
//  KTDoctor
//
//  Created by duwei on 2019/3/13.
//  Copyright © 2019 dz. All rights reserved.
//

#import "NSString+mobile.h"

@implementation NSString (mobile)
+ (BOOL)isPhoneNumber:(NSString *)mobile {
    if (mobile.length < 11)
    {
        return NO;
    } else {
        NSString *NUM = @"^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(16[6])|(17[0,1,3,5-8])|(18[0-9])|(19[8,9]))\\d{8}$";
        NSPredicate *pred4 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NUM];
        BOOL isMatch4 = [pred4 evaluateWithObject:mobile];
        if (isMatch4)
            return YES;
        else
            return NO;
    }
}

@end
