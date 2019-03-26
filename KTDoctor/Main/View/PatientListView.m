//
//  PatientListView.m
//  KTDoctor
//
//  Created by duwei on 2019/3/26.
//  Copyright © 2019 dz. All rights reserved.
//

#import "PatientListView.h"
#import "PatientCell.h"

#define kAlertView_LeftMargin 200
#define kAlertViewTopMargin 150
#define kTopView_Height 50
#define KTitleLbl_Width 250
#define kTitleLbl_Height 40
#define kTitleLbl_TopMargin 10
#define kRightButton_Width 35
#define kRightButton_RightMargin 15
#define kFunctionButton_TopMargin 10
#define kFunctionButton_LeftMargin 20
#define kFunctionButton_Height 40
#define kFunctionButton_FontSize 20
#define kFunctionButton_HorizontalSpace 2
#define kRemoveBtn_LeftMargin 30
#define kRemoveBtn_Width 20
#define kRemoveBtn_RightMargin 15
#define KListView_TopMargin 10

@interface PatientListView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,assign)CGRect contentFrame;
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIButton *rightBtn;
@property (nonatomic,strong)UIView *seperateLine;
@property (nonatomic,strong)UIButton *hrDeviceIDBtn;
@property (nonatomic,strong)UIButton *deviceIDBtn;
@property (nonatomic,strong)UIButton *nameBtn;
@property (nonatomic,strong)UIButton *idBtn;
@property (nonatomic,strong)UITableView *listView;
@end

@implementation PatientListView

