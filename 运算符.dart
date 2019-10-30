import 'dart:html';
/**
 * Dart定义了下表显示的操作符, 你可以重写其中的许多操作符, 如可重写操作符所述
 * 
 * 一元后置操作符:        expr++  expr--  ()      []      .       ?.
 * 一元前置操作符:        -expr   !expr   ~expr   ++expr  --expr
 * 乘除运算:              *   /   %   ~/
 * 加减运算:              +     -
 * 移位运算:              <<    >>
 * 按位与:                &
 * 按位异或               ^
 * 按位或:                |
 * 关系和类型测试:         >=   >   <=   <  as  is  is!
 * 相等:                  ==    !=
 * 逻辑与:                &&
 * 逻辑或:                ||
 * 是否为null:            ??
 * 三元判断:              expr1 ? expr2 : expr3
 * 级联                   ..
 * 赋值:                  =   *=    /=    ~/=     %=    +=    -=    <<=   >>=   &=  ^=
 */


import 'dart:svg';

/**
 * 在上面的运算列表中, 每一个运算符的优先级都高于排在自己后面的运算符
 * 例如乘除运算中运算符 % 的优先级高于(并在之前执行)相等判断运算符 ==
 * 相等运算符 == 的优先级又高于逻辑与运算符 &&
 * 这种优先级意味着一下两行代码以相同的方式执行
 */

num a() {
  var n = 1, i = 1, d = 1;
  if ((n % i == 0) && (d % i == 0)) {return n;}
  if (n % i == 0 && d % i == 0) {return d;}
}
//警告: 对于在两个操作数上工作的运算符, 最左边的操作数决定使用哪个版本的运算符
//例如, 如果有一个矢量对象和一个点对象, aVector + aPoint使用矢量版本的+

/**
 * 算术运算符
 * Dart支持通常的算术运算符, 如下表所示
 * 
 * 运算符                 说明
 * 
 * +                      加法
 * -                      减法
 * -expr                  一元减号,也成为否定(与表达式的符号相反)
 * *                      乘法
 * /                      除法
 * ~/                     取整运算
 * %                      取余运算
 * 
 */

void main1() {
  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5);
  assert(5 ~/ 2 == 2);
  assert(5 % 2 == 1);

  assert('5/2 == ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');
}


/**
 * Dart还支持前缀和后缀底层和递减运算符
 * ++var          var = var + 1(表达式的值是var + 1)
 * var++          var = var + 1(表达式的值是var)
 * --var          var = var - 1(表达式的值是var - 1)
 * var--          var = var - 1(表达式的值是var)
 */

void main2() {
  var a, b;
  a = 0;
  b = ++a;
  assert(a == b);

  a = 0;
  b = a++;
  assert(a != b);

  a = 0;
  b = --a;
  assert(a == b);

  a = 0;
  b = a--;
  assert(a != b);
}


/**
 * 相等和关系运算符
 * ==             相等
 * !=             不等
 * >              大于
 * <              小于
 * >=             大于等于
 * <=             小于等于
 * 
 * 要测试连个对象x和y是否代表相同的东西, 请使用==操作符(在需要知道两个对象是否完全相同的情况下, 可以使用identical()函数)
 * ==操作符的工作原理如下:
 * 1.如果x或y为空, 如果两个都为空, 则返回true; 如果只有一个为空, 则返回false
 * 2.返回方法调用x.= (y)的结果. (==操作符是在第一个操作数上调用的方法 甚至可以覆盖许多操作符, 包括== 可以可覆盖操作符看到)
 */
void main3() {
  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);
}

/**
 * 类型测试操作符
 * as             形态转换
 * is             如果对象具有指定的类型, 则为True
 * is!            如果对象具有制定的类型, 则为False
 * 
 * 如果obj实现了T指定的接口, 则obj is T为真, 例如 obj is Object总是为真
 * 使用as操作符将对象转换为特定类型 一般来说, 您可以将其作为is测试的简写形式, 以使用该对象的表达式对对象进行测试
 */
void main4() {
  var emp = {};
  if (emp is Person) {
    //Type check
    emp.firstName = 'Bob';
  }

  (emp as Person).firstName = 'Bob';

  //注意: 代码不等效. 如果emp是null或不是Person, 那么is什么都不做; as抛出异常
}

