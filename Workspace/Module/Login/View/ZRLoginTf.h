//
//  ZRLoginTf.h
//  Workspace
//
//  Created by sanjia on 2018/5/28.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 输入框类型

 - ZRLoginPhoneTf: 手机号
 - ZRLoginCodeTf: 验证码
 - ZRLoginClubTf: 俱乐部
 */
typedef NS_ENUM(NSUInteger, ZRLoginTfType) {
    ZRLoginPhoneTf,
    ZRLoginCodeTf,
    ZRLoginClubTf,
};

@interface ZRLoginTf : UIView

/**
 根据类型初始化输入框

 @param type 输入框类型
 @return 输入框
 */
- (instancetype)initWithType:(ZRLoginTfType)type;
@end
