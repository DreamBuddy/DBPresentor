//
//  DBActionSheetAction.m
//  DBActionSheet
//
//  Created by 徐梦童 on 10/8/17.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import "DBActionSheetAction.h"

@implementation DBActionSheetAction

+ (DBActionSheetAction *)actionWithTitle:(NSAttributedString *)attributedString handler:(DBActionSheetHandler)handler{
    
    DBActionSheetAction *action = DBActionSheetAction.new;
    action.edgeInsets = UIEdgeInsetsZero;
    action.separatorColor = [UIColor lightGrayColor];
    action.bgColor_highlight = [UIColor grayColor];
    action.bgColor = [UIColor clearColor];
    action.actionHeight = 40.0f;
    action.attributedString = attributedString;
    action.handler = handler;
    action.style = DBActionSheetStyleDefault;
    
    return action;
}

@end
