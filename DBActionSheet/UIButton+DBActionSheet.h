//
//  UIButton+DBActionSheet.h
//  DBPresentorDemo
//
//  Created by 徐梦童 on 2017/11/22.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DBGestureBlock)(id sender);

@interface UIButton (DBActionSheet)

- (void)db_setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

- (void)db_addTouchEvent:(UIControlEvents)events block:(DBGestureBlock)block;

@end
