//
//  HomeCollectionReusableView.h
//  Gift
//
//  Created by flrj on 2018/4/4.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Block) (NSDictionary *dic);

@interface HomeCollectionReusableView : UICollectionReusableView

@property (nonatomic, copy) Block myblock;

@end
