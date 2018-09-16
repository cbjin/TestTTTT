//
//  HomeTableViewCell.m
//  Gift
//
//  Created by flrj on 2018/4/4.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "BaseHeader.h"

@interface HomeTableViewCell ()

@property (nonatomic, strong) UIButton *btnPerson;
@property (nonatomic, strong) UILabel *labelName;
@property (nonatomic, strong) UILabel *labelPDes;
@property (nonatomic, strong) UIImageView *imgV;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelDes;
@property (nonatomic, strong) UILabel *labelLM;  // 栏目
@property (nonatomic, strong) UILabel *labelEnjoy; // 喜欢

- (void)createSubViews;
@end

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    _btnPerson = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnPerson.frame = CGRectMake(10, 10, 40, 40);
    _btnPerson.layer.masksToBounds = YES;
    _btnPerson.layer.cornerRadius = 20;
    [_btnPerson setImage:[UIImage imageNamed:@"123"] forState:UIControlStateNormal];
    [_btnPerson addTarget:self action:@selector(btnPerson:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_btnPerson];
    _labelName = [[UILabel alloc] initWithFrame:CGRectMake(_btnPerson.frame.size.width + 20, 10, 200, 20)];
    _labelName.text = @"小礼君";
    _labelName.textAlignment = 0;
    _labelName.textColor = [UIColor blackColor];
    _labelName.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_labelName];
    
    _labelPDes = [[UILabel alloc] initWithFrame:CGRectMake(_btnPerson.frame.size.width + 20, 30, 200, 20)];
    _labelPDes.text = @"资深买买买达人";
    _labelPDes.textAlignment = 0;
    _labelPDes.textColor = RGB(150, 150, 150);
    _labelPDes.font = [UIFont systemFontOfSize:12];
    
    [self.contentView addSubview:_labelPDes];
    
    _imgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, _btnPerson.frame.size.height + 20, KScreenW - 20, 200)];
    _imgV.image = [UIImage imageNamed:@"123"];
    [self.contentView addSubview:_imgV];
    
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 260, KScreenW - 20, 50)];
    _labelTitle.text = @"最适合春天的礼物:\n这些高颜值花瓶送给爱花党";
    _labelTitle.textAlignment = 0;
    _labelTitle.textColor = [UIColor blackColor];
    _labelTitle.font = [UIFont systemFontOfSize:17];
    _labelTitle.numberOfLines = 2;
    [self.contentView addSubview:_labelTitle];
    
    _labelDes = [[UILabel alloc] initWithFrame:CGRectMake(10, 320, KScreenW - 20, 20)];
    _labelDes.text = @"不会插画,会插花瓶就好";
    _labelDes.textAlignment = 0;
    _labelDes.textColor = RGB(150, 150, 150);
    _labelDes.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_labelDes];
    
    _labelLM = [[UILabel alloc] initWithFrame:CGRectMake(10, 370, KScreenW / 2, 20)];
    _labelLM.text = @"栏目 不打烊的礼物店";
    _labelLM.textAlignment = 0;
    _labelLM.textColor = RGB(150, 150, 150);
    _labelLM.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_labelLM];
    
    _labelEnjoy = [[UILabel alloc] initWithFrame:CGRectMake(KScreenW / 2 + 10, 370, KScreenW / 2 - 20, 20)];
    _labelEnjoy.text = @"3329";
    _labelEnjoy.textAlignment = 2;
    _labelEnjoy.textColor = RGB(150, 150, 150);
    _labelEnjoy.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_labelEnjoy];
}

- (void)btnPerson:(UIButton *)btn {
    
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
