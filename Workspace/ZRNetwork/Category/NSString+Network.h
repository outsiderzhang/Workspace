//
//  NSString+Network.h
//  Workspace
//
//  Created by sanjia on 2018/5/16.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Network)
/** 转换为url */
@property (nonatomic, strong, readonly) NSURL *url;
/** 获取对应httpsURL */
@property (nonatomic, strong, readonly) NSString *httpStr;
/** 获取对应httpURL */
@property (nonatomic, strong, readonly) NSString *httpsStr;
/** 获取不含http头的URL */
@property (nonatomic, strong, readonly) NSString *noHttpStr;
/** 获取不含https头的URL */
@property (nonatomic, strong, readonly) NSString *noHttpsStr;
/** 是否含http头或https头 */
@property (nonatomic, assign, readonly) BOOL hasScheme;
/** 是否含http头 */
@property (nonatomic, assign, readonly) BOOL hasHttpScheme;
/** 是否含https头 */
@property (nonatomic, assign, readonly) BOOL hasHttpsScheme;
/** 对url进行编码 */
@property (nonatomic, strong, readonly) NSString *encode;

/**
 * @param pairs 参数键值对
 * eg：w=100
 * eg: w=100&h=100
 * eg: w=100&h=100&l=100
 */
- (NSString *)appendQueryKeyValuePairs:(NSString *)pairs;

/**
 * @param key 参数键
 * @param value 参数值
 */
- (NSString *)appendQueryKey:(NSString *)key value:(NSString *)value;
@end
