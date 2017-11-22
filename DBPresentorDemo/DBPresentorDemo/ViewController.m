//
//  ViewController.m
//  DBPresentorDemo
//
//  Created by 徐梦童 on 2017/11/22.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import "ViewController.h"
#import "DBActionSheet.h"
#import "DBPresentorViewController+Show.h"
#import <Masonry.h>

@interface ViewController () <UITableViewDelegate ,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) UIViewController *retainVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.tableFooterView = UIView.new;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
    cell.textLabel.text = @[@"基于DBPresentor弹出自定义视图" ,@"基于DBPresentor封装的自定义ActionSheet" ,@"基于DBPresentor封装的自定义AlertView"][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (row == 0) {
        UIView *customView =UIView.new;
        customView.backgroundColor = [UIColor purpleColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView)];
        [customView addGestureRecognizer:tap];
        
        DBPresentorViewController *presentor = [DBPresentorViewController makerWithCustomView:customView customLayout:^(UIView *superView) {
            [customView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(100, 50));
            }];
        } presentStyle:(arc4random()%DBPresentorPresentStyleSlideRight+1) dismissStyle:arc4random()%DBPresentorDismissStyleSlideRight+1];
        [presentor setTapBackgroundClose:YES];
        
        [presentor show];
        
        self.retainVC = presentor;
    }
    if (row == 1) {
        [[DBActionSheet actionSheetWithTitle:[[NSAttributedString alloc] initWithString:@"TITLE" attributes:@{}] message:[[NSAttributedString alloc] initWithString:@"MESSAGE" attributes:@{}] actions:@[[DBActionSheetAction actionWithTitle:[[NSAttributedString alloc] initWithString:@"ACTION" attributes:@{}] handler:^{
            
        }]]] show];
    }
    if (row == 2) {
        // 待完善
    }
}

- (void)tapView{
    [self.retainVC dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
