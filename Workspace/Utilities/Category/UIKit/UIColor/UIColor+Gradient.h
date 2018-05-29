//
//  UIColor+Gradient.h
//  Education_IM
//
//  Created by sanjia on 2018/1/8.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Gradient)
/**
 *  渐变颜色
 *
 *  @param fromColor    开始颜色
 *  @param toColor      结束颜色
 *  @param height       渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor *)gradientColorFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(int)height;
@end
