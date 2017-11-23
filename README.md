# DBPresentor -- 弹出视图管理器

*ViewController 以下简写为VC*
#### 平时所遇到的一些小困扰
* 经常有需求要在页面上弹出一个框框，框框样式繁杂，我们通过自定义的View来解决问题，这个View为了出现时不那么突兀在显示时会用到一些简单顺眼的小动画~~
* 系统的UIAlertView在iOS8以后不推荐使用了，Apple推荐UIAlertController来代替，但是UIAlertController在show的时候是以Modal方式被present出来的，首先需要找到一个VC来present，然后每个VC只能present一个VC,然后这就意味着当一个Alert存在时不允许弹出第二个(PS.臣妾实在是弹不出来啊)
* 呈上所述的UIAlert***的UI可能设计师不太满意并要求开发者按照他的设计重新设计一款美其名曰CustomAlertView，What？Pardon?

#### 陷入沉思
* 遇到不同类型的弹窗如果只需要关注这个View的自定义，不需要关注这个View添加到哪里，不需要重复性的写动画，那么开发过程肯定会开心很多(PS.晚上可以早些回家打游戏/陪女友/XXX)
* 自定义的AlertView竟然也只能弹一个，什么!!!每次弹还要找先一个VC？？我不干，怎么破...

#### DBPresentor就是为此而生
1. 再也不需要关注 动画
2. 再也不需要关注 添加视图到哪里
3. 再也不需要关注 谁来present AlertViewController
4. 再也不需要关注 多个弹窗共同显示的逻辑处理

**现在你只需要关注的是
 如何实现UI图上那个自定义视图
 剩下的事情交给DBPresentor**
 
 经过项目里的长期实战，Presentor已经添加了很多使用的动画，API经过精心调整使用起来更得心应手

```c
/**
 默认使用API
 CustomView默认居中布局

 @param customView 自定义的View
 @param presentStyle 显示时的动画当时
 @param dismissStyle 隐藏时的动画方式
 @return ViewController实例
 */
+ (instancetype)makerWithCustomView:(UIView *)customView
                       presentStyle:(DBPresentorPresentStyle)presentStyle
                       dismissStyle:(DBPresentorDismissStyle)dismissStyle;

/**
 默认使用API
 CustomView自定义布局方式
 
 @param customView 自定义的View
 @param customLayout 布局回调，在这里尽兴CustomView的自定义布局
 @param presentStyle 显示时的动画当时
 @param dismissStyle 隐藏时的动画方式
 @return ViewController实例
 */
+ (instancetype)makerWithCustomView:(UIView *)customView
                       customLayout:(EXPresentorCustomLayoutBlock)customLayout
                       presentStyle:(DBPresentorPresentStyle)presentStyle
                       dismissStyle:(DBPresentorDismissStyle)dismissStyle;
```
```c
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
```

```c
/**
 弹出VC 默认方式 后弹出的会遮挡前一个
 */
- (void)show;

/**
 弹出VC 可选择动画开关

 @param animated 是否启用动画
 */
- (void)show:(BOOL)animated;

/**
 弹出VC 可选择动画开关 带显示完成的Block

 @param animated 是否启用动画
 @param completion 显示完成的Block
 */
- (void)show:(BOOL)animated completion:(void (^)(void))completion;

/**
 弹出VC 可选择动画开关 带显示完成的Block 可选弹窗的弹出等级

 @param animated 是否启用动画
 @param windowLevel 弹出等级 UIWindowLevel
 @param completion 显示完成的Block
 */
- (void)show:(BOOL)animated windowLevel:(UIWindowLevel)windowLevel completion:(void (^)(void))completion;
```
