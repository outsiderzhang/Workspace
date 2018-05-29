//
//  NSObject+Association.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, ZRAssociation) {
    ZRAssociationAssign,
    ZRAssociationStrong,
    ZRAssociationCopy,
    ZRAssociationWeak,
};
@interface NSObject (Association)
/**
 * 根据key添加动态属性，默认noatomic
 */
- (void)setAssociatedObject:(id)object forKey:(NSString *)key association:(ZRAssociation)association;

/**
 * 根据key添加动态属性
 */
- (void)setAssociatedObject:(id)object forKey:(NSString *)key association:(ZRAssociation)association isAtomic:(BOOL)isAtomic;

/**
 * 根据key获取动态属性
 */
- (id)associatedObjectForKey:(NSString *)key;
@end
