//
//  NSObject+Association.m
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import "NSObject+Association.h"
#import <objc/runtime.h>
#import "NSObject+Dealloc.h"

static NSMutableDictionary *keyBuffer;  // 存储获取动态属性实际的key

@implementation NSObject (Association)

+ (void)load {
    keyBuffer = [NSMutableDictionary dictionary];
}

#pragma mark - # Public Methods
- (void)setAssociatedObject:(id)object forKey:(NSString *)key association:(ZRAssociation)association
{
    [self setAssociatedObject:object forKey:key association:association isAtomic:NO];
}

- (void)setAssociatedObject:(id)object forKey:(NSString *)key association:(ZRAssociation)association isAtomic:(BOOL)isAtomic
{
    if (!key) {
        return;
    }
    const char *cKey = [keyBuffer[key] pointerValue];
    if (cKey == NULL) {
        cKey = key.UTF8String;
        keyBuffer[key] = [NSValue valueWithPointer:cKey];
    }
    if (association == ZRAssociationAssign) {       // Assign
        objc_setAssociatedObject(self, cKey, object, OBJC_ASSOCIATION_ASSIGN);
    }
    else if (association == ZRAssociationStrong) {
        objc_setAssociatedObject(self, cKey, object, isAtomic ? OBJC_ASSOCIATION_RETAIN : OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    else if (association == ZRAssociationCopy) {
        objc_setAssociatedObject(self, cKey, object, isAtomic ? OBJC_ASSOCIATION_COPY : OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    else if (association == ZRAssociationWeak) {
        [self p_setWeakObject:object forKey:key];
    }
}

- (id)associatedObjectForKey:(NSString *)key {
    const char *cKey = [keyBuffer[key] pointerValue];
    if (cKey) {
        return objc_getAssociatedObject(self, cKey);
    }
    return nil;
}

#pragma mark - # Private Methods
- (void)p_setWeakObject:(id)object forKey:(NSString *)key {
    const char *cKey = [keyBuffer[key] pointerValue];
    __weak typeof(self) weakSelf = self;
    
    id oldObj = objc_getAssociatedObject(self, cKey);
    [oldObj removeDeallocTaskForTarget:weakSelf key:key];
    
    objc_setAssociatedObject(self, cKey, object, OBJC_ASSOCIATION_ASSIGN);
    [object addDeallocTask:^{
        objc_setAssociatedObject(weakSelf, cKey, nil, OBJC_ASSOCIATION_ASSIGN);
    } forTarget:weakSelf key:key];
}

@end
