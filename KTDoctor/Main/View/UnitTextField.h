//
//  UnitTextField.h
//  KTDoctor
//
//  Created by duwei on 2019/4/19.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UnitTextField : UITextField
@property (nonatomic,strong)UILabel *unitLbl;
@property (nonatomic,copy)NSString *unit;
@end
