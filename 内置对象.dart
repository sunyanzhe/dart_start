/**
 * 内置对象
 * Dart内置支持下面这些类型
 * 1.number
 * 2.strings
 * 3.booleans
 * 4.lists(也被成为arrays)
 * 5.maps
 * 6.runes(用于在字符串中表示Unicode字符)
 * 7.symbols
 * 
 * 
 * 你可以直接使用字面量来处事刷上面的这些类型,例如'this is a string'是一个字符串字面量,true时一个布尔字面量
 * 由于Dart中每个变量引用都是一个对象-一个类的实例,你通常使用构造函数来初始化变量.
 * 一些内置的类型具有自己的构造函数.
 * 例如, 可以使用Map()构造函数来创建一个map,就像这样new Map()
 */

import 'dart:_js_helper';

/**
 * Number
 * Dart的数字有两种形式:
 * 
 * int
 * 根据平台不同, 整数值不大于64位.
 * 
 * double
 * 64位浮点数 有IEEE 754标准制定
 * int和double都是num的子类型
 * num类型包括基本的操作符, 如 + - / * 您还可以在其中找到abs() ceil()和floor()等方法
 * (位运算符, 如>> 在init类中定义)
 * 如果num及其子类型没有您要查找的的内容 那么 dart:math library可能会有
 * 
 * 整数是没有小数点的数
 */

//如果一个数字包含一个小数, 他就是双精度数

void main() {
  int x = 1;
  int hex = 0xDEADBFF;
  double y = 1.1;

  //String -> int
  var one = int.parse('1');
  var onePointOne = double.parse('1.1');

  String oneAsString = 1.toString();
  String piAsString = 3.14159.toStringAsFixed(2);     //3.14
  
  //int类型制定传统的(<<, >>)和(&),或(|)位操作符
  assert((3 << 1) == 6);
  assert((3 >> 1) == 1);
  assert((3 | 4) == 7);

  //数字字面量是编译时常,许多算数表达式也是编译时常量,只要它们的操作数是编译时常量,可以对数字求值
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;

}

/**
 * 字符串
 * Dart字符串是UTF-16编码单元的序列. 您可以使用单引号或双引号创建一个字符串
 * 
 */
void str() {
  var s1 = 'Sing quotes work well for string literals.';
  var s2 = "Double quotes work just as well";
  var s3 = 'It\'s esay to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";
//您可以使用${expression}将表达式的值放入字符串中.
//如果表达式是一个标识符, 可以跳过{}. 为了获得与对象对应的字符串, Dart调用对象的toString()方法
  var s = 'string interpolation';

  assert("Dart has $s, which is ver handy" == 'Dart has string interpolation, which is very handy');
  assert('That deserves all caps. ${s.toUpperCase()} is very handy' == 'That deserves all caps. STRING INTERPOLATION is very handy');

}

//您可以使用相邻的字符串字面量 或 + 运算符链接字符串
void str2() {
  var s = 'String'
      ' concatenation'
      ' works even over line breaks.';
  assert (s == 'String concatenation works even over line breaks');

  var s2 = 'The + operator ' + 'works, as well.';
  assert (s2 == 'The + operator works, as well.');

  //另一种创建多行字符串的方法: 使用带有单引号或者双引号的三重引号
  var s3 = '''
    You can create
    multi-line strings like this one.
    ''';
  var s4 ="""This is also a
    multi-line string.
    """;
  
  //可以使用r前缀创建一个'原始'字符串
  var s5 = r'In a raw string, not even \n gets special treatment.';

  //有关如何在字符串中表示Unicode字符的详细信息, 请参见[Runes]
  //字符串字面量是编译时常量, 只要任何内查表达式都是编译时常量, 计算结果为null或数值 字符串或布尔值
  
  //These work in a const string
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

  //These do NOT work in a const string.
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];

  const validConstString = '$aConstNum $aConstBool $aConstString';
}

/**
 * 
 * Booleans
 * 为了表示布尔值, Dart有一个名为bool的类型 只有两个对象具有bool类型: 布尔字面量true和false 他们都是编译时常量
 * 
 * Dart的类型安全性意味着您不能使用if(非booleanvalue)或assert(非booleanvalue)之类的代码
 * 相反, 显式地检查值如:
 */
