//
//  NSObject+ModelTransformToDictionaryOrArray.h
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/9/6.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ModelTransformToDictionaryOrArray)


/**
 模型转换成数组

 @param origin 模型数据
 @return 数组数据
 */
- (id)arrayOrDicWithObject:(id)origin;


/**
 模型转换成字典

 @param object 模型数据
 @return 字典数据
 */
- (NSDictionary *)dicFromObject:(NSObject *)object;


/**
 字典转换成json

 @param infoDict 字典
 @return json数据
 */
- (NSString*)convertToJSONData:(id)infoDict;


/**
 数字转换中文

 @param arabicNum 数字
 @return 中文
 */
- (NSString *)translationArabicNum:(NSInteger)arabicNum;

@end
