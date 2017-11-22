//
//  DBActionSheetConfig.h
//  DBActionSheet
//
//  Created by 徐梦童 on 23/8/17.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DBActionSheetConfig : NSObject

+ (DBActionSheetConfig *)defaultConfig;

@property (assign ,nonatomic) UIEdgeInsets padding;
@property (strong ,nonatomic) UIColor *bgColor;
@property (assign ,nonatomic) CGFloat cornerRadius;

@end
