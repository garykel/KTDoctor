//
//  BaseViewController.h
//  XiuXiuTuanGou
//
//  Created by 王克博 on 2018/7/10.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavView.h"

@interface BaseViewController : UIViewController

@property (nonatomic,strong) UIButton *reloadBtn;  //重新加载按钮
@property (nonatomic,strong) UIButton *leftNavBtn;  //左边的导航按钮

@property (nonatomic, strong) BaseNavView *baseNavView; //导航条

- (void)needReloadData;

// 显示/隐藏 加载中
- (void)showProgressView;
- (void)hideProgressView;

//设置跳转相册/图库
- (void)setupOpenURLForPhototAndCamera;

//分享相关
//分享图片到某个平台  微信/朋友圈 type 1/2
- (void)wxShareToSocialWithGetAwardTitle:(NSString *)title description:(NSString *)description image:(UIImage *)image url:(NSString *)url;

//直接调用进入微信分享,type 1/2 ：微信/朋友圈
- (void)wxShareToSocialWithType:(NSInteger)type title:(NSString *)title description:(NSString *)description image:(UIImage *)image url:(NSString *)url;

//分享title，desc，imageURL，url到  微信/朋友圈
- (void)shareToWechatSocialWithTitle:(NSString *)title description:(NSString *)description image:(NSString *)image url:(NSString *)url;


//设置无网、获取数据失败、数据为空 情况下的图片
- (void)setReloadBtnImageToError;
- (void)setReloadBtnImageToEmpty:(NSString *)emptyText;


//UITabelView.Section.分割线
- (UIView *)addTableViewSectionSegmentationLineByY:(CGFloat)y;

//拨打电话
- (void)goToPhone:(NSString *)phoneNumber;


#if defined __cplusplus
extern "C" {
#endif
    
    void soundplay(void);

#if defined __cplusplus
};
#endif

@end
