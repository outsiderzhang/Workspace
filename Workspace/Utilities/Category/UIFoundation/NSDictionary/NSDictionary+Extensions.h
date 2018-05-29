//
//  NSDictionary+Extensions.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extensions)
+ (NSDictionary *)dictionaryMergeWith:(NSDictionary *)dict1 and:(NSDictionary *)dict2;

- (NSDictionary *)dictionaryMergeWith:(NSDictionary *)dictionary;
@end
