//
//  ZRToolMacro.h
//  Workspace
//
//  Created by sanjia on 2018/5/9.
//  Copyright © 2018年 zhang. All rights reserved.
//

#ifndef ZRToolMacro_h
#define ZRToolMacro_h

/** XCode */
#define     XCODE_VERSION_8_LATER       __has_include(<UserNotifications/UserNotifications.h>)

/* 打印提示 */
#ifdef DEBUG
    #define DLog( s, ... ) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
    #define DLog( s, ... )
#endif

#pragma mark -- 方法简写
/** 通知中心 */
#define     ZRNotificationCenter        [NSNotificationCenter defaultCenter]

/** 用户自定义数据 */
#define     ZRUserDefaults              [NSUserDefaults standardUserDefaults]

/** URL */
#define     ZRURL(urlString)            [NSURL URLWithString:urlString]

/** 图片 */
#define     ZRImage(imageName)          [UIImage imageNamed:imageName]

/** PNG图片 */
#define     ZRPNG(X)                    [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:X ofType:@"png"]]

/** JPG图片 */
#define     ZRJPG(X)                    [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:X ofType:@"jpg"]]

/** 字符串 */
#define     ZRNonnullString(str)        (str.length > 0 ? str : @"")

/** 方法名 */
#define     ZRStirngFormSelector(s)     [[NSString alloc] initWithUTF8String:sel_getName(s)]

/** 国际化 */
#define     ZRLOCSTR(str)               NSLocalizedString(str, nil)

/** 颜色 */
#define     ZRRGB(r, g, b)              [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]

#define     ZRRGBA(r, g, b, a)          [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define     ZRHex(color)                [UIColor colorWithRed:((float)((color & 0xFF0000) >> 16))/255.0 green:((float)((color & 0xFF00) >> 8))/255.0 blue:((float)(color & 0xFF))/255.0 alpha:1.0]

#define     ZRHexA(color, a)            [UIColor colorWithRed:((float)((color & 0xFF0000) >> 16))/255.0 green:((float)((color & 0xFF00) >> 8))/255.0 blue:((float)(color & 0xFF))/255.0 alpha:a]


/** 圆角和加边框 */
#define     ZRBorderRadius(View, Radius, Width, Color) \
            \
            [View.layer setCornerRadius:(Radius)];\
            [View.layer setMasksToBounds:YES];\
            [View.layer setBorderWidth:(Width)];\
            [View.layer setBorderColor:[Color CGColor]]

/** 圆角 */
#define     ZRRadius(View, Radius) \
            \
            [View.layer setCornerRadius:(Radius)];\
            [View.layer setMasksToBounds:YES]


/** PushVC */
#define     ZRPushVC(vc)                {\
                                        [vc setHidesBottomBarWhenPushed:YES];\
                                        [self.navigationController pushViewController:vc animated:YES];\
                                        }

/** 方法交换 */
#define     ZRExchangeMethod(oldSEL, newSEL) \
            {\
            Method oldMethod = class_getInstanceMethod(self, oldSEL);\
            Method newMethod = class_getInstanceMethod(self, newSEL);\
            method_exchangeImplementations(oldMethod, newMethod);\
            }\

/** 多线程 */
#define     ZRBackThread(block) \
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

#define     ZRMainThread(block) \
            dispatch_async(dispatch_get_main_queue(), block)

#define     ZRMainBarrier(block) \
            dispatch_barrier_async(dispatch_get_main_queue(), block)

#define     ZRMainAfter(x, block) \
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(x * NSEC_PER_SEC)), dispatch_get_main_queue(), block)

/** 循环引用消除 */

#define     ZRWS(type)              __weak typeof(type) weak##type = type;

#define     ZRSS(type)              __strong typeof(type) strong##type = type;

#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object)     autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object)     autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object)     try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object)     try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object)   autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object)   autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object)   try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object)   try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

///正常字体
#define     H30     [UIFont systemFontOfSize:30]
#define     H29     [UIFont systemFontOfSize:29]
#define     H28     [UIFont systemFontOfSize:28]
#define     H27     [UIFont systemFontOfSize:27]
#define     H26     [UIFont systemFontOfSize:26]
#define     H25     [UIFont systemFontOfSize:25]
#define     H24     [UIFont systemFontOfSize:24]
#define     H23     [UIFont systemFontOfSize:23]
#define     H22     [UIFont systemFontOfSize:22]
#define     H20     [UIFont systemFontOfSize:20]
#define     H19     [UIFont systemFontOfSize:19]
#define     H18     [UIFont systemFontOfSize:18]
#define     H17     [UIFont systemFontOfSize:17]
#define     H16     [UIFont systemFontOfSize:16]
#define     H15     [UIFont systemFontOfSize:15]
#define     H14     [UIFont systemFontOfSize:14]
#define     H13     [UIFont systemFontOfSize:13]
#define     H12     [UIFont systemFontOfSize:12]
#define     H11     [UIFont systemFontOfSize:11]
#define     H10     [UIFont systemFontOfSize:10]
#define     H9      [UIFont systemFontOfSize:9]
#define     H8      [UIFont systemFontOfSize:8]


