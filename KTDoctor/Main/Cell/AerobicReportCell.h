//
//  AerobicReportCell.h
//  KTDoctor
//
//  Created by duwei on 2019/4/24.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AerobicReportCell : UITableViewCell
@property (nonatomic,strong)UIView *infoView;
@property (nonatomic,strong)UIView *middleLine;
@property (nonatomic,strong)UIView *seperateLine1;
@property (nonatomic,strong)UIView *seperateLine2;
@property (nonatomic,strong)UIView *seperateLine3;
@property (nonatomic,strong)UIView *seperateLine4;
@property (nonatomic,strong)UIView *seperateLine5;
@property (nonatomic,strong)UIView *seperateLine6;
@property (nonatomic,strong)UIView *seperateLine7;
@property (nonatomic,strong)UIButton *downSelectBtn;
@property (nonatomic,strong)UIButton *prescriptionDetailBtn;
@property (nonatomic,strong)UILabel *prescriptionLbl;
@property (nonatomic,strong)UILabel *prescriptionNameLbl;
@property (nonatomic,strong)UILabel *typeLbl;
@property (nonatomic,strong)UILabel *typeNameLbl;
@property (nonatomic,strong)UILabel *trainingEquipmentLbl;
@property (nonatomic,strong)UILabel *trainingEquipmentNameLbl;
@property (nonatomic,strong)UILabel *riskLevelLbl;
@property (nonatomic,strong)UILabel *riskLevelValLbl;
@property (nonatomic,strong)UILabel *createTimeLbl;
@property (nonatomic,strong)UILabel *createTimeValLbl;
@property (nonatomic,strong)UILabel *doctorLbl;
@property (nonatomic,strong)UILabel *doctorNameLbl;
@property (nonatomic,strong)UILabel *sportDaysLbl;
@property (nonatomic,strong)UILabel *sportDaysValLbl;
@property (nonatomic,strong)UIButton *reportsBtn;
@property (nonatomic,strong)UILabel *reportsValLbl;
@property (nonatomic,assign)NSInteger type2;
@property (nonatomic,strong)NSDictionary *patientInfo;
+ (CGFloat)cellDefaultHeight;
+ (CGFloat)cellMoreHeight:(NSInteger)reportsNum;
@end

