//
//  ClassifyViewController.m
//  Gift
//
//  Created by flrj on 2018/4/3.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "ClassifyViewController.h"
#import "BaseHeader.h"

@interface ClassifyViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) TipsView     *tipsV;
@property (nonatomic, strong) SingleView   *singleV;
@property (nonatomic, strong) UISearchBar  *searchBar;
@property (nonatomic, strong) UIButton     *btnSearch;
@property (nonatomic, strong) ClassifyHeaderView *classifyHV;

@end

@implementation ClassifyViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.classifyHV;
    [self.view addSubview:self.btnSearch];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.tipsV];
    [self.scrollView addSubview:self.singleV];
    
    // Do any additional setup after loading the view.
}

- (ClassifyHeaderView *)classifyHV {
    if (!_classifyHV) {
        _classifyHV = [[ClassifyHeaderView alloc] initWithFrame:CGRectMake(0, 0, 120, 44)];
        __weak typeof(self) weakSelf = self;
        _classifyHV.myblock = ^(NSDictionary *dic) {
            NSInteger num = [dic[@"num"] integerValue];
            [UIView animateWithDuration:0.1 animations:^{
                weakSelf.scrollView.contentOffset = CGPointMake(num * KScreenW, 0);
            }];
        };
        
    }
    return _classifyHV;
    
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, NaviH + 10, KScreenW - 20, 30)];
        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
        _searchBar.barStyle = 0;
        UITextField *searchField = [_searchBar valueForKey:@"_searchField"];
        if (searchField) {
            [searchField setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
            [searchField setValue:RGB(230, 230, 230) forKeyPath:@"_placeholderLabel.textColor"];
            
        }
        _searchBar.placeholder = @"选份走心好礼送给Ta";
    }
    return _searchBar;
}

- (UIButton *)btnSearch {
    if (!_btnSearch) {
        _btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnSearch.frame = CGRectMake(10, NaviH + 10, KScreenW - 20, 30);
        _btnSearch.layer.cornerRadius = 10;
        _btnSearch.backgroundColor = RGB(240, 240, 240);
        [_btnSearch setTitle:@"🔍 选份走心好礼送给Ta" forState:UIControlStateNormal];
        [_btnSearch setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btnSearch.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnSearch addTarget:self action:@selector(btnSearch:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnSearch;
}

- (void)btnSearch:(UIButton *)btn {
    SearchViewController *search = [[SearchViewController alloc] init];
    BaseNaviController *navi = [[BaseNaviController alloc] initWithRootViewController:search];
    [self presentViewController:navi animated:NO completion:nil];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchBar resignFirstResponder];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, NaviH + 50, KScreenW, KScreenH - NaviH - 50 - TabBarH - SafeAreaBottom)];
        _scrollView.contentSize = CGSizeMake(KScreenW * 2, CGRectGetHeight(_scrollView.frame));
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

- (TipsView *)tipsV {
    if (!_tipsV) {
        _tipsV = [[TipsView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, CGRectGetHeight(_scrollView.frame))];
        _tipsV.backgroundColor = [UIColor redColor];
    }
    return _tipsV;
}

- (SingleView *)singleV {
    if (!_singleV) {
        _singleV = [[SingleView alloc] initWithFrame:CGRectMake(KScreenW, 0, KScreenW, CGRectGetHeight(_scrollView.frame))];
        _singleV.backgroundColor = [UIColor brownColor];
    }
    return _singleV;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _scrollView) {
        CGFloat x = _scrollView.contentOffset.x;
        
        _classifyHV.num = x / KScreenW;
    }
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
