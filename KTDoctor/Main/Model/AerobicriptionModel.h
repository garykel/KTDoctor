//
//  AerobicriptionModel.h
//  KTDoctor
//
//  Created by garychen on 2019/5/12.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AerobicriptionModel : BaseModel
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *hrRange;
@property (nonatomic,copy)NSString *rpeRange;
@property (nonatomic,copy)NSString *difficulty;
@property (nonatomic,assign)NSInteger calorie;
@property (nonatomic,assign)NSInteger duration;
@property (nonatomic,assign)NSInteger restDuration;
@property (nonatomic,assign)NSInteger speed;
@property (nonatomic,assign)CGFloat weight;
@property (nonatomic,assign)NSInteger times;
@property (nonatomic,copy)NSString *rotationAngle;
@end

NS_ASSUME_NONNULL_END
