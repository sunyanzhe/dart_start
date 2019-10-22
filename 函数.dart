import 'dart:html';

/**
 * Dart是一种真正的面向对象语言, 所以即使函数也是对象, 具有类型和功能
 * 这意味着函数可以分配给变量或作为参数传递给其他函数
 * 还可以像调用函数一样调用Dart类的实例
 */
bool isNodble(int atomicNumber) {
  var _nobleGases = {};
  return _nobleGases[atomicNumber] != null;
}

//尽管Effective Dart建议对公共api使用类型注释, 但是如果您省略了类型,这个函数仍然可以工作
isNoble(atomicNumber) {
  var _nobleGases = {};
  return _nobleGases[atomicNumber] != null;
}

//对于质保函一个表达式的函数,可以使用简写语法
bool isNoble1(int atomicNumber) => atomicNumber == 1;


//函数可以有两种类型的参数: 必需和可选.
//首先列出必须的参数, 后边是任何可选参数. 命名可选参数也可以标记为@required

/**
 * 可选参数
 * 可选参数可以是位置参数, 也可以是命名参数, 但不能两者都是
 */


//可选的命名参数
//在调用函数时,可以使用paramName: value来指定命名参数.
// enableFlags(bold: true, hidden: false);

//在定义函数时, 使用{param1, param2}来制定命名参数:
// void enableFlags({bool bold, bool hidden}) {}

//Flutter实例创建表达式可能会变得复杂, 因此小部件构造函数只是用命名参数
//这使得实例创建表达式更容易阅读

//可以在任何Dart代码(不仅仅是Flutter)中注释一个已命名的参数, 并使用@required说明他是一个必传参数

//const Scrollbar({Key key, @required Widget child})

//当构造Scrollbar时, 分析器在没有子参数时报错


//可选的位置参数
//在[]中包装一组函数参数, 标记为可选的位置参数
String say(String from, String msg, [String device]) {
  var result = '$from say $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

//这里有一个调用这个函数的例子, 没有可选参数:
void mainn() {
  assert(say('Bob', 'Howdy') == 'Bob says Howdy');
}

//这里有一个用第三个参数调用这个函数的例子:
void main1() {
  assert(say('Bob', 'Howdy', 'smoke signal') == 'Bob says Howdy with a smoke signal');
}


//默认参数值
//您的函数可以使用 = 来定义命名和位置参数的默认值
//默认值必须是编译时常量. 如果没有提供默认值, 则默认值为null
//下面是命名参数设置默认值的示例

void enableFlags1({bool bold = false, bool hidden = false}) {}

void main2() {
  enableFlags1(bold: true);
}

//下一个示例展示了如何设置位置参数的默认值
String say1(String from, String msg,
    [String device = 'carrier pigeon', String mood]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }
  return result;
}


//还可以将list或map集合作为默认值
//下面的示例定义一个函数doStuff(), 该函数制定列表参数的默认列表和礼品参数的默认map集合
void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  print('list: $list');
  print('gifts: $gifts');
}

/**
 * main 函数
 * 每个应用程序都必须要有一个顶级的main函数
 * 他作为应用程序的入口点. main函数返回void,并有一个可选的列表参数作为参数
 * 下面是web应用程序的main函数示例
 */
void main() {
  querySelector('#sample_text_id')
    ..text = 'Click me!'
    ..onClick.listen(print);
}
//注意: 代码前的(..)语法被称为级联. 使用级联,可以对单个对象的成员执行多个操作

//下面是一个命名应用的main()函数示例,
void main3(List<String> arguments) {
  print(arguments);
  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
}
//你可以使用args库来定义和解析命令行参数


/**
 * 函数是一等公民 (Functions as first-class objects)
 */

//可以将函数作为参数传递给另一个函数
void kk() {
  void printElement(int element) {
    print(element);
  }

  var list = [1,2,3];
  list.forEach(printElement);
}

//你也可以为变量分配一个函数
void mm() {
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');
}

/**
 * 匿名函数
 * 
 * 大多数函数都被命名, 如main()或者printElement()
 * 你也可以创建一个没有函数名称的函数, 这种函数称为匿名函数, 或者lambda函数或者闭包函数
 * 您可以为变量分配一个匿名函数, 例如, 您可以从集合中添加或删除它
 * 匿名函数看起来类似于命名函数——有0个或多个参数, 在括号之间用逗号和可选类型标注分隔
 * 最后的代码块包含函数的主体
 * ([[Type] param1[, ...]]) {
 *    codeBlock;
 * }
 */

//下面的示例定义了一个带有无类型参数item的匿名函数
//该函数为列表中的每个item调用, 打印一个字符串, 该字符串包含指定索引的值

void kka() {
  var list = ['apples', 'bananas', 'oranges'];
  list.forEach((item) {
    print('${list.indexOf(item)}: $item');
  });
}


/**
 * 词法作用域
 * Dart是一种在词法上确定范围的语言, 这意味着变量的范围是静态的, 仅仅是通过代码的布局来决定
 * 你可以'跟随花括号向外'以查看变量是否在范围内
 * 这里有一个嵌套函数的例子,每个作用于级别上都有变量
 */
bool topLevel = true;
void main4() {
  var insideMain = true;
  void myFunction() {
    var insideFunction = true;
    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}
//请注意nestedFunction如何使用从每个级别到顶层的变量


/**
 * 词法闭包
 * 闭包是一个函数对象,它可以访问其词法范围内的变量, 及时函数再其原始范围之外使用
 * 函数可以关闭周围作用域中定义的变量. 在下面的事例中 makeAdder()不好变量addBy
 * 无论返回的函数到哪里, 他都会记住addBy
 */

Function makeAder(num addBy) {
  return (num i) => addBy + 1;
}

void main5() {
  var add2 = makeAder(2);
  var add4 = makeAder(4);

  assert(add2() + add4() == 8);
}


/**
 * 判断函数相等
 * 下面是一个测试顶级函数, 静态方法和相等实例方法的示例
 */

void foo() {}   //A top-level function

class A {
  static void bar() {}
  void baz() {}
}

void main6() {
  var x;

  x = foo;
  assert(foo == x);

  x = A.bar;
  assert(A.bar == x);

  var v = A();
  var w = A();
  var  y = w;
  x = w.baz;

  assert(y.baz == x);
  assert(v.baz != w.baz);
}

/**
 * 返回值
 * 所有函数都返回一个值, 如果没有指定返回值, 则语句返回null, 隐式附加到函数体
 */
void foo2() {}
// assert(foo2() == null);