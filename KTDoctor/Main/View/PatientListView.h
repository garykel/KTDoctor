//
//  PatientListView.h
//  KTDoctor
//
//  Created by duwei on 2019/3/26.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientListView : UIView
@property (nonatomic,strong)NSMutableArray *dataArr;
- (instancetype)initWithFrame:(CGRect) frame;
- (void)show;
@end

