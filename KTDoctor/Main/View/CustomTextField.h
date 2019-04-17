//
//  CustomTextField.h
//  KTDoctor
//
//  Created by duwei on 2019/4/17.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomTextField;

@protocol CustomTextFieldDelegate <NSObject>
- (void)textFieldDidBeginEditing:(CustomTextField *)textField;
- (void)textFieldDidEndEditing:(CustomTextField *)textField;
@end

@interface CustomTextField : UITextField
@property (nonatomic,strong)UILabel *placeholderLbl;
@property(nonatomic,assign)id<CustomTextFieldDelegate> cdelegate;
@end

