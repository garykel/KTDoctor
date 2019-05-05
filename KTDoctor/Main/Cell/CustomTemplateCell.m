//
//  CustomTemplateCell.m
//  KTDoctor
//
//  Created by garychen on 2019/5/4.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "CustomTemplateCell.h"
#define kLeftMargin 15+20+15
#define kTemplateMenu_LeftMargin 15
#define kHeaderView_RightMargin 130
#define kCheck_LeftMargin 17
#define kCheck_RightMargin 13
#define kCheck_Width 16
#define kMiddleLine_Width 1
#define kEditBtn_LeftMargin 15
#define kEditBtn_RightMargin 15
#define kEditBtn_Height 24
#define kEditBtn_Width 100
#define kEditBtn_FontSize 13.0
#define kItem_FontSize 13.0
#define kCell_Height 30
#define kSeperateLine_Height 1
extern CGSize customListviewSize;

@interface CustomTemplateCell ()
@property (nonatomic,strong)UIView *seperateLine;
@end

@implementation CustomTemplateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}


- (void)setUI {
    self.checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.checkBtn.frame = CGRectMake(kCheck_LeftMargin * kXScal, (kCell_Height * kXScal - kCheck_Width * kYScal)/2, kCheck_Width * kYScal, kCheck_Width * kYScal);
    [self.checkBtn setImage:[UIImage imageNamed:@"template_unselected"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.checkBtn];
    
    CGFloat itemLbl_Width = (customListviewSize.width - CGRectGetMaxX(self.checkBtn.frame) - kCheck_RightMargin * kXScal - kHeaderView_RightMargin * kXScal - 7 * kMiddleLine_Width)/8;
    
    self.nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.checkBtn.frame) + kCheck_RightMargin * kXScal, 0, itemLbl_Width, kCell_Height * kYScal)];
    self.nameLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.nameLbl.backgroundColor = [UIColor whiteColor];
    self.nameLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.nameLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.nameLbl];
    
    self.line1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line1.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line1];
    
    self.dieaseLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line1.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.dieaseLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.dieaseLbl.backgroundColor = [UIColor whiteColor];
    self.dieaseLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.dieaseLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.dieaseLbl];
    
    self.line2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dieaseLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line2.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line2];
    
    self.riskLevelLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line2.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.riskLevelLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.riskLevelLbl.backgroundColor = [UIColor whiteColor];
    self.riskLevelLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.riskLevelLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.riskLevelLbl];
    
    self.line3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line3.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line3];
    
    self.positionLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line3.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.positionLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.positionLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.positionLbl.backgroundColor = [UIColor whiteColor];
    self.positionLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.positionLbl];
    
    self.line4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.positionLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line4.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line4];
    
    self.equipmentLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line4.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.equipmentLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.equipmentLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.equipmentLbl.backgroundColor = [UIColor whiteColor];
    self.equipmentLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.equipmentLbl];
    
    self.line5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.equipmentLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line5.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line5];
    
    self.weekLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line5.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.weekLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.weekLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.weekLbl.backgroundColor = [UIColor whiteColor];
    self.weekLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.weekLbl];
    
    self.line6 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.weekLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line6.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line6];
    
    self.groupLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line6.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.groupLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.groupLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.groupLbl.backgroundColor = [UIColor whiteColor];
    self.groupLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.groupLbl];
    
    self.line7 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.groupLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line7.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line7];
    
    self.timeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line7.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.timeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.timeLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.timeLbl.backgroundColor = [UIColor whiteColor];
    self.timeLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.timeLbl];
    
    self.seperateLine = [[UIView alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x, kCell_Height - kSeperateLine_Height, itemLbl_Width * 8 + 7 * kMiddleLine_Width, kSeperateLine_Height)];
    self.seperateLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.seperateLine];
    
    self.editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [self.editBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    self.editBtn.frame = CGRectMake(CGRectGetMaxX(self.timeLbl.frame) + kEditBtn_LeftMargin * kXScal, (kCell_Height * kYScal - kEditBtn_Height * kYScal)/2.0, kEditBtn_Width * kXScal, kEditBtn_Height * kYScal);
    self.editBtn.layer.cornerRadius = kEditBtn_Height * kYScal/2.0;
    self.editBtn.layer.masksToBounds = YES;
    self.editBtn.backgroundColor = [UIColor whiteColor];
    [self.editBtn.titleLabel setFont:[UIFont systemFontOfSize:kEditBtn_FontSize * kYScal]];
    [self.contentView addSubview:self.editBtn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
