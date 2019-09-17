//
//  IndexPopoverViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/3/22.
//  Copyright © 2019 dz. All rights reserved.
//

#import "IndexPopoverViewController.h"
#import "IndexPopCell.h"

@interface IndexPopoverViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableview;
@end

@implementation IndexPopoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableview.tableFooterView = [[UIView alloc] init];
    self.tableview.backgroundColor = [UIColor whiteColor];
    self.tableview.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableview.scrollEnabled = NO;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
}

#pragma mark - UITableviewDelegate && UITableviewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *seperateLine = [[UIView alloc] init];
    seperateLine.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    return seperateLine;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.contentArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110/3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseCellId = @"reuseCellId";
    IndexPopCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellId];
    if (cell == nil) {
        cell = [[IndexPopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (self.contentArr.count > 0) {
        NSDictionary *dict = [self.contentArr objectAtIndex:indexPath.section];
        NSString *title = [dict valueForKey:@"title"];
        NSString *icon = [dict valueForKey:@"icon"];
        cell.titleLbl.text = title;
        cell.icon.image = [UIImage imageNamed:icon];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self.delegate conditionChoose:indexPath.section];
}

@end
