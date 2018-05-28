//
//  ZRTabBar.h
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZRConfig.h"

@class ZRTabBar;
@protocol ZRTabBarDelegate <NSObject>
/**
 选中某个索引
 
 @param tabBar 当前tabBar
 @param selectIndex 选中的索引
 */
- (void)tabBar:(ZRTabBar *)tabBar didSelectIndex:(NSInteger)selectIndex;
@end

@interface ZRTabBar : UITabBar
/**
 初始化TabBar
 
 @param frame tabBar frame
 @param norImages 未选中图片名称数组
 @param selImages 选中图片名称数组
 @param titles 标题数组
 @param config 配置信息
 @return TabBatController
 */
- (instancetype)initWithFrame:(CGRect)frame norImages:(NSArray <NSString *>*)norImages selImages:(NSArray <NSString *>*)selImages titles:(NSArray <NSString *>*)titles config:(ZRConfig *)config;

/** tabBar代理 */
@property (nonatomic, weak) id <ZRTabBarDelegate>tabBarDelegate;

/** selectedIndex (默认为0) */
@property (nonatomic, assign) NSInteger selectedIndex;

@end
