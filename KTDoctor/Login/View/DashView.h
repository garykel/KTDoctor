//
//  DashView.h
//  KTDoctor
//
//  Created by duwei on 2019/3/12.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface DashView : UIView
@property (nonatomic,strong)UIColor *dashColor;

- (id)initWithFrame:(CGRect)frame color:(UIColor*)color;
@end
