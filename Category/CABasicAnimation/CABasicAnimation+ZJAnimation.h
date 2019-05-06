//
//  CABasicAnimation+ZJAnimation.h
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/21.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CABasicAnimation (ZJAnimation)
+ (CABasicAnimation *)scaleXByParam:(float)param;
//竖直方向移动
+ (CABasicAnimation *)moveYPositionWithFrom:(float)from to:(float)to;

//水平方向移动
+ (CABasicAnimation *)moveXPositionWithFrom:(float)from to:(float)to;

+ (CABasicAnimation *)moveAnimationWithFrom:(float)from to:(float)to  diction:(NSString *)diction isDelay:(BOOL)isdelay;


/**
 指定layer添加放大/缩小动画
 
 @param layer           执行动画的layer
 @param duration        单次时间
 @param fromValue       开始大小比例
 @param toValue         结束大小比例
 @param autoreverses    是否单次完成后逆转执行动画
 @param repeatCount     重复次数，如果一直执行则为0
 
 */
+ (void)transformScaleAnimationWithLayer:(CALayer *)layer duration:(float)duration fromValue:(float)fromValue toValue:(float)toValue autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount;


/**
 指定layer添加旋转动画
 
 @param layer           执行动画的layer
 @param duration        单次时间
 @param fromValue       开始的角度值
 @param toValue         结束角度值       //M_PI为90度
 @param autoreverses    是否单次完成后逆转执行动画
 @param repeatCount     重复次数，如果一直执行则为0
 
 */
+ (void)transformRotationZAnimationWithLayer:(CALayer *)layer duration:(float)duration fromValue:(float)fromValue toValue:(float)toValue autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount;


/**
 指定layer添加平移动画，pointA到pointB
 
 @param layer           执行动画的layer
 @param duration        单次时间
 @param fromValue       开始point点
 @param toValue         结束point点
 @param autoreverses    是否单次完成后逆转执行动画
 @param repeatCount     重复次数，如果一直执行则为0
 
 */
+ (void)transformPositionAnimationWithLayer:(CALayer *)layer duration:(float)duration fromValue:(CGPoint)fromValue toValue:(CGPoint)toValue autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount;


/**
 指定layer添加多个point的position动画
 
 @param layer               执行动画的layer
 @param duration            单次时间
 @param pointValueArray     CGPoint转换为NSValue，NSValue对象加入数组中
 @param autoreverses        是否单次完成后逆转执行动画
 @param repeatCount         重复次数，如果一直执行则为0
 @param isComplentBack      是否执行结束后 还原为原本状态
 */
+ (void)transformPointsPositionAnimationWithLayer:(CALayer *)layer duration:(float)duration pointValueArray:(NSArray *)pointValueArray autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount isComplentBack:(BOOL)isComplentBack;

/**
 指定layer添加多个Animation共同动画
 
 @param layer               执行动画的layer
 @param duration            单次时间
 @param animationArray      多个CABasicAnimation动画数组
 @param autoreverses        是否单次完成后逆转执行动画
 @param repeatCount         重复次数，如果一直执行则为0
 @param isComplentBack      是否执行结束后 还原为原本状态
 */
+ (void)transformAnimationGroupWithLayer:(CALayer *)layer duration:(float)duration animationArray:(NSArray *)animationArray autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount isComplentBack:(BOOL)isComplentBack;


/**
 快速创建CABasicAnimation动画，旋转/大小
 
 @param keyPath         动画类型keyPath:transform.scale、transform.rotation.z
 @param duration        单次时间
 @param fromValue       开始value
 @param toValue         结束value
 @param autoreverses    是否单次完成后逆转执行动画
 @param repeatCount     重复次数，如果一直执行则为0
 @param isComplentBack      是否执行结束后 还原为原本状态
 
 */
+ (CABasicAnimation *)makeScaleRotationBasicAnimationWithKeyPath:(NSString *)keyPath duration:(float)duration fromValue:(float)fromValue toValue:(float)toValue autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount isComplentBack:(BOOL)isComplentBack;


/**
 快速创建CABasicAnimation动画，point平移
 
 @param duration        单次时间
 @param fromPoint       开始point点
 @param toPoint         结束point点
 @param autoreverses    是否单次完成后逆转执行动画
 @param repeatCount     重复次数，如果一直执行则为0
 @param isComplentBack      是否执行结束后 还原为原本状态
 
 */
+ (CABasicAnimation *)makePositionBasicAnimationWithDuration:(float)duration fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount isComplentBack:(BOOL)isComplentBack;


/**
 创建多个point的position动画
 
 @param duration            单次时间
 @param pointValueArray     CGPoint转换为NSValue，NSValue对象加入数组中
 @param autoreverses        是否单次完成后逆转执行动画
 @param repeatCount         重复次数，如果一直执行则为0
 @param isComplentBack      是否执行结束后 还原为原本状态
 */
+ (CAKeyframeAnimation *)makeKeyFramePositionKeyFrameAnimationWithDuration:(float)duration pointValueArray:(NSArray *)pointValueArray  autoreverses:(BOOL)autoreverses repeatCount:(float)repeatCount isComplentBack:(BOOL)isComplentBack;

@end
