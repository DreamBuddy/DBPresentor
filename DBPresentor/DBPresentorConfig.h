//
//  DBPresentorConfig.h
//  DBPresentor
//
//  Created by 徐梦童 on 2017/11/21.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#ifndef DBPresentorConfig_h
#define DBPresentorConfig_h

/**
 Present时的动画Style
 */
typedef NS_ENUM(NSInteger, DBPresentorPresentStyle) {
    DBPresentorPresentStyleSystem,                                 // 系统样式
    DBPresentorPresentStyleFadeIn,                                 // 渐入
    DBPresentorPresentStyleBounce,                                 // 弹出
    DBPresentorPresentStyleExpandHorizontal,                       // 水平展开
    DBPresentorPresentStyleExpandVertical,                         // 垂直展开
    DBPresentorPresentStyleSlideDown,                              // 从上往下划入
    DBPresentorPresentStyleSlideUp,                                // 从下往上划入
    DBPresentorPresentStyleSlideLeft,                              // 从右往左划入
    DBPresentorPresentStyleSlideRight,                             // 从左往右划入
};

/**
 Dismiss时的动画Style
 */
typedef NS_ENUM(NSInteger,DBPresentorDismissStyle) {
    DBPresentorDismissStyleFadeOut,                                 // 渐出
    DBPresentorDismissStyleContractHorizontal,                      // 水平收起
    DBPresentorDismissStyleContractVertical,                        // 垂直收起
    DBPresentorDismissStyleSlideDown,                               // 向下划出
    DBPresentorDismissStyleSlideUp,                                 // 向上划出
    DBPresentorDismissStyleSlideLeft,                               // 向左划出
    DBPresentorDismissStyleSlideRight,                              // 向右划出
};

#endif /* DBPresentorConfig_h */
