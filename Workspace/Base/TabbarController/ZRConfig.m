//
//  ZRConfig.m
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRConfig.h"
#import "ZRTabBarButton.h"
#import "ZRTabBarController.h"
static ZRConfig *_instance = nil;
@implementation ZRConfig

+ (instancetype)config {
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
        [self configNormal];
    });
    return _instance;
}

- (void)configNormal {
    _norTitleColor = ZRHex(0x808080);
    _selTitleColor = kThemeColor;
    _isClearTabBarTopLine = NO;
    _tabBarTopLineColor = kBgColor;
    _tabBarBackground = [UIColor whiteColor];//ZRHexA(0xffffff, 0.99);//
    _layoutType = ZRConfigLayoutNormal;
    _imageSize = CGSizeMake(28, 28);
    _badgeTextColor = ZRHex(0xFFFFFF);
    _badgeBackgroundColor = ZRHex(0xFF4040);
    _titleFont = 12.f;
    _titleOffset = 2.f;
    _imageOffset = 2.f;
}

- (void)setBadgeSize:(CGSize)badgeSize {
    _badgeSize = badgeSize;
    NSMutableArray *arrM = [self getTabBarButtons];
    for (ZRTabBarButton *btn in arrM) {
        btn.badgeValue.badgeL.size = badgeSize;
    }
}

- (void)setBadgeOffset:(CGPoint)badgeOffset {
    _badgeOffset = badgeOffset;
    NSMutableArray *arrM = [self getTabBarButtons];
    for (ZRTabBarButton *btn in arrM) {
        btn.badgeValue.badgeL.x += badgeOffset.x;
        btn.badgeValue.badgeL.y += badgeOffset.y;
    }
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor {
    _badgeTextColor = badgeTextColor;
    NSMutableArray *arrM = [self getTabBarButtons];
    for (ZRTabBarButton *btn in arrM) {
        btn.badgeValue.badgeL.textColor = badgeTextColor;
    }
}

- (void)setBadgeBackgroundColor:(UIColor *)badgeBackgroundColor {
    _badgeBackgroundColor = badgeBackgroundColor;
    NSMutableArray *arrM = [self getTabBarButtons];
    for (ZRTabBarButton *btn in arrM) {
        btn.badgeValue.badgeL.backgroundColor = badgeBackgroundColor;
    }
}

- (void)setBadgeRadius:(CGFloat)badgeRadius {
    _badgeRadius = badgeRadius;
    NSMutableArray *arrM = [self getTabBarButtons];
    for (ZRTabBarButton *btn in arrM) {
        btn.badgeValue.badgeL.layer.cornerRadius = badgeRadius;
    }
}

- (void)badgeRadius:(CGFloat)radius AtIndex:(NSInteger)index {
    ZRTabBarButton *tabBarButton = [self getTabBarButtonAtIndex:index];
    tabBarButton.badgeValue.badgeL.layer.cornerRadius = radius;
}


- (void)showPointBadgeAtIndex:(NSInteger)index{
    ZRTabBarButton *tabBarButton = [self getTabBarButtonAtIndex:index];
    tabBarButton.badgeValue.hidden = NO;
    tabBarButton.badgeValue.type = ZRBadgeValuePoint;
}

- (void)showNewBadgeAtIndex:(NSInteger)index {
    ZRTabBarButton *tabBarButton = [self getTabBarButtonAtIndex:index];
    tabBarButton.badgeValue.hidden = NO;
    tabBarButton.badgeValue.badgeL.text = @"new";
    tabBarButton.badgeValue.type = ZRBadgeValueNew;
}

- (void)showNumberBadgeValue:(NSString *)badgeValue AtIndex:(NSInteger)index {
    ZRTabBarButton *tabBarButton = [self getTabBarButtonAtIndex:index];
    tabBarButton.badgeValue.hidden = NO;
    tabBarButton.badgeValue.badgeL.text = badgeValue;
    tabBarButton.badgeValue.type = ZRBadgeValueNumber;
}

- (void)hideBadgeAtIndex:(NSInteger)index {
    [self getTabBarButtonAtIndex:index].badgeValue.hidden = YES;
}

- (void)addCustomBtn:(UIButton *)btn AtIndex:(NSInteger)index BtnClickBlock:(ZRConfigCustomBtnBlock)btnClickBlock {
    btn.tag = index;
    [btn addTarget:self action:@selector(customBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.btnClickBlock = btnClickBlock;
    [self.tabBarController.ZR_TabBar addSubview:btn];
}

- (void)customBtnClick:(UIButton *)sender {
    if (self.btnClickBlock) {
        self.btnClickBlock(sender, sender.tag);
    }
}

- (ZRTabBarButton *)getTabBarButtonAtIndex:(NSInteger)index {
    NSArray *subViews = self.tabBarController.ZR_TabBar.subviews;
    for (int i = 0; i < subViews.count; i++) {
        UIView *tabBarButton = subViews[i];
        if ([tabBarButton isKindOfClass:[ZRTabBarButton class]] && i == index) {
            ZRTabBarButton *tabBarBtn = (ZRTabBarButton *)tabBarButton;
            return tabBarBtn;
        }
    }
    return nil;
}

- (NSMutableArray *)getTabBarButtons {
    NSArray *subViews = self.tabBarController.ZR_TabBar.subviews;
    NSMutableArray *tempArr = [NSMutableArray array];
    for (int i = 0; i < subViews.count; i++) {
        UIView *tabBarButton = subViews[i];
        if ([tabBarButton isKindOfClass:[ZRTabBarButton class]]) {
            ZRTabBarButton *tabBarBtn = (ZRTabBarButton *)tabBarButton;
            [tempArr addObject:tabBarBtn];
        }
    }
    return tempArr;
}
@end
