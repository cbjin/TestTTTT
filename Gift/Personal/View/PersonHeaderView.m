//
//  PersonHeaderView.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/10.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "PersonHeaderView.h"
#import "BaseHeader.h"

@interface PersonHeaderView ()

@property (nonatomic, strong) UIImageView *imgUser;
@property (nonatomic, strong) UIButton *btnMenu;
@property (nonatomic, strong) UIButton *btnUp;
@property (nonatomic, strong) UIView   *viewMiddle;

@end

@implementation PersonHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    _imgUser = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    _imgUser.image = [UIImage imageNamed:@"123"];
    _imgUser.layer.masksToBounds = YES;
    _imgUser.layer.cornerRadius = 50;
    [self addSubview:_imgUser];
    NSArray *arrM = @[@"积分", @"关注", @"新消息"];
    for (int i = 0; i < arrM.count; i++) {
        _btnUp = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnUp.frame = CGRectMake(150 + i * (KScreenW - 160) / 3, 40, (KScreenW - 150) / 3, 60);
        
        [_btnUp setTitle:[NSString stringWithFormat:@"22222\n%@", arrM[i]] forState:UIControlStateNormal];
        [_btnUp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btnUp.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnUp addTarget:self action:@selector(btnUpp:) forControlEvents:UIControlEventTouchUpInside];
        _btnUp.titleLabel.numberOfLines = 2;
        _btnUp.titleLabel.textAlignment = 1;
        [self addSubview:_btnUp];
        if (i < arrM.count - 1) {
            _viewMiddle = [[UIView alloc] initWithFrame:CGRectMake(_btnUp.frame.size.width - 1, 20, 1, 20)];
            _viewMiddle.backgroundColor = RGB(220, 220, 220);
            [_btnUp addSubview:_viewMiddle];
            
        }
    }
    
    NSArray *arr = @[@"购物车", @"订单", @"礼券", @"送礼提醒"];
    for (int i = 0 ; i < arr.count; i++) {
        
        _btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnMenu.frame = CGRectMake(i * KScreenW / 4, 140, KScreenW / 4, KScreenW / 4);
        [_btnMenu setTitle:arr[i] forState:UIControlStateNormal];
        [_btnMenu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btnMenu setImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
        _btnMenu.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnMenu verticalImageAndTitle:10];
        [_btnMenu addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnMenu];
    }
}

- (void)btnUpp:(UIButton *)btn {
    NSLog(@"fff");
}

- (void)btn:(UIButton *)btn {
    self.myblock(@{@"name":@"张三"});
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
