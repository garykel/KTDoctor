//
//  NSString+Base64.h
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/9/5.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)

/**
 将图片对象转换为base64字符串
 
 @param originImage 传入图片
 
 @return 返回图片
 */
+ (NSString *)getBase64DataByImageName:(UIImage *)originImage;



/**
 将base64字符串转换为图片对象
 
 @param imageBase64String 传入base64字符串
 
 @return 返回图片
 */
+ (UIImage *)getImageByBase64String:(NSString *)imageBase64String;



@end
