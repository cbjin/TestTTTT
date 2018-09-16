//
//  PersonHeaderView.h
//  Gift
//
//  Created by 蔡佰津 on 2018/4/10.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Block) (NSDictionary *dic);

@interface PersonHeaderView : UIView

@property (nonatomic, copy) Block myblock;

@end
