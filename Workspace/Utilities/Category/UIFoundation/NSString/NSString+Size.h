//
//  NSString+Size.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)
- (CGSize)tt_sizeWithFont:(UIFont *)font;

- (CGSize)tt_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGSize)tt_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

- (CGSize)tt_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
- (CGSize)tt_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (CGSize)tt_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode lineSpace:(CGFloat)lineSpace;
@end
