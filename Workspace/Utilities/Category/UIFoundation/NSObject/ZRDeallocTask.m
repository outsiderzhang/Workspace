//
//  ZRDeallocTask.m
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import "ZRDeallocTask.h"

#pragma mark - ## ZRDeallocTaskItem
@interface ZRDeallocTaskItem : NSObject

@property (nonatomic, weak, readonly) id target;
@property (nonatomic, copy, readonly) NSString *key;
@property (nonatomic, copy, readonly) ZRDeallocBlock task;

- (instancetype)initWithTarget:(id)target key:(NSString *)key task:(ZRDeallocBlock)task;

@end

@implementation ZRDeallocTaskItem

- (instancetype)initWithTarget:(id)target key:(NSString *)key task:(ZRDeallocBlock)task
{
    self = [super init];
    if (self) {
        _target = target;
        _key = key;
        _task = [task copy];
    }
    return self;
}

- (BOOL)isEqual:(ZRDeallocTaskItem *)object
{
    if (object == self) {
        return YES;
    }
    else if ([object isKindOfClass:[self class]] && [object.target isEqual:self.target] && [object.key isEqualToString:self.key]) {
        return YES;
    }
    return NO;
}

- (NSUInteger)hash
{
    return ([self.target hash] + self.key.hash) / 2;
}

@end

#pragma mark - ## ZRDeallocTask
@interface ZRDeallocTask ()

@property (nonatomic, strong) NSMutableSet<ZRDeallocTaskItem *> *taskSet;

@end

@implementation ZRDeallocTask

- (id)init
{
    if (self = [super init]) {
        self.taskSet = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [self.taskSet enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(ZRDeallocTaskItem *obj, BOOL *stop) {
        obj.task ? obj.task() : nil;
    }];
}

#pragma mark - # Public Methods
- (void)addTask:(ZRDeallocBlock)task forTarget:(id)target key:(NSString *)key
{
    ZRDeallocTaskItem *taskItem = [[ZRDeallocTaskItem alloc] initWithTarget:target key:key task:task];
    if ([self.taskSet containsObject:taskItem]) {
        [self.taskSet removeObject:taskItem];
    }
    [self.taskSet addObject:taskItem];
}

- (void)removeTaskForTarget:(id)target key:(NSString *)key
{
    ZRDeallocTaskItem *taskItem = [[ZRDeallocTaskItem alloc] initWithTarget:target key:key task:nil];
    [self.taskSet removeObject:taskItem];
}

@end
