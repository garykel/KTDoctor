//
//  HistoryDetailViewController.h
//  KTDoctor
//
//  Created by duwei on 2019/4/4.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryDetailViewController : UIViewController
@property (nonatomic,strong)NSDictionary *sportDict;
@property (nonatomic,assign)NSInteger type2;
@property (nonatomic,assign)BOOL isFromReport;
@property (nonatomic,strong)NSDictionary *patientInfo;
@property (nonatomic,strong)NSArray *reports;//报告列表
@end
