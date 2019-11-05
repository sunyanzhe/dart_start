/**
 * 每个类都有隐式地定义一个接口
 * 该接口包含的所有实例成员及其实现的任何接口
 * 如果想创建一个类A, 它支持B的API而不继承B的实现, 那么类A应该实现B接口
 */

class Person {
  final _name;
  Person(this._name);
  String greet(String who) => 'Hello, $who. I am $_name';
}

class Impostor implements Person {
  get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am';
}



//一个类实现多个接口
class Point implements Comparable, Location {
  
}