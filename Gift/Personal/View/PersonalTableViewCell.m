//
//  PersonalTableViewCell.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/11.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "PersonalTableViewCell.h"
#import "BaseHeader.h"

@interface PersonalTableViewCell ()

@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UIButton *btnTitle;
@property (nonatomic, strong) UILabel *labelDes;
@property (nonatomic, strong) UIImageView *imgV;

@end


@implementation PersonalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, KScreenW - 10, 20)];
    _labelTitle.textAlignment = 0;
    _labelTitle.text = @"我喜欢的礼物";
    _labelTitle.textColor = [UIColor blackColor];
    _labelTitle.font = [UIFont systemFontOfSize:15];
    _labelTitle.userInteractionEnabled = YES;
    [self.contentView addSubview:_labelTitle];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapIt)];
    [_labelTitle addGestureRecognizer:tap];
    
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, KScreenW - 10, 10)];
    _labelTitle.textAlignment = 0;
    _labelTitle.text = @"共2个";
    _labelTitle.textColor = [UIColor lightGrayColor];
    _labelTitle.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_labelTitle];
    
    for (int i = 0; i < 2; i++) {
        _imgV = [[UIImageView alloc] initWithFrame:CGRectMake(10 * (i + 1) + i * 100 , 70, 100, 100)];
        _imgV.image = [UIImage imageNamed:@"123"];
        [self.contentView addSubview:_imgV];
        
    }
}

- (void)tapIt {
    NSLog(@"12");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
