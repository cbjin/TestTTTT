//
//  SearchHeaderView.h
//  Gift
//
//  Created by flrj on 2018/4/3.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Block)(NSDictionary *dic);

@interface SearchHeaderView : UIView


@property (nonatomic, copy) Block myBlock;

@end
