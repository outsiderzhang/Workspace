//
//  NSString+StringPages.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringPages)
/**
 *  根据字符串进行分页
 *
 *  @param font  你想显示的字体大小，这个要保持统一
 *  @param rect     你想在多大的窗口显示
 *
 *  @return 返回一个数组，数组的元素是NSrange，根据NSRange来进行截取字符串
 */
- (NSArray *)tt_getPagesOfStringWithFont:(UIFont *)font inRect:(CGRect)rect;
@end