/** 当前系统版本版本 */
#define     KSYSTEMVERSION          [[UIDevice currentDevice] systemVersion]
/** 等于某个版本 */
#define     SYSTEM_VERSION_EQUAL_TO(v) \
            ([KSYSTEMVERSION compare:v options:NSNumericSearch] == NSOrderedSame)
/** 大于某个版本 */
#define     SYSTEM_VERSION_GREATER_THAN(v) \
            ([KSYSTEMVERSION compare:v options:NSNumericSearch] == NSOrderedDescending)
/** 大于等于某个版本 */
#define     SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) \
            ([KSYSTEMVERSION compare:v options:NSNumericSearch] != NSOrderedAscending)
/** 小于某个版本 */
#define     SYSTEM_VERSION_LESS_THAN(v) \
            ([KSYSTEMVERSION compare:v options:NSNumericSearch] == NSOrderedAscending)
/** 小于等于某个版本 */
#define     SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) \
            ([KSYSTEMVERSION compare:v options:NSNumericSearch] != NSOrderedDescending)


//常用控件高度

/** 状态栏 */
#define     UI_STATUSBAR            (UI_IS_IPHONEX ? 44.0f : 20.0f)

/** tabbar */
#define     UI_TABBAR               (UI_IS_IPHONEX ? 49.0f + 34.0f : 49.0f)

/** 导航 */
#define     UI_NAVBAR               44.0f

/** 底部安全区 */
#define     UI_SAFEAREA_BOTTOM      (UI_SAFEAREA_INSETS.bottom)

/** 搜索框高度 */
#define     UI_SEARCHBAR            (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11.0") ? 52.0f : 44.0f)

/** 状态栏 */
#define     UI_1PX                  ([[UIScreen mainScreen] scale] > 0.0 ? 1.0 / [[UIScreen mainScreen] scale] : 1.0)

/** 安全区 */
#define     UI_SAFEAREA_INSETS \
            ({ \
            UIEdgeInsets edgeInsets = UIEdgeInsetsZero; \
            if (@available(iOS 11.0, *)) { \
                edgeInsets = [UIApplication sharedApplication].keyWindow.safeAreaInsets; \
            }   \
            edgeInsets; \
            }) \

/** 屏幕 */
#define     UI_SCREEN_SIZE          [UIScreen mainScreen].bounds.size//屏幕大小
#define     UI_SCREEN_WIDTH         SCREEN_SIZE.width//屏幕宽
#define     UI_SCREEN_HEIGTH        SCREEN_SIZE.height//屏幕高

//判断设备型号
#define     UI_IS_LANDSCAPE         ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft || [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight)

#define     UI_IS_IPAD              ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define     UI_IS_IPHONE            ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

//#define     UI_IS_IPHONE4           (UI_IS_IPHONE && UI_SCREEN_HEIGTH < 568.0)
#define     UI_IS_IPHONE4           (UI_SCREEN_HEIGTH < 568.0)

#define     UI_IS_IPHONE5           (UI_SCREEN_HEIGTH == 568.0)

#define     UI_IS_IPHONE6           (UI_SCREEN_HEIGTH == 667.0)

#define     UI_IS_IPHONE6P          (UI_SCREEN_HEIGTH == 736.0)

#define     UI_IS_IPHONEX           (UI_SCREEN_HEIGTH == 812.0)

//测量时屏幕的宽度
#define     UI_MEASURE_WIDTH        375.0
//测量时屏幕的高度(除去状态栏,导航高度64)
#define     UI_MEASURE_HEIGTH       667.0

//得到view相对屏幕宽度比例实际的宽度   多余与CGReat
#define     KGetViewWidth(x)        UI_SCREEN_WIDTH * (x / UI_MEASURE_WIDTH)
//得到view相对屏幕高度比例实际的高度   多余与CGReat
#define     KGetViewHeight(x)       UI_SCREEN_HEIGTH * (x / UI_MEASURE_HEIGTH)

//左右边距
#define     KGetMarginLR            KGetViewWidth(18)
//上下边距
#define     KGetMarginTB            KGetViewHeight(10)

//字体边距
#define KGetMarginMin               5
#define KGetMarginMid               8
#define KGetMarginMax               10

#endif /* ZRToolMacro_h */
