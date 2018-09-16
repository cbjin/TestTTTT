//
//  ClassifyTipsCollectionReusableView.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/12.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "ClassifyTipsCollectionReusableView.h"
#import "BaseHeader.h"

@interface ClassifyTipsCollectionReusableView ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ClassifyTipsCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}


- (void)createSubViews {
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(10, 10, KScreenW / 3 * 2, 40);
    [_btn setTitle:@"点击查看更多" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _btn.titleLabel.font = [UIFont systemFontOfSize:HomeFont];
    _btn.layer.masksToBounds = YES;
    _btn.layer.borderColor = [[UIColor redColor] CGColor];
    _btn.layer.borderWidth = 1;
    _btn.layer.cornerRadius = 5;
    [_btn addTarget:self action:@selector(btnMore:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btn];
}

- (void)btnMore:(UIButton *)btn {
    NSLog(@"点击查看更多");
}

@end
