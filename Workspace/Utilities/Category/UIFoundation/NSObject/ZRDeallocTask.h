//
//  ZRDeallocTask.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Dealloc.h"
@interface ZRDeallocTask : NSObject
- (void)addTask:(ZRDeallocBlock)task forTarget:(id)target key:(NSString *)key;

- (void)removeTaskForTarget:(id)target key:(NSString *)key;
@end
