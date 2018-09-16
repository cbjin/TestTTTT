//
//  ClassifyTipsSectionFCollectionViewCell.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/12.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "ClassifyTipsSectionFCollectionViewCell.h"
#import "BaseHeader.h"

@interface ClassifyTipsSectionFCollectionViewCell ()

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel     *labelTitle;
@property (nonatomic, strong) UILabel     *labelDes;


@end

@implementation ClassifyTipsSectionFCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) / 2, CGRectGetHeight(self.contentView.frame))];
    _img.image = [UIImage imageNamed:@"123"];
    [self.contentView addSubview:_img];
    
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_img.frame) + 5, 10, CGRectGetWidth(self.contentView.frame) / 2 - 10, CGRectGetHeight(_img.frame) / 2 - 10)];
    _labelTitle.text = @"不打烊的礼物店";
    _labelTitle.textColor = [UIColor blackColor];
    _labelTitle.textAlignment = 0;
    _labelTitle.font = [UIFont systemFontOfSize:HomeFont];
    [self.contentView addSubview:_labelTitle];
    
    _labelDes = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_img.frame) + 5, CGRectGetHeight(_img.frame) / 2, CGRectGetWidth(self.contentView.frame) / 2 - 10, CGRectGetHeight(_img.frame) / 2 - 10)];
    _labelDes.text = @"小礼君";
    _labelDes.textColor = RGB(150, 150, 150);
    _labelDes.textAlignment = 0;
    _labelDes.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_labelDes];
    
    
}


@end
