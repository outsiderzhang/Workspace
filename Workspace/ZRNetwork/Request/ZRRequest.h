//
//  ZRRequest.h
//  Workspace
//
//  Created by sanjia on 2018/5/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZRRequestProtocol.h"

@class ZRResponse;
@interface ZRRequest : NSObject

#pragma mark -- 基本请求参数
/** 请求地址,不包含域名(域名在NetworkConfig中指定) */
@property (nonatomic, strong) NSString *url;
/** 请求方式 */
@property (nonatomic, assign) ZRRequestMethod requestMethod;
/** 请求参数 */
@property (nonatomic, strong) id parameters;
/** 请求头 */
@property (nonatomic, strong) NSDictionary <NSString *, NSString *>*headerField;
/** 请求成功回调 */
@property (nonatomic, copy) ZRRequestSuccess successHandler;
/** 请求失败回调 */
@property (nonatomic, copy) ZRRequestFailure failureHandler;
/** 请求回调delegate */
@property (nonatomic, weak) id <ZRRequestProtocol>delegate;

#pragma mark -- 参数序列化类型
/** 请求参数序列化类型 */
@property (nonatomic, assign) ZRRequestSerializerType requestSerializerType;
/** 响应参数序列化类型 */
@property (nonatomic, assign) ZRResponseSerializerType responseSerializerType;

#pragma mark -- 网络请求配置
/** 请求优先级 */
@property (nonatomic, assign) ZRRequestPriority requestPriority;
/** 请求超时时间 默认获取Config中的设置（30s） */
@property (nonatomic, assign) NSInteger timeoutInterval;
/** 不允许蜂窝移动访问 */
@property (nonatomic, assign) BOOL disableCellularAccess;

#pragma mark -- 公开参数
/** 请求标识 */
@property (nonatomic, assign) NSInteger tag;
/** 请求用户自定义信息 */
@property (nonatomic, strong) id userInfo;
/** 请求状态 */
@property (nonatomic, assign) ZRRequestState state;
/** 请求任务 */
@property (nonatomic, strong) NSURLSessionTask *requestTask;

#pragma mark -- mock
/** 请求标识 */
@property (nonatomic, assign) BOOL useMock;

#pragma mark -- request初始化
/**
 初始化

 @param method 请求方式
 @param url 请求地址
 @param parameters 请求参数
 @return 请求模型
 */
- (instancetype)initWithMethod:(ZRRequestMethod)method url:(NSString *)url parameters:(NSDictionary *)parameters;

/** 类初始化方法 */
+ (instancetype)initWithMethod:(ZRRequestMethod)method url:(NSString *)url parameters:(NSDictionary *)parameters;

- (instancetype)init __attribute__((unavailable("请使用 initWithMethod:url:params: 或者 initWithMethod:url:params:")));

#pragma mark -- 请求发起与终止
/**
 发起网络请求

 @param successHandler 成功回调
 @param failureHandler 失败回调
 */
- (void)startRequestWithSuccessHandler:(ZRRequestSuccess)successHandler
                        failureHandler:(ZRRequestFailure)failureHandler;

/**
 发起网络请求
 */
- (void)startRequest;

/**
 取消网络请求
 */
- (void)cancelRequest;
@end
