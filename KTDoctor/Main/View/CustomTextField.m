//
//  CustomTextField.m
//  KTDoctor
//
//  Created by duwei on 2019/4/17.
//  Copyright © 2019 dz. All rights reserved.
//

#import "CustomTextField.h"
#define kLeftMargin 10
@implementation CustomTextField

- (instancetype)initWithFrame:(CGRect) frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.placeholderLbl = [[UILabel alloc] initWithFrame:CGRectMake(kLeftMargin, 4, self.frame.size.width - kLeftMargin, self.frame.size.height - 2 * 4)];
    [self addSubview:self.placeholderLbl];
}
@end
