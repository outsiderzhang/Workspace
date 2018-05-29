//
//  ZRBadgeValue.m
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRBadgeValue.h"
#import "CAAnimation+TabBar.h"
#import "ZRConfig.h"
@implementation ZRBadgeValue

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.badgeL = [[UILabel alloc] initWithFrame:self.bounds];
        self.badgeL.textColor = [[ZRConfig config] badgeTextColor];
        self.badgeL.font = [UIFont systemFontOfSize:11.f];
        self.badgeL.textAlignment = NSTextAlignmentCenter;
        self.badgeL.layer.cornerRadius = 8.f;
        self.badgeL.layer.masksToBounds = YES;
        self.badgeL.backgroundColor = [[ZRConfig config] badgeBackgroundColor];
        [self addSubview:self.badgeL];
    }
    return self;
}

- (void)setType:(ZRBadgeValueType)type {
    _type = type;
    if (type == ZRBadgeValuePoint) {
        self.badgeL.size = CGSizeMake(10, 10);
        self.badgeL.layer.cornerRadius = 5.f;
        self.badgeL.x = 0;
        self.badgeL.y = self.height * 0.5 - self.badgeL.size.height * 0.5;
    } else if (type == ZRBadgeValueNew) {
        self.badgeL.size = CGSizeMake(self.width, self.height);
    } else if (type == ZRBadgeValueNumber) {
        CGSize size = CGSizeZero;
        CGFloat radius = 8.f;
        if (self.badgeL.text.length <= 1) {
            size = CGSizeMake(self.height, self.height);
            radius = self.height * 0.5;
        } else if (self.badgeL.text.length > 1) {
            size = self.bounds.size;
            radius = 8.f;
        }
        self.badgeL.size = size;
        self.badgeL.layer.cornerRadius = radius;
    }
    
    ZRConfigBadgeAnimationType animType = [[ZRConfig config] badgeAnimType];
    if (animType == ZRConfigBadgeAnimationShake) {   //抖动
        [self.badgeL.layer addAnimation:[CAAnimation shakeAnimationRepeatTimes:5] forKey:@"shakeAnimation"];
    } else if (animType == ZRConfigBadgeAnimationOpacity) { //透明过渡动画
        [self.badgeL.layer addAnimation:[CAAnimation opacityAnimatioinDurTimes:0.3] forKey:@"opacityAniamtion"];
    } else if (animType == ZRConfigBadgeAnimationScale) { //缩放动画
        [self.badgeL.layer addAnimation:[CAAnimation scaleAnimation] forKey:@"scaleAnimation"];
    }
}

- (CGSize)sizeWithAttribute:(NSString *)text {
    return [text sizeWithAttributes:@{NSFontAttributeName:self.badgeL.font}];
}

@end
