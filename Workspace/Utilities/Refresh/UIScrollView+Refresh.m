//
//  UIScrollView+Refresh.m
//  Workspace
//
//  Created by sanjia on 2018/5/17.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "UIScrollView+Refresh.h"
#import <MJRefresh/MJRefresh.h>
@implementation UIScrollView (Refresh)

/**
 添加刷新事件

 @param headerBlock 头部刷新
 @param footerBlock 底部刷新
 */
- (void)setRefreshWithHeaderBlock:(void(^)(void))headerBlock footerBlock:(void(^)(void))footerBlock
{
    if (headerBlock) {
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            headerBlock();
        }];
        header.stateLabel.font = [UIFont systemFontOfSize:13];
        header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:13];
        self.mj_header = header;
    }
    
    if (footerBlock) {
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            footerBlock();
        }];
        footer.stateLabel.font = [UIFont systemFontOfSize:13];
        [footer setTitle:@"暂无更多数据" forState:MJRefreshStateNoMoreData];
        [footer setTitle:@"" forState:MJRefreshStateIdle];
        self.mj_footer.ignoredScrollViewContentInsetBottom = 44;
        self.mj_footer = footer;
    }
}

#pragma mark -- 开启头部刷新
- (void)headerBeginRefreshing
{
    [self.mj_header beginRefreshing];
}

#pragma mark -- 没有更多数据
- (void)footerNomoreData
{
    [self.mj_footer setState:MJRefreshStateNoMoreData];
}

#pragma mark -- 结束刷新
- (void)endRefresh
{
    if (self.mj_header) {
        [self.mj_header endRefreshing];
    }
    if (self.mj_footer) {
        [self.mj_footer endRefreshing];
    }
}
@end
