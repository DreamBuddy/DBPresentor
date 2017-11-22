//
//  UIButton+DBActionSheet.m
//  DBPresentorDemo
//
//  Created by 徐梦童 on 2017/11/22.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import "UIButton+DBActionSheet.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (copy ,nonatomic) DBGestureBlock db_block;

@end

@implementation UIButton (DBActionSheet)

#pragma mark - 增加方法 - (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state
- (void)db_setBackgroundColor:(UIColor *)color forState:(UIControlState)state{
    [self setBackgroundImage:[self db_imageWithColor:color] forState:state];
}

- (UIImage *)db_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)db_addTouchEvent:(UIControlEvents)events block:(DBGestureBlock)block{
    if (block) {
        [self setDb_block:block];
    }
    // 先移除所有事件
    [self removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    // 添加点击事件
    [self addTarget:self action:@selector(db_controlEvent:) forControlEvents:events];
}

- (void)db_controlEvent:(UIButton *)sender{
    if ([self db_block]) {
        [self db_block](sender);
    }
}

#pragma mark - Dynamic Associate
- (DBGestureBlock)db_block{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setDb_block:(DBGestureBlock)db_block{
    objc_setAssociatedObject(self, @selector(db_block), db_block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
