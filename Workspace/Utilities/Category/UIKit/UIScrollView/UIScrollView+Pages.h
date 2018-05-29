//
//  UIScrollView+Pages.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Pages)
#pragma mark - # 横向分页
@property (nonatomic, assign, readonly) NSInteger numberOfPageX;
@property (nonatomic, assign) NSInteger pageX;
- (void)setPageX:(CGFloat)page animated:(BOOL)animated;

#pragma mark - # 纵向分页
@property (nonatomic, assign, readonly) NSInteger numberOfPageY;
@property (nonatomic, assign) NSInteger pageY;
- (void)setPageY:(CGFloat)page animated:(BOOL)animated;
@end
