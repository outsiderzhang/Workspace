//
//  ZRegisterVC.m
//  Workspace
//
//  Created by sanjia on 2018/5/28.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ZRRegisterVC.h"
#import "ZRLoginTf.h"
#import "ZRLaunchManager.h"
@interface ZRRegisterVC ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ZRRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"注册";
    
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self addKeyboardNoti];
    
    [self initSubView];
}

#pragma mark -- 注册
- (void)registerMethod
{
    [ZRLaunchManager manager].isLogin = YES;
    [[ZRLaunchManager manager] login];
}

#pragma mark -- 初始化界面
- (void)initSubView
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod:)];
    [self.scrollView addGestureRecognizer:tap];
    
    ZRLoginTf *phene = [[ZRLoginTf alloc] initWithType:ZRLoginPhoneTf];
    phene.frame = CGRectMake(15, 147, UI_SCREEN_WIDTH - 30, 60);
    [self.scrollView addSubview:phene];
    
    ZRLoginTf *code = [[ZRLoginTf alloc] initWithType:ZRLoginCodeTf];
    code.frame = CGRectMake(15, 207, UI_SCREEN_WIDTH - 30, 60);
    [self.scrollView addSubview:code];
    
    ZRLoginTf *club = [[ZRLoginTf alloc] initWithType:ZRLoginClubTf];
    club.frame = CGRectMake(15, 267, UI_SCREEN_WIDTH - 30, 60);
    [self.scrollView addSubview:club];
    
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 390, UI_SCREEN_WIDTH - 30, 44)];
    registerBtn.backgroundColor = kThemeColor;
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerMethod) forControlEvents:UIControlEventTouchUpInside];
    ZRRadius(registerBtn, 22);
    [self.scrollView addSubview:registerBtn];
}

#pragma mark -- scrollView点击手势移除键盘
- (void)tapMethod:(UITapGestureRecognizer *)gesture
{
    [self.view endEditing:YES];
}

#pragma mark -- 添加键盘弹出/收起观察者
- (void)addKeyboardNoti
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShowNoti:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHideNoti:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
}

 #pragma mark -- 键盘弹出通知
- (void)keyboardWillShowNoti:(NSNotification *)noti
{
    //获取键盘弹出或收回时frame
    CGRect keyboardFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //获取键盘弹出所需时长
    float duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    //添加弹出动画
    [UIView animateWithDuration:duration animations:^{
        self.scrollView.frame = CGRectMake(0, 0, self.view.width, keyboardFrame.origin.y - UI_STATUSBAR - UI_NAVBAR);
        NSLog(@"%f", self.scrollView.frame.size.height);
        self.scrollView.contentSize = CGSizeMake(UI_SCREEN_WIDTH, self.scrollView.height < 450 ? 450 : self.scrollView.height + UI_1PX);
        [self.scrollView scrollToBottomWithAnimation:YES];
    }];
    
}

#pragma mark -- 键盘收起通知
- (void)keyboardWillHideNoti:(NSNotification *)noti
{
    //获取键盘弹出所需时长
    float duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    //添加弹出动画
    [UIView animateWithDuration:duration animations:^{
        
        self.scrollView.frame = self.view.bounds;
        self.scrollView.contentSize = CGSizeMake(UI_SCREEN_WIDTH, UI_SCREEN_HEIGTH + UI_1PX - UI_STATUSBAR - UI_NAVBAR);
        [self.scrollView scrollToTopWithAnimation:YES];
    }];
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        scrollView.contentSize = CGSizeMake(UI_SCREEN_WIDTH, UI_SCREEN_HEIGTH + UI_1PX - UI_STATUSBAR - UI_NAVBAR);
        scrollView.delegate = self;
        [self.view addSubview:scrollView];
        
        _scrollView = scrollView;
    }
    return _scrollView;
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
