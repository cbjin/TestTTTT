//
//  BaseHeader.h
//  Gift
//
//  Created by flrj on 2018/4/3.
//  Copyright © 2018年 cbj. All rights reserved.
//

#ifndef BaseHeader_h
#define BaseHeader_h

#pragma mark - 基类
#import "BaseViewController.h"
#import "BaseTabBarController.h"
#import "BaseTableViewController.h"
#import "BaseNaviController.h"

#pragma mark - App代理

#import "AppDelegate.h"

#pragma mark - VC

#import "ViewController.h"
#import "SearchViewController.h"
#import "HotListViewController.h"
#import "ClassifyViewController.h"
#import "PersonalViewController.h"
#import "SearchHeaderView.h"
#import "HomeTabView.h"
#import "HomeCollectionViewCell.h"
#import "HomeTableViewCell.h"
#import "HomeBannerView.h"
#import "HomeCollectionReusableView.h"
#import "LoginViewController.h"
#import "UILabel+LabelCat.h"
#import "PersonHeaderView.h"
#import "UIButton+ImageAndTitle.h"
#import "PersonalCollectionViewCell.h"
#import "PersonalTableViewCell.h"
#import "PersonFooterView.h"
#import "PersonSecTableViewCell.h"
#import "HotListTapMenuView.h"
#import "HotListCollectionViewCell.h"
#import "HotListDetailCollectionViewCell.h"
#import "SingleView.h"
#import "TipsView.h"
#import "TipsCollectionViewCell.h"
#import "ClassifyHeaderView.h"
#import "ClassifyTipsCollectionReusableView.h"
#import "ClassifyTipsSectionFCollectionViewCell.h"
#import "ClassifyTipsOtherCollectionViewCell.h"
#import "ClassifyTipsTableViewCell.h"
#import "ClassifySingleCollectionViewCell.h"
#import "ClassifySingleCollectionReusableView.h"

#import <objc/runtime.h>
#import <MJRefresh.h>
#import <AFNetworking.h>
#import <MBProgressHUD.h>
#import <UIImageView+WebCache.h>
#import <SDCycleScrollView.h>

#pragma mark - 常量
#define iOS11 @available(iOS 11.0, *)

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height
#define NaviH (KScreenH == 812.0 ? 88 : 64)
#define HomeFont (KScreenW > 320 ? 15 : 12)
#define TabBarH 49
#define SafeAreaBottom (KScreenH == 812.0 ? 34 : 0)
#define BaseUrl @""

// RGB颜色转换（16进制->10进制）

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

// 随机色
#define ZXRandomColor QNColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define KCollectionHeader UICollectionElementKindSectionHeader
#define KCollectionFooter UICollectionElementKindSectionFooter

#endif /* BaseHeader_h */


