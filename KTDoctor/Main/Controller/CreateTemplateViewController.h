//
//  CreateTemplateViewController.h
//  KTDoctor
//
//  Created by duwei on 2019/5/17.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CreateTemplateViewController : UIViewController
@property (nonatomic,strong)NSArray *deviceTypeArr;
@property (nonatomic,assign)NSInteger type;
@property (nonatomic,assign)NSInteger sourceType;//来源类型 1.新建康复模板 2.新建有氧模板 3.新建力量模板
@end
