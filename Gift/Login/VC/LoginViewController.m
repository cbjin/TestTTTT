//
//  LoginViewController.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/9.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "LoginViewController.h"
#import "BaseHeader.h"

@interface LoginViewController ()

@property (nonatomic, strong) UITextField *userField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UIButton    *btnLogin;

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_userField resignFirstResponder];
    [_passwordField resignFirstResponder];
}
- (void)viewDidAppear:(BOOL)animated {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.userField.frame = CGRectMake(KScreenW / 8, KScreenH / 5, KScreenW * 3 / 4, 40);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.passwordField.frame = CGRectMake(KScreenW / 8, KScreenH / 5 + 100, KScreenW * 3 / 4, 40);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{
                _btnLogin.alpha = 0.7;
                
            } completion:nil];
        }];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"loginbg"]];
    
    [self.view addSubview:self.btnLogin];
    [self.view addSubview:self.userField];
    [self.view addSubview:self.passwordField];
    
    
    // Do any additional setup after loading the view.
}



- (UITextField *)userField {
    if (!_userField) {
        _userField = [[UITextField alloc] initWithFrame:CGRectMake(-KScreenW, KScreenH / 5, KScreenW * 3 / 4, 40)];
        _userField.backgroundColor = [UIColor clearColor];
        _userField.clearsOnBeginEditing = YES;
        _userField.secureTextEntry = NO;
        _userField.textColor = [UIColor whiteColor];
        _userField.borderStyle = 3;
        _userField.layer.cornerRadius = 5;
        // 就下面这两行是重点
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请输入账号" attributes:
                                          @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                            NSFontAttributeName:_userField.font
                                            }];
        _userField.attributedPlaceholder = attrString;
        _userField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _userField.layer.borderWidth = 1;
        _userField.tintColor = [UIColor whiteColor];
        UIButton *clean = [_userField valueForKey:@"_clearButton"]; //key是固定的
        [clean setImage:[UIImage imageNamed:@"clear"] forState:UIControlStateNormal];
        [clean setImage:[UIImage imageNamed:@"clear"] forState:UIControlStateHighlighted];
        _userField.layer.borderColor = [[UIColor whiteColor] CGColor];
    }
    return _userField;
}

- (UITextField *)passwordField {
    if (!_passwordField) {
        _passwordField = [[UITextField alloc] initWithFrame:CGRectMake(-KScreenW, KScreenH / 5 + 100, KScreenW * 3 / 4, 40)];
        _passwordField.backgroundColor = [UIColor clearColor];
        _passwordField.clearsOnBeginEditing = YES;
        _passwordField.secureTextEntry = YES;
        _passwordField.textColor = [UIColor whiteColor];
        _passwordField.borderStyle = 3;
        _passwordField.layer.cornerRadius = 5;
        // 就下面这两行是重点
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:
                                          @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                            NSFontAttributeName:_userField.font
                                            }];
        _passwordField.attributedPlaceholder = attrString;
        _passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordField.layer.borderWidth = 1;
//        _passwordField.tintColor = [UIColor whiteColor];
        UIButton *clean = [_passwordField valueForKey:@"_clearButton"]; //key是固定的
        [clean setImage:[UIImage imageNamed:@"clear"] forState:UIControlStateNormal];
        [clean setImage:[UIImage imageNamed:@"clear"] forState:UIControlStateHighlighted];
        [clean addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        _passwordField.layer.borderColor = [[UIColor whiteColor] CGColor];
    }
    return _passwordField;
}
- (UIButton *)btnLogin {
    if (!_btnLogin) {
        _btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnLogin.frame = CGRectMake(KScreenW / 6, KScreenH / 5 + 250, KScreenW * 2 / 3, 40);
        _btnLogin.layer.cornerRadius = 10;
        [_btnLogin setTitle:@"登录" forState:UIControlStateNormal];
        [_btnLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btnLogin.backgroundColor = [UIColor blackColor];
        _btnLogin.titleLabel.font = [UIFont systemFontOfSize:15];
        _btnLogin.alpha = 0;
        [_btnLogin addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnLogin;
}

- (void)change:(UIButton *)btn {
    NSLog(@"切换");
}

- (void)btn:(UIButton *)btn {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = @"登录中";
    hud.removeFromSuperViewOnHide = YES;
    [self.view addSubview:hud];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud removeFromSuperview];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setBool:YES forKey:@"isLogin"];
        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [self dismissViewControllerAnimated:YES completion:^{
            app.window.rootViewController = [BaseTabBarController new];
            
        }];
        
        
    });
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
