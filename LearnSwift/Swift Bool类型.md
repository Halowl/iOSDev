# Swift Bool类型
- C语言和OC并没有真正的Bool类型
- C语言的Bool类型为非0即真
- OC语言的Bool类型是typedef signed char BOOL;
- Swift引入了真正的Bool类型 

```
Bool true false
```


###if
- Swift中if的条件只能是一个Bool的值或者是返回值是Bool类型的表达式(==/!=/>/<等等) 
- OC中if可以是任何整数(非0即真), 但是存在的问题是可能将判断写错, 写成了赋值 if(isOpen = 2) , 在开发中为了避免这个问题有经验的程序员会这样写 if(2 == isOpen)来避免这个问题. 在Swift中很好的解决了这个问题

```
let isOpen = true
//let isOpen = 1;
if isOpen {
	print("打开")
}else{
	print("关闭")
}
```




