//
//  ZRResponse.m
//  Workspace
//
//  Created by sanjia on 2018/5/15.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRResponse.h"

@implementation ZRResponse

- (id)initWithRequest:(__kindof ZRRequest *)request responseObject:(id)responseObject error:(NSError *)error
{
    if (self = [super init]) {
        
        _request = request;
        _responseObject = responseObject;
        _error = error;
        
        if (error || !responseObject) {
            _success = NO;
        }else{
            _success = YES;
        }
        
        if ([responseObject isKindOfClass:[NSData class]]) {
            //_responseString = [NSString alloc] initWithData:responseObject encoding:self.customResponse.
        }
    }
    return self;
}
@end
