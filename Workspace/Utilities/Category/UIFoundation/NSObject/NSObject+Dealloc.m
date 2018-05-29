//
//  NSObject+Dealloc.m
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import "NSObject+Dealloc.h"
#import <objc/runtime.h>
#import "ZRDeallocTask.h"

static const char kTask = '0';

@implementation NSObject (Dealloc)

- (void)addDeallocTask:(ZRDeallocBlock)deallocTask forTarget:(id)target key:(NSString *)key
{
    [self.deallocTask addDeallocTask:deallocTask forTarget:target key:key];
}

- (void)removeDeallocTaskForTarget:(id)target key:(NSString *)key
{
    [self.deallocTask removeDeallocTaskForTarget:target key:key];
}

#pragma mark - # Getters
- (ZRDeallocTask *)deallocTask
{
    ZRDeallocTask *task = objc_getAssociatedObject(self, &kTask);
    if (!task) {
        task = [[ZRDeallocTask alloc] init];
        objc_setAssociatedObject(self, &kTask, task, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return task;
}

@end
