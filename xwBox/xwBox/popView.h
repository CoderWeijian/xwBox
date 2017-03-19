//
//  popView.h
//  xwBox
//
//  Created by 廖伟健 on 2017/3/19.
//  Copyright © 2017年 lwj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface popView : UIView

-(instancetype)initWithSubButtonTitles:(NSArray *)titleArray frame:(CGRect)parentFrame currentContentOffset:(CGPoint)curContentOffset;
//+(instancetype)popViewWithSubButtonTitles:(NSArray *)titleArray frame:(CGRect)parentFrame;



@end
