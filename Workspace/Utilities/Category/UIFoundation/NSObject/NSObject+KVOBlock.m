//
//  NSObject+KVOBlock.m
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import "NSObject+KVOBlock.h"
#import <objc/runtime.h>

@implementation NSObject (KVOBlock)

-(void)tt_addObserver:(NSObject *)observer
           forKeyPath:(NSString *)keyPath
              options:(NSKeyValueObservingOptions)options
              context:(void *)context
            withBlock:(ZRKVOBlock)block
{
    
    objc_setAssociatedObject(observer, (__bridge const void *)(keyPath), block, OBJC_ASSOCIATION_COPY);
    [self addObserver:observer forKeyPath:keyPath options:options context:context];
}

-(void)tt_removeBlockObserver:(NSObject *)observer
                   forKeyPath:(NSString *)keyPath
{
    objc_setAssociatedObject(observer, (__bridge const void *)(keyPath), nil, OBJC_ASSOCIATION_COPY);
    [self removeObserver:observer forKeyPath:keyPath];
}

-(void)tt_observeValueForKeyPath:(NSString *)keyPath
                        ofObject:(id)object
                          change:(NSDictionary *)change
                         context:(void *)context
{
    
    ZRKVOBlock block = objc_getAssociatedObject(self, (__bridge const void *)(keyPath));
    block(change, context);
}

-(void)tt_addObserverForKeyPath:(NSString *)keyPath
                        options:(NSKeyValueObservingOptions)options
                        context:(void *)context
                      withBlock:(ZRKVOBlock)block
{
    
    [self tt_addObserver:self forKeyPath:keyPath options:options context:context withBlock:block];
}

-(void)tt_removeBlockObserverForKeyPath:(NSString *)keyPath
{
    [self tt_removeBlockObserver:self forKeyPath:keyPath];
}

@end
