//
//  CAAnimation+TabBar.h
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (TabBar)
/**
 抖动动画
 
 @param repeatTimes 重复次数
 @return 返回关键帧动画
 */
+ (CAKeyframeAnimation *)shakeAnimationRepeatTimes:(float)repeatTimes;

/**
 透明过渡动画
 
 @param time 持续时间
 @return 返回透明过渡动画
 */
+ (CABasicAnimation *)opacityAnimatioinDurTimes:(float)time;


/**
 缩放动画
 
 @return 返回缩放动画
 */
+ (CABasicAnimation *)scaleAnimation;

+ (CABasicAnimation *)tabBarRotationY;
+ (CABasicAnimation *)tabBarBoundsMin;
+ (CABasicAnimation *)tabBarBoundsMax;
@end
