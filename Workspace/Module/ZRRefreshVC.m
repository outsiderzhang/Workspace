//
//  ZRRefreshVC.m
//  Workspace
//
//  Created by sanjia on 2018/5/17.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRRefreshVC.h"
#import "UIScrollView+Refresh.h"
@interface ZRRefreshVC ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ZRRefreshVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = self.view.bounds.size;
    //__weak typeof(self) ws = self;
    //ZRWS(self)
    @weakify(self);
    [self.scrollView setRefreshWithHeaderBlock:^{
        NSLog(@"header 刷新");
        [weak_self requestNewData];
    } footerBlock:^{
        NSLog(@"footer 刷新");
        [weak_self requestMoreData];
    }];
    [self.view addSubview:self.scrollView];
}

- (void)requestNewData
{
    sleep(2);
    [self.scrollView endRefresh];
}

- (void)requestMoreData
{
    sleep(2);
    [self.scrollView footerNomoreData];
    [self.scrollView endRefresh];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
