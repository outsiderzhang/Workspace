//
//  ZRLoginRequest.m
//  Workspace
//
//  Created by sanjia on 2018/5/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRLoginRequest.h"
#import "ZRInterfaceConst.h"
@implementation ZRLoginRequest
+ (NSURLSessionTask *)loginWithParameters:(NSDictionary *)parameters success:(ZRHttpRequestSuccess)success failure:(ZRHttpRequestFailed)failure
{
    NSString *url = [NSString stringWithFormat:@"%@%@", KSERVERURLPREFIX, KAPILOGIN];
    return [self requestWithHTTPMethod:ZRHTTPPostRequestMethod URL:url parameters:parameters success:success failure:failure];
}
+ (NSURLSessionTask *)loginWithParameters:(NSDictionary *)parameters responseCache:(ZRHttpRequestCache)responseCache success:(ZRHttpRequestSuccess)success failure:(ZRHttpRequestFailed)failure
{
    NSString *url = [NSString stringWithFormat:@"%@%@", KSERVERURLPREFIX, KAPILOGIN];
    return [self requestWithHTTPMethod:ZRHTTPPostRequestMethod URL:url parameters:parameters responseCache:responseCache success:success failure:failure];
}
@end
