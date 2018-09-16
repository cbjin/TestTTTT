//
//  ClassifyTipsOtherCollectionViewCell.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/12.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "ClassifyTipsOtherCollectionViewCell.h"
#import "BaseHeader.h"

@interface ClassifyTipsOtherCollectionViewCell ()

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel     *label;
@property (nonatomic, strong) UILabel     *labelDes;

@end

@implementation ClassifyTipsOtherCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame))];
    _img.image = [UIImage imageNamed:@"123"];
    [self.contentView addSubview:_img];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(_img.frame) - 20, CGRectGetHeight(_img.frame) / 2 - 10)];
    _label.text = @"礼物";
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = 0;
    _label.font = [UIFont systemFontOfSize:HomeFont];
    [self.contentView addSubview:_label];
    
    _labelDes = [[UILabel alloc] initWithFrame:CGRectMake(10, 10 + CGRectGetHeight(_label.frame), CGRectGetWidth(self.contentView.frame) - 20, CGRectGetHeight(_img.frame) / 2 - 10)];
    _labelDes.text = @"专治送礼困难症";
    _labelDes.textColor = [UIColor whiteColor];
//    _labelDes.backgroundColor = [UIColor greenColor];     
    _labelDes.textAlignment = 0;
    _labelDes.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_labelDes];
    
    
}



@end
