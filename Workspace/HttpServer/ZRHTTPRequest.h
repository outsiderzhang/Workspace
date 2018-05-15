//
//  ZRHTTPRequest.h
//  Workspace
//
//  Created by sanjia on 2018/5/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZRNetworkHelper.h"

/**
 请求方式

 - ZRHTTPGetRequestMethod: get请求
 - ZRHTTPPostRequestMethod: post请求
 */
typedef NS_ENUM(NSUInteger, ZRHTTPRequestMethod) {
    ZRHTTPGetRequestMethod,
    ZRHTTPPostRequestMethod,
};
@interface ZRHTTPRequest : NSObject
/**
 请求发起(无缓存)
 
 @param method GET/POST
 @param URL 请求地址
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 @return 返回的对象可取消请求,调用cancel方法
 */
+ (NSURLSessionTask *)requestWithHTTPMethod:(ZRHTTPRequestMethod)method
                                        URL:(NSString *)URL
                                 parameters:(NSDictionary *)parameters
                                    success:(ZRHttpRequestSuccess)success
                                    failure:(ZRHttpRequestFailed)failure;

/**
 请求发起(缓存)

 @param method GET/POST
 @param URL 请求地址
 @param parameters 请求参数
 @param responseCache 请求缓存
 @param success 请求成功回调
 @param failure 请求失败回调
 @return 返回的对象可取消请求,调用cancel方法
 */
+ (NSURLSessionTask *)requestWithHTTPMethod:(ZRHTTPRequestMethod)method
                                        URL:(NSString *)URL
                                 parameters:(NSDictionary *)parameters
                              responseCache:(ZRHttpRequestCache)responseCache
                                    success:(ZRHttpRequestSuccess)success
                                    failure:(ZRHttpRequestFailed)failure;
@end
