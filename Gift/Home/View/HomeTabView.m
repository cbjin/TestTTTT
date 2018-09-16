
//
//  HomeTabView.m
//  Gift
//
//  Created by flrj on 2018/4/4.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "HomeTabView.h"
#import "BaseHeader.h"

@interface HomeTabView ()
@property (nonatomic, strong) UIButton *btnTabType;
@property (nonatomic, strong) UIView *viewB;
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation HomeTabView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    _array = [NSMutableArray array];
    [self createTabTypeWith:@[@"精选", @"送女友", @"送基友", @"送同事", @"送长辈"].mutableCopy];
    
}


- (void)setNum:(CGFloat )num {
    _num = num;
    NSInteger a = _num;
    for (UIButton *btn in _array) {
        UIButton *bbbtn = _array[a];
        if (btn == bbbtn) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    [UIView animateWithDuration:0.0 animations:^{
        _viewB.frame = CGRectMake(10 * (num + 1) + 60 * num, _btnTabType.frame.size.height, 60, self.frame.size.height - _btnTabType.frame.size.height);
        
    }];
    
}

- (void)createTabTypeWith:(NSMutableArray *)arr {
    UIScrollView *scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    scrollV.bounces = NO;
    
    scrollV.showsHorizontalScrollIndicator = NO;
    scrollV.contentSize = CGSizeMake(10 * (arr.count + 1) + 60 * arr.count, self.frame.size.height);
    [self addSubview:scrollV];
    for (int i = 0; i < arr.count; i++) {
        _btnTabType = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnTabType.frame = CGRectMake(10 * (i + 1) + 60 * i, 0, 60, self.frame.size.height - 2);
        [_btnTabType setTitle:arr[i] forState:UIControlStateNormal];
        if (i == 0) {
            [_btnTabType setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else {
            [_btnTabType setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        _btnTabType.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnTabType addTarget:self action:@selector(btnChangeType:) forControlEvents:UIControlEventTouchUpInside];
        _btnTabType.tag = i + 100;
        [scrollV addSubview:_btnTabType];
        [_array addObject:_btnTabType];
        
    }
    _viewB = [[UIView alloc] initWithFrame:CGRectMake(10, _btnTabType.frame.size.height, _btnTabType.frame.size.width, self.frame.size.height - _btnTabType.frame.size.height)];
    _viewB.backgroundColor = [UIColor redColor];
    [scrollV addSubview:_viewB];
}
- (void)btnChangeType:(UIButton *)btn {
    NSInteger tag = btn.tag - 100;
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    for (UIButton *btnA in _array) {
        if (btnA != btn) {
            [btnA setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
        }
    }
    self.myblock(@{@"name":btn.titleLabel.text, @"num":[NSString stringWithFormat:@"%ld",tag]});
    
    [UIView animateWithDuration:0.1 animations:^{
        _viewB.frame = CGRectMake(10 * (tag + 1) + 60 * tag, _btnTabType.frame.size.height, 60, self.frame.size.height - _btnTabType.frame.size.height);
        
    }];
}

- (void)layoutSubviews {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
