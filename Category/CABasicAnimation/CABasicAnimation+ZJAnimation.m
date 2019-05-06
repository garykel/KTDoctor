//
//  CABasicAnimation+ZJAnimation.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/21.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "CABasicAnimation+ZJAnimation.h"

@implementation CABasicAnimation (ZJAnimation)

+ (CABasicAnimation *)scaleXByParam:(float)param
{
    CABasicAnimation *scaleXAin = [CABasicAnimation animation];
    scaleXAin.keyPath = @"transform.scale.x";
    scaleXAin.fromValue = @1.0;
    scaleXAin.toValue = @(param);
    return scaleXAin;
}

//竖直方向移动
+ (CABasicAnimation *)moveYPositionWithFrom:(float)from to:(float)to
{
    return [self moveAnimationWithFrom:from to:to diction:@"position.y" isDelay:NO];
}

//水平方向移动
+ (CABasicAnimation *)moveXPositionWithFrom:(float)from to:(float)to
{
    return [self moveAnimationWithFrom:from to:to diction:@"position.x" isDelay:NO];
}

+ (CABasicAnimation *)moveAnimationWithFrom:(float)from to:(float)to  diction:(NSString *)diction isDelay:(BOOL)isdelay
{
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:diction];
    move.fromValue = @(from);
    move.toValue = @(to);
    move.removedOnCompletion = NO;
    move.fillMode = kCAFillModeForwards;
    return move;
}

+ (void)transformScaleAnimationWithLayer:(CALayer *)layer duration:(float)duration fromValue:(float)fromValue toValue:(float)toValue autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount
{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:fromValue];
    animation.toValue = [NSNumber numberWithFloat:toValue];
    animation.duration = duration;
    animation.autoreverses = autoreverses;            //结束后是否逆转播放
    animation.fillMode = kCAFillModeForwards;
    if (repeatCount == 0) {
        animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }else {
        animation.repeatCount = repeatCount; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }
    animation.removedOnCompletion = NO;     //切换页面或者按HOME键进入前台 再次进入app保持动画一直运行。
    [layer addAnimation:animation forKey:nil];
}


+ (void)transformRotationZAnimationWithLayer:(CALayer *)layer duration:(float)duration fromValue:(float)fromValue toValue:(float)toValue autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount
{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:fromValue];
    animation.toValue = [NSNumber numberWithFloat:toValue];
    animation.duration = duration;
    animation.autoreverses = autoreverses;            //结束后是否逆转播放
    animation.fillMode = kCAFillModeForwards;
    if (repeatCount == 0) {
        animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }else {
        animation.repeatCount = repeatCount; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }
    animation.removedOnCompletion = NO;     //切换页面或者按HOME键进入前台 再次进入app保持动画一直运行。
    [layer addAnimation:animation forKey:nil];
}


+ (void)transformPositionAnimationWithLayer:(CALayer *)layer duration:(float)duration fromValue:(CGPoint)fromValue toValue:(CGPoint)toValue autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animation setFromValue:[NSValue valueWithCGPoint:fromValue]];
    [animation setToValue:[NSValue valueWithCGPoint:toValue]];
    [animation setAutoreverses:autoreverses];
    [animation setDuration:duration];
    if (repeatCount == 0) {
        animation.repeatCount = MAXFLOAT; //如果这里想设置成一直执行，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }else {
        animation.repeatCount = repeatCount; //如果这里想设置成一直执行，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }
    animation.removedOnCompletion = NO;     //切换页面或者按HOME键进入前台 再次进入app保持动画一直运行。
    [layer addAnimation:animation forKey:nil];
}


+ (void)transformPointsPositionAnimationWithLayer:(CALayer *)layer duration:(float)duration pointValueArray:(NSArray *)pointValueArray autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount isComplentBack:(BOOL)isComplentBack
{
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = duration;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation.values = pointValueArray;
    animation.autoreverses = autoreverses;            //结束后是否逆转播放
    if (isComplentBack == YES) {
        animation.fillMode = kCAFillModeBackwards;
    }else {
        animation.fillMode = kCAFillModeForwards;
    }
    if (repeatCount == 0) {
        animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }else {
        animation.repeatCount = repeatCount; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }
    animation.removedOnCompletion = NO;     //切换页面或者按HOME键进入前台 再次进入app保持动画一直运行。
    [layer addAnimation:animation forKey:nil];
}


+ (void)transformAnimationGroupWithLayer:(CALayer *)layer duration:(float)duration animationArray:(NSArray *)animationArray autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount isComplentBack:(BOOL)isComplentBack
{
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.animations = animationArray;
    group.duration = duration;
    group.autoreverses = autoreverses;            //结束后是否逆转播放
    if (isComplentBack == YES) {
        group.fillMode = kCAFillModeBackwards;
    }else {
        group.fillMode = kCAFillModeForwards;
    }
    group.removedOnCompletion = NO;
    if (repeatCount == 0) {
        group.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }else {
        group.repeatCount = repeatCount; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [layer addAnimation:group forKey:nil];
}


//MARK: - 快捷创建CABasicAnimation
+ (CABasicAnimation *)makeScaleRotationBasicAnimationWithKeyPath:(NSString *)keyPath duration:(float)duration fromValue:(float)fromValue toValue:(float)toValue autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount isComplentBack:(BOOL)isComplentBack
{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:keyPath];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:fromValue];
    animation.toValue = [NSNumber numberWithFloat:toValue];
    animation.duration = duration;
    animation.autoreverses = autoreverses;            //结束后是否逆转播放
    if (isComplentBack == YES) {
        animation.fillMode = kCAFillModeBackwards;
    }else {
        animation.fillMode = kCAFillModeForwards;
    }
    if (repeatCount == 0) {
        animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }else {
        animation.repeatCount = repeatCount; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }
    animation.removedOnCompletion = NO;     //切换页面或者按HOME键进入前台 再次进入app保持动画一直运行。
    return animation;
}

+ (CABasicAnimation *)makePositionBasicAnimationWithDuration:(float)duration fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount isComplentBack:(BOOL)isComplentBack
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animation setFromValue:[NSValue valueWithCGPoint:fromPoint]];
    [animation setToValue:[NSValue valueWithCGPoint:toPoint]];
    [animation setAutoreverses:autoreverses];
    [animation setDuration:duration];
    if (isComplentBack == YES) {
        animation.fillMode = kCAFillModeBackwards;
    }else {
        animation.fillMode = kCAFillModeForwards;
    }
    if (repeatCount == 0) {
        animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }else {
        animation.repeatCount = repeatCount; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }
    animation.removedOnCompletion = NO;     //切换页面或者按HOME键进入前台 再次进入app保持动画一直运行。
    return animation;
}


+ (CAKeyframeAnimation *)makeKeyFramePositionKeyFrameAnimationWithDuration:(float)duration pointValueArray:(NSArray *)pointValueArray  autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount isComplentBack:(BOOL)isComplentBack
{
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = duration;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation.values = pointValueArray;
    animation.autoreverses = autoreverses;            //结束后是否逆转播放
    if (isComplentBack == YES) {
        animation.fillMode = kCAFillModeBackwards;
    }else {
        animation.fillMode = kCAFillModeForwards;
    }
    if (repeatCount == 0) {
        animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }else {
        animation.repeatCount = repeatCount; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    }
    animation.removedOnCompletion = NO;     //切换页面或者按HOME键进入前台 再次进入app保持动画一直运行。
    return animation;
}

@end
