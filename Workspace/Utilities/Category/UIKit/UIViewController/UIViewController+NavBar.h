//
//  UIViewController+NavBar.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBarButtonItem+Action.h"
@interface UIViewController (NavBar)
/// 添加消失BarButton（左侧)
- (void)addDismissBarButtonWithTitle:(NSString *)title;

/// 左侧文字BarButton
- (void)addLeftBarButtonWithTitle:(NSString *)title actionBlick:(ZRBarButtonActionBlock)actionBlock;
/// 左侧图片BarButton
- (void)addLeftBarButtonWithImage:(UIImage *)image actionBlick:(ZRBarButtonActionBlock)actionBlock;

/// 右侧文字BarButton
- (void)addRightBarButtonWithTitle:(NSString *)title actionBlick:(ZRBarButtonActionBlock)actionBlock;
/// 右侧图片BarButton
- (void)addRightBarButtonWithImage:(UIImage *)image actionBlick:(ZRBarButtonActionBlock)actionBlock;
@end
