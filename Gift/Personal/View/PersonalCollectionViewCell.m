//
//  PersonalCollectionViewCell.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/11.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "PersonalCollectionViewCell.h"
#import "BaseHeader.h"

@interface PersonalCollectionViewCell ()

@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelDes;
@property (nonatomic, strong) UIImageView *imgV;

@end

@implementation PersonalCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, KScreenW - 10, 20)];
    _labelTitle.textAlignment = 0;
    _labelTitle.text = @"我喜欢的礼物";
    _labelTitle.textColor = [UIColor blackColor];
    _labelTitle.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_labelTitle];
    
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, KScreenW - 10, 10)];
    _labelTitle.textAlignment = 0;
    _labelTitle.text = @"共2个";
    _labelTitle.textColor = [UIColor blackColor];
    _labelTitle.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_labelTitle];
    
    
    for (int i = 0; i < 2; i++) {
        _imgV = [[UIImageView alloc] initWithFrame:CGRectMake(5 * (i + 1) + i * 50 , 45, 50, 50)];
        _imgV.image = [UIImage imageNamed:@"123"];
        [self.contentView addSubview:_imgV];
        
    }
    
    
}



@end
