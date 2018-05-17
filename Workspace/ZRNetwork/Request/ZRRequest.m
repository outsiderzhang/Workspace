//
//  ZRRequest.m
//  Workspace
//
//  Created by sanjia on 2018/5/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRRequest.h"

@implementation ZRRequest

#pragma mark -- 类初始化方法
+ (instancetype)initWithMethod:(ZRRequestMethod)method url:(NSString *)url parameters:(NSDictionary *)parameters
{
    return [self initWithMethod:method url:url parameters:parameters];
}

#pragma mark -- 请求模型初始化
- (instancetype)initWithMethod:(ZRRequestMethod)method url:(NSString *)url parameters:(NSDictionary *)parameters
{
    if (self) {
        self.requestMethod = method;
        self.url = url;
        self.parameters = parameters;
        self.requestPriority = ZRRequestPriorityDefault;
        
//        self.timeoutInterval = [TLNetworkConfig sharedConfig].timeoutIntervalForRequest;
//        self.requestSerializerType = [TLNetworkConfig sharedConfig].requestSerializerType;
//        self.responseSerializerType = [TLNetworkConfig sharedConfig].responseSerializerType;
//        self.headerField = [TLNetworkConfig sharedConfig].headerField;
    }
    return self;
}

#pragma mark -- 发起/取消网络请求
- (void)startRequestWithSuccessHandler:(ZRRequestSuccess)successHandler failureHandler:(ZRRequestFailure)failureHandler
{
    [self setSuccessHandler:successHandler];
    [self setFailureHandler:failureHandler];
    [self startRequest];
}

- (void)startRequest
{
    
}

- (void)cancelRequest
{
    
}

- (void)setRequestTask:(NSURLSessionTask *)requestTask
{
    
}

#pragma mark -- getter
- (ZRRequestState)state
{
    if (!self.requestTask) return ZRRequestStateSuspended;
    
    switch (self.requestTask.state) {
        case NSURLSessionTaskStateRunning:
            return ZRRequestStateRunning;
            break;
        case NSURLSessionTaskStateCanceling:
            return ZRRequestStateCanceling;
            break;
        case NSURLSessionTaskStateCompleted:
            return ZRRequestStateCompleted;
            break;
        case NSURLSessionTaskStateSuspended:
            return ZRRequestStateSuspended;
            break;
        default:
            return ZRRequestStateSuspended;
            break;
    }
}
@end
