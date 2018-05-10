//
//  ZRTabBarButton.m
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRTabBarButton.h"
#import "UIView+TabBar.h"
@implementation ZRTabBarButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.imageView = [[UIImageView alloc] init];
        [self addSubview:self.imageView];
        
        self.title = [[UILabel alloc] init];
        self.title.textAlignment = NSTextAlignmentCenter;
        self.title.font = [UIFont systemFontOfSize:[[ZRConfig config] titleFont]];
        [self addSubview:self.title];
        
        self.badgeValue = [[ZRBadgeValue alloc] init];
        self.badgeValue.hidden = YES;
        [self addSubview:self.badgeValue];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize imageSize = [[ZRConfig config] imageSize];
    CGFloat imageY = [[ZRConfig config] imageOffset];
    if ([[ZRConfig config] layoutType] == ZRConfigLayoutImage) {
        imageY = self.height * 0.5 - imageSize.height * 0.5;
    }
    CGFloat iamgeX = self.width * 0.5 - imageSize.width * 0.5;
    self.imageView.frame = CGRectMake(iamgeX, imageY, imageSize.width, imageSize.height);
    
    CGFloat titleX = 4;
    CGFloat titleH = 14.f;
    CGFloat titleW = self.width - 8;
    CGFloat titleY = self.height - titleH - [[ZRConfig config] titleOffset];
    self.title.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat badgeX = CGRectGetMaxX(self.imageView.frame) - 6;
    CGFloat badgeY = CGRectGetMinY(self.imageView.frame) - 2;
    CGFloat badgeH = 16;
    CGFloat badgeW = 24;
    self.badgeValue.frame = CGRectMake(badgeX, badgeY, badgeW, badgeH);
}

- (void)setLayoutType:(ZRConfigLayoutType)layoutType {
    _layoutType = layoutType;
    
    if (layoutType == ZRConfigLayoutImage) {
        self.title.hidden = YES;
        
        CGSize imageSize = [[ZRConfig config] imageSize];
        
        CGFloat imageX = self.width * 0.5 - imageSize.width * 0.5;
        CGFloat imageY = self.height * 0.5 - imageSize.height * 0.5;
        self.imageView.frame = CGRectMake(imageX, imageY, imageSize.width, imageSize.height);
    }
}

@end
