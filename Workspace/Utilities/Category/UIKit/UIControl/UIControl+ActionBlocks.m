//
//  UIControl+ActionBlocks.m
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import "UIControl+ActionBlocks.h"
#import <objc/runtime.h>

#define ZR_UICONTROL_EVENT(methodName, eventName) \
-(void)methodName : (void (^)(void))eventBlock \
{ \
objc_setAssociatedObject(self, @selector(methodName:), eventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC); \
[self addTarget:self \
action:@selector(methodName##Action:) \
forControlEvents:UIControlEvent##eventName]; \
}\
-(void)methodName##Action:(id)sender \
{ \
void (^block)(void) = objc_getAssociatedObject(self, @selector(methodName:)); \
if (block) { \
block(); \
} \
}

@implementation UIControl (ActionBlocks)

ZR_UICONTROL_EVENT(tt_touchDown, TouchDown)
ZR_UICONTROL_EVENT(tt_touchDownRepeat, TouchDownRepeat)
ZR_UICONTROL_EVENT(tt_touchDragInside, TouchDragInside)
ZR_UICONTROL_EVENT(tt_touchDragOutside, TouchDragOutside)
ZR_UICONTROL_EVENT(tt_touchDragEnter, TouchDragEnter)
ZR_UICONTROL_EVENT(tt_touchDragExit, TouchDragExit)
ZR_UICONTROL_EVENT(tt_touchUpInside, TouchUpInside)
ZR_UICONTROL_EVENT(tt_touchUpOutside, TouchUpOutside)
ZR_UICONTROL_EVENT(tt_touchCancel, TouchCancel)
ZR_UICONTROL_EVENT(tt_valueChanged, ValueChanged)
ZR_UICONTROL_EVENT(tt_editingDidBegin, EditingDidBegin)
ZR_UICONTROL_EVENT(tt_editingChanged, EditingChanged)
ZR_UICONTROL_EVENT(tt_editingDidEnd, EditingDidEnd)
ZR_UICONTROL_EVENT(tt_editingDidEndOnExit, EditingDidEndOnExit)

@end
