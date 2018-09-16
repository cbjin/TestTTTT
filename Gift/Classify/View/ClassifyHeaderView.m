//
//  HotListTapMenuView.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/12.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "ClassifyHeaderView.h"
#import "BaseHeader.h"

@interface ClassifyHeaderView ()

@property (nonatomic, strong) UIButton *btnTabType;
@property (nonatomic, strong) UIView *viewB;
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation ClassifyHeaderView


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
    [self createTabTypeWith:@[@"攻略", @"单品"].mutableCopy];
    
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
    [self setAnimateForBottomView:num];
    
}

- (void)createTabTypeWith:(NSMutableArray *)arr {
    
    for (int i = 0; i < arr.count; i++) {
        _btnTabType = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnTabType.frame = CGRectMake(60 * i, 0, 60, CGRectGetHeight(self.frame) - 3);
        [_btnTabType setTitle:arr[i] forState:UIControlStateNormal];
        if (i == 0) {
            [_btnTabType setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else {
            [_btnTabType setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        _btnTabType.titleLabel.font = [UIFont systemFontOfSize:HomeFont];
        [_btnTabType addTarget:self action:@selector(btnChangeType:) forControlEvents:UIControlEventTouchUpInside];
        _btnTabType.tag = i + 300;
        [self addSubview:_btnTabType];
        [_array addObject:_btnTabType];
        
    }
    _viewB = [[UIView alloc] initWithFrame:CGRectMake(5, CGRectGetHeight(_btnTabType.frame), CGRectGetWidth(_btnTabType.frame) - 10, 3)];
    _viewB.backgroundColor = [UIColor redColor];
    [self addSubview:_viewB];
}
- (void)btnChangeType:(UIButton *)btn {
    NSInteger tag = btn.tag - 300;
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    for (UIButton *btnA in _array) {
        if (btnA != btn) {
            [btnA setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
        }
    }
    self.myblock(@{@"name":btn.titleLabel.text, @"num":[NSString stringWithFormat:@"%ld",tag]});
    [self setAnimateForBottomView:tag];
    
}

- (void)setAnimateForBottomView:(CGFloat )tag {
    [UIView animateWithDuration:0.1 animations:^{
        _viewB.frame = CGRectMake(5 + CGRectGetWidth(_btnTabType.frame) * tag, CGRectGetHeight(_btnTabType.frame), CGRectGetWidth(_btnTabType.frame) - 10, 3);
        
    }];
}




/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
