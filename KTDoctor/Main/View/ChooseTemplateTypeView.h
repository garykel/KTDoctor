//
//  ChooseTemplateTypeView.h
//  KTDoctor
//
//  Created by duwei on 2019/5/17.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChooseTemplateTypeView : UIView
@property (nonatomic,strong)UIButton *intensiteBtn;
@property (nonatomic,strong)UIButton *powerBtn;
- (instancetype)initWithFrame:(CGRect) frame title:(NSString*)title;
- (void)show;
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
