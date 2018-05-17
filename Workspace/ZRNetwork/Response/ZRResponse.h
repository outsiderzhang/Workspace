//
//  ZRResponse.h
//  Workspace
//
//  Created by sanjia on 2018/5/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZRRequest.h"
@interface ZRResponse : NSObject

/** 是否成功 */
@property (nonatomic, assign, readonly) BOOL success;
/** 状态码 */
@property (nonatomic, assign, readonly) NSInteger statusCode;
/** 响应头 */
@property (nonatomic, strong, readonly) NSDictionary *headerField;
/** 响应体(已经序列化) */
@property (nonatomic, strong, readonly) id responseObject;
/** 响应体->模型 */
//@property (nonatomic, strong, readonly) id responseModel;
/** 响应体->字符串 */
@property (nonatomic, strong, readonly) NSString *responseString;
/** 错误信息 */
@property (nonatomic, strong, readonly) NSError *error;

#pragma mark - Request相关
/** request模型 */
@property (nonatomic, strong, readonly) __kindof ZRRequest *request;
/** 请求标识（Request）*/
@property (nonatomic, assign, readonly) NSInteger tag;
/** 用户自定义信息（Request）*/
@property (nonatomic, strong, readonly) id userInfo;

#pragma mark - 私有响应参数
/** 请求任务sessionTask（从ZRRequest中获取）*/
@property (nonatomic, strong, readonly) NSURLSessionTask *requestTask;
/** 系统网络请求响应模型 */
@property (nonatomic, strong, readonly) NSHTTPURLResponse *customResponse;

/**
 * 初始化
 *
 * @param request 网络请求模型
 * @param responseObject 请求响应体（未经处理）
 * @param error 错误信息
 */
- (id)initWithRequest:(__kindof ZRRequest *)request responseObject:(id)responseObject error:(NSError *)error;
@end
