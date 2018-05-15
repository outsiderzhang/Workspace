//
//  ZRLoginRequest.h
//  Workspace
//
//  Created by sanjia on 2018/5/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRHTTPRequest.h"

@interface ZRLoginRequest : ZRHTTPRequest
+ (NSURLSessionTask *)loginWithParameters:(NSDictionary *)parameters success:(ZRHttpRequestSuccess)success failure:(ZRHttpRequestFailed)failure;
+ (NSURLSessionTask *)loginWithParameters:(NSDictionary *)parameters responseCache:(ZRHttpRequestCache)responseCache success:(ZRHttpRequestSuccess)success failure:(ZRHttpRequestFailed)failure;
@end
