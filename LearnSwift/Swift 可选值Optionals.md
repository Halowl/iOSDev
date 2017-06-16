# Swift 可选值Optionals


###Optionals
- 有值
- 没有值,没有值就是nil

```
//有值
var optValue1:Int = 9
// 没有值
var optValue2:Int?
var optValue3: Int? = nil
```
- 使用if语句来判断可选值


```
var var optValue4:Int ?
if optValue4 != nil{
	print(optValue4)
}else{
	print(optValue4)
}
```
###可选绑定
- 为了更安全的解析可选类型的值,一般情况下使用可选绑定

```
var optValue5:Int? = 9
if let res =  optValue5{
	print(res)
}
```
- 如上,如果optValue5没有值就不会进行任何操作,如果有值,optValue5就会返回true,就会把optValue5的值赋值给res

###强制解析(提取可选类型的值)

```
var optValue6:Int? = 9
let res2:Int = optValue6!
print(res2)
```
- 会将optValue6中的值赋值给res2,告诉编译器optValue6一定有值
- 如果强制解析optValue6,但是optValue6没有值,这是就会报错


```
// 报错
var optValue7:Int?
let res4:Int =  optValue7!
print(res4)
```


