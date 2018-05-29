//
//  UIViewController+TipView.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TipView)
@property (nonatomic, strong, readonly) UIView *tt_tipView;

- (void)showTipView:(UIView *)tipView retryAction:(void (^)(id userData))retryAction;

- (void)showTipView:(UIView *)tipView userData:(id)userData retryAction:(void (^)(id userData))retryAction;

- (void)removeTipView;
@end
