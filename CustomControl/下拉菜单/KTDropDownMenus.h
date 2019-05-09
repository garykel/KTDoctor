//
//  XXTGDropDownMenus.h
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/7/6.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KTDropDownMenus;

@protocol XXTGDropdownMenuDelegate <NSObject>

@optional

- (void)dropdownMenuWillShow:(KTDropDownMenus *)menu;    // 当下拉菜单将要显示时调用
- (void)dropdownMenuDidShow:(KTDropDownMenus *)menu;     // 当下拉菜单已经显示时调用
- (void)dropdownMenuWillHidden:(KTDropDownMenus *)menu;  // 当下拉菜单将要收起时调用
- (void)dropdownMenuDidHidden:(KTDropDownMenus *)menu;   // 当下拉菜单已经收起时调用

- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellNumber:(NSInteger)number; // 当选择某个选项时调用str
- (void)dropdownMenu:(KTDropDownMenus *)menu selectedCellStr:(NSString *)string; // 当选择某个选项时调用

- (void)dropdownMenu:(KTDropDownMenus *)menu mainBtnClick:(UIButton*)sender;//下拉按钮点击时调用

@end

@interface KTDropDownMenus : UIView

@property (nonatomic, strong) UIButton *mainBtn;
@property (nonatomic, copy) NSString *defualtStr; //默认显示
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) float dropdownHeight;
@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, weak) id<XXTGDropdownMenuDelegate> delegate;

- (void)showCityList; // 显示下拉菜单
- (void)hiddenCityList; // 隐藏下拉菜单

@end
