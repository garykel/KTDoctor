//
//  PatientCell12.h
//  KTDoctor
//
//  Created by duwei on 2019/3/28.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientCell12 : UICollectionViewCell
@property (nonatomic,strong)UIImageView *headImg;
@property (nonatomic,strong)UILabel *nameLbl;
@property (nonatomic,strong)UILabel *idLbl;
@property (nonatomic,strong)UIImageView *timeImg;
@property (nonatomic,strong)UILabel *timeLbl;
@property (nonatomic,strong)UIImageView *heartImg;
@property (nonatomic,strong)UILabel *currentHrLbl;
@property (nonatomic,strong)UILabel *avgHRLbl;
@property (nonatomic,strong)UILabel *avgHRValueLbl;
@property (nonatomic,strong)UILabel *avgHRUnitLbl;
@property (nonatomic,strong)UILabel *maxHRLbl;
@property (nonatomic,strong)UILabel *maxHRValueLbl;
@property (nonatomic,strong)UILabel *maxHRUnitLbl;
@property (nonatomic,strong)UILabel *speedLbl;
@property (nonatomic,strong)UILabel *speedValueLbl;
@property (nonatomic,strong)UILabel *speedUnitLbl;
@property (nonatomic,strong)UILabel *intensionLbl;
@property (nonatomic,strong)UILabel *intensionValueLbl;
@end
