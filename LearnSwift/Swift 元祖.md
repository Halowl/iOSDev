# Swift 元祖

###元祖的概念
- 在其它语言中很找早就有元祖这个概念,但是对于OC程序员来说这是一个新的概念
- 将多个相同或者不同类型的值用一个小括号括起来就是一个元祖

```
let cat = ("xixi",3,5.3)
```
- 元祖其实是复合类型,小括号中可以写任何类型

```
let cat: (String, Int, Double) = ("xixi", 3 ,5.3)
```

###元祖的定义
- 常用方式

```
let cat = ("xixi",3,5.3)
print(cat)
print(cat.0)
print(cat.1)
print(cat.2)
```
- 指明应用元祖元素的名称

```
let cat = (name:"xixi",age:3,weight:5.3)
print(cat)
print(cat.name)
print(cat.age)
print(cat.weight)
```
- 指定的名称进取元祖对应的值,会将对应位置的值 赋值给对应位置的名称

```
let (name,age,weight)  = ("xixi",3,5.3)
print(name)
print(age)
print(weight)
```

- 如果不关心元祖的某个值可以利用_通配符来忽略提取

```
let (name,age,_)  = ("xixi",3,5.3)
print(name)
print(age)
```


