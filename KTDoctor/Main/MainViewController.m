//
//  MainViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/3/13.
//  Copyright © 2019 dz. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UIButton *logoutBtn;
@property (nonatomic,strong)UILabel *nameLbl;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    self.title = @"首页";
    [self setNavBar];
}

- (void)setNavBar {
    self.navView = [[UIView alloc] init];
    self.navView.backgroundColor = [UIColor colorWithHexString:@"#10a9cc"];
    [self.view addSubview:self.navView];
    
    self.logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.logoutBtn setImage:[UIImage imageNamed:@"set"] forState:UIControlStateNormal];
    self.logoutBtn.backgroundColor = [UIColor colorWithHexString:@"#bebcc4"];
    [self.logoutBtn setTitle:@"注销" forState:UIControlStateNormal];
    [self.logoutBtn.titleLabel setFont:[UIFont systemFontOfSize:10.0]];
    self.logoutBtn.layer.cornerRadius = 10.0;
    self.logoutBtn.layer.masksToBounds = YES;
    self.logoutBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    [self.logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.logoutBtn addTarget:self action:@selector(logoutBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.logoutBtn];
    
    self.nameLbl = [[UILabel alloc] init];
    self.nameLbl.textColor = [UIColor whiteColor];
    self.nameLbl.font = [UIFont systemFontOfSize:15.0];
    self.nameLbl.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:self.nameLbl];
    
    [self.navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(20);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.equalTo(@(60));
    }];
    
    [self.nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.logoutBtn.mas_centerY);
        make.left.equalTo(self.logoutBtn.mas_right).offset(15);
        make.width.equalTo(@280);
        make.height.equalTo(@20);
    }];
    
    [self.logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navView.mas_centerY);
        make.right.equalTo(self.navView.mas_left).offset(15);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
}

- (void)logoutBtnClick:(UIButton*)sender {
    
}

@end
