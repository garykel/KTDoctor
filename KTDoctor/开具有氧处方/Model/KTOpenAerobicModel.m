//
//  KTOpenAerobicModel.m
//  KTDoctor
//
//  Created by 张敬 on 2019/5/6.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "KTOpenAerobicModel.h"

@implementation KTOpenAerobicModel

- (NSMutableArray *)cells{
    
    if(!_cells){
        _cells = [NSMutableArray array];
    }
    return _cells;
}

@end
