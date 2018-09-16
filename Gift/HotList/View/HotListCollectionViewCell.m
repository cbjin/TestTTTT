//
//  HotListCollectionViewCell.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/12.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "HotListCollectionViewCell.h"
#import "BaseHeader.h"

@interface HotListCollectionViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView   *imgHeader;

@end

@implementation HotListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    [self.contentView addSubview:self.collectionView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.minimumLineSpacing = 10;
        flow.minimumInteritemSpacing = 10;
        flow.itemSize = CGSizeMake((KScreenW - 30) / 2, 265);
        flow.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        flow.scrollDirection = UICollectionViewScrollDirectionVertical;
        flow.headerReferenceSize = CGSizeMake(KScreenW, 200);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, KScreenH - NaviH - 50 - TabBarH - SafeAreaBottom) collectionViewLayout:flow];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = RGB(230, 230, 230);
        [_collectionView registerClass:[HotListDetailCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:KCollectionHeader withReuseIdentifier:@"header"];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:KCollectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    if (!_imgHeader) {
        _imgHeader = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, 200)];
        _imgHeader.image = [UIImage imageNamed:@"123"];
        [header addSubview:_imgHeader];
    }
    
    return header;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HotListDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 5;
    
    return cell;
}



@end
