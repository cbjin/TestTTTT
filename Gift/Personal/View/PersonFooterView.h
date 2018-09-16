//
//  PersonFooterView.h
//  Gift
//
//  Created by 蔡佰津 on 2018/4/11.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FooterBlock) (NSInteger aaa);

@interface PersonFooterView : UIView

@property (nonatomic, copy) FooterBlock myblock;

@end
