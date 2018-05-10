//
//  CAAnimation+TabBar.m
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "CAAnimation+TabBar.h"
#import <UIKit/UIKit.h>

#define angle2Rad(angle) ((angle) / 180.0 * M_PI)
@implementation CAAnimation (TabBar)
+ (CAKeyframeAnimation *)shakeAnimationRepeatTimes:(float)repeatTimes {
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    anima.values = @[@(angle2Rad(-15)),@(angle2Rad(-10)),@(angle2Rad(-7)),@(angle2Rad(-5)),@(angle2Rad(0)),@(angle2Rad(5)),@(angle2Rad(-7)),@(angle2Rad(10)),@(angle2Rad(15))];
    anima.repeatCount = repeatTimes;
    return anima;
}


+ (CABasicAnimation *)opacityAnimatioinDurTimes:(float)time {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = [NSNumber numberWithFloat:1.0f];
    anima.toValue = [NSNumber numberWithFloat:0.2f];
    anima.repeatCount = 3;
    anima.duration = time;
    anima.autoreverses = YES;
    return anima;
}

+ (CABasicAnimation *)scaleAnimation {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima.toValue = [NSNumber numberWithFloat:1.2f];
    anima.duration = 0.3f;
    anima.repeatCount = 3;
    anima.autoreverses = YES;
    return anima;
}

+ (CABasicAnimation *)tabBarRotationY {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.toValue = [NSNumber numberWithFloat:M_PI * 2];
    return animation;
}

+ (CABasicAnimation *)tabBarBoundsMin {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(12, 12)];
    return anim;
}

+ (CABasicAnimation *)tabBarBoundsMax {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(46, 46)];
    return anim;
}
@end
