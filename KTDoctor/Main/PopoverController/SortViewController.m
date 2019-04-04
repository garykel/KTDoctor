//
//  SortViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/3/25.
//  Copyright © 2019 dz. All rights reserved.
//

#import "SortViewController.h"

@interface SortViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UILabel *titleLbl;
@property (nonatomic,strong)UIView *sortBtnBgView;
@property (nonatomic,strong)UIButton *ascBtn;
@property (nonatomic,strong)UIButton *descBtn;
@property (nonatomic,strong)UIView *listBgView;
@property (nonatomic,strong)UITableView *listView;
@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleLbl = [[UILabel alloc] init];
    self.titleLbl.textColor = [UIColor blackColor];
    self.titleLbl.font = [UIFont systemFontOfSize:18.0];
    self.titleLbl.text = self.titleName;
    self.titleLbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.titleLbl];
    
    self.sortBtnBgView = [[UIView alloc] init];
    self.sortBtnBgView.backgroundColor = [UIColor whiteColor];
    self.sortBtnBgView.layer.borderColor = [UIColor colorWithHexString:@"#10a9cc"].CGColor;
    self.sortBtnBgView.layer.borderWidth = 1.0;
    [self.view addSubview:self.sortBtnBgView];
    
    self.ascBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ascBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [self.ascBtn setTitle:@"升序" forState:UIControlStateNormal];
    [self.ascBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.ascBtn setBackgroundColor:[UIColor colorWithHexString:@"#10a9cc"]];
    self.ascBtn.tag = 1;
    [self.ascBtn addTarget:self action:@selector(sort:) forControlEvents:UIControlEventTouchUpInside];
    [self.sortBtnBgView addSubview:self.ascBtn];
    
    self.descBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.descBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [self.descBtn setTitle:@"降序" forState:UIControlStateNormal];
    [self.descBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.descBtn setBackgroundColor:[UIColor whiteColor]];
    self.descBtn.tag = 2;
    [self.descBtn addTarget:self action:@selector(sort:) forControlEvents:UIControlEventTouchUpInside];
    [self.sortBtnBgView addSubview:self.descBtn];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //上次排序信息
    NSDictionary *lastSortInfo = [defaults valueForKey:@"lastSortInfo"];
    NSLog(@"lastSortInfo here :%@",lastSortInfo);
    if (lastSortInfo) {
        BOOL isAsc = [[lastSortInfo valueForKey:@"isAsc"] boolValue];
        if (isAsc) {
            [self.ascBtn setBackgroundColor:[UIColor colorWithHexString:@"#10a9cc"]];
            [self.descBtn setBackgroundColor:[UIColor whiteColor]];
        } else {
            [self.ascBtn setBackgroundColor:[UIColor whiteColor]];
            [self.descBtn setBackgroundColor:[UIColor colorWithHexString:@"#10a9cc"]];
        }
    } else {
        [self.ascBtn setBackgroundColor:[UIColor colorWithHexString:@"#10a9cc"]];
        [self.descBtn setBackgroundColor:[UIColor whiteColor]];
    }
    
    self.listBgView = [[UIView alloc] init];
    self.listBgView.layer.borderColor = [UIColor colorWithHexString:@"#10a9cc"].CGColor;
    self.listBgView.layer.borderWidth = 1.0;
    [self.view addSubview:self.listBgView];
    
    self.listView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.listView.tableFooterView = [[UIView alloc] init];
    self.listView.backgroundColor = [UIColor whiteColor];
    self.listView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.listView.scrollEnabled = NO;
    self.listView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.listView.delegate = self;
    self.listView.dataSource = self;
    [self.view addSubview:self.listView];
    
    [self setupAutoLayout];
}

- (void)setupAutoLayout {
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(18);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@200);
        make.height.equalTo(@15);
    }];
    
    CGFloat width = (self.preferredContentSize.width - 2 * 11)/2;
    [self.sortBtnBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLbl.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@29);
    }];
    
    [self.ascBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sortBtnBgView.mas_top).offset(1);
        make.left.equalTo(self.sortBtnBgView.mas_left).offset(1);
        make.width.equalTo(@(width));
        make.height.equalTo(@27);
    }];
    
    [self.descBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ascBtn.mas_top);
        make.right.equalTo(self.sortBtnBgView.mas_right).offset(-1);
        make.width.equalTo(@(width));
        make.height.equalTo(@27);
    }];
    
    [self.listBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sortBtnBgView.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
    }];
    
    [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.listBgView.mas_top).offset(1);
        make.left.equalTo(self.listBgView.mas_left).offset(1);
        make.right.equalTo(self.listBgView.mas_right).offset(-1);
        make.bottom.equalTo(self.listBgView.mas_bottom).offset(-0.5);
    }];
}

