//
//  NSString+Base64.m
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/9/5.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)

#pragma mark - private methods
+ (NSString *)getBase64DataByImageName:(UIImage *)originImage
{
   // UIImage *originImage = [UIImage imageNamed:imagename];
    NSData *data = UIImageJPEGRepresentation(originImage, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    //NSLog(@"encodedImageStr==%@",encodedImageStr);
    
    return encodedImageStr;
}


+ (UIImage *)getImageByBase64String:(NSString *)imageBase64String
{
    NSData * data = [NSData dataWithBase64EncodedString:imageBase64String];
    UIImage * image = [UIImage imageWithData:data];
    return image;
}



@end
