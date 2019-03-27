//
//  SportDataModel.h
//  KTDoctor
//
//  Created by duwei on 2019/3/27.
//  Copyright © 2019 dz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SportDataModel : NSObject
@property (nonatomic,assign)NSInteger alHr;
@property (nonatomic,assign)NSInteger avgHr;
@property (nonatomic,assign)NSInteger currHr;
@property (nonatomic,copy)NSString *dId;
@property (nonatomic,assign)NSInteger diff;
@property (nonatomic,assign)NSInteger dqxjzxj;
@property (nonatomic,copy)NSString *endTime;
@property (nonatomic,copy)NSString *headUrl;
@property (nonatomic,assign)NSInteger isEnd;
@property (nonatomic,assign)NSInteger isxiuxi;
@property (nonatomic,assign)CGFloat kcal;
@property (nonatomic,assign)CGFloat lc;
@property (nonatomic,assign)NSInteger maxHr;
@property (nonatomic,assign)NSInteger maxRestHr;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *percentum;
@property (nonatomic,assign)CGFloat speed;
@property (nonatomic,assign)NSInteger time;
@property (nonatomic,assign)NSInteger userId;
@property (nonatomic,copy)NSString *xId;
@property (nonatomic,assign)NSInteger xiaojietime;
@end
