//
//  WJAdditemsControllerViewController.m
//  xwBox
//
//  Created by 廖伟健 on 2017/3/20.
//  Copyright © 2017年 lwj. All rights reserved.
//

#import "WJAdditemsControllerViewController.h"
#import "listViewController.h"

@interface WJAdditemsControllerViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *titleV;
@property (weak, nonatomic) IBOutlet UITextView *contentV;

@end

@implementation WJAdditemsControllerViewController

- (void)viewDidLoad {
    //设置导航栏
    [self settingNavigationBar];
    
    [self setupTextView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

#pragma mark - 导航栏方法
-(void)settingNavigationBar
{
    //设置左边按钮
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 0, 40, 30);
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [cancelBtn setTitleColor:[UIColor colorWithRed:112/255.0 green:181/255.0 blue:250/255.0 alpha:1.0] forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [cancelBtn addTarget:self action:@selector(cancelAdd) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    //设置右边按钮
    UIButton *commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commitBtn.frame = CGRectMake(0, 0, 40, 30);
    commitBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [commitBtn setTitleColor:[UIColor colorWithRed:112/255.0 green:181/255.0 blue:250/255.0 alpha:1.0] forState:UIControlStateNormal];
    [commitBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [commitBtn setTitle:@"完成" forState:UIControlStateNormal];
    commitBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [commitBtn addTarget:self action:@selector(commitItem) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:commitBtn];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    //设置titleView
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.textColor = [UIColor colorWithRed:112/255.0 green:181/255.0 blue:250/255.0 alpha:1.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:18.0];
    titleLabel.text = @"添加事项";
    self.navigationItem.titleView = titleLabel;
    
    _titleV.textContainer.lineFragmentPadding = 0;
    _contentV.textContainerInset = UIEdgeInsetsZero;
    
}

- (void)setupTextView
{
    //为标题输入框添加placeHolder
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"  标题";
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    [placeHolderLabel sizeToFit];
    [self.titleV addSubview:placeHolderLabel];
    _titleV.font = [UIFont systemFontOfSize:15.f];
    placeHolderLabel.font = [UIFont systemFontOfSize:15.f];
    [self.titleV setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    
    //为内容输入框添加placeholder
    UILabel *placeHolderL = [[UILabel alloc] init];
    placeHolderL.text = @"事项内容";
    placeHolderL.numberOfLines = 0;
    placeHolderL.textColor = [UIColor lightGrayColor];
    [placeHolderL sizeToFit];
    [self.contentV addSubview:placeHolderL];
    _contentV.font = [UIFont systemFontOfSize:15.f];
    placeHolderL.font = [UIFont systemFontOfSize:15.f];
    [self.contentV setValue:placeHolderL forKey:@"_placeholderLabel"];
}
#pragma mark - UITextViewDelegate


#pragma mark - 导航栏按钮方法
-(void)cancelAdd
{
    for (UIViewController *controller in self.navigationController.viewControllers) {
        
        if ([controller isKindOfClass:[listViewController class]]) {
            
            [self.navigationController popToViewController:(listViewController *)controller animated:YES];
            
        }
    }
}

-(void)commitItem
{
    NSString *title = _titleV.text;
    NSString *content = _contentV.text;
    
}
@end
