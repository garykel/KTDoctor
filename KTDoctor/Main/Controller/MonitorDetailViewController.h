//
//  MonitorDetailViewController.h
//  KTDoctor
//
//  Created by duwei on 2019/4/1.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SportDataModel.h"
@interface MonitorDetailViewController : UIViewController
@property (nonatomic,assign)NSUInteger *selectedIndex;
@property (nonatomic,strong)SportDataModel *data;
@end

