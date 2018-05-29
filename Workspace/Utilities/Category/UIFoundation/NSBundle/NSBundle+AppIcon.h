//
//  NSBundle+AppIcon.h
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSBundle (AppIcon)

@property (nonatomic, strong, readonly) NSString *appIconPath;

@property (nonatomic, strong, readonly) UIImage *appIcon;

@end
