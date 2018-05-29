//
//  UIAlertView+ActionBlocks.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (ActionBlocks)
@property (nonatomic, copy) void (^tt_actionBlock)(UIAlertView *alertView, NSInteger buttonIndex);

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
        actionBlock:(void (^)(UIAlertView *alertView, NSInteger buttonIndex))actionBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;
@end
