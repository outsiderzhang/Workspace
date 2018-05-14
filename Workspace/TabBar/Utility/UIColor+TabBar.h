//
//  UIColor+TabBar.h
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TabBar)
//16进制颜色转换
+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHexString:(NSString *)color Alpha:(CGFloat)alpha;
@end
