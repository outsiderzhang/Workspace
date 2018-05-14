//
//  ZRTabBarButton.h
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZRBadgeValue.h"
#import "ZRConfig.h"
@interface ZRTabBarButton : UIView
/** UIImageView */
@property (nonatomic, strong) UIImageView *imageView;
/** Title */
@property (nonatomic, strong) UILabel *title;
/** badgeValue */
@property (nonatomic, strong) ZRBadgeValue *badgeValue;
/** type */
@property (nonatomic, assign) ZRConfigLayoutType layoutType;
@end
