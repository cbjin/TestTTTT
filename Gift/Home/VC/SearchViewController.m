//
//  SearchViewController.m
//  Gift
//
//  Created by flrj on 2018/4/3.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "SearchViewController.h"
#import "BaseHeader.h"

@interface SearchViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIButton *btnSearch;


@end

@implementation SearchViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 注册键盘通知
    // 即将显示
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    // 显示
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidShowNotification:) name:UIKeyboardDidShowNotification object:nil];
    // 即将隐藏
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardDidHideNotification object:nil];
    // 隐藏
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHideNotification:) name:UIKeyboardDidHideNotification object:nil];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // 接触键盘通知
    // 即将显示
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    // 显示
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    // 即将隐藏
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    // 隐藏
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}
- (void) keyboardWillShowNotification: (NSNotification *)notif{
    NSLog(@"键盘即将显示");
}
- (void) keyboardDidShowNotification: (NSNotification *)notif{
    NSLog(@"键盘显示");
}
- (void) keyboardWillHideNotification:(NSNotification *)notif{
    NSLog(@"键盘即将隐藏");
}
- (void) keyboardDidHideNotification:(NSNotification *)notif{
    NSLog(@"键盘隐藏");
}


- (void)btnBack:(UIBarButtonItem *)btn {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, NaviH - 44 + 5, KScreenW *0.8, 40)];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"请输入搜索内容";
        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    }
    return _searchBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.searchBar;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(btnBack:)];
    
    SearchHeaderView *header = [[SearchHeaderView alloc] initWithFrame:CGRectMake(0, NaviH + 20, KScreenW, 150)];
    __weak typeof(self) weakSelf = self;
    header.myBlock = ^(NSDictionary *dic) {
        NSLog(@"%@", dic);
        [weakSelf dismissViewControllerAnimated:NO completion:nil];
    };
    [self.view addSubview:header];
    
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchBar resignFirstResponder];
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
