//
//  DBActionSheet.h
//  DBActionSheet
//
//  Created by 徐梦童 on 10/8/17.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBActionSheetConfig.h"
#import "DBActionSheetAction.h"

@interface DBActionSheet : UIView

/**
 Make ActionSheet With Default Appearance

 @param title   Type：NSAttributedString
 @param message Type：NSAttributedString
 @param actions Type：DBActionSheetAction
 @return        Type：ActionSheet --> View
 */
+ (DBActionSheet *)actionSheetWithTitle:(NSAttributedString *)title message:(NSAttributedString *)message actions:(NSArray <DBActionSheetAction *> *)actions;

/**
 Make ActionSheet With Customise Appearance

 @param title   Type：NSAttributedString
 @param message Type：NSAttributedString
 @param actions Type：DBActionSheetAction
 @param config  Type：DBActionSheetConfig
 @return        Type：ActionSheet --> View
 */
+ (DBActionSheet *)actionSheetWithTitle:(NSAttributedString *)title message:(NSAttributedString *)message actions:(NSArray <DBActionSheetAction *> *)actions config:(DBActionSheetConfig *)config;

/**
 To Show The ActionSheet
 */
- (void)show;

/**
 DBample 示例:
 
 DBActionSheetAction *cancelSheet = [DBActionSheetAction actionWithTitle:[@"取消" bos_makeString:^(BOStringMaker *make) {
 make.foregroundColor(UIColorFromRGB(0x8094FA));
 make.font(H14);
 }] handler:^{
 [DBHUD toast:@"点击了 --> 取消按钮" inView:DBWindow];
 }];
 cancelSheet.style = DBActionSheetStyleCancel;
 
 [[DBActionSheet actionSheetWithTitle:[@"" bos_makeString:^(BOStringMaker *make) {
 make.foregroundColor(DBColor333333);
 }] message:[@"" bos_makeString:^(BOStringMaker *make) {
 make.foregroundColor(DBColor999999);
 }] actions:@[[DBActionSheetAction actionWithTitle:[@"从手机相册选取" bos_makeString:^(BOStringMaker *make) {
 make.foregroundColor(UIColorFromRGB(0x8094FA));
 make.font(H14);
 }] handler:^{
 [DBHUD toast:@"点击了 --> 相册按钮" inView:DBWindow];
 }],[DBActionSheetAction actionWithTitle:[@"拍照" bos_makeString:^(BOStringMaker *make) {
 make.foregroundColor(UIColorFromRGB(0x8094FA));
 make.font(H14);
 }] handler:^{
 [DBHUD toast:@"点击了 --> 拍照按钮" inView:DBWindow];
 }],cancelSheet] config:[DBActionSheetConfig defaultConfig]] show];

 */

@end
