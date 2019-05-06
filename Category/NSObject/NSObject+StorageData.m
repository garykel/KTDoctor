//
//  NSObject+StorageData.m
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/8/16.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import "NSObject+StorageData.h"

@implementation NSObject (StorageData)

- (NSString *)obtainNavPilstFileByName:(NSString *)name
{
    NSString *file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:name];
    return file;
}

- (void)writeToNavPlistFile:(id)model fileName:(NSString *)name
{
    NSString *filePath = [self obtainNavPilstFileByName:name];
    [NSKeyedArchiver archiveRootObject:model toFile:filePath];
}

- (id)readToNavPlistFileByFileName:(NSString *)name
{
    NSString *filePath = [self obtainNavPilstFileByName:name];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

- (void)removeFileByFileName:(NSString *)name
{
    NSString *filePath = [self obtainNavPilstFileByName:name];
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager isDeletableFileAtPath:filePath]) {
        [defaultManager removeItemAtPath:filePath error:nil];
    }
}

@end
