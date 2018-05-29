//
//  NSObject+Dealloc.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ZRDeallocBlock)(void);

@interface NSObject (Dealloc)

- (void)addDeallocTask:(ZRDeallocBlock)deallocTask forTarget:(id)target key:(NSString *)key;

- (void)removeDeallocTaskForTarget:(id)target key:(NSString *)key;

@end
