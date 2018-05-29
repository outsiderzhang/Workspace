//
//  UICollectionViewCell+Extensions.m
//  Education_IM
//
//  Created by sanjia on 2018/1/10.
//  Copyright © 2018年 sanjia. All rights reserved.
//

#import "UICollectionViewCell+Extensions.h"

@implementation UICollectionViewCell (Extensions)
- (void)setSelectedBackgrounColor:(UIColor *)selectedBackgrounColor
{
    if (selectedBackgrounColor) {
        UIView *selectedBGView = [[UIView alloc] init];
        [selectedBGView setBackgroundColor:selectedBackgrounColor];
        [self setSelectedBackgroundView:selectedBGView];
    }
    else {
        [self setSelectedBackgroundView:nil];
    }
}
- (UIColor *)selectedBackgrounColor
{
    return self.selectedBackgroundView.backgroundColor;
}

@end
