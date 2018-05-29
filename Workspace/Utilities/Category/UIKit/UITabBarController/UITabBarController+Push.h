//
//  UITabBarController+Push.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (Push)
/**
 *  获取当前VC的navController，并执行push操作
 *
 *  @return 是否成功push
 */
- (BOOL)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
@end
