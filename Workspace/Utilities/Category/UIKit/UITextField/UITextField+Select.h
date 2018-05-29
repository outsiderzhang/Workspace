//
//  UITextField+Select.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Select)
/**
 * 当前选中的字符串范围
 */
- (NSRange)selectedRange;

/**
 *  选中所有文字
 */
- (void)selectedText;

/**
 *  选中指定范围的文字
 */
- (void)setSelectedRange:(NSRange)range;
@end
