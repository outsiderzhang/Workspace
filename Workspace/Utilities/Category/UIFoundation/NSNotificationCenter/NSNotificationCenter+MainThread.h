//
//  NSNotificationCenter+MainThread.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (MainThread)
- (void)postNotificationOnMainThread:(NSNotification *)notification;

- (void)postNotificationOnMainThreadName:(NSString *)name object:(id)object;

- (void)postNotificationOnMainThreadName:(NSString *)name object:(id)object userInfo:(NSDictionary *)aUserInfo;
@end
