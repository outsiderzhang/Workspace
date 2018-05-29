//
//  NSString+Contains.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Contains)
@property (nonatomic, assign, readonly, getter=isContainEmoji) BOOL containEmoji;

@property (nonatomic, assign, readonly, getter=isContainChinese) BOOL containChinese;

@property (nonatomic, assign, readonly, getter=isContainBlank) BOOL containBlank;
@end
