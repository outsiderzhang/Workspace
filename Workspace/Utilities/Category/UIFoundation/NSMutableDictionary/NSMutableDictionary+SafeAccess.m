//
//  NSMutableDictionary+SafeAccess.m
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import "NSMutableDictionary+SafeAccess.h"

@implementation NSMutableDictionary (SafeAccess)
- (void)setSafeObject:(id)object forKey:(NSString*)key
{
    if (object != nil) {
        self[key] = object;
    }
}

- (void)setString:(NSString *)string forKey:(NSString *)key
{
    [self setValue:string ? string : @"" forKey:key];
}

- (void)setBool:(BOOL)boolValue forKey:(NSString *)key
{
    self[key] = @(boolValue);
}

- (void)setInt:(int)intValue forKey:(NSString *)key
{
    self[key] = @(intValue);
}

- (void)setInteger:(NSInteger)integerValue forKey:(NSString *)key
{
    self[key] = @(integerValue);
}

- (void)setUnsignedInteger:(NSUInteger)unsignedIntegerValue forKey:(NSString *)key
{
    self[key] = @(unsignedIntegerValue);
}

- (void)setCGFloat:(CGFloat)floatValue forKey:(NSString *)key
{
    self[key] = @(floatValue);
}

- (void)setChar:(char)charValue forKey:(NSString *)key
{
    self[key] = @(charValue);
}

- (void)setFloat:(float)floatValue forKey:(NSString *)key
{
    self[key] = @(floatValue);
}

- (void)setDouble:(double)doubleValue forKey:(NSString *)key
{
    self[key] = @(doubleValue);
}

- (void)setLongLong:(long long)longlongValue forKey:(NSString *)key
{
    self[key] = @(longlongValue);
}

- (void)setPoint:(CGPoint)point forKey:(NSString *)key
{
    self[key] = NSStringFromCGPoint(point);
}

- (void)setSize:(CGSize)size forKey:(NSString *)key
{
    self[key] = NSStringFromCGSize(size);
}

- (void)setRect:(CGRect)rect forKey:(NSString *)key
{
    self[key] = NSStringFromCGRect(rect);
}
@end
