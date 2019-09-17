//
//  UnitTextField.m
//  KTDoctor
//
//  Created by duwei on 2019/4/19.
//  Copyright © 2019 dz. All rights reserved.
//

#import "UnitTextField.h"

#define kUnitLbl_RightMargin 11
#define kUnitLbl_Width 50
#define kUnitLbl_FontSize 10.0
#define kUnitLbl_Height 11
@implementation UnitTextField

- (instancetype)initWithFrame:(CGRect) frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    CGFloat topMargin = (self.frame.size.height - kUnitLbl_Height * kYScal)/2.0;
    self.unitLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - kUnitLbl_RightMargin * kXScal - kUnitLbl_Width * kXScal, topMargin, kUnitLbl_Width * kXScal, kUnitLbl_Height * kYScal)];
    self.unitLbl.textColor = [UIColor colorWithHexString:@"#999999"];
    self.unitLbl.font = [UIFont systemFontOfSize:kUnitLbl_FontSize * kYScal];
    self.unitLbl.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.unitLbl];
}
@end
