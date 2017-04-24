# iOS知识树
> UIKit

- UIViewController
    - ViewController在iOS是一个非常重要的概念,其在一个App中所扮演的角色
        - View Managemnet:管理View
        - Data Marshalling:管理数据
        - User Interactions:响应用户交互
        - Resource Management:管理资源
        - Adaptivity:适配不同的屏幕尺寸空间的变化
    - 生命周期
        - (http://www.cnblogs.com/smileEvday/archive/2012/03/05/2380916.html)
        - (http://blog.csdn.net/huifeidexin_1/article/details/7566226)
    - [+ (void)initialize和 + (void)load 的调用时机,以及区别](http://www.cnblogs.com/ider/archive/2012/09/29/objective_c_load_vs_initialize.html)
    - ViewDidLoad调用时机:当view被首次使用的时候,某些情况可提升性能
- UIView
    - [frame和bounds的区别](http://blog.csdn.net/hherima/article/details/39501857)
        - frame是相对父视图坐标系统的值
        - bounds是相对于本身坐标系统的值
    - [layoutSubviews](http://bachiscoding.com/blog/2014/12/15/when-will-layoutsubviews-be-invoked/)需要将`[super layoutSubviews];`放到最后,不然iOS7有可能会有这个崩溃
        -  ★ ["Auto Layout still required after executing -layoutSubviews” iOS7上崩溃sdk缺陷](http://blog.csdn.net/hherima/article/details/47343223)

