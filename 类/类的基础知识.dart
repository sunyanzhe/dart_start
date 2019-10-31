/**
 * Dart是一种面向对象的语言, 具有类和基于mixin的继承.
 * 每个对象都是一个类的实例,所有的累都是Object的子类
 * 基于mixin的继承意味着,尽管每个类(除了Object)都是只有一个超类, 但类主题可以在多个类层次结构中重用
 */

//使用类成员
/**
 * 对象具有由函数和数据(分别是方法和实例变量)组成的成员
 * 当您调用一个方法时, 您在一个对象上调用它: 该方式可以访问该对象的函数和数据
 */
Function aa() {
  var p = Point(2, 2);
  p.y = 3;
  assert(p.y == 3);

  num distance = p.distanceTo(Point(4, 4));
}


//使用构造函数
/**
 * 可以使用构造函数创建一个对象
 * 构造函数名可以使ClassName或ClassName.identifier
 */

void main2() {
  var p1 = Point(2, 2);
  var p2 = Point.fromJson({'x': 1, 'y': 2});
}

//下面的代码具有相同效果, 但是在构造函数名之前使用可选的new关键字

void main3() {
  var p1 = new Point(2, 2);
  var p2 = new Point.fromJson({'x': 1, 'y': 2});
}
//版本注意事项: 在Dart2中new关键字为可选关键字

//有些类提供常量构造函数. 要是用常量构造函数创建编译时变量, 请将const关键字放在构造函数名之前
void main4() {
  var p = const ImmutablePoint(2, 2);
}

//构造两个相同的编译时常量会生成一个单一的 规范的实例
void main5() {
  var a = const ImmutablePoint(2, 2);
  var b = const ImmutablePoint(2, 2);
  assert(identical(a, b));    //They are the same instance!
}

//在常量上下文中, 可以在构造函数或文字之前省略const
const pointAndLine = const {
  'point': const [const ImmutablePoint(0, 0)],
  'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
};

//除了第一次使用const关键字之外其他的const都可以省略:
const pointAndLine = {
  'point': [ImmutablePoint(0, 0)],
  'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
};

//实例变量
//下面是如何声明实例变量的方法
class Point {
  num x, y, z = 0;
}

//所有未初始化的实例变量都具有null值
//所有实例变量都生成隐式getter方法
//非最终实例变量也生成隐式setter方法

class Point1 {
  num x;
  num y;
}

void main11() {
  var point = Point();
  point.x = 4;
  assert(point.x == 4);   
  assert(point.y == null);
}

//如果在声明实例变量的地方(而不是在构造函数或方法中)初始化实例变量
//则在创建实例时(在构造函数及其初始化列表执行之前)设置该值