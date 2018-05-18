//
//  ViewController.m
//  Workspace
//
//  Created by sanjia on 2018/4/28.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ViewController.h"
#import "ZRLoginRequest.h"

#import "ZRRefreshVC.h"
#import "ZREmptyDataVC.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    [ZRLoginRequest loginWithParameters:para responseCache:^(id cacheObject) {
//        DLog(@"cacheObject:%@", cacheObject);
//    } success:^(id responseObject) {
//        DLog(@"responseObject:%@", responseObject);
//    } failure:^(NSError *error) {
//        DLog(@"error:%@", error);
//    }];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
    self.navigationController.navigationBar.titleTextAttributes = nil;
    self.navigationController.navigationBar.barTintColor = ZRHex(0xf8f8f8);
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    self.array = @[@"Refresh", @"EmptyDataSet"];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[ZRRefreshVC new] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[ZREmptyDataVC new] animated:YES];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
