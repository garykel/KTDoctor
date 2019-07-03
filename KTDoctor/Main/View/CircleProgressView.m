//
//  CircleProgressView.m
//  CircleProgressView
//
//  Created by garychen on 2019/7/3.
//  Copyright © 2019年 garychen. All rights reserved.
//

#import "CircleProgressView.h"

@interface CircleProgressView()
@property (nonatomic,assign)CGRect contentFrame;
@property (nonatomic,assign)NSInteger percent;
@property (nonatomic,strong)UIColor *circleColor;
@end

@implementation CircleProgressView

- (instancetype)initWithFrame:(CGRect)frame percent:(NSInteger)percent color:(UIColor*)color{
    if (self = [super initWithFrame:frame]) {
        self.contentFrame = frame;
        self.percent = percent;
        self.circleColor = color;
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    CAShapeLayer *layer = [CAShapeLayer new];
    layer.lineWidth = 8;
    //圆环的颜色
    layer.strokeColor = self.circleColor.CGColor;
    //背景填充色
    layer.fillColor = [UIColor clearColor].CGColor;
    //设置半径为10
    CGFloat radius = self.contentFrame.size.width;
    //按照顺时针方向
    BOOL clockWise = true;
    //初始化一个路径
    CGFloat r = self.contentFrame.size.width/2.0;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(r, r) radius:radius startAngle:(1.5*M_PI) endAngle:(2*M_PI/100 * self.percent +1.5*M_PI) clockwise:clockWise];
    layer.path = [path CGPath];
    [self.layer addSublayer:layer];
    
    CAShapeLayer *roundLayer = [CAShapeLayer new];
    roundLayer.lineWidth = 1;
    roundLayer.strokeColor = self.circleColor.CGColor;
    //背景填充色
    roundLayer.fillColor = [UIColor whiteColor].CGColor;
    CGFloat roundR = self.contentFrame.size.width - 8;
    //初始化一个路径
    UIBezierPath *rpath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(r,r) radius:roundR startAngle:(1.5*M_PI) endAngle:(3.5*M_PI) clockwise:clockWise];
    roundLayer.path = [rpath CGPath];
    [self.layer addSublayer:roundLayer];
}

@end
