//
//  DBPresentorContainerViewController.h
//  DBPrestentorDemo
//
//  Created by 徐梦童 on 2017/11/21.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBPresentorContainerViewController : UIViewController

@property (assign ,nonatomic) BOOL db_preferStatusBarHidden;
@property (assign ,readonly ,nonatomic) BOOL db_statusBarBasedOnViewController;
@property (assign ,nonatomic) BOOL db_statusBarHiddenStorage;

@end
