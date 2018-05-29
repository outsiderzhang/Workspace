//
//  ZRLoginTf.m
//  Workspace
//
//  Created by sanjia on 2018/5/28.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRLoginTf.h"

@interface ZRLoginTf ()
@property (nonatomic, assign) ZRLoginTfType type;//输入框类型表示

@property (nonatomic, strong) UITextField *tf;//输入框
@property (nonatomic, strong) UILabel *title;//前标题
@property (nonatomic, strong) UIButton *code;//获取验证码
@end
@implementation ZRLoginTf

//根据类型初始化输入框
- (instancetype)initWithType:(ZRLoginTfType)type
{
    if (self = [super init]) {
        _type = type;
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
    UILabel *title = [[UILabel alloc] init];
    title.textColor = ZRHex(0x333333);
    title.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
    [self addSubview:title];
    
    self.title = title;
    
    UILabel *bottomLine = [[UILabel alloc] init];
    bottomLine.backgroundColor = kLineColor;
    [self addSubview:bottomLine];
    
    UITextField *tf = [[UITextField alloc] init];
    tf.textColor = ZRHex(0x999999);
    tf.keyboardType = UIKeyboardTypeNumberPad;
    tf.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
    [self addSubview:tf];
    
    self.tf = tf;
    
    if (_type == ZRLoginCodeTf) {
        
        UIButton *code = [[UIButton alloc] init];
        code.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
        [code setTitle:@"获取验证码" forState:UIControlStateNormal];
        [code setTitleColor:ZRHex(0x333333) forState:UIControlStateNormal];
        [self addSubview:code];
        
        self.code = code;
        
        [code mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).with.offset(UI_IS_IPHONE5 || UI_IS_IPHONE4 ? -10 : -15);
            make.bottom.equalTo(self).with.offset(-13);
            make.size.mas_equalTo(CGSizeMake(80, 15));
        }];
        
        UILabel *line = [[UILabel alloc] init];
        line.backgroundColor = kLineColor;
        [self addSubview:line];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(code);
            make.right.equalTo(code.mas_left).with.offset(UI_IS_IPHONE5 || UI_IS_IPHONE4 ? -10 : -15);
            make.size.mas_equalTo(CGSizeMake(UI_1PX, 20));
        }];
    }
    
    switch (_type) {
        case ZRLoginPhoneTf:
            self.title.text = @"手机号";
            self.tf.placeholder = @"请输入手机号";
            break;
        case ZRLoginCodeTf:
            self.title.text = @"验证码";
            self.tf.placeholder = @"请输入验证码";
            break;
        case ZRLoginClubTf:
            self.title.text = @"俱乐部";
            self.tf.placeholder = @"A8桌球俱乐部";
            break;
        default:
            break;
    }
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(5);
        make.width.equalTo(@45);
        if (self.code != nil) {
            make.centerY.equalTo(self.code);
        }else{
            make.bottom.equalTo(self).with.offset(-13);
        }
        
    }];
    
    [self.tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title.mas_right).with.offset(30);
        make.centerY.equalTo(self.title);
        make.height.equalTo(@15);
        if (self.code == nil) {
            make.right.equalTo(self).with.offset(-30);
        }else{
            make.right.equalTo(self.code.mas_left).with.offset(UI_IS_IPHONE5 || UI_IS_IPHONE4 ? -20 : -30);
        }
    }];
    
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self).with.offset(0);
        make.height.equalTo(@UI_1PX);
    }];
    
    
}


@end
