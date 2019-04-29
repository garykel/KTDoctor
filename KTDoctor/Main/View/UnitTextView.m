//
//  UnitTextView.m
//  KTDoctor
//
//  Created by duwei on 2019/4/28.
//  Copyright © 2019 dz. All rights reserved.
//

#import "UnitTextView.h"
#define kUnitLbl_RightMargin 16
#define kUnitLbl_BottomMargin 10
#define kUnitLbl_Width 50
#define kUnitLbl_FontSize 12.0
#define kUnitLbl_Height 12

@implementation UnitTextView

- (instancetype)initWithFrame:(CGRect) frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    CGFloat topMargin = self.frame.size.height - kUnitLbl_Height * kYScal - kUnitLbl_BottomMargin * kYScal;
    self.unitLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - kUnitLbl_RightMargin * kXScal - kUnitLbl_Width * kXScal, topMargin, kUnitLbl_Width * kXScal, kUnitLbl_Height * kYScal)];
    self.unitLbl.textColor = [UIColor colorWithHexString:@"#999999"];
    self.unitLbl.font = [UIFont systemFontOfSize:kUnitLbl_FontSize * kYScal];
    self.unitLbl.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.unitLbl];
}

@end
