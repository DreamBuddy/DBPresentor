//
//  DBActionSheet.m
//  DBActionSheet
//
//  Created by 徐梦童 on 10/8/17.
//  Copyright © 2017年 DreamBuddy. All rights reserved.
//

#import "DBActionSheet.h"
#import <Masonry.h>
#import "UIView+DBLiner.h"
#import "UIButton+DBActionSheet.h"
#import "DBPresentorViewController+Show.h"

@interface DBActionSheet ()

// ****** 头部 ******
@property (strong ,nonatomic) UIView *headSquare;

// ****** 中部 ******
@property (strong ,nonatomic) UIView *centerSquare;

// ****** 尾部 ******
@property (strong ,nonatomic) UIView *tailSquare;

// ****** 存储 ******
@property (strong ,nonatomic) NSAttributedString *title;
@property (strong ,nonatomic) NSAttributedString *message;
@property (strong ,nonatomic) NSArray *actions;
@property (strong ,nonatomic) DBActionSheetConfig *config;

@property (weak ,nonatomic) UIViewController *retainVC;

@end

@implementation DBActionSheet

+ (DBActionSheet *)actionSheetWithTitle:(NSAttributedString *)title message:(NSAttributedString *)message actions:(NSArray <DBActionSheetAction *> *)actions {
    return [DBActionSheet actionSheetWithTitle:title message:message actions:actions config:[DBActionSheetConfig defaultConfig]];
}

+ (DBActionSheet *)actionSheetWithTitle:(NSAttributedString *)title message:(NSAttributedString *)message actions:(NSArray <DBActionSheetAction *> *)actions config:(DBActionSheetConfig *)config{
    DBActionSheet *actionSheet = [[DBActionSheet alloc] initActionSheetWithTitle:title message:message actions:actions config:config];
    
    return actionSheet;
}

- (instancetype)initActionSheetWithTitle:(NSAttributedString *)title message:(NSAttributedString *)message actions:(NSArray <DBActionSheetAction *> *)actions config:(DBActionSheetConfig *)config{
    if (self = [super init]) {
        self.title = title;
        self.message = message;
        self.config = config;
        self.actions = actions;
        
        [self addSubviews];
        [self defineLayout];
        [self configAppearance];
    }
    return self;
}

- (void)addSubviews{
    // ****** 头部 *******
    [self addSubview:self.headSquare];
    
    __block NSMutableArray *messages = [@[] mutableCopy];
    [@[self.title ,self.message] enumerateObjectsUsingBlock:^(NSAttributedString *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj && obj.length ? [messages addObject:obj] : nil;
    }];
    [messages enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *messageLabel = UILabel.new;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.numberOfLines = 0;
        [self.headSquare addSubview:messageLabel];
        
        messageLabel.attributedText = obj;
    }];
    
    // ****** 中部 *******
    [self addSubview:self.centerSquare];
    
    // ****** 尾部 *******
    [self addSubview:self.tailSquare];
    
    __weak typeof(self) weakSelf = self;
    [self.actions enumerateObjectsUsingBlock:^(DBActionSheetAction  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        DBActionSheetAction *action = self.actions[idx];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        UIColor *buttonBGColor = (obj.bgColor && ![obj.bgColor isEqual:[UIColor clearColor]]) ? obj.bgColor : self.config.bgColor;
        [button db_setBackgroundColor:buttonBGColor forState:UIControlStateNormal];
        [button db_setBackgroundColor:action.bgColor_highlight forState:UIControlStateHighlighted];
        
        [button setAttributedTitle:action.attributedString forState:UIControlStateNormal];
        [button db_addLinerInPlace:UIRectEdgeBottom lineColor:action.separatorColor];
        
        [button db_addTouchEvent:UIControlEventTouchUpInside block:^(id sender) {
            
            [weakSelf.retainVC dismissViewControllerAnimated:YES completion:^{
                !action.handler?:action.handler();
            }];
        }];
        
        if (obj.style != DBActionSheetStyleCancel) {
            [self.centerSquare addSubview:button];
        } else {
            [self.tailSquare addSubview:button];
        }
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(action.actionHeight);
        }];
    }];
}

- (void)defineLayout{
    // ****** 头部 *******
    [self.headSquare mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0).priorityLow();
    }];
    
    [self.headSquare.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj mas_updateConstraints:^(MASConstraintMaker *make) {
            if (idx == 0) {
                make.top.mas_equalTo(10);
            } else {
                make.top.mas_equalTo(self.headSquare.subviews[idx - 1].mas_bottom).mas_offset(10);
            }
            if (idx == self.headSquare.subviews.count - 1) {
                make.bottom.mas_equalTo(-10);
            }
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }];
    
    // ****** 中部 *******
    [self.centerSquare mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headSquare.mas_bottom).mas_offset(self.config.padding.top);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(0).priorityLow();
    }];
    
    [self.centerSquare.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj mas_updateConstraints:^(MASConstraintMaker *make) {
            if (idx == 0) {
                make.top.mas_equalTo(0);
            } else {
                make.top.mas_equalTo(self.centerSquare.subviews[idx - 1].mas_bottom).mas_offset(0);
            }
            if (idx == self.centerSquare.subviews.count - 1) {
                make.bottom.mas_equalTo(0);
            }
            make.left.right.mas_equalTo(0);
        }];
    }];
    
    // ****** 尾部 ******
    [self.tailSquare mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.centerSquare.mas_bottom).mas_offset(self.config.padding.top);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0).priorityLow();
    }];
    
    [self.tailSquare.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj mas_updateConstraints:^(MASConstraintMaker *make) {
            if (idx == 0) {
                make.top.mas_equalTo(0);
            } else {
                make.top.mas_equalTo(self.tailSquare.subviews[idx - 1].mas_bottom).mas_offset(0);
            }
            if (idx == self.tailSquare.subviews.count - 1) {
                make.bottom.mas_equalTo(0);
            }
            make.left.right.mas_equalTo(0);
        }];
    }];
}

- (void)configAppearance{
    self.headSquare.backgroundColor = self.config.bgColor;
    self.centerSquare.backgroundColor = self.config.bgColor;
    self.tailSquare.backgroundColor = self.config.bgColor;
    
    self.headSquare.layer.cornerRadius = self.config.cornerRadius;
    self.centerSquare.layer.cornerRadius = self.config.cornerRadius;
    self.tailSquare.layer.cornerRadius = self.config.cornerRadius;
    
    self.headSquare.clipsToBounds = YES;
    self.centerSquare.clipsToBounds = YES;
    self.tailSquare.clipsToBounds = YES;
}

- (void)show{
    DBPresentorViewController *actionSheet = [DBPresentorViewController makerWithCustomView:self customLayout:^(UIView *superView) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.config.padding.left);
            make.right.mas_equalTo(-self.config.padding.right);
            
            // 适配iPhone X 底部的安全区域
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(superView.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.mas_equalTo(0);
            }
        }];
    } presentStyle:DBPresentorPresentStyleSlideUp dismissStyle:DBPresentorDismissStyleSlideDown];
    [actionSheet setTapBackgroundClose:YES];
    [actionSheet show];
    
    // 持有它
    self.retainVC = actionSheet;
}

#pragma mark - Lazy Load
- (UIView *)headSquare{
    if (!_headSquare) {
        _headSquare = UIView.new;
    }
    return _headSquare;
}

- (UIView *)centerSquare{
    if (!_centerSquare) {
        _centerSquare = UIView.new;
    }
    return _centerSquare;
}

- (UIView *)tailSquare{
    if (!_tailSquare) {
        _tailSquare = UIView.new;
    }
    return _tailSquare;
}

@end
