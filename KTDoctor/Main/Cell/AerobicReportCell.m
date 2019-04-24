//
//  AerobicReportCell.m
//  KTDoctor
//
//  Created by duwei on 2019/4/24.
//  Copyright © 2019 dz. All rights reserved.
//

#import "AerobicReportCell.h"
#import "ReportListCell.h"

#define kView_LeftMargin 20
#define kListView_LeftMargin 15
#define kInfoView_TopMargin 15
#define kInfoView_LeftMargin 15
#define kInfoView_Height 67
#define kPrescriptionDetailBtn_Width 110
#define kPrescriptionDetailBtn_Height 24
#define kPrescriptionDetailBtn_LeftMargin 15
#define kPrescriptionDetailBtn_RightMargin 15
#define kItemLbl_Height 14
#define kItemLbl_FontSize 14.0
#define kPrescriptionBtn_FontSize 12.0
#define kReportList_TopMargin 10
#define kReportList_CellHeight 195

@interface AerobicReportCell()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation AerobicReportCell

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
    frame.size.width = kWidth - 2 * kView_LeftMargin - 2 * kListView_LeftMargin;
    [super setFrame:frame];
}

- (void)setUI {
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    self.infoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.frame.size.width - kPrescriptionDetailBtn_LeftMargin - kPrescriptionDetailBtn_Width,kInfoView_Height * kYScal)];
    self.infoView.layer.cornerRadius = 4;
    self.infoView.layer.masksToBounds = YES;
    self.infoView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.infoView];
    
    CGFloat itemWidth = (self.infoView.frame.size.width - 6)/7;
    CGFloat itemHeight = (kInfoView_Height - 1)/2;
    self.prescriptionLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, itemWidth, itemHeight)];
    self.prescriptionLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.prescriptionLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.prescriptionLbl.text = @"处方名称";
    self.prescriptionLbl.textAlignment = NSTextAlignmentCenter;
    [self.infoView addSubview:self.prescriptionLbl];
    
    self.middleLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.prescriptionLbl.frame), self.infoView.frame.size.width, 1)];
    self.middleLine.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.infoView addSubview:self.middleLine];
    
    self.prescriptionNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.middleLine.frame), itemWidth, itemHeight)];
    self.prescriptionNameLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.prescriptionNameLbl.textAlignment = NSTextAlignmentCenter;
    self.prescriptionNameLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    [self.infoView addSubview:self.prescriptionNameLbl];
    
    self.seperateLine1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.prescriptionLbl.frame), 0, 1, kInfoView_Height * kYScal)];
    self.seperateLine1.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.infoView addSubview:self.seperateLine1];
    
    self.trainingEquipmentLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperateLine1.frame), 0, itemWidth, itemHeight)];
    self.trainingEquipmentLbl.textAlignment = NSTextAlignmentCenter;
    self.trainingEquipmentLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.trainingEquipmentLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.trainingEquipmentLbl.text = @"训练设备";
    [self.infoView addSubview:self.trainingEquipmentLbl];
    
    self.trainingEquipmentNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.trainingEquipmentLbl.frame.origin.x, CGRectGetMaxY(self.middleLine.frame), itemWidth, itemHeight)];
    self.trainingEquipmentNameLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.trainingEquipmentNameLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.trainingEquipmentNameLbl.textAlignment = NSTextAlignmentCenter;
    [self.infoView addSubview:self.trainingEquipmentNameLbl];
    
    self.seperateLine2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.trainingEquipmentNameLbl.frame), 0, 1, kInfoView_Height * kYScal)];
    self.seperateLine2.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.infoView addSubview:self.seperateLine2];
    
    self.riskLevelLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperateLine2.frame), 0, itemWidth, itemHeight)];
    self.riskLevelLbl.textAlignment = NSTextAlignmentCenter;
    self.riskLevelLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.riskLevelLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.riskLevelLbl.text = @"风险等级";
    [self.infoView addSubview:self.riskLevelLbl];
    
    self.riskLevelValLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.riskLevelLbl.frame.origin.x, CGRectGetMaxY(self.middleLine.frame), itemWidth, itemHeight)];
    self.riskLevelValLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.riskLevelValLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.riskLevelValLbl.textAlignment = NSTextAlignmentCenter;
    [self.infoView addSubview:self.riskLevelValLbl];
    
    self.seperateLine3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.riskLevelLbl.frame), 0, 1, kInfoView_Height * kYScal)];
    self.seperateLine3.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.infoView addSubview:self.seperateLine3];
    
    self.createTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperateLine3.frame), 0, itemWidth, itemHeight)];
    self.createTimeLbl.textAlignment = NSTextAlignmentCenter;
    self.createTimeLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.createTimeLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.createTimeLbl.text = @"开具时间";
    [self.infoView addSubview:self.createTimeLbl];
    
    self.createTimeValLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.createTimeLbl.frame.origin.x, CGRectGetMaxY(self.middleLine.frame), itemWidth, itemHeight)];
    self.createTimeValLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.createTimeValLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.createTimeValLbl.textAlignment = NSTextAlignmentCenter;
    [self.infoView addSubview:self.createTimeValLbl];
    
    self.seperateLine4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.createTimeLbl.frame), 0, 1, kInfoView_Height * kYScal)];
    self.seperateLine4.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.infoView addSubview:self.seperateLine4];
    
    self.doctorLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperateLine4.frame), 0, itemWidth, itemHeight)];
    self.doctorLbl.textAlignment = NSTextAlignmentCenter;
    self.doctorLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.doctorLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.doctorLbl.text = @"开具医生";
    [self.infoView addSubview:self.doctorLbl];
    
    self.doctorNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.doctorLbl.frame.origin.x, CGRectGetMaxY(self.middleLine.frame), itemWidth, itemHeight)];
    self.doctorNameLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.doctorNameLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.doctorNameLbl.textAlignment = NSTextAlignmentCenter;
    [self.infoView addSubview:self.doctorNameLbl];
    
    self.seperateLine5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.doctorLbl.frame), 0, 1, kInfoView_Height * kYScal)];
    self.seperateLine5.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.infoView addSubview:self.seperateLine5];
    
    self.sportDaysLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.seperateLine5.frame), 0, itemWidth, itemHeight)];
    self.sportDaysLbl.textAlignment = NSTextAlignmentCenter;
    self.sportDaysLbl.textColor = [UIColor colorWithHexString:@"#666666"];
    self.sportDaysLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.sportDaysLbl.text = @"运动天数";
    [self.infoView addSubview:self.sportDaysLbl];
    
    self.sportDaysValLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.sportDaysLbl.frame.origin.x, CGRectGetMaxY(self.middleLine.frame), itemWidth, itemHeight)];
    self.sportDaysValLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.sportDaysValLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.sportDaysValLbl.textAlignment = NSTextAlignmentCenter;
    [self.infoView addSubview:self.sportDaysValLbl];
    
    self.seperateLine6 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.sportDaysLbl.frame), 0, 1, kInfoView_Height * kYScal)];
    self.seperateLine6.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
    [self.infoView addSubview:self.seperateLine6];
    
    self.reportsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.reportsBtn.backgroundColor = [UIColor whiteColor];
    self.reportsBtn.frame = CGRectMake(CGRectGetMaxX(self.seperateLine6.frame), 0, itemWidth, itemHeight);
    [self.reportsBtn setTitle:@"报告数" forState:UIControlStateNormal];
    [self.reportsBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    [self.reportsBtn setImage:[UIImage imageNamed:@"showReport"] forState:UIControlStateNormal];
    [self.reportsBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.reportsBtn.imageView.frame.size.width, 0, self.reportsBtn.imageView.frame.size.width)];
    [self.reportsBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.reportsBtn.titleLabel.bounds.size.width, 0, -self.reportsBtn.titleLabel.bounds.size.width)];
    [self.reportsBtn.titleLabel setFont:[UIFont systemFontOfSize:kItemLbl_FontSize * kYScal]];
    [self.infoView addSubview:self.reportsBtn];
    
    self.reportsValLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.reportsBtn.frame.origin.x, CGRectGetMaxY(self.middleLine.frame), itemWidth, itemHeight)];
    self.reportsValLbl.textColor = [UIColor colorWithHexString:@"#333333"];
    self.reportsValLbl.font = [UIFont systemFontOfSize:kItemLbl_FontSize * kYScal];
    self.reportsValLbl.textAlignment = NSTextAlignmentCenter;
    [self.infoView addSubview:self.reportsValLbl];
    
    self.prescriptionDetailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.prescriptionDetailBtn.backgroundColor = [UIColor whiteColor];
    CGFloat topMargin = (self.infoView.frame.size.height - kPrescriptionDetailBtn_Height * kYScal)/2;
    self.prescriptionDetailBtn.frame = CGRectMake(CGRectGetMaxX(self.infoView.frame) + kPrescriptionDetailBtn_LeftMargin * kXScal, topMargin, kPrescriptionDetailBtn_Width * kXScal, kPrescriptionDetailBtn_Height * kYScal);
    [self.prescriptionDetailBtn setTitleColor:[UIColor colorWithHexString:@"#0FAAC9"] forState:UIControlStateNormal];
    [self.prescriptionDetailBtn.titleLabel setFont:[UIFont systemFontOfSize:kPrescriptionBtn_FontSize * kYScal]];
    self.prescriptionDetailBtn.layer.cornerRadius = kPrescriptionDetailBtn_Height * kYScal / 2.0;
    [self.prescriptionDetailBtn setTitle:@"处方详情" forState:UIControlStateNormal];
    self.prescriptionDetailBtn.layer.masksToBounds = YES;
    [self.contentView addSubview:self.prescriptionDetailBtn];
    
    self.reportListview = [[UITableView alloc] initWithFrame:CGRectMake(self.infoView.frame.origin.x, CGRectGetMaxY(self.infoView.frame) + kReportList_TopMargin * kYScal, CGRectGetMaxX(self.prescriptionDetailBtn.frame), 400) style:UITableViewStylePlain];
//    self.reportListview.hidden = YES;
    self.reportListview.delegate = self;
    self.reportListview.dataSource = self;
    self.reportListview.tableFooterView = [[UIView alloc] init];
    [self.contentView addSubview:self.reportListview];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return self.reportsArr.count;
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kReportList_CellHeight * kYScal;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseCellStr = [NSString stringWithFormat:@"reportListCell%d%d",indexPath.section,indexPath.row];
    ReportListCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellStr];
    if (cell == nil) {
        cell = [[ReportListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellStr];
        cell.backgroundColor = [UIColor colorWithHexString:@"#9EDCEA"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
