//
//  DBPresentorViewController.h
//  DBPresentor
//
//  Created by 徐梦童 on 2017/11/21.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBPresentorPresentAnimator.h"
#import "DBPresentorDismissAnimator.h"

typedef void(^EXPresentorCustomLayoutBlock)(UIView *superView);

@interface DBPresentorViewController : UIViewController


/**
 外部传入的View
 */
@property (nonatomic,strong) UIView *contentView;

/**
 背景
 */
@property (nonatomic,strong) UIView *backgroundView;

/**
 视图推出样式
 */
@property (nonatomic,assign) DBPresentorPresentStyle presentStyle;

/**
 视图消失样式
 */
@property (nonatomic,assign) DBPresentorDismissStyle dismissStyle;

/**
 自定义布局
 */
@property (nonatomic,copy)   EXPresentorCustomLayoutBlock customLayout;

/**
 是否点击背景关闭，默认NO
 */
@property (nonatomic,assign) BOOL tapBackgroundClose;

/**
 是否隐藏状态栏
 */
@property (nonatomic,assign) BOOL db_preferStatusBarHidden;

/**
 默认使用API
 CustomView默认居中布局

 @param customView 自定义的View
 @param presentStyle 显示时的动画当时
 @param dismissStyle 隐藏时的动画方式
 @return ViewController实例
 */
+ (instancetype)makerWithCustomView:(UIView *)customView
                       presentStyle:(DBPresentorPresentStyle)presentStyle
                       dismissStyle:(DBPresentorDismissStyle)dismissStyle;

/**
 默认使用API
 CustomView自定义布局方式
 
 @param customView 自定义的View
 @param customLayout 布局回调，在这里尽兴CustomView的自定义布局
 @param presentStyle 显示时的动画当时
 @param dismissStyle 隐藏时的动画方式
 @return ViewController实例
 */
+ (instancetype)makerWithCustomView:(UIView *)customView
                       customLayout:(EXPresentorCustomLayoutBlock)customLayout
                       presentStyle:(DBPresentorPresentStyle)presentStyle
                       dismissStyle:(DBPresentorDismissStyle)dismissStyle;

@end
