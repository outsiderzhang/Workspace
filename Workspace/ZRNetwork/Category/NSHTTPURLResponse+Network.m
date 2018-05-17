//
//  NSHTTPURLResponse+Network.m
//  Workspace
//
//  Created by sanjia on 2018/5/16.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "NSHTTPURLResponse+Network.h"

@implementation NSHTTPURLResponse (Network)

/** 字符编码格式 */
- (NSStringEncoding)stringEncoding
{
    if (self.textEncodingName) {
        CFStringEncoding encoding = CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.textEncodingName);
        if (encoding != kCFStringEncodingInvalidId) {
            return CFStringConvertEncodingToNSStringEncoding(encoding);
        }
    }
    return NSUTF8StringEncoding;
}
@end
