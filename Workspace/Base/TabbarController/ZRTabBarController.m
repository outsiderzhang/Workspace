//
//  ZRTabBarController.m
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRTabBarController.h"

@interface ZRTabBarController ()<ZRTabBarDelegate>

@end

@implementation ZRTabBarController

- (instancetype)initWithTabBarControllers:(NSArray<UIViewController *> *)controllers norImages:(NSArray<NSString *> *)norImages selImages:(NSArray<NSString *> *)selImages titles:(NSArray<NSString *> *)titles config:(ZRConfig *)config
{
    self.viewControllers = controllers;
    
    self.ZR_TabBar = [[ZRTabBar alloc] initWithFrame:self.tabBar.bounds norImages:norImages selImages:selImages titles:titles config:config];
    self.ZR_TabBar.tabBarDelegate = self;
    
    config.tabBarController = self;

    [self setValue:self.ZR_TabBar forKeyPath:@"tabBar"];
    [self addObserver:self forKeyPath:@"selectedIndex" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSInteger selectedIndex = [change[@"new"] integerValue];
    self.ZR_TabBar.selectedIndex = selectedIndex;
}

- (void)tabBar:(ZRTabBar *)tabBar didSelectIndex:(NSInteger)selectIndex {
    self.selectedIndex = selectIndex;
}

- (void)dealloc {
    
    [self removeObserver:self forKeyPath:@"selectedIndex"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
