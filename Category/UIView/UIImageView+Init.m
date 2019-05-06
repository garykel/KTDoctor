//
//  UIImageView+Init.m
//  SummaryUsefulCode
//
//  Created by 王克博 on 2019/1/10.
//  Copyright © 2019 XiuXiu. All rights reserved.
//

#import "UIImageView+Init.h"

@implementation UIImageView (Init)

+ (UIImageView *)makeImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius
{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:frame];
    if (imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    if (cornerRadius > 0) {
        imageView.layer.cornerRadius = cornerRadius;
        imageView.layer.masksToBounds = YES;
    }
    return imageView;
}


@end
