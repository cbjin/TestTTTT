//
//  HomeTabView.h
//  Gift
//
//  Created by flrj on 2018/4/4.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^block) (NSDictionary *dic);

@interface HomeTabView : UIView

@property (nonatomic, copy) block myblock;
@property (nonatomic, assign) CGFloat num;

@end
