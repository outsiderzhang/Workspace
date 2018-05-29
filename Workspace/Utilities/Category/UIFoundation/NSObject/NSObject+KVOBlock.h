//
//  NSObject+KVOBlock.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ZRKVOBlock)(NSDictionary *change, void *context);

@interface NSObject (KVOBlock)

- (void)tt_addObserver:(NSObject *)observer
            forKeyPath:(NSString *)keyPath
               options:(NSKeyValueObservingOptions)options
               context:(void *)context
             withBlock:(ZRKVOBlock)block;

-(void)tt_removeBlockObserver:(NSObject *)observer
                   forKeyPath:(NSString *)keyPath;

-(void)tt_addObserverForKeyPath:(NSString *)keyPath
                        options:(NSKeyValueObservingOptions)options
                        context:(void *)context
                      withBlock:(ZRKVOBlock)block;

-(void)tt_removeBlockObserverForKeyPath:(NSString *)keyPath;


@end
