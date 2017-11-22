//
//  UIView+DBLiner.m
//  OneLucky
//
//  Created by mt on 16/6/12.
//  Copyright © 2016年 DreamBuddy. All rights reserved.
//

#import "UIView+DBLiner.h"
#import <objc/runtime.h>
#import <Masonry.h>

@interface UIView ()

@property (strong ,nonatomic) NSMutableDictionary *db_linesStore;

@end

@implementation UIView (DBLiner)

-(void)db_addLinerInPlace:(UIRectEdge)edge{
    [self db_addLinerInPlace:edge lineColor:db_default_color];
}

-(void)db_addLinerInPlace:(UIRectEdge)edge lineColor:(UIColor *)color{
    [self db_addLinerInPlace:edge lineColor:color lineWidth:(1/[UIScreen mainScreen].scale)];
}

-(void)db_addLinerInPlace:(UIRectEdge)edge lineColor:(UIColor *)color lineWidth:(CGFloat)width{
    [self db_addLinerInPlace:edge lineColor:color lineWidth:width insets:UIEdgeInsetsZero];
}

-(void)db_addLinerInPlace:(UIRectEdge)edge lineColor:(UIColor *)color lineWidth:(CGFloat)width insets:(UIEdgeInsets)insets{
    [self db_addLinerInPlace:edge lineColor:color lineWidth:width insets:insets specialKey:nil];
}

-(void)db_addLinerInPlace:(UIRectEdge)edge lineColor:(UIColor *)color lineWidth:(CGFloat)width insets:(UIEdgeInsets)insets specialKey:(NSString *)specialKey{
    
    specialKey = [specialKey isEqualToString:@""]?nil:specialKey;
    
    if ((edge & UIRectEdgeTop) && (edge & UIRectEdgeBottom) && (edge & UIRectEdgeLeft) && (edge & UIRectEdgeRight)) {
        self.layer.borderColor = color.CGColor;
        self.layer.borderWidth = width;
        
        return ;
    }
    
    if (edge & UIRectEdgeTop) {
        UIView *liner = [self db_createLiner];
        
        liner.backgroundColor = color;
        
        [liner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(width);
            make.left.right.top.mas_offset(insets);
        }];
        
        !specialKey?:[self.db_linesStore setValue:liner forKey:specialKey];
    }
    
    if (edge & UIRectEdgeBottom) {
        UIView *liner = [self db_createLiner];
        
        liner.backgroundColor = color;
        
        [liner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(width);
            make.left.right.bottom.mas_offset(insets);
        }];
        
        !specialKey?:[self.db_linesStore setValue:liner forKey:specialKey];
    }
    
    if (edge & UIRectEdgeLeft) {
        UIView *liner = [self db_createLiner];
        
        liner.backgroundColor = color;
        
        [liner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width);
            make.top.left.bottom.mas_offset(insets);
        }];
        
        !specialKey?:[self.db_linesStore setValue:liner forKey:specialKey];
    }
    
    if (edge & UIRectEdgeRight) {
        UIView *liner = [self db_createLiner];
        
        liner.backgroundColor = color;
        
        [liner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width);
            make.top.right.bottom.mas_offset(insets);
        }];
        
        !specialKey?:[self.db_linesStore setValue:liner forKey:specialKey];
    }
}

- (UIView *)db_linerForSpecialKey:(NSString *)specialKey{
    return self.db_linesStore[specialKey];
}

- (UIView *)db_createLinerWithLineColor:(UIColor *)color{
    UIView *liner = [self db_createLiner];
    liner.backgroundColor = color;
    return liner;
}

-(UIView *)db_createLiner{
    return ({
        UIView *view = [DBLinerView new];
        [self addSubview:view];
        
        view;
    });
}

//移除分割线
-(void)db_removeAllLiners{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[DBLinerView class]]) {
            [obj removeFromSuperview];
        }
    }];
    
    self.db_linesStore = nil;
}

//Associated Object
- (NSMutableDictionary *)db_linesStore{
    NSMutableDictionary *obj = objc_getAssociatedObject(self, _cmd);
    return obj?:({id temp = [@{} mutableCopy];self.db_linesStore = temp;temp;});
}
- (void)setDb_linesStore:(NSMutableDictionary *)db_linesStore{
    objc_setAssociatedObject(self, @selector(db_linesStore), db_linesStore, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation DBLinerView

@end
