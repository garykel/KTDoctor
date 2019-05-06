//
//  NSObject+ImageZip.h
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/9/13.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ImageZip)


/**
 图片压缩

 @param sourceImage 原图
 @return 数据
 */
- (NSData *)zipNSDataWithImage:(UIImage *)sourceImage;

@end
