//
//  ViewController.m
//  KTDoctor
//
//  Created by duwei on 2019/3/11.
//  Copyright © 2019 dz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@"13021059166" forKey:@"username"];
    [parameter setValue:@"123456" forKey:@"password"];
    [[NetworkService sharedInstance] requestWithUrl:[NSString stringWithFormat:@"%@%@",kSERVER_URL,kDOCTOR_LOGIN_URL] andParams:parameter andSucceed:^(NSDictionary *responseObject) {
        NSLog(@"登录成功");
    } andFaild:^(NSError *error) {
        NSLog(@"error :%@",error);
    }];
}


@end
