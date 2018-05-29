//
//  UIViewController+NavBar.m
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import "UIViewController+NavBar.h"

@implementation UIViewController (NavBar)
- (void)addDismissBarButtonWithTitle:(NSString *)title
{
    __weak typeof(self) weakSelf = self;
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain actionBlick:^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
    [self.navigationItem setLeftBarButtonItem:barButton];
}

- (void)addLeftBarButtonWithTitle:(NSString *)title actionBlick:(ZRBarButtonActionBlock)actionBlock
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain actionBlick:actionBlock];
    [self.navigationItem setLeftBarButtonItem:barButton];
}

- (void)addLeftBarButtonWithImage:(UIImage *)image actionBlick:(ZRBarButtonActionBlock)actionBlock
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain actionBlick:actionBlock];
    [self.navigationItem setLeftBarButtonItem:barButton];
}

- (void)addRightBarButtonWithTitle:(NSString *)title actionBlick:(ZRBarButtonActionBlock)actionBlock
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain actionBlick:actionBlock];
    [self.navigationItem setRightBarButtonItem:barButton];
}

- (void)addRightBarButtonWithImage:(UIImage *)image actionBlick:(ZRBarButtonActionBlock)actionBlock
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain actionBlick:actionBlock];
    [self.navigationItem setRightBarButtonItem:barButton];
}
@end
