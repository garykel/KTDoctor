//
//  NSObject+StorageData.h
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/8/16.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (StorageData)


/**
 获取存储文件地址

 @param name 文件名
 @return 文件地址
 */
- (NSString *)obtainNavPilstFileByName:(NSString *)name;


/**
 写入数据

 @param model 数据
 @param name 文件名
 */
- (void)writeToNavPlistFile:(id)model fileName:(NSString *)name;


/**
 读数据

 @param name 文件名
 @return 返回数据
 */
- (id)readToNavPlistFileByFileName:(NSString *)name;


/**
 删数据
 
 @param name 文件名
 */
- (void)removeFileByFileName:(NSString *)name;

@end
