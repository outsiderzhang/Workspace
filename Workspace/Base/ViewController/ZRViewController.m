//
//  ZRViewController.m
//  Workspace
//
//  Created by sanjia on 2018/5/28.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRViewController.h"

@interface ZRViewController ()

@end

@implementation ZRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    //不扩展
    self.edgesForExtendedLayout = UIRectEdgeAll;
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
