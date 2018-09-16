//
//  ClassifySingleCollectionReusableView.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/13.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "ClassifySingleCollectionReusableView.h"
#import "BaseHeader.h"

@interface ClassifySingleCollectionReusableView ()

@property (nonatomic, strong) UIView *viewL;
@property (nonatomic, strong) UIView *viewR;

@property (nonatomic, strong) UILabel *labelTitle;

@end

@implementation ClassifySingleCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)setStr:(NSString *)str {
    _str = str;
    CGSize size = [_labelTitle labelWithStr:_str Size:CGSizeMake(MAXFLOAT, 30) font:[UIFont systemFontOfSize:HomeFont]];
    _labelTitle.frame = CGRectMake((CGRectGetWidth(self.frame) - size.width) / 2, 10, size.width, 30);
    _labelTitle.text = _str;
    _viewL.frame = CGRectMake(0, CGRectGetHeight(self.frame) / 2, (CGRectGetWidth(self.frame) - CGRectGetWidth(_labelTitle.frame)) / 2, 1);
    
    _viewR.frame = CGRectMake(CGRectGetWidth(_viewL.frame) + size.width, CGRectGetHeight(self.frame) / 2, CGRectGetWidth(_viewL.frame), 1);
}

- (void)createSubViews {
    
    _viewL = [[UIView alloc] init];
    _viewL.backgroundColor = RGB(230, 230, 230);
    [self addSubview:_viewL];
    
    _labelTitle = [[UILabel alloc] init];
    _labelTitle.textColor = [UIColor blackColor];
    _labelTitle.textAlignment = 1;
    _labelTitle.font = [UIFont systemFontOfSize:HomeFont];
    [self addSubview:_labelTitle];
    
    _viewR = [[UIView alloc] init];
    _viewR.backgroundColor = RGB(230, 230, 230);
    [self addSubview:_viewR];
    
}


@end