/**
 * 赋值操作符
 * 可以使用=操作符来赋值
 * ??=操作符仅仅在变量为null时会赋值, 未初始化和后来手动赋值为null的情况都会执行此操作赋值
 * a = value;
 * 
 * 仅仅在b为空的情况下 b被赋值value否则b的值不变
 * b ??= value;
 */

//复合赋值操作符, 如+=将操作与赋值合并
/**
 *    =   -=    /=    %=    >>=   ^=
 *    +=  *=    ~/=   <<=   &=    |=
 */

/**
 * 逻辑运算符
 * 运算符                                 说明
 * !expr                                  对!后的表达式结果取反(如果表达式结果为false则表达式前加!使其变为true)
 * ||                                     逻辑或
 * &&                                     逻辑与(且)
 */


/**
 * 位和移位运算符
 * 
 * 运算符                                 说明
 * &                                      按位与
 * |                                      按位或
 * ^                                      按位异或
 * ~expr                                  按位取反
 * <<                                     
 * >>
 */


/**
 * 条件表达式
 * Dart 有两个运算符, 可以让你精确的计算那些可能需要if-else语句的表达式
 * condition ? expr1 : expr2
 * 
 * 如果条件为真, 则计算expr1(并返回其值), 否则, 计算并返回expr2的值
 * 
 * expr1 ?? expr2
 * 如果expr1 ?? expr2
 * 如果expr1是非空的, 则返回其值; 否则, 计算并返回expr2的值
 * 
 * 如果需要基于布尔表达式的结果赋值 使用 ? :
 * 
 * var cisibility = isPublic ? 'public' : 'private'
 * 
 * 如果布尔表达式只想判断值是否为null, 请考虑使用??
 * 
 * String playerName(String name) => name ?? 'Guest';
 */

//前面的例子也可以用以下另外两种方式来写, 但是不够简洁
//String playerName(String name) => name != null ? name : 'Guest'

/**
 * String playerName(String name) {
 *  if (name ! = null) {
 *    return name;
 *  } else {
 *    return 'Guest';
 *  }
 * }
 */


/**
 * 级联表示法(..)
 * 级联(..)允许您在同一个对象上创建一个操作序列,
 * 除了函数调用之外, 您还可以访问同一个对象上的字段
 * 这通常可以省去创建临时变量的步骤, 能使您更为流畅的写代码
 */
void mian3() {
  querySelector('#confirm')
    ..text = 'Confirm'
    ..classes.add('important')
    ..onClick.listen((e) => window.alert('Confirmed!'));
}

//首先调用querySelector()方法返回一个selector对象.
//跟随级联表示法的代码对这个选择器对象进行操作,忽略可能返回的任何后续值
//前面的例子等价于
void mian4() {
  var button = querySelector('#confirm');
  button.text = 'Confirm';
  button.classes.add('important');
  button.onClick.listen((e) => window.alert('Confirmed!'));
}


//你也可以嵌套级联操作. 例如

// final addressBook = (AddressBookBuilder()
//       ..name = 'jenny'
//       ..email = 'jenny@example.com'
//       ..phone = (PhoneNumberBuilder()
//             ..number = '415-555-0100'
//             ..label = 'home')
//           .build())
//       .build();


//返回实际对象的函数上构造级联要小心. 例如, 以下代码会出错
// void main5() {
//   var sb = StringBuffer();
//   sb.write('foo')
//     ..write('bar');
// }
 
//上例中sb.write()返回结果为void, 所以你不能再一个void结果上继续构建级联操作
//严格地说, 级联的".."表示法不是运算符, 只是Dart语法的一部分

/**
 * 其他运算符
 * 你已经在其他例子中看到了大多数剩余的运算符
 * ()           功能函数        表示一个函数的调用
 * []           访问列表        引用列表中制定索引处的值
 * .            访问成员        表示表达式的属性 foo.bar
 * ?.           根据条件访问成员 foo?.bar 如果foo为空则返回null
 */

class A {
  var b;
}

void main() {
  var aobj = A();
  var z = null;
  print(aobj.b);
  print(z?.b);
  print(z.b);
}

