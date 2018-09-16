//
//  TipsView.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/12.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "TipsView.h"
#import "BaseHeader.h"

@interface TipsView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel     *labelType;
@property (nonatomic, strong) UIButton    *btnMore;

@end

@implementation TipsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    [self addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, CGRectGetHeight(self.frame)) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        NSArray *arr = @[@"reuse1", @"reuse2", @"reuse2", @"reuse2"];
        for (NSString *str in arr) {
            [_tableView registerClass:[ClassifyTipsTableViewCell class] forCellReuseIdentifier:str];
            
        }
        
        [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
        
        
    }
    return _tableView;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *viewHeader = [[UITableViewHeaderFooterView alloc] init];
    viewHeader.contentView.backgroundColor = [UIColor whiteColor];
    _labelType = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, KScreenW / 2 - 10, 20)];
    _labelType.text = @"栏目";
    _labelType.textColor = [UIColor blackColor];
    _labelType.textAlignment = 0;
    _labelType.font = [UIFont systemFontOfSize:15];
    [viewHeader addSubview:self.labelType];
    
    _btnMore = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnMore.frame = CGRectMake(KScreenW - 90, 10, 80, 20);
    [_btnMore setTitle:@"查看全部" forState:UIControlStateNormal];
    [_btnMore setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btnMore.titleLabel.font = [UIFont systemFontOfSize:15];
    [_btnMore addTarget:self action:@selector(btnMore:) forControlEvents:UIControlEventTouchUpInside];
    [viewHeader addSubview:self.btnMore];
    
    return viewHeader;
}

- (void)btnMore:(UIButton *)btn {
    NSLog(@"查看更多");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 280;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *arr = @[@"reuse1", @"reuse2", @"reuse2", @"reuse2"];
    ClassifyTipsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:arr[indexPath.section]];
    cell.row = indexPath.section;
    
    return cell;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
