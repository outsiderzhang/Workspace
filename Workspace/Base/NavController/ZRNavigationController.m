//
//  ZRNavigationController.m
//  Workspace
//
//  Created by sanjia on 2018/5/28.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRNavigationController.h"

@interface ZRNavigationController ()<UINavigationControllerDelegate>

@end

@implementation ZRNavigationController

//APP生命周期中 只会执行一次
+ (void)initialize
{
    //导航栏主题 title文字属性
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTranslucent:NO];
    [navBar setBarTintColor:kWhiteColor];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kTintColor, NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    [navBar setBackgroundImage:[UIImage imageWithColor:kWhiteColor] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault]; //此处使底部线条颜色为红色
    [navBar setShadowImage:[UIImage imageWithColor:kWhiteColor]];
    
    //导航栏左右文字主题
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kTintColor, NSFontAttributeName: [UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    [barButtonItem setTintColor:kTintColor];
    
    //tabbar
    UITabBar *tabBar = [UITabBar appearance];
    [tabBar setTranslucent:YES];
    [tabBar setBarTintColor:kWhiteColor];
    [tabBar setBackgroundImage:[UIImage imageWithColor:kWhiteColor]];
    [tabBar setShadowImage:[UIImage imageWithColor:kBgColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark -- UINavigationControllerDelegate
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
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
