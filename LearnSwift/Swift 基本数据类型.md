#Swift 基本数据类型
- OC:
	- 整型  int intValue = 10;
	- 浮点型 double doubleValue = 10.10;  float floatValue = 5.1;
	- 长 long
	- 短 short
	- 有符号 signed
	- 无符号 unsigned
	
```
各种类型的数据的取值范围在不同位的编译器下取值范围不同
```
 - Swift:注意关键字大写
	- 整形 
	![](media/14664971594108/14664985085295.jpg)

	- Xcode 中Int的默认值是64bit 的，而 Int64也是64bit 
	- 参考
		- [在 Swift 中我们一般简单地使用 Int 来表示整数，在 iPhone 5 和以下的设备中，这个类型其实等同于 Int32，而在 64 位设备中表示的是 Int64](http://swifter.tips/overflow/)

		- [iOS 和 swift 中常见的 Int、Int8、Int16、Int32和 Int64介绍](http://blog.csdn.net/DearHoneybee/article/details/51212948)


```
var intValue:Int  = 10
//如果按照长度划分,Swift中的长短比OC更加精确
var intValue2:Int8 = 6
var intValue3:Int16 = 7
var intValue4:Int32 = 8
var intValue5:Int64 = 9
```
 - 浮点型

```
var doubleValue1:Double =  10.10 //表示64位的浮点数

var doubleValue2:Float = 9.9 // 表示32位的浮点数
```

 - 有符号无符号, 默认是有符号的(UInt8/UInt16/UInt32/UInt64)
	 - var uintValue7:UInt = 10
	 - 注意: 无符号的数比有符号的取值范围更大, 因为符号位也用来存值


####Swift是类型安全的语言, 如果取值错误会直接报错, 而OC不会

```
取值不对
OC:unsigned int intValue = -10; 不会报错
Swift:var intValue:UInt = -10 会报错
溢出:
OC:int intValue = INT_MAX + 1; 不会报错
Swift:var intValue:UInt = UInt.max + 1 会报错
```



```
数据类型的相互赋值(隐式类型转换)
OC可以
int intValue = 10;
double doubleValue = intValue;

Swift:不可以
var intValue:Int = 10
var doubleValue:Double = intValue
在Swift中“值永远不会被隐式转换为其他类型”(OC中可以隐式类型转换), 以上语句会报错
```



