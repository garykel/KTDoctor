
//
//  PatientListsCell.m
//  KTDoctor
//
//  Created by duwei on 2019/4/17.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientListsCell.h"
#define kSeperateLine_Width 1
#define kCheckBtn_Width 140
#define kCheckBtn_Height 24
#define kLbl_FontSize 13.0
#define kLbl_Height 20
#define kCheckBtn_FontSize 12.0
#define kSearchView_LeftMargin 20
#define kListBgView_LeftMargin 15
#define kCell_Height 30
#define kCell_LeftMargin 15+15+20

@interface PatientListsCell ()
@property (nonatomic,strong)UIView *checkBtnBgView;
@end

@implementation PatientListsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier itemWidth:(NSInteger)itemWidth{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.itemWidth = itemWidth;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    CGFloat lblWidth = self.itemWidth;
    CGFloat lblHeight = kCell_Height * kYScal;
    self.idLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, lblWidth, lblHeight)];
    self.idLbl.backgroundColor = [UIColor whiteColor];
    self.idLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    self.idLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.idLbl];
    
    self.seperateLine1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.idLbl.frame) + 0.5, 0, kSeperateLine_Width, lblHeight)];
    self.seperateLine1.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.contentView addSubview:self.seperateLine1];
    
    self.nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperateLine1.frame), 0, lblWidth, lblHeight)];
    self.nameLbl.backgroundColor = [UIColor whiteColor];
    self.nameLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    self.nameLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.nameLbl];
    
    self.seperateLine2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLbl.frame) + 0.5, 0, kSeperateLine_Width, lblHeight)];
    self.seperateLine2.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.contentView addSubview:self.seperateLine2];
    
    self.ageLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperateLine2.frame), 0, lblWidth, lblHeight)];
    self.ageLbl.backgroundColor = [UIColor whiteColor];
    self.ageLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    self.ageLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.ageLbl];
    
    self.seperateLine3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.ageLbl.frame) + 0.5, 0, kSeperateLine_Width, lblHeight)];
    self.seperateLine3.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.contentView addSubview:self.seperateLine3];
    
    self.sexLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperateLine3.frame), 0, lblWidth, lblHeight)];
    self.sexLbl.backgroundColor = [UIColor whiteColor];
    self.sexLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    self.sexLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.sexLbl];
    
    self.seperateLine4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.sexLbl.frame) + 0.5, 0, kSeperateLine_Width, lblHeight)];
    self.seperateLine4.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.contentView addSubview:self.seperateLine4];
    
    self.riskLevelLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperateLine4.frame), 0, lblWidth, lblHeight)];
    self.riskLevelLbl.backgroundColor = [UIColor whiteColor];
    self.riskLevelLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    self.riskLevelLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.riskLevelLbl];
    
    self.seperateLine5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelLbl.frame) + 0.5, 0, kSeperateLine_Width, lblHeight)];
    self.seperateLine5.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.contentView addSubview:self.seperateLine5];
    
    self.dieaseLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperateLine5.frame), 0, lblWidth, lblHeight)];
    self.dieaseLbl.backgroundColor = [UIColor whiteColor];
    self.dieaseLbl.font = [UIFont systemFontOfSize:kLbl_FontSize * kYScal];
    self.dieaseLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.dieaseLbl];
    
    self.checkBtnBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dieaseLbl.frame), 0, kCheckBtn_Width, lblHeight)];
    self.checkBtnBgView.backgroundColor = [UIColor colorWithHexString:@"#a6dfeb"];
    [self.contentView addSubview:self.checkBtnBgView];
    
    self.checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat checkBtn_TopMargin = (lblHeight - kCheckBtn_Height * kYScal)/2;
    self.checkBtn.frame = CGRectMake(0, checkBtn_TopMargin, kCheckBtn_Width * kXScal, kCheckBtn_Height * kYScal);
    [self.checkBtn setTitle:@"查看" forState:UIControlStateNormal];
    [self.checkBtn setTitleColor:[UIColor colorWithHexString:@"#0FAAC9"] forState:UIControlStateNormal];
    self.checkBtn.layer.cornerRadius = kCheckBtn_Height * kYScal / 2.0;
    self.checkBtn.backgroundColor = [UIColor whiteColor];
    self.checkBtn.titleLabel.font = [UIFont systemFontOfSize:kCheckBtn_FontSize * kYScal];
    [self.checkBtnBgView addSubview:self.checkBtn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
