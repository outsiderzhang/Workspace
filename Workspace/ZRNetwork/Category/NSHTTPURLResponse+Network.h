//
//  NSHTTPURLResponse+Network.h
//  Workspace
//
//  Created by sanjia on 2018/5/16.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSHTTPURLResponse (Network)
/** 字符串编码，默认NSUTF8StringEncoding */
@property (nonatomic, assign, readonly) NSStringEncoding stringEncoding;
@end
