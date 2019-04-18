//
//  PatientListsCell.h
//  KTDoctor
//
//  Created by duwei on 2019/4/17.
//  Copyright © 2019 dz. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PatientListsCell : UITableViewCell
@property (nonatomic,strong)UILabel *idLbl;
@property (nonatomic,strong)UIView *seperateLine1;
@property (nonatomic,strong)UILabel *nameLbl;
@property (nonatomic,strong)UIView *seperateLine2;
@property (nonatomic,strong)UILabel *ageLbl;
@property (nonatomic,strong)UIView *seperateLine3;
@property (nonatomic,strong)UILabel *sexLbl;
@property (nonatomic,strong)UIView *seperateLine4;
@property (nonatomic,strong)UILabel *riskLevelLbl;
@property (nonatomic,strong)UIView *seperateLine5;
@property (nonatomic,strong)UILabel *dieaseLbl;
@property (nonatomic,strong)UIButton *checkBtn;
@property (nonatomic,assign)NSInteger itemWidth;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier itemWidth:(NSInteger)itemWidth;
@end

