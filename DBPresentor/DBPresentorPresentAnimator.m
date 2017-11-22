//
//  DBPresentorPresentAnimator.m
//  DBPresentor
//
//  Created by 徐梦童 on 2017/11/21.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import "DBPresentorPresentAnimator.h"
#import "DBPresentorViewController.h"

@implementation DBPresentorPresentAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.presentStyle) {
        case DBPresentorPresentStyleSystem:
            return 0.3;
        case DBPresentorPresentStyleFadeIn:
            return 0.2;
        case DBPresentorPresentStyleBounce:
            return 0.42;
        case DBPresentorPresentStyleExpandHorizontal:
            return 0.3;
        case DBPresentorPresentStyleExpandVertical:
            return 0.3;
        case DBPresentorPresentStyleSlideDown:
            return 0.5;
        case DBPresentorPresentStyleSlideUp:
            return 0.5;
        case DBPresentorPresentStyleSlideLeft:
            return 0.4;
        case DBPresentorPresentStyleSlideRight:
            return 0.4;
    }
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self animateWithStyle:self.presentStyle context:transitionContext];
}

- (void)animateWithStyle:(DBPresentorPresentStyle)style context:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    
    switch (style) {
        case DBPresentorPresentStyleSystem:
            [self systemAnimationWithContext:transitionContext];
            break;
        case DBPresentorPresentStyleFadeIn:
            [self fadeInAnimationWithContext:transitionContext];
            break;
        case DBPresentorPresentStyleBounce:
            [self bounceAnimationWithContext:transitionContext];
            break;
        case DBPresentorPresentStyleExpandHorizontal:
            [self expandHorizontalAnimationWithContext:transitionContext];
            break;
        case DBPresentorPresentStyleExpandVertical:
            [self expandVerticalAnimationWithContext:transitionContext];
            break;
        case DBPresentorPresentStyleSlideDown:
            [self slideDownAnimationWithContext:transitionContext];
            break;
        case DBPresentorPresentStyleSlideUp:
            [self slideUpAnimationWithContext:transitionContext];
            break;
        case DBPresentorPresentStyleSlideLeft:
            [self slideLeftAnimationWithContext:transitionContext];
            break;
        case DBPresentorPresentStyleSlideRight:
            [self slideRightAnimationWithContext:transitionContext];
            break;
    }
}

- (void)systemAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DBPresentorViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.contentView.alpha = 0;
    toVC.contentView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         toVC.backgroundView.alpha = 0.4;
                         toVC.contentView.alpha = 1;
                         toVC.contentView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)fadeInAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.alpha = 0;
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         toVC.view.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)bounceAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DBPresentorViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.contentView.alpha = 0;
    toVC.contentView.transform = CGAffineTransformMakeScale(0, 0);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = 0.4;
                         toVC.contentView.alpha = 1;
                         toVC.contentView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)expandHorizontalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DBPresentorViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.contentView.alpha = 0;
    toVC.contentView.transform = CGAffineTransformMakeScale(0, 1);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.75
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = 0.4;
                         toVC.contentView.alpha = 1;
                         toVC.contentView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)expandVerticalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DBPresentorViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.contentView.alpha = 0;
    toVC.contentView.transform = CGAffineTransformMakeScale(1, 0);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.75
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = 0.4;
                         toVC.contentView.alpha = 1;
                         toVC.contentView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideDownAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DBPresentorViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.contentView.center = CGPointMake(toVC.view.center.x, -toVC.contentView.frame.size.height/2.0);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = 0.4;
                         toVC.contentView.center = toVC.view.center;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideUpAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DBPresentorViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.contentView.center = CGPointMake(toVC.view.center.x, toVC.view.frame.size.height+toVC.contentView.frame.size.height/2.0);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = 0.4;
                         toVC.contentView.center = toVC.view.center;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideLeftAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DBPresentorViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.contentView.center = CGPointMake(toVC.view.frame.size.width+toVC.contentView.frame.size.width/2.0, toVC.view.center.y);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         toVC.backgroundView.alpha = 0.4;
                         toVC.contentView.center = toVC.view.center;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideRightAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DBPresentorViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.contentView.center = CGPointMake(-toVC.contentView.frame.size.width/2.0, toVC.view.center.y);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         toVC.backgroundView.alpha = 0.4;
                         toVC.contentView.center = toVC.view.center;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
