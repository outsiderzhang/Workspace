//
//  UIImage+Color.h
//  Education_IM
//
//  Created by sanjia on 2018/1/8.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage *)imageWithColor:(UIColor *)color;

// 灰色图像
- (UIImage *)grayImage;
@end
