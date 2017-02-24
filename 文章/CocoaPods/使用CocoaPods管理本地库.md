# 使用CocoaPods管理本地库
1. 在~/Desktop/Menu目录下创建一个文件
2. 把你添加的文件放到文件夹中,如图所示
![](https://github.com/gongjujun/MyCode/blob/master/%E6%96%87%E7%AB%A0/CocoaPods/5C4BE0A6-834D-4340-96D4-3902BD9312FD.png?raw=true)

2. 在此目录下`git init`(cd /Users/adobe/Desktop/Menu目录 )
3. `git add .`
4. `git commit -m "add"`
5. 在此目录下新建一个podspec

	```objc
	Pod::Spec.new do |s|
	    s.name = 'Menu'
	    s.version = '0.0.1'
	    s.license = 'Commercial'
	    s.summary = 'Menu'
	    s.homepage = 'https://www.baidu.com/'
	    s.author = { 'today' => '271584255@qq.com' }
	    s.platform        = :ios,"7.0"
	    s.source          =  { :git => "~/Desktop/Menu" }  #本地的路径
	    s.source_files    = "Head/*.{h,m}"              #制定需要引入的文件
	    s.requires_arc    = true
	end
	```

6. 在要使用到上面的本地库的地方,在podfile中加入

	```objc
	target "Test" do
	
	source 'https://github.com/CocoaPods/Specs.git'
	platform :ios, "7.0"
	
	pod 'Menu', :path => '~/Desktop/Menu'
	end
	```

7. pod install
![](https://raw.githubusercontent.com/gongjujun/MyCode/master/%E6%96%87%E7%AB%A0/CocoaPods/Snip20170224_12.png)


- [使用CocoaPods管理本地代码](http://www.jianshu.com/p/d2b0acfad0d8)
- [基于 CocoaPods 和 Git 的 iOS 工程组件化实践](https://skyline75489.github.io/post/2016-3-19_ios_modularization_practice.html)
- ![](https://github.com/gongjujun/MyCode/blob/master/%E6%96%87%E7%AB%A0/CocoaPods/Snip20170224_11.png?raw=true)

	

