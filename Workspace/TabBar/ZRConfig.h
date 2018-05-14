//
//  ZRConfig.h
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ZRTabBarController;

/**
 TabBar布局枚举

 - ZRConfigTypeLayoutNormal: 默认布局 图上字下
 - ZRConfigTypeLayoutImage: 只有图片布局(居中)
 */
typedef NS_ENUM(NSInteger, ZRConfigLayoutType) {
    ZRConfigLayoutNormal,
    ZRConfigLayoutImage,
};

/**
 TabBar动画枚举

 - ZRConfigTabBarAnimationNormal: 无动画
 - ZRConfigTabBarAnimationRotationY: Y轴旋转
 - ZRConfigTabBarAnimationBoundsMin: 缩小
 - ZRConfigTabBarAnimationBoundsMax: 放大
 - ZRConfigTabBarAnimationScale: 缩放动画
 */
typedef NS_ENUM(NSInteger, ZRConfigTabBarAnimationType) {
    ZRConfigTabBarAnimationNormal,
    ZRConfigTabBarAnimationRotationY,
    ZRConfigTabBarAnimationBoundsMin,
    ZRConfigTabBarAnimationBoundsMax,
    ZRConfigTabBarAnimationScale,
};

/**
 Badge动画枚举

 - ZRConfigBadgeAnimationNormal: 无动画
 - ZRConfigBadgeAnimationShake: 抖动动画
 - ZRConfigBadgeAnimationOpacity: 透明过渡动画
 - ZRConfigBadgeAnimationScale: 缩放动画
 */
typedef NS_ENUM(NSInteger, ZRConfigBadgeAnimationType) {
    ZRConfigBadgeAnimationNormal,
    ZRConfigBadgeAnimationShake,
    ZRConfigBadgeAnimationOpacity,
    ZRConfigBadgeAnimationScale,
};

/**
 添加自定义按钮block

 @param btn 按钮
 @param index 索引
 */
typedef void (^ZRConfigCustomBtnBlock) (UIButton *btn, NSInteger index);

@interface ZRConfig : NSObject

/**
 单例模式
 */
+ (instancetype)config;

/**
 * 恢复默认配置 (此选项用于demo工程中,实际开发中请忽略)
 */
- (void)configNormal;

/******************************** tabBar 基本配置 ********************************/

/** 布局类型 (默认是 图片在上, 文字在下) */
@property (nonatomic, assign) ZRConfigLayoutType layoutType;

/** 标题的默认颜色 (默认为 #808080) */
@property (nonatomic, strong) UIColor *norTitleColor;
/** 标题的选中颜色 (默认为 #d81e06)*/
@property (nonatomic, strong) UIColor *selTitleColor;
/** 图片的size (默认 28*28) */
@property (nonatomic, assign) CGSize imageSize;
/** 标题文字大小 (默认 12.f) */
@property (nonatomic, assign) CGFloat titleFont;
/** 标题的偏移值 (标题距离底部的距离 默认 2.f) */
@property (nonatomic, assign) CGFloat titleOffset;
/** 图片的偏移值 (图片距离顶部的距离 默认 2.f) */
@property (nonatomic, assign) CGFloat imageOffset;

/** tabBar */
@property (nonatomic, assign) ZRConfigTabBarAnimationType tabBarAnimType;
/** 是否显示tabBar顶部线条颜色 (默认 YES) */
@property (nonatomic, assign) BOOL isClearTabBarTopLine;
/** tabBar顶部线条颜色 (默认亮灰色) */
@property (nonatomic, strong) UIColor *tabBarTopLineColor;
/** tabBar的背景颜色 (默认白色) */
@property (nonatomic, strong) UIColor *tabBarBackground;



/** tabBarController */
@property (nonatomic, strong) ZRTabBarController *tabBarController;




/******************************** badgeValue 基本配置 ********************************/

/** badgeColor(默认 #FFFFFF) */
@property (nonatomic, strong) UIColor *badgeTextColor;
/** badgeBackgroundColor (默认 #FF4040)*/
@property (nonatomic, strong) UIColor *badgeBackgroundColor;
/** badgeSize (如没有特殊需求, 请勿修改此属性, 此属性只有在控制器加载完成后有效)*/
@property (nonatomic, assign) CGSize badgeSize;
/** badgeOffset (如没有特殊需求, 请勿修改此属性, 此属性只有在控制器加载完成后有效) */
@property (nonatomic, assign) CGPoint badgeOffset;
/** badge圆角大小 (如没有特殊需求, 请勿修改此属性, 此属性只有在控制器加载完成后有效, 一般配合badgeSize或badgeOffset使用) */
@property (nonatomic, assign) CGFloat badgeRadius;

/**
 对单个进行圆角设置
 @param radius 圆角值
 @param index 下标
 */
- (void)badgeRadius:(CGFloat)radius AtIndex:(NSInteger)index;

/** badge动画 (默认无动画) */
@property (nonatomic, assign) ZRConfigBadgeAnimationType badgeAnimType;

/**
 显示圆点badgevalue  (以下关于badgeValue的操作可以在app全局操作)  使用方法 [[JMConfig config] showPointBadgeValue: AtIndex: ]
 @param index 显示的下标
 */
- (void)showPointBadgeAtIndex:(NSInteger)index;

/**
 显示newBadgeValue (以下关于badgeValue的操作可以在app全局操作)
 @param index 下标
 */
- (void)showNewBadgeAtIndex:(NSInteger)index;

/**
 显示带数值的下标  (注意: 此方法可以全局重复调用)
 @param badgeValue 数值
 @param index 下标
 */
- (void)showNumberBadgeValue:(NSString *)badgeValue AtIndex:(NSInteger)index;

/**
 隐藏下标的badgeValue
 
 @param index 下标
 */
- (void)hideBadgeAtIndex:(NSInteger)index;



/******************************** 自定义按钮 基本配置 ********************************/

/** btnClickBlock */
@property (nonatomic, weak) ZRConfigCustomBtnBlock btnClickBlock;

/**
 添加自定义按钮 (目前只支持自定义按钮, 如果需要自定义view或者对加号按钮有更多需求的请联系我)
 @param btn 自定义btn
 @param index 添加的下标位置
 @param btnClickBlock 按钮点击事件的回调
 */
- (void)addCustomBtn:(UIButton *)btn AtIndex:(NSInteger)index BtnClickBlock:(ZRConfigCustomBtnBlock)btnClickBlock;

@end
