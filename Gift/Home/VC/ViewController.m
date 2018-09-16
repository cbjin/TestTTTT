//
//  ViewController.m
//  Gift
//
//  Created by flrj on 2018/4/3.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "ViewController.h"
#import "BaseHeader.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIButton *btnTabType;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) HomeTabView *htabV;

@end

@implementation ViewController



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%f\n%f", KScreenW, KScreenH);
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"扫一扫"] style:UIBarButtonItemStylePlain target:self action:@selector(sao:)];
    [self createNaviView];
    
    _htabV = [[HomeTabView alloc] initWithFrame:CGRectMake(0, NaviH, KScreenW, 50)];
    __weak typeof(self) weakSelf = self;
    _htabV.myblock = ^(NSDictionary *dic) {
        NSInteger num = [dic[@"num"] integerValue];
        weakSelf.collectionView.contentOffset = CGPointMake(num * KScreenW, 0);
        NSLog(@"%@", dic[@"name"]);
    };
    
    [self.view addSubview:_htabV];
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)createNaviView {
    UIView *viewH = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenW * 0.8, 44)];
    UILabel *labelNaviT = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, viewH.frame.size.width * 0.3, 44)];
    labelNaviT.textAlignment = 1;
    labelNaviT.text = @"礼物说";
    labelNaviT.textColor = [UIColor redColor];
    labelNaviT.font = [UIFont fontWithName:@"RosewoodStd-Regular" size:15];
    [viewH addSubview:labelNaviT];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(labelNaviT.frame.size.width, 7, viewH.frame.size.width * 0.7, 30);
    btn.layer.cornerRadius = 10;
    btn.backgroundColor = RGB(240, 240, 240);
    [btn setTitle:@"🔍 选份走心好礼送给Ta" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(btnSearch:) forControlEvents:UIControlEventTouchUpInside];
    [viewH addSubview:btn];
    self.navigationItem.titleView = viewH;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.minimumLineSpacing = 0;
        flow.minimumInteritemSpacing = 0;
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flow.itemSize = CGSizeMake(KScreenW, KScreenH - NaviH - 50 - TabBarH - SafeAreaBottom);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, NaviH + 50, KScreenW, KScreenH - NaviH - 30 - TabBarH - SafeAreaBottom) collectionViewLayout:flow];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.bounces = NO;
        [_collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
        _collectionView.pagingEnabled = YES;
    }
    return _collectionView;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    cell.row = indexPath.row;
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _collectionView) {
        CGFloat x = _collectionView.contentOffset.x;
        
        _htabV.num = x / KScreenW;
    }
}

- (void)sao:(UIBarButtonItem *)barButtonItem {
    
    
}

- (void)btnSearch:(UIButton *)btn {
    
    SearchViewController *search = [[SearchViewController alloc] init];
    BaseNaviController *navi = [[BaseNaviController alloc] initWithRootViewController:search];
    [self presentViewController:navi animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
