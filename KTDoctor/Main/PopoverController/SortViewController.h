//
//  SortViewController.h
//  KTDoctor
//
//  Created by duwei on 2019/3/25.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SortDelegate<NSObject>
- (void)conditionChoose:(NSDictionary*)condition;
@end

@interface SortViewController : UIViewController
@property (nonatomic,strong)NSString *titleName;
@property (nonatomic,strong)NSMutableArray *conditionsArr;
@property (nonatomic,assign)id<SortDelegate>delegate;
@end
