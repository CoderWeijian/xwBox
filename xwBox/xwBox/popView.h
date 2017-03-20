//
//  popView.h
//  xwBox
//
//  Created by 廖伟健 on 2017/3/19.
//  Copyright © 2017年 lwj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol popViewDelegate <NSObject>

@optional
-(void)buttonClickInPopView:(UIButton *)button;

@end

@interface popView : UIView

@property (weak , nonatomic) id<popViewDelegate> delegate;

-(instancetype)initWithSubButtonTitles:(NSArray *)titleArray frame:(CGRect)parentFrame currentContentOffset:(CGPoint)curContentOffset;

@end
