//
//  ZRBadgeValue.h
//  Workspace
//
//  Created by sanjia on 2018/5/10.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 角标类型枚举

 - ZRBadgeValuePoint: 点
 - ZRBadgeValueNew: new
 - ZRBadgeValueNumber: number
 */
typedef NS_ENUM(NSInteger, ZRBadgeValueType) {
    ZRBadgeValuePoint,
    ZRBadgeValueNew,
    ZRBadgeValueNumber,
};

@interface ZRBadgeValue : UIView
/** badgeL */
@property (nonatomic, strong) UILabel *badgeL;

/** type */
@property (nonatomic, assign) ZRBadgeValueType type;
@end
