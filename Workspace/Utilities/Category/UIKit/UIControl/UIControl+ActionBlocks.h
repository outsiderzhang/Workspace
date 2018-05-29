//
//  UIControl+ActionBlocks.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (ActionBlocks)
- (void)tt_touchDown:(void (^)(void))eventBlock;
- (void)tt_touchDownRepeat:(void (^)(void))eventBlock;
- (void)tt_touchDragInside:(void (^)(void))eventBlock;
- (void)tt_touchDragOutside:(void (^)(void))eventBlock;
- (void)tt_touchDragEnter:(void (^)(void))eventBlock;
- (void)tt_touchDragExit:(void (^)(void))eventBlock;
- (void)tt_touchUpInside:(void (^)(void))eventBlock;
- (void)tt_touchUpOutside:(void (^)(void))eventBlock;
- (void)tt_touchCancel:(void (^)(void))eventBlock;
- (void)tt_valueChanged:(void (^)(void))eventBlock;
- (void)tt_editingDidBegin:(void (^)(void))eventBlock;
- (void)tt_editingChanged:(void (^)(void))eventBlock;
- (void)tt_editingDidEnd:(void (^)(void))eventBlock;
- (void)tt_editingDidEndOnExit:(void (^)(void))eventBlock;
@end
