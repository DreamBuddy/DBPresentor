//
//  DBPresentorPresentAnimator.h
//  DBPresentor
//
//  Created by 徐梦童 on 2017/11/21.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DBPresentorConfig.h"

@interface DBPresentorPresentAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic) DBPresentorPresentStyle presentStyle;

@end
