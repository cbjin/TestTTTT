//
//  HomeCollectionReusableView.m
//  Gift
//
//  Created by flrj on 2018/4/4.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "HomeCollectionReusableView.h"
#import "BaseHeader.h"

@interface HomeCollectionReusableView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *bannerView;
@property (nonatomic, strong) UIButton *btnMenu;

@end

@implementation HomeCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    self.backgroundColor = RGB(245, 245, 245);
    _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenW, self.frame.size.height - 85) imageNamesGroup:@[@"123", @"123", @"123", @"123"]];
    _bannerView.autoScrollTimeInterval = 2;
    _bannerView.showPageControl = YES;
    [self addSubview:_bannerView];
    NSArray *arr = @[@"百元礼物", @"创意礼物", @"美味礼物"];
    for (int i = 0; i < 3; i++) {
        
        _btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnMenu.frame = CGRectMake(KScreenW / 3 * i, _bannerView.frame.size.height + 20, KScreenW / 3, 50);
        //        _btnMenu.backgroundColor = [UIColor greenColor];
        [_btnMenu setImage:[UIImage imageNamed:@"discover"] forState:UIControlStateNormal];
        [_btnMenu setTitle:arr[i] forState:UIControlStateNormal];
        [_btnMenu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btnMenu.titleLabel.font = [UIFont systemFontOfSize:12];
        [_btnMenu setTitleEdgeInsets:UIEdgeInsetsMake(_btnMenu.imageView.frame.size.height ,-_btnMenu.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        [_btnMenu setImageEdgeInsets:UIEdgeInsetsMake(-30.0, 0.0,0.0, -_btnMenu.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
        _btnMenu.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        
        [_btnMenu addTarget:self action:@selector(btnMenu:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnMenu];
    }
}

- (void)btnMenu:(UIButton *)btn {
    
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
    self.myblock(@{@"name":@"123"});
    
}

@end
