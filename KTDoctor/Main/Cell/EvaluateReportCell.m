//
//  EvaluateReportCell.m
//  KTDoctor
//
//  Created by duwei on 2019/5/30.
//  Copyright © 2019 dz. All rights reserved.
//

#import "EvaluateReportCell.h"

#define kMiddleLine_Width 1
#define kCell_Height 44
#define kSeperateLine_Height 1
#define kItem_FontSize 13.0

extern CGSize evaluateReportListviewSize;

@interface EvaluateReportCell()
@property (nonatomic,strong)UIView *line1;
@property (nonatomic,strong)UIView *line2;
@property (nonatomic,strong)UIView *line3;
@property (nonatomic,strong)UIView *line4;
@property (nonatomic,strong)UIView *line5;
@property (nonatomic,strong)UIView *seperateLine;
@end

@implementation EvaluateReportCell

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
    CGFloat itemLbl_Width = (evaluateReportListviewSize.width - 5 * kMiddleLine_Width)/6;
    self.dateLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, itemLbl_Width, kCell_Height * kYScal - kSeperateLine_Height)];
    self.dateLbl.textColor = [UIColor blackColor];
    self.dateLbl.backgroundColor = [UIColor whiteColor];
    self.dateLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.dateLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.dateLbl];
    
    self.line1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dateLbl.frame), 0, kMiddleLine_Width, self.dateLbl.frame.size.height)];
    self.line1.backgroundColor = [UIColor colorWithHexString:@"a6dfeb"];
    [self.contentView addSubview:self.line1];
    
    self.timeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line1.frame), 0, itemLbl_Width, self.dateLbl.frame.size.height)];
    self.timeLbl.textColor = [UIColor blackColor];
    self.timeLbl.backgroundColor = [UIColor whiteColor];
    self.timeLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.timeLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.timeLbl];
    
    self.line2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.timeLbl.frame), 0, kMiddleLine_Width, self.dateLbl.frame.size.height)];
    self.line2.backgroundColor = [UIColor colorWithHexString:@"a6dfeb"];
    [self.contentView addSubview:self.line2];
    
    self.avgPowerLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line2.frame), 0, itemLbl_Width, self.dateLbl.frame.size.height)];
    self.avgPowerLbl.textColor = [UIColor blackColor];
    self.avgPowerLbl.backgroundColor = [UIColor whiteColor];
    self.avgPowerLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.avgPowerLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.avgPowerLbl];
    
    self.line3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgPowerLbl.frame), 0, kMiddleLine_Width, self.dateLbl.frame.size.height)];
    self.line3.backgroundColor = [UIColor colorWithHexString:@"a6dfeb"];
    [self.contentView addSubview:self.line3];
    
    self.avgSpeedLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line3.frame), 0, itemLbl_Width, self.dateLbl.frame.size.height)];
    self.avgSpeedLbl.textColor = [UIColor blackColor];
    self.avgSpeedLbl.backgroundColor = [UIColor whiteColor];
    self.avgSpeedLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.avgSpeedLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.avgSpeedLbl];
    
    self.line4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avgSpeedLbl.frame), 0, kMiddleLine_Width, self.dateLbl.frame.size.height)];
    self.line4.backgroundColor = [UIColor colorWithHexString:@"a6dfeb"];
    [self.contentView addSubview:self.line4];
    
    self.maxHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line4.frame), 0, itemLbl_Width, self.dateLbl.frame.size.height)];
    self.maxHRLbl.textColor = [UIColor blackColor];
    self.maxHRLbl.backgroundColor = [UIColor whiteColor];
    self.maxHRLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.maxHRLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.maxHRLbl];
    
    self.line5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.maxHRLbl.frame), 0, kMiddleLine_Width, self.dateLbl.frame.size.height)];
    self.line5.backgroundColor = [UIColor colorWithHexString:@"a6dfeb"];
    [self.contentView addSubview:self.line5];
    
    self.avgHRLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.line5.frame), 0, itemLbl_Width, self.dateLbl.frame.size.height)];
    self.avgHRLbl.textColor = [UIColor blackColor];
    self.avgHRLbl.backgroundColor = [UIColor whiteColor];
    self.avgHRLbl.font = [UIFont systemFontOfSize:kItem_FontSize * kYScal];
    self.avgHRLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.avgHRLbl];
    
    self.seperateLine = [[UIView alloc] initWithFrame:CGRectMake(0, kCell_Height * kYScal - kSeperateLine_Height, evaluateReportListviewSize.width, kSeperateLine_Height)];
    self.seperateLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.seperateLine];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
