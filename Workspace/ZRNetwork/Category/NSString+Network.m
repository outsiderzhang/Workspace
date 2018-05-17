//
//  NSString+Network.m
//  Workspace
//
//  Created by sanjia on 2018/5/16.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "NSString+Network.h"

@implementation NSString (Network)
- (NSURL *)url
{
    NSURL *url = [NSURL URLWithString:[self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    return url;
}

- (NSString *)httpsStr
{
    if ([self hasPrefix:@"http://"]) {
        return [self stringByReplacingOccurrencesOfString:@"http://" withString:@"https://"];
    }
    else if ([self hasPrefix:@"://"]) {
        return [@"https" stringByAppendingString:self];
    }
    else if ([self hasPrefix:@"//"]) {
        return [@"https:" stringByAppendingString:self];
    }
    
    return [@"https://" stringByAppendingString:self];
}

- (NSString *)httpStr
{
    if ([self hasPrefix:@"https://"]) {
        return [self stringByReplacingOccurrencesOfString:@"https://" withString:@"http://"];
    }
    else if ([self hasPrefix:@"://"]) {
        return [@"http" stringByAppendingString:self];
    }
    else if ([self hasPrefix:@"//"]) {
        return [@"http:" stringByAppendingString:self];
    }
    
    return [@"http://" stringByAppendingString:self];
}

- (NSString *)noHttpStr
{
    if ([self hasHttpScheme]) {
        return [self substringFromIndex:[@"http://" length]];
    }
    else if ([self hasPrefix:@"//"]) {
        return [self substringFromIndex:[@"//" length]];
    }
    else if ([self hasPrefix:@"://"]) {
        return [self substringFromIndex:[@"://" length]];
    }
    
    return self;
}

- (NSString *)noHttpsStr
{
    if ([self hasHttpsScheme]) {
        return [self substringFromIndex:[@"https://" length]];
    }
    else if ([self hasPrefix:@"//"]) {
        return [self substringFromIndex:[@"//" length]];
    }
    else if ([self hasPrefix:@"://"]) {
        return [self substringFromIndex:[@"://" length]];
    }
    
    return self;
}

- (BOOL)hasScheme
{
    return [self hasHttpScheme] || [self hasHttpsScheme];
}

- (BOOL)hasHttpScheme
{
    return [self hasPrefix:@"http://"];
}

- (BOOL)hasHttpsScheme
{
    return [self hasPrefix:@"https://"];
}

- (NSString *)encode
{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (CFStringRef)self,
                                                                                 (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                                                 NULL,
                                                                            kCFStringEncodingUTF8));
}

- (NSString *)appendQueryKeyValuePairs:(NSString *)pairs {
    NSString *result = self;
    if (pairs.length > 0) {
        NSRange range = [self rangeOfString:@"?"];
        NSString *firstPart = nil;
        NSString *secondPart = nil;
        NSString *insertParamStr = pairs;
        if (range.location != NSNotFound) {
            firstPart = [self substringToIndex:range.location];
            secondPart = [self substringFromIndex:range.location + 1];
            secondPart = [NSString stringWithFormat:@"%@&%@", insertParamStr, secondPart];
        } else {
            firstPart = self;
            secondPart = insertParamStr;
        }
        result = [NSString stringWithFormat:@"%@?%@", firstPart, secondPart];
    }
    
    return result;
}

- (NSString *)appendQueryKey:(NSString *)key value:(NSString *)value {
    NSString *result = self;
    if (key.description.length > 0 && value.description.length > 0) {
        NSRange range = [self rangeOfString:@"?"];
        NSString *firstPart = nil;
        NSString *secondPart = nil;
        NSString *insertParamStr = [NSString stringWithFormat:@"%@=%@",key,value];
        if (range.location != NSNotFound) {
            firstPart = [self substringToIndex:range.location];
            secondPart = [self substringFromIndex:range.location + 1];
            secondPart = [NSString stringWithFormat:@"%@&%@", insertParamStr, secondPart];
        } else {
            firstPart = self;
            secondPart = insertParamStr;
        }
        result = [NSString stringWithFormat:@"%@?%@", firstPart, secondPart];
    }
    
    return result;
}
@end
