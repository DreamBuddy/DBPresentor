//
//  DBPresentorViewController.m
//  DBPresentor
//
//  Created by 徐梦童 on 2017/11/21.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import "DBPresentorViewController.h"

@interface DBPresentorViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation DBPresentorViewController

#pragma mark - User Method
+ (instancetype)makerWithCustomView:(UIView *)customView
                                presentStyle:(DBPresentorPresentStyle)presentStyle
                                dismissStyle:(DBPresentorDismissStyle)dismissStyle{
    return [DBPresentorViewController makerWithCustomView:customView customLayout:nil presentStyle:presentStyle dismissStyle:dismissStyle];
}

+ (instancetype)makerWithCustomView:(UIView *)customView
                                customLayout:(EXPresentorCustomLayoutBlock)customLayout
                                presentStyle:(DBPresentorPresentStyle)presentStyle
                                dismissStyle:(DBPresentorDismissStyle)dismissStyle{
    DBPresentorViewController *alertController = [[DBPresentorViewController alloc] init];
    alertController.presentStyle = presentStyle;
    alertController.dismissStyle = dismissStyle;
    alertController.contentView = customView;
    alertController.customLayout = customLayout;
    return alertController;
}

#pragma mark - Init
- (instancetype)init{
    if (self = [super init]) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.contentView];
    
    [self configConstraints];
    
    !self.customLayout?:self.customLayout(self.view);
    
    [self _addGestures];
}

#pragma mark - Gesture
// 添加背景点击手势动作
- (void)_addGestures{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_bgViewTapAction)];
    [self.backgroundView addGestureRecognizer:gesture];
}

// 关闭背景视图
- (void)_bgViewTapAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 设置是否点击背景关闭
- (void)setTapBackgroundClose:(BOOL)tapBackgroundClose{
    _tapBackgroundClose = tapBackgroundClose;
    self.backgroundView.userInteractionEnabled = tapBackgroundClose;
}

#pragma mark - Constrait
// 弹出框布局
- (void)configConstraints{
    // 设置灰色半透明背景的约束
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0@250-[_backgroundView]-0@250-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_backgroundView)]];
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0@250-[_backgroundView]-0@250-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_backgroundView)]];
    
    // 设置 contentView 在屏幕中心
    NSLayoutConstraint *xCenter = [NSLayoutConstraint constraintWithItem:self.contentView
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    xCenter.priority = UILayoutPriorityDefaultLow;
    xCenter.active = YES;

    NSLayoutConstraint *yCenter = [NSLayoutConstraint constraintWithItem:self.contentView
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0];
    yCenter.priority = UILayoutPriorityDefaultLow;
    yCenter.active = YES;
}

#pragma mark - UIViewControllerTransitioningDelegate
//Present动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    DBPresentorPresentAnimator *animator = [[DBPresentorPresentAnimator alloc] init];
    animator.presentStyle = self.presentStyle;
    return animator;
}

//Dismiss动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    DBPresentorDismissAnimator *animator = [[DBPresentorDismissAnimator alloc] init];
    animator.dismissStyle = self.dismissStyle;
    return animator;
}

#pragma mark - lazy load
- (UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = UIView.new;
        _backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = 0.4;
        _backgroundView.userInteractionEnabled = NO;
    }
    return _backgroundView;
}

@end
