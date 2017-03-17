//
//  loginViewController.m
//  xwBox
//
//  Created by 廖伟健 on 2017/3/17.
//  Copyright © 2017年 lwj. All rights reserved.
//

#import "loginViewController.h"

//读取用户文件
#define userInfoPath [[NSBundle mainBundle] pathForResource:@"userInfo.plist" ofType:nil]


@interface loginViewController ()
//登录界面背景
@property (weak, nonatomic) IBOutlet UIImageView *loginBg;
//登录头像
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
//用户名
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
//密码
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
//登录按钮
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
//登录按钮触发的方法
- (IBAction)clickLoginBtn:(id)sender;

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //布局
    [self userInterfaceLayout];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    //隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
}
#pragma  mark ---- 其他
/*
 *布局
 */
-(void)userInterfaceLayout
{
    //背景处理
    //毛玻璃效果
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = self.loginBg.frame;
    [self.loginBg addSubview:effectView];
    
    //头像处理
    NSDictionary *userInfoDict = [NSDictionary dictionaryWithContentsOfFile:userInfoPath];
    NSString *icon = [userInfoDict valueForKey:@"icon"];
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    iconView.layer.cornerRadius = 50;
    iconView.layer.masksToBounds = YES;
    self.iconView = iconView;
    
    //登录按钮处理
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
}
/*
 *登录按钮响应方法
 */
- (IBAction)clickLoginBtn:(id)sender {
    
    NSString *userName = self.userNameTF.text;
    NSString *password = self.passwordTF.text;
    //读取用户名，密码
    NSDictionary *userInfoDict = [NSDictionary dictionaryWithContentsOfFile:userInfoPath];
    NSString *defaultUserName = [userInfoDict valueForKey:@"userName"];
    NSString *defaluePassword = [userInfoDict valueForKey:@"password"];
    
    if([userName isEqualToString:defaultUserName] && [password isEqualToString:defaluePassword])//用户名、密码正确
    {
        NSLog(@"congratuation!");
    }
}
@end
