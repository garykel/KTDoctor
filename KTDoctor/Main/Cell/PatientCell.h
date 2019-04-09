//
//  PatientCell.h
//  KTDoctor
//
//  Created by duwei on 2019/3/26.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientCell : UITableViewCell
@property (nonatomic,strong)UIImageView *bgImg;
@property (nonatomic,strong)UIButton *hrDeviceIdBtn;
@property (nonatomic,strong)UIButton *deviceIdBtn;
@property (nonatomic,strong)UIButton *nameBtn;
@property (nonatomic,strong)UIButton *idBtn;
@property (nonatomic,strong)UIButton *deleteBtn;
@end
