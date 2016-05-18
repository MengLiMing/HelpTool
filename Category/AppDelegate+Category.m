//
//  AppDelegate+Category.m
//  BaseProject
//
//  Created by my on 16/4/21.
//  Copyright © 2016年 base. All rights reserved.
//

#import "AppDelegate+Category.h"

#define kApp_Version @"app_version"

@implementation AppDelegate (Category)

/*判断是不是最新版本*/
- (BOOL)isNewVersion {
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    NSString *localVersion = [[NSUserDefaults standardUserDefaults] objectForKey:kApp_Version];
    return [currentVersion isEqualToString:localVersion];
}

/*渐变切换跟视图*/
-(void)restoreRootViewController:(UIViewController *)rootViewController
{
    typedef void (^Animation)(void);
    UIWindow* window = self.window;
    
    rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        window.rootViewController = rootViewController;
        [UIView setAnimationsEnabled:oldState];
    };
    
    [UIView transitionWithView:window
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
}

@end
