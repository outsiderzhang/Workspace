//
//  NSMutableURLRequest+Network.m
//  Workspace
//
//  Created by sanjia on 2018/5/16.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "NSMutableURLRequest+Network.h"
#import <AFNetworking/AFNetworking.h>

@implementation NSMutableURLRequest (Network)
+ (NSMutableURLRequest *)requestWithSerializer:(AFHTTPRequestSerializer *)serializer
                                        method:(NSString *)method
                                           url:(NSString *)url
                                    parameters:(id)parameters
                                     construct:(ZRRequestConstruct)construct
                                         error:(NSError *__autoreleasing *)error
{
    NSMutableURLRequest *request;
    if (construct) {
        request = [serializer multipartFormRequestWithMethod:method
                                                   URLString:url
                                                  parameters:parameters
                                   constructingBodyWithBlock:construct
                                                       error:error];
    } else {
        request = [serializer requestWithMethod:method
                                      URLString:url
                                     parameters:parameters
                                          error:error];
    }
    return request;
}
@end
