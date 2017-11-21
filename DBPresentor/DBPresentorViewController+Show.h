//
//  DBPresentorViewController+Show.h
//  DBPrestentorDemo
//
//  Created by 徐梦童 on 2017/11/21.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import "DBPresentorViewController.h"

@interface DBPresentorViewController (Show)

// UIWindow 用于弹出VC
@property (strong ,nonatomic) UIWindow *presentorWindow;

- (void)show;

- (void)show:(BOOL)animated;

- (void)show:(BOOL)animated completion:(void (^)(void))completion;

- (void)show:(BOOL)animated windowLevel:(UIWindowLevel)windowLevel completion:(void (^)(void))completion;

@end
