//
//  UIBarButtonItem+Action.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZRBarButtonActionBlock)(void);

@interface UIBarButtonItem (Action)

+ (id)fixItemSpace:(CGFloat)space;

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style actionBlick:(ZRBarButtonActionBlock)actionBlock;

- (id)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style actionBlick:(ZRBarButtonActionBlock)actionBlock;

- (void)setActionBlock:(ZRBarButtonActionBlock)actionBlock;

@end
