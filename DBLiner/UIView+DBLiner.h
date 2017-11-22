//
//  UIView+DBLiner.h
//  OneLucky
//
//  Created by mt on 16/6/12.
//  Copyright © 2016年 DreamBuddy. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 一个像素的宽度
 */
#define DBLiner_Single_Line_Width (1 / [UIScreen mainScreen].scale)
#define DBLiner_Single_Adjust_Offset ((1 / [UIScreen mainScreen].scale) / 2)

/**
 Custom Color 自定义默认颜色
 */
#define db_default_color [UIColor blackColor]

/**
 *  一切UIKit的 描边属性 都在这里设置了
 *
 *  Author: MT-X
 */
@interface UIView (DBLiner)

/**
 画线条
 
 @param edge 线条位置 Exp:UIRectEdgeTop / UIRectEdgeBottom
 */
-(void)db_addLinerInPlace:(UIRectEdge)edge;

/**
 画线条 自定义线条颜色
 
 @param edge 线条位置 Exp:UIRectEdgeTop / UIRectEdgeBottom
 @param color 线条颜色
 */
-(void)db_addLinerInPlace:(UIRectEdge)edge lineColor:(UIColor *)color;

/**
 画线条 自定义线条颜色和线条宽度
 
 @param edge 线条位置 Exp:UIRectEdgeTop / UIRectEdgeBottom
 @param color 线条颜色
 @param width 线条宽度
 */
-(void)db_addLinerInPlace:(UIRectEdge)edge lineColor:(UIColor *)color lineWidth:(CGFloat)width;

/**
 增加间距可调整
 * 只适用于单条线
 */
-(void)db_addLinerInPlace:(UIRectEdge)edge lineColor:(UIColor *)color lineWidth:(CGFloat)width insets:(UIEdgeInsets)insets;

/**
 增加间距可调整 & 特殊标识
 * 只适用于单条线
 */
-(void)db_addLinerInPlace:(UIRectEdge)edge lineColor:(UIColor *)color lineWidth:(CGFloat)width insets:(UIEdgeInsets)insets specialKey:(NSString *)specialKey;

/**
 通过specialKey取特定的描边线条
 */
- (UIView *)db_linerForSpecialKey:(NSString *)specialKey;

/**
 生产一个未布局的“线条”，来进行自定义布局
 
 @param color 线条颜色
 @return 用于自定义的线条
 */
- (UIView *)db_createLinerWithLineColor:(UIColor *)color;

/**
 移除所有线条
 */
-(void)db_removeAllLiners;

@end

@interface DBLinerView : UIView

@end
