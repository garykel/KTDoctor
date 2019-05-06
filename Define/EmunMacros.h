//
//  Define_Emun.h
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2019/4/10.
//  Copyright © 2019年 XiuXiuTuanGou. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 店铺入驻
//修改店铺信息提示
typedef NS_ENUM(NSInteger, ShopCellTipState) {
    
    ShopCellTipState_None,
    ShopCellTipState_Tip
};

//清除修改时间的状态
typedef NS_ENUM(NSInteger, ClearShopCellTipState) {
    
    ClearShopCellTipState_None,
    ClearShopCellTipState_Tip
};


//店铺认证的状态
typedef NS_ENUM(NSInteger, ShopCertificationState){
    
    ShopCertificationState_None         =       1,    //去认证
    ShopCertificationState_Dealing      =       2, //处理中
    ShopCertificationState_Failture     =       3, //认证失败
    ShopCertificationState_InfoSuccess  =       4, //资料审核通过
    ShopCertificationState_Success      =       5, //已认证
};





