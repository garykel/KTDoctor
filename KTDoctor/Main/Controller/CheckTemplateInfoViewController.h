//
//  CheckTemplateInfoViewController.h
//  KTDoctor
//
//  Created by duwei on 2019/5/20.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CheckTemplateInfoViewController : UIViewController
@property (nonatomic,strong)NSDictionary *templateInfo;
@property (nonatomic,assign)NSInteger type; //1 有氧模板 2 力量模板
@end

