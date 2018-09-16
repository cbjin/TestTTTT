//
//  HotListViewController.m
//  Gift
//
//  Created by flrj on 2018/4/3.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "HotListViewController.h"
#import "BaseHeader.h"

@interface HotListViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) HotListTapMenuView *tapList;


@end

@implementation HotListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"礼物榜";
    _tapList = [[HotListTapMenuView alloc] initWithFrame:CGRectMake(0, NaviH, KScreenW, 50)];
    __weak typeof(self) weakSelf = self;
    _tapList.myblock = ^(NSDictionary *dic) {
        NSInteger num = [dic[@"num"] integerValue];
        [UIView animateWithDuration:0.1 animations:^{
            weakSelf.collectionView.contentOffset = CGPointMake(num * KScreenW, 0);
            
        }];
        NSLog(@"%@", dic[@"name"]);
    };
    [self.view addSubview:_tapList];
    
    [self.view addSubview:self.collectionView];
    
    // Do any additional setup after loading the view.
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.minimumLineSpacing = 0;
        flow.minimumInteritemSpacing = 0;
        flow.itemSize = CGSizeMake(KScreenW, KScreenH - NaviH - 50 - TabBarH - SafeAreaBottom);
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, NaviH + 50, KScreenW, KScreenH - NaviH - 50 - TabBarH - SafeAreaBottom) collectionViewLayout:flow];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.bounces = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = RGB(230, 230, 230);
        [_collectionView registerClass:[HotListCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
        
    }
    return _collectionView;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HotListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _collectionView) {
        CGFloat x = _collectionView.contentOffset.x;
        
        _tapList.num = x / KScreenW;
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
