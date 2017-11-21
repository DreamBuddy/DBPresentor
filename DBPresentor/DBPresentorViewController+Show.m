//
//  DBPresentorViewController+Show.m
//  DBPrestentorDemo
//
//  Created by 徐梦童 on 2017/11/21.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import "DBPresentorViewController+Show.h"
#import <objc/runtime.h>
#import "DBPresentorContainerViewController.h"

@implementation DBPresentorViewController (Show)

- (void)show{
    [self show:YES];
}

- (void)show:(BOOL)animated{
    [self show:animated completion:nil];
}

- (void)show:(BOOL)animated completion:(void (^)(void))completion{
    // window level is above the top window (this makes the alert, if it's a sheet, show over the keyboard)
    UIWindow *topWindow = [UIApplication sharedApplication].windows.lastObject;
    [self show:animated windowLevel:topWindow.windowLevel + 1 completion:completion];
}

- (void)show:(BOOL)animated windowLevel:(UIWindowLevel)windowLevel completion:(void (^)(void))completion{
    self.presentorWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    DBPresentorContainerViewController *containerVC = [[DBPresentorContainerViewController alloc] init];
    // 处理状态栏隐藏
    if (containerVC.db_statusBarBasedOnViewController) {
        containerVC.db_preferStatusBarHidden = self.db_preferStatusBarHidden;
    } else {
        containerVC.db_statusBarHiddenStorage = [UIApplication sharedApplication].statusBarHidden;
        [[UIApplication sharedApplication] setStatusBarHidden:self.db_preferStatusBarHidden];
    }
    
    self.presentorWindow.rootViewController = containerVC;
    
    // 设置代理颜色
    id <UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;
    // Applications that does not load with UIMainStoryboardFile might not have a window property:
    if ([delegate respondsToSelector:@selector(window)]) {
        // we inherit the main window's tintColor
        self.presentorWindow.tintColor = delegate.window.tintColor;
    }
    
    // 设置window层级
    self.presentorWindow.windowLevel = windowLevel;
    
    // 弹出自定义window
    [self.presentorWindow makeKeyAndVisible];
    [self.presentorWindow.rootViewController presentViewController:self animated:animated completion:completion?completion:nil];
}

- (void)viewDidDisappear:(BOOL)animated{
    // 还原StatusBar Hidden
    DBPresentorContainerViewController *containerVC = (DBPresentorContainerViewController *)self.presentorWindow.rootViewController;
    // 处理状态栏隐藏
    if (!containerVC.db_statusBarBasedOnViewController) {
        [[UIApplication sharedApplication] setStatusBarHidden:containerVC.db_statusBarHiddenStorage];
    }
    // 移除自定义window
    self.presentorWindow.hidden = YES;
    self.presentorWindow = nil;
}

#pragma mark - Dynamic Associate
- (UIWindow *)presentorWindow{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setPresentorWindow:(UIWindow *)presentorWindow{
    objc_setAssociatedObject(self, @selector(presentorWindow), presentorWindow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
