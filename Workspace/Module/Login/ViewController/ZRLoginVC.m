//
//  ZRLoginVC.m
//  Workspace
//
//  Created by sanjia on 2018/5/28.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRLoginVC.h"

@interface ZRLoginVC ()

@end

@implementation ZRLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"登录";
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(0, 0, UI_SCREEN_WIDTH, 70);
    [self.view addSubview:button];
    
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(clickMethod) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clickMethod
{
    [self.navigationController pushViewController:[ZRLoginVC new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
