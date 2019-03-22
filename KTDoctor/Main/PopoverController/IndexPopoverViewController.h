//
//  IndexPopoverViewController.h
//  KTDoctor
//
//  Created by duwei on 2019/3/22.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol IndexPopoverDelegate<NSObject>
- (void)conditionChoose:(NSInteger)index;
@end
@interface IndexPopoverViewController : UIViewController
@property (nonatomic,strong)NSArray *contentArr;
@property (nonatomic,assign)id<IndexPopoverDelegate>delegate;
@end
