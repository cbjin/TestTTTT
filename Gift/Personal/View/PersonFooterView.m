//
//  PersonFooterView.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/11.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "PersonFooterView.h"
#import "BaseHeader.h"

@interface PersonFooterView ()

@property (nonatomic, strong) UIButton *btnAdd;
@property (nonatomic, strong) UILabel  *label;

@end

@implementation PersonFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    _btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnAdd.frame = CGRectMake(10, 10, CGRectGetHeight(self.frame) - 20, CGRectGetHeight(self.frame) - 20);
    [_btnAdd setImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
    [_btnAdd addTarget:self action:@selector(btnAdd:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btnAdd];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_btnAdd.frame) + 20, 10, KScreenW / 2, CGRectGetHeight(_btnAdd.frame))];
    _label.text = @"新建礼物清单";
    _label.textColor = [UIColor blackColor];
    _label.textAlignment = 0;
    _label.font = [UIFont systemFontOfSize:15];
    [self addSubview:_label];
    
}

- (void)btnAdd:(UIButton *)btn {
    NSLog(@"添加");
    if (_myblock) {
        self.myblock(1);
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
