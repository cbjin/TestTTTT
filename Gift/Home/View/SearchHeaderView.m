//
//  SearchHeaderView.m
//  Gift
//
//  Created by flrj on 2018/4/3.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "SearchHeaderView.h"
#import "BaseHeader.h"

@interface SearchHeaderView ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation SearchHeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((KScreenW - 50 * 5) / 6, 0, 100, 30)];
    label.text = @"浏览记录";
    label.textAlignment = 0;
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor blackColor];
    [self addSubview:label];
    NSMutableArray *arr = @[@"生日", @"粉色", @"情侣", @"杯子", @"手机壳", @"手表", @"手链", @"项链"].mutableCopy;
    [self createBtnsWithArray:arr];
}

- (void)createBtnsWithArray:(NSMutableArray *)array {
    NSInteger allline = array.count / 5;
    if ((array.count % 5) != 0) {
        allline = allline + 1;
    }
    for (int i = 0;i < array.count ; i++) {
        CGFloat btnW = 50;
        CGFloat btnH = 30;
        NSInteger hang = i % 5;
        NSInteger zong = i / 5;
        CGFloat btnHang = (KScreenW - 50 * 5) / 6;
        CGFloat btnZong = (self.bounds.size.height - 50 * allline) / (allline + 1);
        _btn  = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(btnHang * (hang + 1) + btnW * hang, btnZong * (zong + 1) + btnH * zong + 40, btnW, btnH);
        
        _btn.backgroundColor = RGB(245, 245, 245);
        [_btn setTitle:array[i] forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if (i < 3) {
            [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        _btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn];
    }
}

- (void)btn:(UIButton *)btn {
    NSMutableDictionary *dic = @{@"name":@"张三", @"age":@"14"}.mutableCopy;
    _myBlock(dic);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
