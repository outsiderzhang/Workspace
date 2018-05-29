//
//  UIView+Separator.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <UIKit/UIKit.h>
#define     SJSEPERATOR_DEFAULT_COLOR       [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0]

typedef NS_ENUM(NSInteger, SJSeparatorPosition) {
    SJSeparatorPositionTop,
    SJSeparatorPositionBottom,
    SJSeparatorPositionLeft,
    SJSeparatorPositionRight,
    SJSeparatorPositionCenterX,
    SJSeparatorPositionCenterY,
};

@class SJSeparatorModel;
@interface SJSeparatorChainModel : NSObject

/// 偏移量（相对于方向）
- (SJSeparatorChainModel *(^)(CGFloat offset))offset;
/// 颜色
- (SJSeparatorChainModel *(^)(UIColor *color))color;
/// 起点
- (SJSeparatorChainModel *(^)(CGFloat begin))beginAt;
/// 长度
- (SJSeparatorChainModel *(^)(CGFloat length))length;
/// 终点（优先使用长度）
- (SJSeparatorChainModel *(^)(CGFloat end))endAt;
/// 线粗
- (SJSeparatorChainModel *(^)(CGFloat borderWidth))borderWidth;

@end
@interface UIView (Separator)
- (SJSeparatorChainModel *(^)(SJSeparatorPosition position))addSeparator;

- (void (^)(SJSeparatorPosition position))removeSeparator;

- (void)updateSeparator;
@end
