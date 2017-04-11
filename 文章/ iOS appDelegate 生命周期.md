#  iOS AppDelegate 生命周期


```
// 当应用程序失去焦点的时候调用
- (void)applicationWillResignActive:(UIApplication *)application

说明：当应用程序将要入非活动状态执行，在此期间，应用程序不接收消息或事件，比如来电话了

// 当应用程序获取焦点的时候调用
- (void)applicationDidBecomeActive:(UIApplication *)application

说明：当应用程序入活动状态执行，这个刚好跟上面那个方法相反,当用户完全获取焦点的时候，才能跟界面交互

// 当应用程序进入后台的时候调用
- (void)applicationDidEnterBackground:(UIApplication *)application

说明：当程序被推送到后台的时候调用。所以要设置后台继续运行，则在这个函数里面设置即可,保存一些数据

// 当应用程序进入进台的时候调用
- (void)applicationWillEnterForeground:(UIApplication *)application

说明：当程序从后台将要重新回到前台时候调用，这个刚好跟上面的那个方法相反。

// 当应用程序关闭的时候调用
- (void)applicationWillTerminate:(UIApplication *)application

说明：当程序将要退出是被调用，通常是用来保存数据和一些退出前的清理工作。这个需要要设置UIApplicationExitsOnSuspend的键值。

// 当程序接收到内存警告的时候调用
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application

说明：iPhone设备只有有限的内存，如果为应用程序分配了太多内存操作系统会终止应用程序的运行，在终止前会执行这个方法，通常可以在这里进行内存清理工作防止程序被终止

- (void)applicationSignificantTimeChange:(UIApplication*)application

说明：当系统时间发生改变时执行

- (void)applicationDidFinishLaunching:(UIApplication*)application

说明：当程序载入后执行

 - (void)application:(UIApplication)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame

说明：当StatusBar框将要变化时执行

- (void)application:(UIApplication*)application willChangeStatusBarOrientation:

(UIInterfaceOrientation)newStatusBarOrientation

duration:(NSTimeInterval)duration

说明：当StatusBar框方向将要变化时执行

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)url

说明：当通过url执行

- (void)application:(UIApplication*)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation

说明：当StatusBar框方向变化完成后执行

- (void)application:(UIApplication*)application didChangeSetStatusBarFrame:(CGRect)oldStatusBarFrame

说明：当StatusBar框变化完成后执行
```

- [参考链接](https://github.com/gongjujun/MyCode/blob/master/%E6%80%9D%E7%BB%B4%E5%AF%BC%E5%9B%BE/AppDelegate%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F.pdf)

