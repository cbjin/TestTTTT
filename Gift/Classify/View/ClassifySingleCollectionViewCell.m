//
//  ClassifySingleCollectionViewCell.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/13.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "ClassifySingleCollectionViewCell.h"
#import "BaseHeader.h"

@interface ClassifySingleCollectionViewCell ()

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel     *label;

@end

@implementation ClassifySingleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame) - 20)];
    _img.image = [UIImage imageNamed:@"panda"];
    [self.contentView addSubview:_img];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_img.frame), CGRectGetWidth(self.contentView.frame), 20)];
    _label.text = @"帆布包";
    _label.textColor = [UIColor blackColor];
    _label.textAlignment = 1;
    _label.font = [UIFont systemFontOfSize:HomeFont];
    [self.contentView addSubview:_label];
    
}


@end
