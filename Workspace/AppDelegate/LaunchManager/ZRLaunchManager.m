//
//  ZRLaunchManager.m
//  Workspace
//
//  Created by sanjia on 2018/5/28.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRLaunchManager.h"

#import "ZRNavigationController.h"
#import "ZRLoginVC.h"
#import "ZRRegisterVC.h"
#import "ZRNearlyVC.h"
#import "ZRServiceVC.h"
#import "ZRMineVC.h"

@interface ZRLaunchManager ()
//窗口
@property (nonatomic, weak) UIWindow *window;
//tabbarController
@property (nonatomic, strong, readwrite) ZRTabBarController *tabBarController;
@end

@implementation ZRLaunchManager

@synthesize tabBarController = _tabBarController;

//初始化窗口
- (void)initWithWindow:(UIWindow *)window
{
    self.window = window;
    if (!self.isLogin) {
        ZRRegisterVC *loginVC = [[ZRRegisterVC alloc] init];
        ZRNavigationController *nav = [[ZRNavigationController alloc] initWithRootViewController:loginVC];
        [self setRootViewController:nav];
    }else{
        [self setRootViewController:self.tabBarController];
    }
}

- (void)setRootViewController:(__kindof UIViewController *)rootViewController
{
    UIWindow *window = self.window ? self.window:[UIApplication sharedApplication].keyWindow;
    //[window removeAllSubviews];
    [window setRootViewController:rootViewController];
    [window addSubview:rootViewController.view];
    window.backgroundColor = kWhiteColor;
    [window makeKeyAndVisible];
}

#pragma mark -- 初始化
+ (instancetype)manager
{
    static ZRLaunchManager *_launchManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _launchManager = [[ZRLaunchManager alloc] init];
    });
    return _launchManager;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self setupTabBarController];
    }
    return self;
}

- (void)setupTabBarController
{
    NSArray *titles = @[@"附近俱乐部", @"自助服务", @"个人中心"];
    NSArray *normalImages = @[@"tab1_nor", @"tab2_nor", @"tab3_nor"];
    NSArray *selectedImages = @[@"tab1_sel", @"tab2_sel", @"tab3_sel"];
    NSMutableArray *viewControllers = @[].mutableCopy;
    [viewControllers addObject:[self setupNavWithController:[ZRNearlyVC new]]];
    [viewControllers addObject:[self setupNavWithController:[ZRServiceVC new]]];
    [viewControllers addObject:[self setupNavWithController:[ZRMineVC new]]];
    
    self.tabBarController = [[ZRTabBarController alloc] initWithTabBarControllers:viewControllers norImages:normalImages selImages:selectedImages titles:titles config:[ZRConfig config]];
    
    //    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    btn.imageEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0);
    //    [btn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    //    [config addCustomBtn:btn AtIndex:2 BtnClickBlock:^(UIButton *btn, NSInteger index) {
    //
    //        UIViewController *vc = [[UIViewController alloc] init];
    //        vc.view.backgroundColor = [UIColor orangeColor];
    //        [[ZRConfig config].tabBarController presentViewController:vc animated:YES completion:nil];
    //
    //        //测试代码 (两秒后自动关闭)
    //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //            [vc dismissViewControllerAnimated:YES completion:nil];
    //        });
    //    }];
}

- (ZRNavigationController *)setupNavWithController:(ZRViewController *)controller
{
    return [[ZRNavigationController alloc] initWithRootViewController:controller];
}

@end
