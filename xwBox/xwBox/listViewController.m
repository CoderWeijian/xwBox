//
//  listViewController.m
//  xwBox
//
//  Created by 廖伟健 on 2017/3/17.
//  Copyright © 2017年 lwj. All rights reserved.
//

#import "listViewController.h"
#import "popView.h"

@interface listViewController ()
{
    Boolean leftIconIsClick;
    CGPoint curContentOffset;
}

@property (weak , nonatomic) popView *popV;
@property (weak , nonatomic) UIButton *coverBtn;

@end

@implementation listViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    leftIconIsClick = NO;
    
    //设置导航栏控件
    [self addNavigatuonBarItems];
    
    //添加headerView
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 100)];
    headerView.backgroundColor = [UIColor blueColor];
    self.tableView.tableHeaderView = headerView;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.hidesBackButton = YES;
}

#pragma mark - other
-(void)addNavigatuonBarItems
{
    //设置cell的高度
    self.tableView.rowHeight = 64;
    
    //添加导航栏左上角的用户头像icon按钮
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
    leftBtn.layer.cornerRadius = 15;
    leftBtn.layer.masksToBounds = YES;
    leftBtn.layer.borderColor = [UIColor grayColor].CGColor;
    leftBtn.layer.borderWidth = 1;
    [leftBtn addTarget:self action:@selector(popViewByLeftIcon) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *leftBarIcon = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBarIcon;
    
    //设置导航栏title
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.textColor = [UIColor colorWithRed:112/255.0 green:181/255.0 blue:250/255.0 alpha:1.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:18.0];
    titleLabel.text = @"事项列表";
    self.navigationItem.titleView = titleLabel;
    
    //设置导航栏右侧添加按钮
    UIButton *rightAddBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [rightAddBtn addTarget:self action:@selector(addNewItem) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc]initWithCustomView:rightAddBtn];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
}

//导航栏左侧按钮点击事件
-(void)popViewByLeftIcon
{
    leftIconIsClick = !leftIconIsClick;
    
    if (leftIconIsClick) {
        
        self.tableView.scrollEnabled = NO;
        
        UIButton *coverBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, curContentOffset.y + 64, self.view.frame.size.width, self.view.frame.size.height)];
        coverBtn.backgroundColor = [UIColor clearColor];
        [coverBtn addTarget:self action:@selector(dismissPopView) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:coverBtn];
        self.coverBtn = coverBtn;
        
        popView *pop = [[popView alloc] initWithSubButtonTitles:@[@"个人主页",@"退出登录"] frame:[UIScreen mainScreen].bounds currentContentOffset:curContentOffset];
        [self.view addSubview:pop];
        self.popV = pop;
        
    }else{
        
        self.tableView.scrollEnabled = YES;
        [self.popV removeFromSuperview];
        
    }
    

}
-(void)dismissPopView
{
    self.tableView.scrollEnabled = YES;
    [self.popV removeFromSuperview];
    
    leftIconIsClick = !leftIconIsClick;
    
}


//导航栏右侧按钮点击事件
-(void)addNewItem
{
    if (leftIconIsClick) {
        
        self.tableView.scrollEnabled = YES;
        [self.popV removeFromSuperview];
        
        leftIconIsClick = !leftIconIsClick;
        
    }else{
        
        NSLog(@"转跳到添加事项控制器");
    }
    
}

#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        NSString *str = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        cell.textLabel.text = str;
    }
    
    return cell;
}

#pragma mark - tableView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    curContentOffset = scrollView.contentOffset;
    
    NSLog(@"%@",[NSValue valueWithCGPoint:scrollView.contentOffset]);
}


@end
