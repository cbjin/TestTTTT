//
//  HomeCollectionViewCell.m
//  Gift
//
//  Created by flrj on 2018/4/4.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "BaseHeader.h"

@interface HomeCollectionViewCell ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomeBannerView *banner;
@property (nonatomic, strong) MBProgressHUD *hud;

- (void)createSubViews;
@end

@implementation HomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    
    [self.contentView addSubview:self.tableView];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeaderData)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterData)];
    _banner = [[HomeBannerView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, 285)];
    _banner.myblock = ^(NSDictionary *dic) {
        NSLog(@"%@", dic[@"name"]);
    };
    
}

- (void)refreshHeaderData {
    [self.tableView.mj_header beginRefreshing];
    [self.tableView.mj_footer resetNoMoreData];
    [self showProgressHUD:@"加载中" view:self.contentView];
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf removeHud];
        [weakSelf.tableView.mj_header endRefreshing];
        
    });
}

- (void)showProgressHUD:(NSString *)message view:(UIView *)view {
    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    _hud.label.text = message;
    // 隐藏时候从父控件中移除
    _hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    _hud.mode = MBProgressHUDModeIndeterminate;
    [self.contentView addSubview:_hud];
}

- (void)removeHud {
    [_hud removeFromSuperview];
}

- (void)refreshFooterData {
    [self.tableView.mj_footer beginRefreshing];
    [self showProgressHUD:@"加载中" view:self.contentView];
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.tableView.mj_footer endRefreshing];
        [weakSelf removeHud];
        [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
    });
}

- (void)setRow:(NSInteger)row {
    _row = row;
    if (_row == 0) {
        _tableView.tableHeaderView = _banner;
    } else {
        _tableView.tableHeaderView = nil;
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"reuse"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}


@end
