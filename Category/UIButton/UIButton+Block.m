//
//  UIButton+Block.m
//  KTDoctor
//
//  Created by 张敬 on 2019/5/5.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "UIButton+Block.h"

@implementation UIButton (Block)


- (void)setBlock:(dealBtnOperation)block
{
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_COPY);
    
    [self addTarget:self action:@selector(chicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (dealBtnOperation)block
{
    return objc_getAssociatedObject(self, @selector(block));
}

- (void)chicked:(UIButton *)btn
{
    if (self.block) {
        self.block(btn);
    }
}



@end
