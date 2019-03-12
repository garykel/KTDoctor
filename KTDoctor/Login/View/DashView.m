//
//  DashView.m
//  KTDoctor
//
//  Created by duwei on 2019/3/12.
//  Copyright © 2019 dz. All rights reserved.
//

#import "DashView.h"

@implementation DashView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame color:(UIColor*)color {
    self = [super initWithFrame:frame];
    if (self) {
        self.dashColor = color;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = self.dashColor.CGColor;
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    border.frame = self.bounds;
    border.lineWidth = 1.f;
    border.lineCap = @"square";
    border.lineDashPattern = @[@4,@2];
    [self.layer addSublayer:border];
}
@end
