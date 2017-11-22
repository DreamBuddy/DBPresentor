//
//  DBPresentorViewController+Show.h
//  DBPresentor
//
//  Created by 徐梦童 on 2017/11/21.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import "DBPresentorViewController.h"

@interface DBPresentorViewController (Show)

// UIWindow 用于弹出VC
@property (strong ,nonatomic) UIWindow *presentorWindow;

/**
 弹出VC 默认方式 后弹出的会遮挡前一个
 */
- (void)show;

/**
 弹出VC 可选择动画开关

 @param animated 是否启用动画
 */
- (void)show:(BOOL)animated;

/**
 弹出VC 可选择动画开关 带显示完成的Block

 @param animated 是否启用动画
 @param completion 显示完成的Block
 */
- (void)show:(BOOL)animated completion:(void (^)(void))completion;

/**
 弹出VC 可选择动画开关 带显示完成的Block 可选弹窗的弹出等级

 @param animated 是否启用动画
 @param windowLevel 弹出等级 UIWindowLevel
 @param completion 显示完成的Block
 */
- (void)show:(BOOL)animated windowLevel:(UIWindowLevel)windowLevel completion:(void (^)(void))completion;

@end
