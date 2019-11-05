//重写类的成员
/**
 * 子类可以覆盖实例方法 getter和setter.
 * 可以使用@override注释来知识你重写了某个成员方法
 */
class SmarTelevision extends Television {
  @override
  void turnOn() {
    //..
  }
}
//要在类型安全的代码中缩小方法参数或实例变量的类型,可以使用covariant关键字


//重写操作符
/**
 * 可以重写下面显示的操作符
 * <      +     |     []
 * >      /     ^     []=
 * <=     ~/    &     ~
 * >=     *     <<    ==
 * -      %     >>  
 * 例如, 如果定一个Vector类, 可以定义一个+方法来让两个向量相加
 */

class Vector {
  final int x, y;
  Vector(this.x, this.y);
  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);
}

void main() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));
}

/**
 * 如果重写== 还应该重写对象的hashCode getter
 */

//noSuchMethod
/**可以重写noSuchMethod方法来处理程序访问一个不存在的方法或者成员变量 */
class A {
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' + '${invocation.memberName}');
  }
}