//实例方法
/**
 * 对象上的实例方法可以访问实例变量
 */
import 'dart:math';

class Point {
  num x, y;
  Point(this.x, this.y);

  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}


//Getters 和 Setters 方法
/**
 * getter和setter是对对象属性的读写访问的特殊方法
 * 回想一下, 每个实例变量都有一个隐式的getter 如果需要的话还可以加上一个setter
 * 使用get和set关键字来实现getter和setter方法可以来读写其他属性
 */

class Rectangle {
  num left, top, width, height;
  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}


//抽象方法
/**
 * 实现方法 getter和setter方法可以是抽象方法
 * 只定义一个接口 但是将具体实现留给其他类
 * 抽象方法只能存在于抽象类之中, 抽象方法是没有方法体的
 */

abstract class Doer {
  void doSomething();
}

class EffectiveDoer extends Doer {
  void doSomething() {

  }
}