void boolean() {
  var fullName = '';
  assert(fullName.isEmpty);

  //Check for zero
  var hitPoints = 0;
  assert(hitPoints <= 0);

  //Check for null
  var unicorn;
  assert(unicorn == null);

  //Check for NaN
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);
}


/**
 * List
 * 也许几乎所有编程语言中最常见的合计就是数组或有序对象组
 * 在Dart中, 数组是列表对象, 所以大多数人把他们叫做列表
 * Dart列表字面量看起来像JavaScript数组字面量.这是一个简单的Dart列表
 */

void list() {
  var list = [1, 2, 3];
  // 注意: 分析器推断该列表具有List<int>类型. 如果试图向此列表添加非整形对象, 则分析器或运行时将引发错误
  
  //列表使用基于0的索引, 其中0是第一个元素和列表的索引. [长度 - 1]是最后一个元素的索引
  //您可以获取列表的长度, 并引用列表元素, 就像在JavaScript中那样
  assert(list.length == 3);
  assert(list[1] == 2);
  
  list[1] = 1;
  assert(list[1] == 1);
  //要创建一个编译时常量列表, 请在列表字面量之前添加const:
  var constantList = const [1, 2, 3];
  // constantList[1] = 1;     //Uncommenting this causes an error

  //列表类型有许多便于操作列表的方法
}

/**
 * Maps
 * 在很多地方将maps翻译为映射, 但是由于人们对于英语单词的第一释义并不是很好理解
 * 所以在本文档中我对maps没有做翻译, 把他理解为一种数据类型就行
 * 
 * 通常, map是一个关联键和值的对象.
 * 键和值都可以是任何类型的对象.
 * 每个键只出现一次, 但是您可以多次使用相同的值
 * Dart对map的支持是通过map字面量和map类型来提供的
 * 这里有两个简单的Dart map类型, 使用map字面量创建
 */

void map() {
  var gifts = {
      'first': 'partridge',
      'second': 'turtledoves',
      'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon'
  };

  //注意: 解析器推断gifts的类型为 Map<String, String>, nobleGases的类型为Map<int String>
  //如果您试图向map添加错误的类型值, 则分析器或运行时将引发错误.

  //在现有的map中添加一个新的键值对, 就像在JavaScript中那样:
  gifts['fourth'] = 'calling birds';

  //从map中检索值的方式与在JavaScript中一样
  assert(gifts['first'] == 'partridge');

  //如果你要获取的键不在map中, 将会返回一个null
  assert(gifts['sixth'] == null);

  //使用length获取map中元素的个数
  assert(gifts.length == 3);

  //要创建一个编译时常量的map需要在map的字面量前加const关键字

  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon'
  };
  // constantMap[2] = 'Helium';   //Uncommenting this causes an error;
}


/**
 * Runes(字符)
 * 在Dart中, 字符是字符串的UTF-32编码点
 * Unicode为世界所有的书写系统中使用的每个字母,数字和符号定义一个唯一的数值
 * 因为Dart字符串是UTF-16代码单元的序列, 所以在字符串中表示32位的Unicode值需要特殊的语法
 * 表示Unicode码点的常用方法是\uXXXX, 其中XXXX是4位数的十六进制值
 * 例如,心形字符(♥)的编码为\u2665
 * 要指定大于或小于4位十六进制数字, 请将值放在花括号中
 * 例如笑脸表情😆的编码\u{1f600}
 * 
 * String类有几个属性可以用来获取runes信息, codeUnitAt和codeUnit返回16位代码单元
 * 使用字符属性获取字符串的字符
 * 下面说明了 字符 16位代码单元和32位单面单元之间的关系
 */
void runes() {
  var clapping = '\u{1f600}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = new Runes(
    '\u2665 \u{1f605} \u{1f60e} \u{1f596} \u{1f44d}');
      print(new String.fromCharCodes(input));
}
//注意: 使用列表操作runes是要小心. 根据特定的语言 字符集和操作, 这种方法很容易出错

/**
 * Symbols (符号)
 * 符号对象表示在Dart程序中声明的操作符或标识符
 * 您可能用户按不需要使用符号, 但是对于按名称引用标识符的api来说, 他们是非常重要的, 因为缩小改变了标识符名称而不是标识符符号
 * 要获取标识符的符号, 请使用符号文字, 符号文字仅为#, 后面跟着标识符
 * #radix
 * #bar
 * 符号常量是编译时常量
 */