//
//  HotListDetailCollectionViewCell.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/12.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "HotListDetailCollectionViewCell.h"
#import "BaseHeader.h"

@interface HotListDetailCollectionViewCell ()

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelMoney;

@end

@implementation HotListDetailCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetWidth(self.contentView.frame))];
    _img.image = [UIImage imageNamed:@"123"];
    [self.contentView addSubview:_img];
    
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetHeight(_img.frame) + 10, CGRectGetWidth(_img.frame) - 20, 40)];
    _labelTitle.text = @"OSEWAYA | 宇宙土星双层项链";
    _labelTitle.textColor = [UIColor blackColor];
    _labelTitle.textAlignment = 0;
    _labelTitle.font = [UIFont systemFontOfSize:15];
    _labelTitle.numberOfLines = 2;
    [self.contentView addSubview:_labelTitle];
    
    _labelMoney = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetHeight(_labelTitle.frame) + CGRectGetHeight(_img.frame) + 20, CGRectGetWidth(_labelTitle.frame), 20)];
    _labelMoney.text = @"¥ 118";
    _labelMoney.textColor = [UIColor redColor];
    _labelMoney.textAlignment = 0;
    _labelMoney.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_labelMoney];
}



@end
