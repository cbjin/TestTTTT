//
//  HotListTapMenuView.h
//  Gift
//
//  Created by 蔡佰津 on 2018/4/12.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^block) (NSDictionary *dic);

@interface HotListTapMenuView : UIView

@property (nonatomic, copy) block myblock;

@property (nonatomic, assign) CGFloat num;

@end
