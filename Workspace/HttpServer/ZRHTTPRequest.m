//
//  ZRHTTPRequest.m
//  Workspace
//
//  Created by sanjia on 2018/5/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRHTTPRequest.h"

@implementation ZRHTTPRequest
#pragma mark -- 请求发起(无缓存)
+ (NSURLSessionTask *)requestWithHTTPMethod:(ZRHTTPRequestMethod)method
                                        URL:(NSString *)URL
                                 parameters:(NSDictionary *)parameters
                                    success:(ZRHttpRequestSuccess)success
                                    failure:(ZRHttpRequestFailed)failure
{
    return [self requestWithHTTPMethod:method URL:URL parameters:parameters responseCache:nil success:success failure:failure];
}
#pragma mark -- 请求发起(缓存)
+ (NSURLSessionTask *)requestWithHTTPMethod:(ZRHTTPRequestMethod)method
                                        URL:(NSString *)URL
                                 parameters:(NSDictionary *)parameters
                              responseCache:(ZRHttpRequestCache)responseCache
                                    success:(ZRHttpRequestSuccess)success
                                    failure:(ZRHttpRequestFailed)failure
{
    switch (method) {
        case ZRHTTPGetRequestMethod:
            return [self getRequestWithURL:URL parameters:parameters responseCache:responseCache success:success failure:failure];
            break;
        case ZRHTTPPostRequestMethod:
            return [self postRequestWithURL:URL parameters:parameters responseCache:responseCache success:success failure:failure];
            break;
    }
    
}

#pragma mark -- 私有
+ (NSURLSessionTask *)getRequestWithURL:(NSString *)URL
                              parameters:(NSDictionary *)parameters
                           responseCache:(ZRHttpRequestCache)responseCache
                                 success:(ZRHttpRequestSuccess)success
                                 failure:(ZRHttpRequestFailed)failure
{
    return [ZRNetworkHelper GET:URL parameters:parameters responseCache:^(id cacheObject) {
        responseCache != nil ? responseCache(cacheObject) : nil;
    } success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

+ (NSURLSessionTask *)postRequestWithURL:(NSString *)URL
                          parameters:(NSDictionary *)parameters
                       responseCache:(ZRHttpRequestCache)responseCache
                             success:(ZRHttpRequestSuccess)success
                             failure:(ZRHttpRequestFailed)failure
{
    return [ZRNetworkHelper POST:URL parameters:parameters responseCache:^(id cacheObject) {
        responseCache != nil ? responseCache(cacheObject) : nil;
    } success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}


@end
