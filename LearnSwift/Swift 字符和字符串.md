# Swift 字符和字符串
![](http://www.eryi.org/blog/upload/design/photo2text.png)

### 字符
- OC 

```
 char charValue = 'a';
```
- Swift 

```
 var chareValue1:Character = "a"
```
- 注意
	- swift是用的双引号
	- swift中的字符类型和OC中的也不一样,OC中的字符是占一个字节,因为它只包含ASCII表中的字符,而swift中的字符除了可以存储ASCII表中的字符,还可以存储unicode字符
	
```
OC: char charValue = '龚'//错误
Swift: var charValue2:Character = "龚"//正确

<------- 双绰号中只能放一个字符,如下是错误的 ------->

var var charValue2:Character = "ab"
```
### 字符串
- 字符是单个字符的集合,字符串是多个字符的集合,想要存放多个字符就要使用字符串
- 0C语言中的字符串是以\0结尾的 

```
NSString *stringValue = @"abc\0bcd";
NSLog(@"%@", stringValue);
打印结果为abc
```

- Swift

```
var stringValue2 = "abc\0bcd"
print(stringValue2)
// 打印结果为abcbcd
```
- 从上面可以看出swift的字符串和OC是不一样的

#### 字符串的常用方法
- 计算字符串长度

```
C:
char *stringValue = "abc李";
printf("%tu", strlen(stringValue));// 打印结果6

OC:
NSString *stringValue = @"abc李";
NSLog(@"%tu", stringValue.length);//打印结果4, 以UTF16计算

Swift:
var stringValue = "abc李"
print(stringValue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
// 打印结果6, 和C语言一样计算字节数

```
- 字符串拼接

```
C:
char str1[] = "abc";
char *str2 = "bcd";
char *str = strcat(str1, str2);

OC:
NSMutableString *str1 = [NSMutableString stringWithString:@"abc"];
NSString *str2 = @"bcd";
[str1 appendString:str2];
NSLog(@"%@", str1);
<!--也可以使用stringWithFormat:-->

Swift:
var str1 = "abc";
var str2 = "lnj";
var str = str1 + str2;
print(str)

```
- 格式化字符串

```
OC:
NSInteger index = 1;
NSString *str1 = [NSMutableString stringWithFormat:@"http://ios.itcast.cn/pic/%tu.png", index];
NSLog(@"%@", str1);

Swift:
var index = 1
var str3 = "http://www.520it.com/pic/\(index).png"
print(str3)
```
- 字符串比较

```
OC:
NSString *str1 = @"abc";
NSString *str2 = @"abc";
if ([str1 compare:str2] == NSOrderedSame)
{
    NSLog(@"相等");
}else
{
    NSLog(@"不相等");
}

if ([str1 isEqualToString:str2])
{
NSLog(@"相等");
}else
{
NSLog(@"不相等");
}

Swift:(== / != / >= / <=), 和C语言的strcmp一样是逐个比较
var str4 = "abc";
var str5 = "abc";
if str4 == str5
{
    print("相等");
}else
{
    print("不相等");
}

var str6 = "abd";
var str7 = "abc";
if str6 >= str7
{
    print("大于等于");
}else
{
    print("不大于等于");
}

```
- 判断前后缀

```
OC:
NSString *str = @"http://adobeios.com/";
if ([str hasPrefix:@"http"]) {
    NSLog(@"是url");
}

if ([str hasSuffix:@".com"]) {
    NSLog(@"是天朝顶级域名");
}
Swift:
var str8 = "http://adobeios.com/"
if str8.hasPrefix("http") {
    print("是url");
}

if str8.hasSuffix(".com") {
    print("是顶级域名");
}
```
- 大小写转换

```
OC:
NSString *str = @"abc.txt";
NSLog(@"%@", [str uppercaseString]);
NSLog(@"%@", [str lowercaseString]);

Swift:

var str9 = "abc.txt";
print(str9.uppercaseString)
print(str9.lowercaseString)
```
- 转换为基本数据类型

```
OC:
NSString *str = @"250";
NSInteger number = [str integerValue];
NSLog(@"%ld", number);

Swift:
var str10 = "250"
// 如果str不能转换为整数, 那么可选类型返回nil
// str = "250sb" 不能转换所以可能为nil
var number:Int? = Int(str10)
if number != nil
{
    print(number!)
}
```


