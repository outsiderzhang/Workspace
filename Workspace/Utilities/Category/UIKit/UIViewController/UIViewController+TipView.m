//
//  UIViewController+TipView.m
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import "UIViewController+TipView.h"
#import "UIView+TipView.h"

@implementation UIViewController (TipView)

- (void)showTipView:(UIView *)tipView retryAction:(void (^)(id userData))retryAction
{
    [self showTipView:tipView userData:nil retryAction:retryAction];
}

- (void)showTipView:(UIView *)tipView userData:(id)userData retryAction:(void (^)(id userData))retryAction
{
    [self.view showTipView:tipView userData:userData retryAction:retryAction];
}

- (void)removeTipView
{
    [self.view removeTipView];
}

- (UIView *)tt_tipView
{
    return self.view.tt_tipView;
}
@end
