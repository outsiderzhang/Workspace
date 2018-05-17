//
//  NSURL+Network.h
//  Workspace
//
//  Created by sanjia on 2018/5/16.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Network)
@property (nonatomic, assign, readonly) BOOL isHTTP;

@property (nonatomic, assign, readonly) BOOL isHTTPS;
@end
