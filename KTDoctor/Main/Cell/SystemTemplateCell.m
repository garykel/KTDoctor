//
//  SystemTemplateCell.m
//  KTDoctor
//
//  Created by garychen on 2019/5/4.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "SystemTemplateCell.h"

#define kLeftMargin 15+20
#define kNameLbl_LeftMargin 15
#define kHeaderView_RightMargin 130
#define kMiddleLine_Width 1
#define kEditBtn_LeftMargin 15
#define kEditBtn_RightMargin 15
#define kEditBtn_Height 24
#define kEditBtn_Width 100
#define kEditBtn_FontSize 13.0
#define kItem_FontSize 13.0
#define kCell_Height 30
#define kSeperateLine_Height 1

extern CGSize systemListviewSize;

@interface SystemTemplateCell ()
@property (nonatomic,strong)UIView *seperateLine;
@end

@implementation SystemTemplateCell

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

- (void)setFrame:(CGRect)frame {
    frame.size.width = kWidth - 2 * kLeftMargin * kXScal;
    [super setFrame:frame];
}

- (void)setUI {
    CGFloat itemLbl_Width = (systemListviewSize.width - kNameLbl_LeftMargin * kXScal - kHeaderView_RightMargin * kXScal - 8 * kMiddleLine_Width)/9;
    
    self.nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(kNameLbl_LeftMargin * kXScal, 0, itemLbl_Width, kCell_Height * kYScal)];
    self.nameLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.nameLbl.backgroundColor = [UIColor whiteColor];
    self.nameLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.nameLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.nameLbl];
    
    self.line1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line1.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line1];
    
    self.typeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line1.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.typeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.typeLbl.backgroundColor = [UIColor whiteColor];
    self.typeLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.typeLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.typeLbl];
    
    self.line2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.typeLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line2.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line2];
    
    self.dieaseLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line2.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.dieaseLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.dieaseLbl.backgroundColor = [UIColor whiteColor];
    self.dieaseLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.dieaseLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.dieaseLbl];
    
    self.line3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dieaseLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line3.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line3];
    
    self.riskLevelLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line3.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.riskLevelLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.riskLevelLbl.backgroundColor = [UIColor whiteColor];
    self.riskLevelLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.riskLevelLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.riskLevelLbl];
    
    self.line4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line4.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line4];
    
    self.positionLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line4.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.positionLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.positionLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.positionLbl.backgroundColor = [UIColor whiteColor];
    self.positionLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.positionLbl];
    
    self.line5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.positionLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line5.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line5];
    
    self.equipmentLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line5.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.equipmentLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.equipmentLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.equipmentLbl.textAlignment = NSTextAlignmentCenter;
    self.equipmentLbl.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.equipmentLbl];
    
    self.line6 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.equipmentLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line6.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line6];
    
    self.weekLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line6.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.weekLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.weekLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.weekLbl.textAlignment = NSTextAlignmentCenter;
    self.weekLbl.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.weekLbl];
    
    self.line7 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.weekLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line7.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line7];
    
    self.groupLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line7.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.groupLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.groupLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.groupLbl.backgroundColor = [UIColor whiteColor];
    self.groupLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.groupLbl];
    
    self.line8 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.groupLbl.frame), 0, kMiddleLine_Width, kCell_Height * kYScal)];
    self.line8.backgroundColor = [UIColor colorWithHexString:@"#A2E2EF"];
    [self.contentView addSubview:self.line8];
    
    self.timeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line8.frame), 0, itemLbl_Width, kCell_Height * kYScal)];
    self.timeLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.timeLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.timeLbl.backgroundColor = [UIColor whiteColor];
    self.timeLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.timeLbl];
    
    self.seperateLine = [[UIView alloc] initWithFrame:CGRectMake(self.nameLbl.frame.origin.x, kCell_Height * kYScal - kSeperateLine_Height, itemLbl_Width * 9 + 8 * kMiddleLine_Width, kSeperateLine_Height)];
    self.seperateLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.seperateLine];
    
    self.editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.editBtn setTitle:@"查看" forState:UIControlStateNormal];
    [self.editBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    self.editBtn.frame = CGRectMake(CGRectGetMaxX(self.timeLbl.frame) + kEditBtn_LeftMargin * kXScal, (kCell_Height * kYScal - kEditBtn_Height * kYScal)/2.0, kEditBtn_Width * kXScal, kEditBtn_Height * kYScal);
    self.editBtn.layer.cornerRadius = kEditBtn_Height * kYScal/2.0;
    self.editBtn.backgroundColor = [UIColor whiteColor];
    [self.editBtn.titleLabel setFont:[UIFont systemFontOfSize:kEditBtn_FontSize * kYScal]];
    self.editBtn.layer.masksToBounds = YES;
    [self.contentView addSubview:self.editBtn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
