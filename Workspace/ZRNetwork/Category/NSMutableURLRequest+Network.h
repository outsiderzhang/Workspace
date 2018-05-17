//
//  NSMutableURLRequest+Network.h
//  Workspace
//
//  Created by sanjia on 2018/5/16.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZRRequestProtocol.h"

@class AFHTTPRequestSerializer;
@interface NSMutableURLRequest (Network)
+ (NSMutableURLRequest *)requestWithSerializer:(AFHTTPRequestSerializer *)serializer
                                        method:(NSString *)method
                                           url:(NSString *)url
                                    parameters:(id)parameters
                                     construct:(ZRRequestConstruct)construct
                                         error:(NSError *__autoreleasing *)error;
@end
