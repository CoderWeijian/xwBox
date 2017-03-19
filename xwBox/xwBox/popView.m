//
//  popView.m
//  xwBox
//
//  Created by 廖伟健 on 2017/3/19.
//  Copyright © 2017年 lwj. All rights reserved.
//

#import "popView.h"

@interface popView ()
{
    CGRect PFrame;
    CGPoint ContentOffset;
}

@property (weak , nonatomic) UIView *popV;
@property (strong , nonatomic) NSArray *titleArray;

@end

@implementation popView

-(instancetype)initWithSubButtonTitles:(NSArray *)titleArray frame:(CGRect)parentFrame currentContentOffset:(CGPoint)curContentOffset
{
    self.titleArray = titleArray;
    PFrame = parentFrame;
    ContentOffset = curContentOffset;
    
    return [self initWithFrame:parentFrame];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    //添加子控件
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor orangeColor];
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        
        for (NSString *subString in _titleArray) {
            //添加popView里面的子按钮
            UIButton *subBtn = [[UIButton alloc] init];
            subBtn.backgroundColor = [UIColor colorWithRed:42/255.0 green:41/255.0 blue:42/255.0 alpha:1.0];
            [subBtn setTitle:subString forState:UIControlStateNormal];
            subBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
            [subBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
            
            [self addSubview:subBtn];
        }
        
    }
    
    return self;
}

-(void)layoutSubviews
{
    NSLog(@"%f",ContentOffset.y);
    //确定frame
    //确定popView的frame
    self.frame = CGRectMake(5, ContentOffset.y + 69, PFrame.size.width*0.3, self.subviews.count*30);
    //确定子控件的frame
    for (int i=0; i < self.subviews.count; i++) {
        self.subviews[i].frame = CGRectMake(0, i*30, self.frame.size.width, 30);
    }

}
//点击popView里面的按钮
-(void)clickButton:(UIButton *)button
{
    NSLog(@"sdbcuy");
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    
}


@end
