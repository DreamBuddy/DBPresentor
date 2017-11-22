//
//  DBActionSheetConfig.m
//  DBActionSheet
//
//  Created by 徐梦童 on 23/8/17.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import "DBActionSheetConfig.h"

@implementation DBActionSheetConfig

+ (DBActionSheetConfig *)defaultConfig{
    DBActionSheetConfig *config = DBActionSheetConfig.new;
    config.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    config.bgColor = [UIColor whiteColor];
    config.cornerRadius = 5.0f;
    
    return config;
}

@end
