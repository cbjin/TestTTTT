//
//  HomeBannerView.m
//  Gift
//
//  Created by flrj on 2018/4/4.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "HomeBannerView.h"
#import "BaseHeader.h"

@interface HomeBannerView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *bannerView;
@property (nonatomic, strong) UIButton *btnMenu;

- (void)createSubViews;
@end

@implementation HomeBannerView

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
        [_btnMenu verticalImageAndTitle:10];
        [_btnMenu addTarget:self action:@selector(btnMenu:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnMenu];
    }
}

- (void)btnMenu:(UIButton *)btn {
    
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
    self.myblock(@{@"name":@"123"});
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
