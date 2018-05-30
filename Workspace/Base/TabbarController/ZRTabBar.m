//
//  ZRTabBar.m
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRTabBar.h"
#import "ZRTabBarButton.h"
#import "CAAnimation+TabBar.h"
@interface ZRTabBar ()
/** 存放ZRTabBarButton数组 */
@property (nonatomic, strong) NSMutableArray *saveTabBarArr;
/** norImage */
@property (nonatomic, strong) NSMutableArray *norImageArr;
/** SelImage */
@property (nonatomic, strong) NSMutableArray *selImageArr;
/** titleArr */
@property (nonatomic, strong) NSMutableArray *titleImageArr;
@end
@implementation ZRTabBar

- (instancetype)initWithFrame:(CGRect)frame norImages:(NSArray<NSString *> *)norImages selImages:(NSArray<NSString *> *)selImages titles:(NSArray<NSString *> *)titles config:(ZRConfig *)config
{
    if (self = [super initWithFrame:frame]) {
        for (int i = 0; i < titles.count; i++) {
            ZRTabBarButton *tbBtn = [[ZRTabBarButton alloc] init];
            tbBtn.imageView.image = [UIImage imageNamed:norImages[i]];
            tbBtn.title.text = titles[i];
            tbBtn.title.textColor = [[ZRConfig config] norTitleColor];
            tbBtn.layoutType = config.layoutType;
            tbBtn.tag = i;
            [self addSubview:tbBtn];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
            [tbBtn addGestureRecognizer:tap];
            
            [self.saveTabBarArr addObject:tbBtn];
            self.titleImageArr = [NSMutableArray arrayWithArray:titles];
            self.norImageArr = [NSMutableArray arrayWithArray:norImages];
            self.selImageArr = [NSMutableArray arrayWithArray:selImages];
            
        }
        
        //背景颜色处理
        self.backgroundColor = [[ZRConfig config] tabBarBackground];
        
        //顶部线条处理
        if (config.isClearTabBarTopLine) {
            [self topLineIsClearColor:YES];
        } else {
            [self topLineIsClearColor:NO];
        }
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
        }
        if ([tabBarButton isKindOfClass:[ZRTabBarButton class]] || [tabBarButton isKindOfClass:[UIButton class]]) {
            [tempArr addObject:tabBarButton];
        }
    }
    
    //进行排序
    for (int i = 0; i < tempArr.count; i++) {
        UIView *view = tempArr[i];
        if ([view isKindOfClass:[UIButton class]]) {
            [tempArr insertObject:view atIndex:view.tag];
            [tempArr removeLastObject];
            break;
        }
    }
    
    CGFloat viewW = self.width / tempArr.count;
    CGFloat viewH = 49;
    CGFloat viewY = 0;
    for (int i = 0; i < tempArr.count; i++) {
        CGFloat viewX = i * viewW;
        UIView *view = tempArr[i];
        view.frame = CGRectMake(viewX, viewY, viewW, viewH);
    }
}

- (void)tapClick:(UITapGestureRecognizer *)tap {
    [self setUpSelectedIndex:tap.view.tag];
    
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBar:didSelectIndex:)]) {
        [self.tabBarDelegate tabBar:self didSelectIndex:tap.view.tag];
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    
    [self setUpSelectedIndex:selectedIndex];
}

#pragma mark - 设置选中的index进行操作
- (void)setUpSelectedIndex:(NSInteger)selectedIndex {
    for (int i = 0; i < self.saveTabBarArr.count; i++) {
        ZRTabBarButton *tbBtn = self.saveTabBarArr[i];
        if (i == selectedIndex) {
            tbBtn.title.textColor = [[ZRConfig config] selTitleColor];
            tbBtn.imageView.image = [UIImage imageNamed:self.selImageArr[i]];
            
            ZRConfigTabBarAnimationType type = [[ZRConfig config] tabBarAnimType];
            if (type == ZRConfigTabBarAnimationRotationY) {
                [tbBtn.imageView.layer addAnimation:[CAAnimation tabBarRotationY] forKey:@"rotateAnimation"];
            } else if (type == ZRConfigTabBarAnimationScale) {
                
                CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
                CGPoint point = tbBtn.imageView.frame.origin;
                point.y -= 15;
                anim.toValue = [NSNumber numberWithFloat:point.y];
                
                CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
                anim1.toValue = [NSNumber numberWithFloat:1.3f];
                
                CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
                groupAnimation.fillMode = kCAFillModeForwards;
                groupAnimation.removedOnCompletion = NO;
                groupAnimation.animations = [NSArray arrayWithObjects:anim,anim1, nil];
                
                [tbBtn.imageView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
            } else if (type == ZRConfigTabBarAnimationBoundsMin) {
                [tbBtn.imageView.layer addAnimation:[CAAnimation tabBarBoundsMin] forKey:@"min"];
            } else if (type == ZRConfigTabBarAnimationBoundsMax) {
                [tbBtn.imageView.layer addAnimation:[CAAnimation tabBarBoundsMax] forKey:@"max"];
            }
        } else {
            tbBtn.title.textColor = [[ZRConfig config] norTitleColor];
            tbBtn.imageView.image = [UIImage imageNamed:self.norImageArr[i]];
            [tbBtn.imageView.layer removeAllAnimations];
        }
    }
}

#pragma mark - 顶部线条处理(清除颜色)
- (void)topLineIsClearColor:(BOOL)isClearColor {
    UIColor *color = [UIColor clearColor];
    if (!isClearColor) {
        color = [[ZRConfig config] tabBarTopLineColor];
    }
    
    CGRect rect = CGRectMake(0, 0, self.width, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setBackgroundImage:[UIImage new]];
    [self setShadowImage:img];
}

- (NSMutableArray *)norImageArr {
    if (!_norImageArr) {
        _norImageArr = [NSMutableArray array];
    }
    return _norImageArr;
}

- (NSMutableArray *)selImageArr {
    if (!_selImageArr) {
        _selImageArr = [NSMutableArray array];
    }
    return _selImageArr;
}

- (NSMutableArray *)titleImageArr {
    if (!_titleImageArr) {
        _titleImageArr = [NSMutableArray array];
    }
    return _titleImageArr;
}

- (NSMutableArray *)saveTabBarArr {
    if (!_saveTabBarArr) {
        _saveTabBarArr = [NSMutableArray array];
    }
    return _saveTabBarArr;
}
@end
