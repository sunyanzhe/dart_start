//定义一个方法
printNumber(num aNumber) {
  print('The number is ${aNumber + 1}');
}
//这是程序执行的入口
void main() {
  var number = 2;   //定义并初始化一个变量
  printNumber(number);//调用一个方法
}

/**
 * num
 * 一个类型.String,init和bool是另外几种类型
 *
 * 42
 * 一个数字字面量,数字字面量是编译时常量
 * 
 * print
 * 一种打印内容的助手方法
 * 
 * $variableName or(${expression})
 * 字符串插值: 在字符串字面量中引用变量或者表达式,
 * 
 * main()
 * Dart程序执行的入口方法,每个程序都需要这样一个方法
 * 
 * var
 * 一种不指定类型声明变量的方式
 */

/**
 * 
 * 重要概念
 * 1.所有能够使用变量引用的都是对象,每个对象都是一个类的实例.在Dart中,数字 方法 null都是对象. 所有对象都继承Object类
 * 2.使用静态类型(上一实例中的num)可以更清晰的表达你的意图, 并且可以让静态分析工具来分析你的代码,但并不是强制性的(在调试代码的时候你可能注意到 没有指定类型的变量类型为dynamic)
 * 3.Dart在运行之前会解析你的代码, 你可以通过使用类型或者编译时常量来帮助Dart去捕获异常以及让代码变得更高效
 * 4.Dart支持顶级方法(例如main()),同时还支持在类中定义函数(静态函数和实例函数).你还可以在方法中定义方法(嵌套方法或者局部方法)
 * 5.同样Dart还支持顶级变量,以及在类中定义变量(静态变量和实例变量). 实例变量有时候被称之为域(Fields)或者属性(properties)
 * 6.同java不同的是,Dart没有public, protected和private关键字. 如果一个标识符以(_)开头,则该标识符在库内就是私有的,
 * 7.标识符可以以字母和下划线_开头,右面可以是其他字符和数字组合
 * 8.有时候表达式expression和语句statement是有区别的, 所以这种情况我们分别指明每种情况
 * 9.Dart工具可以指出两种问题: 错误和警告. 警告只是说你的代码可能有问题,但是并不会阻止你的代码执行. 错误可以是编译时错误也可以是运行时错误. 遇到编译错误时,代码将无法执行. 运行时错误将会在运行代码的时候导致一个错误
 * 
 */
sunyanzhe