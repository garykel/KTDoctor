//
//  UIImageView+Init.h
//  SummaryUsefulCode
//
//  Created by 王克博 on 2019/1/10.
//  Copyright © 2019 XiuXiu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Init)

/**
 创建ImageView，使用素材中图片
 
 @param frame       坐标
 @param imageName       图片名
 @param cornerRadius    圆角
 
 @return 返回ImageView对象
 */
+ (UIImageView *)makeImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius;

/**
 创建ImageView，使用网络图片地址
 
 @param frame       坐标
 @param imageURL       图片地址
 @param placeHolderImageName    占位图名称
 @param cornerRadius    圆角
 
 @return 返回ImageView对象
 */
//+ (UIImageView *)makeImageViewWithFrame:(CGRect)frame imageURL:(NSString *)imageURL placeHolderImageName:(NSString *)placeHolderImageName cornerRadius:(CGFloat)cornerRadius;


@end

NS_ASSUME_NONNULL_END
