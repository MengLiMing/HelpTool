//
//  AppDelegate+Category.h
//  BaseProject
//
//  Created by my on 16/4/21.
//  Copyright © 2016年 base. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Category)

/*判断是不是最新版本*/
- (BOOL)isNewVersion;

/*渐变切换跟视图*/
-(void)restoreRootViewController:(UIViewController *)rootViewController;


@end