- (instancetype)initWithFrame:(CGRect) frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentFrame = frame;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.85];
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 1;
    }];
    
    self.contentView = [[UIView alloc] init];
    self.contentView.frame = CGRectMake(0, 0, kWidth - 2 * kAlertView_LeftMargin, kHeight - 2 * kAlertViewTopMargin);
    self.contentView.frame = self.contentFrame;
    self.contentView.layer.cornerRadius = 2;
    self.contentView.layer.masksToBounds = YES;
    CGPoint center = self.center;
    CGFloat x = center.x;
    CGFloat y = center.y;
    self.contentView.center = CGPointMake(x, y);
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 6;
    [self addSubview:self.contentView];
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, kTopView_Height)];
    self.topView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.topView];
    
    self.titleLbl = [[UILabel alloc] init];
    self.titleLbl.text = @"患者管理(0)";
    self.titleLbl.textColor = [UIColor blackColor];
    self.titleLbl.textAlignment = NSTextAlignmentCenter;
    CGFloat titleLbl_LeftMargin = (self.topView.frame.size.width - KTitleLbl_Width)/2;
    CGFloat titleLbl_TopMargin = (kTopView_Height - kTitleLbl_Height)/2;
    self.titleLbl.frame = CGRectMake(titleLbl_LeftMargin, titleLbl_TopMargin, KTitleLbl_Width, kTitleLbl_Height);
    [self.topView addSubview:self.titleLbl];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(addPatient:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat rightBtn_LeftMargin = self.topView.frame.size.width - kRightButton_Width - kRightButton_RightMargin;
    CGFloat rightBtn_TopMargin = (kTopView_Height - kRightButton_Width)/2;
    self.rightBtn.frame = CGRectMake(rightBtn_LeftMargin, rightBtn_TopMargin, kRightButton_Width, kRightButton_Width);
    [self.topView addSubview:self.rightBtn];
    
    self.seperateLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame), self.contentView.frame.size.width, 1)];
    self.seperateLine.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.contentView addSubview:self.seperateLine];
    
    self.hrDeviceIDBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat btnWidth = (self.contentView.frame.size.width - kFunctionButton_LeftMargin - kRemoveBtn_LeftMargin - kRemoveBtn_Width - kRemoveBtn_RightMargin)/4;
    self.hrDeviceIDBtn.frame = CGRectMake(kFunctionButton_LeftMargin, CGRectGetMaxY(self.seperateLine.frame) + kFunctionButton_TopMargin, btnWidth, kFunctionButton_Height);
    [self.hrDeviceIDBtn setTitle:@"心率带ID" forState:UIControlStateNormal];
    [self.hrDeviceIDBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.hrDeviceIDBtn.titleLabel setFont:[UIFont systemFontOfSize:kFunctionButton_FontSize]];
    self.hrDeviceIDBtn.backgroundColor = [UIColor colorWithHexString:@"#fccdcc"];
    self.hrDeviceIDBtn.layer.borderColor = [UIColor colorWithHexString:@"#f39795"].CGColor;
    self.hrDeviceIDBtn.layer.borderWidth = 1;
    [self.contentView addSubview:self.hrDeviceIDBtn];
    
    self.deviceIDBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deviceIDBtn.frame = CGRectMake(CGRectGetMaxX(self.hrDeviceIDBtn.frame) + kFunctionButton_HorizontalSpace, self.hrDeviceIDBtn.frame.origin.y, btnWidth, kFunctionButton_Height);
    [self.deviceIDBtn setTitle:@"设备ID" forState:UIControlStateNormal];
    [self.deviceIDBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.deviceIDBtn.titleLabel setFont:[UIFont systemFontOfSize:kFunctionButton_FontSize]];
    self.deviceIDBtn.backgroundColor = [UIColor colorWithHexString:@"#fccdcc"];
    self.deviceIDBtn.layer.borderColor = [UIColor colorWithHexString:@"#f39795"].CGColor;
    self.deviceIDBtn.layer.borderWidth = 1;
    [self.contentView addSubview:self.deviceIDBtn];
    
    self.nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nameBtn.frame = CGRectMake(CGRectGetMaxX(self.deviceIDBtn.frame) + kFunctionButton_HorizontalSpace, self.hrDeviceIDBtn.frame.origin.y, btnWidth, kFunctionButton_Height);
    [self.nameBtn setTitle:@"姓名" forState:UIControlStateNormal];
    [self.nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.nameBtn.titleLabel setFont:[UIFont systemFontOfSize:kFunctionButton_FontSize]];
    self.nameBtn.backgroundColor = [UIColor colorWithHexString:@"#fccdcc"];
    self.nameBtn.layer.borderColor = [UIColor colorWithHexString:@"#f39795"].CGColor;
    self.nameBtn.layer.borderWidth = 1;
    [self.contentView addSubview:self.nameBtn];
    
    self.idBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.idBtn.frame = CGRectMake(CGRectGetMaxX(self.nameBtn.frame) + kFunctionButton_HorizontalSpace, self.hrDeviceIDBtn.frame.origin.y, btnWidth, kFunctionButton_Height);
    [self.idBtn setTitle:@"ID" forState:UIControlStateNormal];
    [self.idBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.idBtn.titleLabel setFont:[UIFont systemFontOfSize:kFunctionButton_FontSize]];
    self.idBtn.backgroundColor = [UIColor colorWithHexString:@"#fccdcc"];
    self.idBtn.layer.borderColor = [UIColor colorWithHexString:@"#f39795"].CGColor;
    self.idBtn.layer.borderWidth = 1;
    [self.contentView addSubview:self.idBtn];
    
    CGFloat listView_Height = self.frame.size.height - CGRectGetMaxX(self.hrDeviceIDBtn.frame) - KListView_TopMargin;
    self.listView = [[UITableView alloc] initWithFrame:CGRectMake(self.hrDeviceIDBtn.frame.origin.x, CGRectGetMaxY(self.hrDeviceIDBtn.frame), self.contentView.frame.size.width - kFunctionButton_LeftMargin, listView_Height) style:UITableViewStylePlain];
    self.listView.tableFooterView = [[UIView alloc] init];
    self.listView.dataSource = self;
    self.listView.delegate = self;
    self.listView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.listView];
}

- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
}

- (void)dismiss {
    [self removeFromSuperview];
}

#pragma mark - UITableviewDelegate && UITableviewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseCellId = @"reuseCellId";
    PatientCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellId];
    if (cell == nil) {
        cell = [[PatientCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell.hrDeviceIdBtn setTitle:@"21cDB2C" forState:UIControlStateNormal];
    [cell.deviceIdBtn setTitle:@"22:22:2C:30:C0:AF" forState:UIControlStateNormal];
    [cell.nameBtn setTitle:@"Andrew" forState:UIControlStateNormal];
    [cell.idBtn setTitle:@"5" forState:UIControlStateNormal];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - button click events

- (void)handleTapGesture:(UITapGestureRecognizer*)gesture {
    if (gesture.state == UIGestureRecognizerStateEnded) {
        CGPoint location = [gesture locationInView:self];
        NSLog(@"location :%@",NSStringFromCGPoint(location));
        if (!CGRectContainsPoint(self.contentView.frame, location)) {
            [self dismiss];
        }
    }
}
- (void)addPatient:(UIButton*)sender {
    NSLog(@"添加患者");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    point = [self.contentView.layer convertPoint:point fromLayer:self.layer];
    if (![self.contentView.layer containsPoint:point]) {
        [self dismiss];
    }
}
@end
