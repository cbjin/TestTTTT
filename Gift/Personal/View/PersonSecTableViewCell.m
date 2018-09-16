//
//  PersonSecTableViewCell.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/11.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "PersonSecTableViewCell.h"
#import "BaseHeader.h"

@interface PersonSecTableViewCell ()

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel     *labelTitle;
@property (nonatomic, strong) UILabel     *labelDes;

@end

@implementation PersonSecTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    
    _img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, KScreenW / 3, 80)];
    _img.image = [UIImage imageNamed:@"123"];
    [self.contentView addSubview:_img];
    
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_img.frame) + 20, 10, KScreenW / 3 * 2 - 30, CGRectGetHeight(_img.frame) / 2)];
    _labelTitle.textAlignment = 0;
    _labelTitle.numberOfLines = 2;
    _labelTitle.text = @"最适合春天的礼物：这些高颜值花瓶送给爱花党";
    _labelTitle.textColor = [UIColor blackColor];
    _labelTitle.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_labelTitle];
    
    _labelDes = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_img.frame) + 20, 10 + CGRectGetHeight(_img.frame) / 2, KScreenW / 3 * 2 - 30, CGRectGetHeight(_img.frame) / 2)];
    _labelDes.textAlignment = 0;
    _labelDes.text = @"4-2 小礼君";
    _labelDes.textColor = [UIColor lightGrayColor];
    _labelDes.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_labelDes];
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
