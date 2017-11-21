//
//  DBPresentorContainerViewController.m
//  DBPrestentorDemo
//
//  Created by 徐梦童 on 2017/11/21.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import "DBPresentorContainerViewController.h"

@interface DBPresentorContainerViewController ()

@end

@implementation DBPresentorContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden{
    return self.db_preferStatusBarHidden;
}

- (BOOL)db_statusBarBasedOnViewController{
    return [[[NSBundle mainBundle] infoDictionary][@"UIViewControllerBasedStatusBarAppearance"] boolValue];
}

@end
