//
//  ZRTabBarController.h
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZRTabBar.h"

@interface ZRTabBarController : UITabBarController

/**
 初始化TabBar

 @param controllers 控制器
 @param norImages 未选中图片名称数组
 @param selImages 选中图片名称数组
 @param titles 标题数组
 @param config 配置信息
 @return TabBatController
 */
- (instancetype)initWithTabBarControllers:(NSArray <UIViewController*>*)controllers norImages:(NSArray <NSString *>*)norImages selImages:(NSArray <NSString *>*)selImages titles:(NSArray <NSString *>*)titles config:(ZRConfig *)config;

/**
 tabBar
 */
@property (nonatomic, strong) ZRTabBar *ZR_TabBar;
@end
