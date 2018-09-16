//
//  ClassifyTipsTableViewCell.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/12.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "ClassifyTipsTableViewCell.h"
#import "BaseHeader.h"

@interface ClassifyTipsTableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flow;

@end

@implementation ClassifyTipsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)setRow:(NSInteger)row {
    _row = row;
    if (_row == 0) {
        _flow.itemSize = CGSizeMake(KScreenW / 3 * 2, 80);
        _flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        _flow.footerReferenceSize = CGSizeMake(KScreenW, 60);
    } else {
        _flow.itemSize = CGSizeMake((KScreenW - 30) / 2, 80);
        _flow.scrollDirection = UICollectionViewScrollDirectionVertical;
//        _flow.footerReferenceSize = CGSizeZero;
    }
//    [_collectionView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _collectionView) {
        
    }
}

- (void)createSubViews {
    [self.contentView addSubview:self.collectionView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _flow = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, 280) collectionViewLayout:_flow];
        _flow.minimumLineSpacing = 10;
        _flow.minimumInteritemSpacing = 10;
        _flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flow.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _flow.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView.delegate = self;
        _collectionView.bounces = NO;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[ClassifyTipsSectionFCollectionViewCell class] forCellWithReuseIdentifier:@"reuseF"];
        [_collectionView registerClass:[ClassifyTipsOtherCollectionViewCell class] forCellWithReuseIdentifier:@"reuseS"];
//        [_collectionView registerClass:[ClassifyTipsCollectionReusableView class] forSupplementaryViewOfKind:KCollectionFooter withReuseIdentifier:@"footer"];
        
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _row == 0 ? 10 : 6;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    ClassifyTipsCollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:KCollectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
//
//    return footer;
//}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ClassifyTipsSectionFCollectionViewCell *cellF = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseF" forIndexPath:indexPath];
    ClassifyTipsOtherCollectionViewCell *cellS = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseS" forIndexPath:indexPath];
    cellF.backgroundColor = [UIColor whiteColor];
    
    cellS.backgroundColor = (indexPath.row % 2 == 0) ? [UIColor redColor] : [UIColor yellowColor];
    
    return (_row == 0) ? cellF : cellS;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
