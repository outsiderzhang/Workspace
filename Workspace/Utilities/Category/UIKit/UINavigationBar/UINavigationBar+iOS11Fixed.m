//
//  UINavigationBar+iOS11Fixed.m
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import "UINavigationBar+iOS11Fixed.h"
#import <objc/runtime.h>
@implementation UINavigationBar (iOS11Fixed)
+ (void)load
{
    Method oldMethod = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method newMethod = class_getInstanceMethod(self, @selector(tt_layoutSubviews));
    method_exchangeImplementations(oldMethod, newMethod);
}

- (void)tt_layoutSubviews
{
    [self tt_layoutSubviews];
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] != NSOrderedAscending) {
        self.layoutMargins = UIEdgeInsetsZero;
        for (UIView *view in self.subviews) {
            if ([NSStringFromClass(view.class) containsString:@"ContentView"]) {
                view.layoutMargins = UIEdgeInsetsZero;
                break;
            }
        }
    }
}
@end
