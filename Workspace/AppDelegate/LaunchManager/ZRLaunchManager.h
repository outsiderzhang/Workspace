//
//  ZRLaunchManager.h
//  Workspace
//
//  Created by sanjia on 2018/5/28.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZRTabBarController.h"

@interface ZRLaunchManager : NSObject

/**
 是否登录
 */
@property (nonatomic, assign) BOOL isLogin;
/**
 tanbarController
 */
@property (nonatomic, strong, readonly) ZRTabBarController *tabBarController;
/**
 初始化
 */
+ (instancetype)manager;

/**
 初始化主界面

 @param window 主界面
 */
- (void)initWithWindow:(UIWindow *)window;
@end