#pragma mark - UITableviewDelegate && UITableviewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.conditionsArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 48;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseCellId = @"reuseCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSMutableDictionary *dict = (NSMutableDictionary*)[self.conditionsArr objectAtIndexCheck:indexPath.section];
    cell.textLabel.text = [dict valueForKey:@"sortkey"];
    cell.textLabel.font = [UIFont systemFontOfSize:15.0];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *seperateLine = [[UIView alloc] init];
    seperateLine.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    return seperateLine;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSMutableDictionary *conditionDict = [NSMutableDictionary dictionary];
    NSMutableDictionary *sortDict = (NSMutableDictionary*)[self.conditionsArr objectAtIndexCheck:indexPath.section];
    NSLog(@"sortDict :%@",sortDict);
    NSString *sortFieldName = [sortDict valueForKey:@"sortkey"];
    NSString *sortField = @"";
    if ([sortFieldName isEqualToString:@"姓名"]) {
        sortField = @"name";
    } else if ([sortFieldName isEqualToString:@"心率带ID"]){
        sortField = @"hrDeviceId";
    } else if([sortFieldName isEqualToString:@"设备ID"]) {
        sortField = @"deviceId";
    } else if ([sortFieldName isEqualToString:@"当前心率"]) {
        sortField = @"currentHR";
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL isAsc = YES;
    UIColor *lightBlue = [UIColor colorWithHexString:@"#10a9cc"];
    UIColor *ascBtnColor = self.ascBtn.backgroundColor;
    if (CGColorEqualToColor(lightBlue.CGColor, ascBtnColor.CGColor)) {
        isAsc = YES;
    } else {
        isAsc = NO;
    }
    //上次排序信息
    NSDictionary *lastSortInfo = [defaults valueForKey:@"lastSortInfo"];
    if (lastSortInfo) {
        NSInteger lastSelectIndex = [[lastSortInfo valueForKey:@"selectedRow"] integerValue];
        UITableViewCell *lastCell = [self.listView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:lastSelectIndex]];
        NSMutableDictionary *sortDict = [self.conditionsArr objectAtIndexCheck:lastSelectIndex];
        NSMutableDictionary *newdict = [NSMutableDictionary dictionary];
        [newdict setValue:[sortDict valueForKey:@"sortkey"] forKey:@"sortkey"];
        [newdict setValue:[NSNumber numberWithBool:NO] forKey:@"hasSelected"];
        lastCell.backgroundColor = [UIColor clearColor];
        [self.conditionsArr replaceObjectAtIndex:lastSelectIndex withObject:newdict];
    }
    UITableViewCell *cell = [self.listView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    NSMutableDictionary *newSortDict = [NSMutableDictionary dictionary];
    [newSortDict setValue:[NSNumber numberWithBool:YES] forKey:@"hasSelected"];
    [newSortDict setValue:[sortDict valueForKey:@"sortkey"] forKey:@"sortkey"];
    [self.conditionsArr replaceObjectAtIndex:indexPath.section withObject:newSortDict];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:self.conditionsArr forKey:@"classSort"];
    NSMutableDictionary *currentSortDict = [NSMutableDictionary dictionary];
    [currentSortDict setValue:[NSNumber numberWithInteger:isAsc] forKey:@"isAsc"];
    [currentSortDict setValue:[NSNumber numberWithInteger:indexPath.section] forKey:@"selectedRow"];
    [userDefaults setValue:currentSortDict forKey:@"lastSortInfo"];
    [userDefaults synchronize];
    [self.listView reloadData];
    
    [conditionDict setValue:[NSNumber numberWithBool:isAsc] forKey:@"sortType"];
    [conditionDict setValue:sortField forKey:@"sortField"];
    [self.delegate conditionChoose:conditionDict];
}

#pragma mark - button click events

- (void)sort:(UIButton*)sender {
    NSInteger tag = sender.tag;
    BOOL isAsc = YES;
    if (tag == 1) {
        isAsc = YES;
        [self.ascBtn setBackgroundColor:[UIColor colorWithHexString:@"#10a9cc"]];
        [self.descBtn setBackgroundColor:[UIColor whiteColor]];
    } else {
        isAsc = NO;
        [self.ascBtn setBackgroundColor:[UIColor whiteColor]];
        [self.descBtn setBackgroundColor:[UIColor colorWithHexString:@"#10a9cc"]];
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //上次排序信息
    NSDictionary *lastSortInfo = [defaults valueForKey:@"lastSortInfo"];
    if (lastSortInfo) {
        NSLog(@"lastSortInfo :%@",lastSortInfo);
        NSInteger lastSelectIndex = [[lastSortInfo valueForKey:@"selectedRow"] integerValue];
        NSMutableDictionary *newSortDict = [NSMutableDictionary dictionary];
        [newSortDict setValue:[NSNumber numberWithBool:isAsc] forKey:@"isAsc"];
        [newSortDict setValue:[NSNumber numberWithInteger:lastSelectIndex] forKey:@"selectedRow"];
        [defaults setValue:newSortDict forKey:@"lastSortInfo"];
        [defaults synchronize];
        
        NSMutableDictionary *conditionDict = [NSMutableDictionary dictionary];
        NSMutableDictionary *sortDict = (NSMutableDictionary*)[self.conditionsArr objectAtIndexCheck:lastSelectIndex];
        NSString *sortFieldName = [sortDict valueForKey:@"sortkey"];
        NSString *sortField = @"";
        if ([sortFieldName isEqualToString:@"姓名"]) {
            sortField = @"name";
        } else if ([sortFieldName isEqualToString:@"心率带ID"]){
            sortField = @"hrDeviceId";
        } else if([sortFieldName isEqualToString:@"设备ID"]) {
            sortField = @"deviceId";
        } else if ([sortFieldName isEqualToString:@"当前心率"]) {
            sortField = @"currentHR";
        }
        [conditionDict setValue:[NSNumber numberWithBool:isAsc] forKey:@"sortType"];
        [conditionDict setValue:sortField forKey:@"sortField"];
        [self.delegate conditionChoose:conditionDict];
    }
}
@end
