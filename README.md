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

