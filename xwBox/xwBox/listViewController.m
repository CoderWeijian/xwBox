//
//  listViewController.m
//  xwBox
//
//  Created by 廖伟健 on 2017/3/17.
//  Copyright © 2017年 lwj. All rights reserved.
//

#import "listViewController.h"

@interface listViewController ()

@end

@implementation listViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏控件
    [self addNavigatuonBarItems];
}

-(void)addNavigatuonBarItems
{
    //添加导航栏左上角的用户头像icon按钮
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
    leftBtn.layer.cornerRadius = 15;
    leftBtn.layer.masksToBounds = YES;
    leftBtn.layer.borderColor = [UIColor blackColor].CGColor;
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
    NSLog(@"click left icon");
}
//导航栏右侧按钮点击事件
-(void)addNewItem
{
    NSLog(@"click right addBtn");
}


-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
