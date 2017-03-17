//
//  AppDelegate.h
//  xwBox
//
//  Created by 廖伟健 on 2017/3/17.
//  Copyright © 2017年 lwj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

