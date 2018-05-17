//
//  NSURL+Network.m
//  Workspace
//
//  Created by sanjia on 2018/5/16.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "NSURL+Network.h"

@implementation NSURL (Network)
- (BOOL)isHTTP
{
    return [self.absoluteString hasPrefix:@"http:"];
}

- (BOOL)isHTTPS
{
    return [self.absoluteString hasPrefix:@"https:"];
}
@end
