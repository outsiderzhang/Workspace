//
//  ZRInterfaceConst.m
//  Workspace
//
//  Created by sanjia on 2018/5/14.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRInterfaceConst.h"

#if DevelopSever
/** 接口前缀-开发服务器*/
NSString *const KSERVERURLPREFIX = @"http://api.budejie.com/api/api_open.php";
#elif TestSever
/** 接口前缀-测试服务器*/
NSString *const KSERVERURLPREFIX = @"https://www.baidu.com";
#elif ProductSever
/** 接口前缀-生产服务器*/
NSString *const KSERVERURLPREFIX = @"https://www.baidu.com";
#endif

/** 登录*/
NSString *const KAPILOGIN = @"";

