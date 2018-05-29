//
//  NSMutableArray+SafeAccess.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableArray (SafeAccess)

- (void)addSafeObject:(id)object;

- (void)addString:(NSString *)stringValue;

- (void)addBool:(BOOL)boolValue;

- (void)addInt:(int)intValue;

- (void)addInteger:(NSInteger)integerValue;

- (void)addUnsignedInteger:(NSUInteger)unsignedIntegerValue;

- (void)addCGFloat:(CGFloat)CGFloatValue;

- (void)addChar:(char)charValue;

- (void)addFloat:(float)floatValue;

- (void)addPoint:(CGPoint)pointValue;

- (void)addSize:(CGSize)sizeValue;

- (void)addRect:(CGRect)rectValue;

@end
