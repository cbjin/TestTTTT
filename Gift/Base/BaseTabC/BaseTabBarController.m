//
//  BaseTabBarController.m
//  Gift
//
//  Created by flrj on 2018/4/3.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseHeader.h"

@interface BaseTabBarController ()<UITabBarDelegate, UITabBarControllerDelegate>

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ViewController *homeVC = [[ViewController alloc] init];
    BaseNaviController *homeNavi = [[BaseNaviController alloc] initWithRootViewController:homeVC];
    homeNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:100];
    
    
    HotListViewController *disVC = [[HotListViewController alloc] init];
    BaseNaviController *disNavi = [[BaseNaviController alloc] initWithRootViewController:disVC];
    disNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[[UIImage imageNamed:@"discover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:100];
    
    ClassifyViewController *expVC = [[ClassifyViewController alloc] init];
    BaseNaviController *expNavi = [[BaseNaviController alloc] initWithRootViewController:expVC];
    expNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"探索" image:[[UIImage imageNamed:@"explore"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:100];
    
    PersonalViewController *myVC = [[PersonalViewController alloc] init];
    BaseNaviController *myNavi = [[BaseNaviController alloc] initWithRootViewController:myVC];
    myNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"my"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:100];
//    self.tabBar.tintColor = [UIColor redColor];
    // 设置未选中文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];
    // 设置选中文字颜色
     [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    self.viewControllers = @[homeNavi, disNavi, expNavi, myNavi];
    self.delegate = self;
    // Do any additional setup after loading the view.
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    BOOL isLogin = [userdefaults objectForKey:@"isLogin"];
    if (viewController == self.viewControllers[3] && !isLogin) {
        LoginViewController *login = [[LoginViewController alloc] init];
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:login];
        [tabBarController.selectedViewController presentViewController:navi animated:YES completion:^{
            
        }];
        return NO;
    } else {
        return YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
