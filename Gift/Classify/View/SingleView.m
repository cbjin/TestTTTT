//
//  SingleView.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/12.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "SingleView.h"
#import "BaseHeader.h"

@interface SingleView ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UITableView *tableLeftView;

@property (nonatomic, strong) UICollectionViewFlowLayout *flow;
@property (nonatomic, strong) UICollectionView *collectionRightView;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSMutableArray *arrayData;
@property (nonatomic, assign) BOOL isScrollDown;

@end

#define KTableView @"reuseTable"
#define KCollectionView @"reuseCollection"

@implementation SingleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    _arrayData = @[@"热门分类", @"个性配饰", @"温暖家居", @"美味厨房", @"美味礼物", @"数码小物", @"创意文具", @"美容护肤", @"精致彩妆", @"运动户外", @"身体保健", @"女装", @"箱包", @"女鞋", @"男装", @"男鞋", @"母婴"].mutableCopy;
    _array = [NSMutableArray array];
    for (int i = 0; i < _arrayData.count; i++) {
        if (i == 0) {
            [_array addObject:@"1"];
        } else {
            [_array addObject:@"0"];
        }
    }
    [self addSubview:self.tableLeftView];
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.minimumLineSpacing = 0;
    flow.minimumInteritemSpacing = 0;
    flow.sectionHeadersPinToVisibleBounds = NO;
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow.itemSize = CGSizeMake(KScreenW / 4, KScreenW / 4);
    flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _collectionRightView = [[UICollectionView alloc] initWithFrame:CGRectMake(KScreenW / 4, 0, KScreenW / 4 * 3, CGRectGetHeight(self.frame)) collectionViewLayout:flow];
    _collectionRightView.bounces = NO;
    _collectionRightView.delegate = self;
    _collectionRightView.dataSource = self;
    [self addSubview:_collectionRightView];
    _collectionRightView.backgroundColor = [UIColor whiteColor];
    [_collectionRightView registerClass:[ClassifySingleCollectionViewCell class] forCellWithReuseIdentifier:KCollectionView];
    [_collectionRightView registerClass:[ClassifySingleCollectionReusableView class] forSupplementaryViewOfKind:KCollectionHeader withReuseIdentifier:@"collH"];
    
    [_tableLeftView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    UITableViewCell *cell = [_tableLeftView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.textLabel.textColor = [UIColor redColor];
}

- (UITableView *)tableLeftView {
    if (!_tableLeftView) {
        _tableLeftView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenW / 4, CGRectGetHeight(self.frame)) style:UITableViewStylePlain];
        _tableLeftView.delegate = self;
        _tableLeftView.dataSource = self;
        _tableLeftView.bounces = NO;
        _tableLeftView.estimatedRowHeight = 0;
        _tableLeftView.estimatedSectionFooterHeight = 0;
        _tableLeftView.estimatedSectionHeaderHeight = 0;
        _tableLeftView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableLeftView registerClass:[UITableViewCell class] forCellReuseIdentifier:KTableView];
        
    }
    return _tableLeftView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KTableView];
    cell.backgroundColor = RGB(235, 235, 235);
//    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    UIView *view = [[UIView alloc] initWithFrame:cell.frame];
    view.backgroundColor = [UIColor whiteColor];
    cell.selectedBackgroundView = view;
    UIView *viewL = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 50)];
    viewL.backgroundColor = [UIColor redColor];
    [view addSubview:viewL];
    
    cell.textLabel.textAlignment = 1;
    cell.textLabel.font = [UIFont systemFontOfSize:HomeFont];
    cell.textLabel.text = _arrayData[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_tableLeftView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor redColor];
    [self scrollToTopOfSection:indexPath.row animated:YES];
    
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blackColor];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _arrayData.count;
}

// CollectionView分区标题即将展示
- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    // 当前CollectionView滚动的方向向上，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (!_isScrollDown && (collectionView.dragging || collectionView.decelerating))
    {
        UITableViewCell *cell = [_tableLeftView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0]];
        cell.textLabel.textColor = [UIColor redColor];
        [self selectRowAtIndexPath:indexPath.section];
    }
}

- (void)changeSelectedTableCellTextColor:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableLeftView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor redColor];
}

// CollectionView分区标题展示结束
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(nonnull UICollectionReusableView *)view forElementOfKind:(nonnull NSString *)elementKind atIndexPath:(nonnull NSIndexPath *)indexPath
{
    // 当前CollectionView滚动的方向向下，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (_isScrollDown && (collectionView.dragging || collectionView.decelerating))
    {
        UITableViewCell *cell = [_tableLeftView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section + 1 inSection:0]];
        cell.textLabel.textColor = [UIColor redColor];
        [self selectRowAtIndexPath:indexPath.section + 1];
    }
}


// 当拖动CollectionView的时候，处理TableView
- (void)selectRowAtIndexPath:(NSInteger)index
{
    [self.tableLeftView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

#pragma mark - 解决点击 TableView 后 CollectionView 的 Header 遮挡问题

- (void)scrollToTopOfSection:(NSInteger)section animated:(BOOL)animated
{
    CGRect headerRect = [self frameForHeaderForSection:section];
    CGPoint topOfHeader = CGPointMake(0, headerRect.origin.y - _collectionRightView.contentInset.top);
    [self.collectionRightView setContentOffset:topOfHeader animated:animated];
}

- (CGRect)frameForHeaderForSection:(NSInteger)section
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
    UICollectionViewLayoutAttributes *attributes = [self.collectionRightView.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
    return attributes.frame;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(KScreenW / 4 * 3, 50);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    ClassifySingleCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:KCollectionHeader withReuseIdentifier:@"collH" forIndexPath:indexPath];
    header.str = _arrayData[indexPath.section];
    return header;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ClassifySingleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KCollectionView forIndexPath:indexPath];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", indexPath.row);
}

#pragma mark - UIScrollView Delegate
// 标记一下CollectionView的滚动方向，是向上还是向下
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static float lastOffsetY = 0;
    
    if (self.collectionRightView == scrollView)
    {
        _isScrollDown = lastOffsetY < scrollView.contentOffset.y;
        lastOffsetY = scrollView.contentOffset.y;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
