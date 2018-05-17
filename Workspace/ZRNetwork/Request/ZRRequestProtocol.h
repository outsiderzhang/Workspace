//
//  ZRRequestProtocol.h
//  Workspace
//
//  Created by sanjia on 2018/5/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 请求方式 */
typedef NS_ENUM(NSUInteger, ZRRequestMethod) {
    ZRRequestMethodGET = 0,
    ZRRequestMethodPOST,
    ZRRequestMethodHEAD,
    ZRRequestMethodPUT,
    ZRRequestMethodDELETE,
    ZRRequestMethodOPTIONS,
    ZRRequestMethodPATCH,
    ZRRequestMethodCONNECT,
    ZRRequestMethodTRACE,
};

/**
 请求数据格式枚举

 - ZRRequestSerializerHTTP: 请求数据为HTTP格式
 - ZRRequestSerializerJSON: 请求数据为JSON格式
 - ZRRequestSerializerXML: 请求数据为XML格式
 - ZRRequestSerializerPLIST: 请求数据为PLIST格式
 */
typedef NS_ENUM(NSUInteger, ZRRequestSerializerType) {
    ZRRequestSerializerHTTP = 0,
    ZRRequestSerializerJSON,
    ZRRequestSerializerXML,
    ZRRequestSerializerPLIST,
};

/**
 响应数据格式枚举

 - ZRResponseSerializerHTTP: 响应数据为HTTP格式
 - ZRResponseSerializerJSON: 响应数据为JSON格式
 - ZRResponseSerializerXML: 响应数据为XML格式
 - ZRResponseSerializerPLIST: 响应数据为PLIST格式
 */
typedef NS_ENUM(NSUInteger, ZRResponseSerializerType) {
    ZRResponseSerializerHTTP = 0,
    ZRResponseSerializerJSON,
    ZRResponseSerializerXML,
    ZRResponseSerializerPLIST,
};

/**
 请求优先级枚举

 - ZRRequestPriorityLow: 低优先级
 - ZRRequestPriorityDefault: 默认
 - ZRRequestPriorityHigh: 高优先级
 */
typedef NS_ENUM(NSInteger, ZRRequestPriority) {
    ZRRequestPriorityLow = -4L,
    ZRRequestPriorityDefault = 0L,
    ZRRequestPriorityHigh = 4L,
};

/**
 请求状态枚举

 - ZRRequestStateRunning: 请求
 - ZRRequestStateSuspended: 挂起
 - ZRRequestStateCanceling: 取消
 - ZRRequestStateCompleted: 完成
 */
typedef NS_ENUM(NSUIteger, ZRRequestState) {
    ZRRequestStateRunning,
    ZRRequestStateSuspended,
    ZRRequestStateCanceling,
    ZRRequestStateCompleted,
};

@class ZRRequest;
@class ZRResponse;

/** 请求完成回调 */
typedef void(^ZRRequestCompletion)(ZRResponse *responseObject);
/** 请求成功回调 */
typedef void(^ZRRequestSuccess)(id successObject);
/** 请求失败回调 */
typedef void(^ZRRequestFailure)(id failureObject);

@protocol AFMultipartFormData;
/** 请求构造回调 */
typedef void (^ZRRequestConstruct)(id<AFMultipartFormData> formData);
/** 请求进度回调 */
typedef void (^ZRRequestProgress)(NSProgress *progress);

@protocol ZRRequestProtocol <NSObject>
/**
 请求成功代理

 @param request 请求模型
 @param response 响应模型
 */
- (void)requestSuccessWithRequest:(__kindof ZRRequest *)request response:(ZRResponse *)response;

/**
 请求失败代理

 @param request 请求模型
 @param response 响应模型
 */
- (void)requestFailureWithRequest:(__kindof ZRRequest *)request response:(ZRResponse *)response;
@end
