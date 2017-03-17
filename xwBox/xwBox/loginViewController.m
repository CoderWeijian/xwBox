//
//  loginViewController.m
//  xwBox
//
//  Created by 廖伟健 on 2017/3/17.
//  Copyright © 2017年 lwj. All rights reserved.
//

#import "loginViewController.h"
#import "listViewController.h"

//读取用户文件
#define userInfoPath [[NSBundle mainBundle] pathForResource:@"userInfo.plist" ofType:nil]
#define user [NSUserDefaults standardUserDefaults]

@interface loginViewController ()
{
    //记住密码标记
    Boolean remenberFlag;
    
}
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
//记住密码按钮
@property (weak, nonatomic) IBOutlet UIButton *remenberUserNameBtn;
//登录按钮触发的方法
- (IBAction)clickLoginBtn:(id)sender;
//记住密码触发的方法
- (IBAction)remenberUserName:(id)sender;

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

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
    NSString *iconString = [userInfoDict valueForKey:@"icon"];
    self.iconView.layer.cornerRadius = 50;
    self.iconView.layer.masksToBounds = YES;
    self.iconView.image = [UIImage imageNamed:iconString];
    
    //记住密码按钮处理
    self.remenberUserNameBtn.layer.cornerRadius = 6;
    self.remenberUserNameBtn.layer.masksToBounds = YES;
    
    //设置按钮状态
    //读取标记
    Boolean userNameFlag = [user boolForKey:@"remenberFlag"];
    NSString *userName = [user objectForKey:@"userName"];
    self.remenberUserNameBtn.selected = userNameFlag;
    if(userName && userNameFlag)//将用户名赋值给文本框
    {
        self.userNameTF.text = userName;
    }
    
    //登录按钮处理
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
}
/*
 *登录按钮响应方法
 */
- (IBAction)clickLoginBtn:(id)sender {
    
    //再一次提交保存用户名
    if(self.userNameTF.text && remenberFlag){
        [user setObject:self.userNameTF.text forKey:@"userName"];
    }
    
    //获取用户输入用户名和密码
    NSString *userName = self.userNameTF.text;
    NSString *password = self.passwordTF.text;
    //读取用户名，密码
    NSDictionary *userInfoDict = [NSDictionary dictionaryWithContentsOfFile:userInfoPath];
    NSString *defaultUserName = [userInfoDict valueForKey:@"userName"];
    NSString *defaluePassword = [userInfoDict valueForKey:@"password"];
    
    if([userName isEqualToString:defaultUserName] && [password isEqualToString:defaluePassword])//用户名、密码正确
    {
        listViewController *listVC = [[listViewController alloc] init];
        [self.navigationController pushViewController:listVC animated:YES];
        
    }else{//用户名或密码错误
        NSLog(@"用户名或密码错误");
    }
}
/*
 *记住密码响应方法
 */
- (IBAction)remenberUserName:(id)sender {
    
    //标记取反
    remenberFlag = !remenberFlag;
    self.remenberUserNameBtn.selected = remenberFlag;
    //保存标记
    [user setBool:remenberFlag forKey:@"remenberFlag"];
    if(!remenberFlag)
    {
        [user removeObjectForKey:@"userName"];
    }
    
}
@end
