//
//  PersonalViewController.m
//  Gift
//
//  Created by flrj on 2018/4/3.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "PersonalViewController.h"
#import "BaseHeader.h"

@interface PersonalViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSString *type;

@property (nonatomic, strong) PersonFooterView *footer;
@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, strong) NSMutableArray   *arrayData;

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _type = @"单品";
    _arrayData = @[@"", @""].mutableCopy;
    self.navigationItem.title = @"礼物说";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(settings:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"注销"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(logout:)];
    [self.view addSubview:self.tableView];
    PersonHeaderView *person = [[PersonHeaderView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, KScreenW / 4 + 140)];
    __weak typeof(self) weakSelf = self;
    person.myblock = ^(NSDictionary *dic) {
        NSLog(@"%@", dic[@"name"]);
    };
    _footer = [[PersonFooterView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, 60)];
    _footer.myblock = ^(NSInteger aaa) {
        [weakSelf.arrayData addObject:@""];
        [weakSelf.tableView reloadData];
        
    };
    self.tableView.tableHeaderView = person;
    self.tableView.tableFooterView = _footer;
    // Do any additional setup after loading the view.
}

- (void)settings:(UIBarButtonItem *)barbutton {
    NSLog(@"settings");
}

- (void)logout:(UIBarButtonItem *)barbutton {
    NSLog(@"登出");
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"isLogin"];
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.window.rootViewController = [BaseTabBarController new];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NaviH, KScreenW, KScreenH - NaviH - SafeAreaBottom - TabBarH) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        [_tableView registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:@"reuse"];
        [_tableView registerClass:[PersonSecTableViewCell class] forCellReuseIdentifier:@"reusesec"];
        [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
        
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_type isEqualToString:@"单品"] ? _arrayData.count : 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [_type isEqualToString:@"单品"] ? 200 : 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *viewHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (!_segment) {
        _segment = [[UISegmentedControl alloc] initWithItems:@[@"单品", @"攻略"]];
        _segment.frame = CGRectMake(KScreenW / 3, 10, KScreenW / 3, 30);
        _segment.selectedSegmentIndex = 0;
        _segment.tintColor = [UIColor redColor];
        [_segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
        [viewHeader addSubview:_segment];
        
    }
    
    return viewHeader;
}

- (void)change:(UISegmentedControl *)segment {
    _type = [segment titleForSegmentAtIndex:segment.selectedSegmentIndex];
    [_tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    PersonSecTableViewCell *cellSec = [tableView dequeueReusableCellWithIdentifier:@"reusesec"];
    _tableView.tableFooterView = [_type isEqualToString:@"单品"] ? _footer : nil;
    return [_type isEqualToString:@"单品"] ? cell : cellSec;
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
