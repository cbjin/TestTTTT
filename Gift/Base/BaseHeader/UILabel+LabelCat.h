//
//  UILabel+LabelCat.h
//  Gift
//
//  Created by 蔡佰津 on 2018/4/9.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LabelCat)

@property (nonatomic, copy) NSString *name;
- (CGSize)labelWithStr:(NSString *)str
                  Size:(CGSize)size
                  font:(UIFont *)font;



@end
