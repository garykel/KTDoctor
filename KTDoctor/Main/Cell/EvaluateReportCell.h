//
//  EvaluateReportCell.h
//  KTDoctor
//
//  Created by duwei on 2019/5/30.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluateReportCell : UITableViewCell
@property (nonatomic,strong)UILabel *dateLbl;
@property (nonatomic,strong)UILabel *timeLbl;
@property (nonatomic,strong)UILabel *avgPowerLbl;
@property (nonatomic,strong)UILabel *avgSpeedLbl;
@property (nonatomic,strong)UILabel *maxHRLbl;
@property (nonatomic,strong)UILabel *avgHRLbl;
@end
