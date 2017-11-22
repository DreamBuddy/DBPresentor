//
//  DBActionSheetAction.h
//  DBActionSheet
//
//  Created by 徐梦童 on 10/8/17.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^DBActionSheetHandler)(void);

typedef NS_ENUM(NSUInteger ,DBActionSheetStyle) {
    DBActionSheetStyleDefault,
    DBActionSheetStyleCancel,
};

@interface DBActionSheetAction : NSObject

+ (DBActionSheetAction *)actionWithTitle:(NSAttributedString *)attributedString handler:(DBActionSheetHandler)handler;

/**
 NSAttributedString
 */
@property (strong ,nonatomic) NSAttributedString *attributedString;

/**
 按钮背景颜色
 */
@property (strong ,nonatomic) UIColor *bgColor;

@property (strong ,nonatomic) UIColor *bgColor_highlight;

/**
 高度
 */
@property (assign ,nonatomic) CGFloat actionHeight;

/**
 边距设置
 */
@property (nonatomic, assign) UIEdgeInsets edgeInsets;

/**
 分割线颜色
 */
@property (nonatomic, strong) UIColor *separatorColor;

/**
 回调Block
 */
@property (copy ,nonatomic) DBActionSheetHandler handler;

/**
 样式 Default / Cancel
 */
@property (assign ,nonatomic) DBActionSheetStyle style;

@end
