import 'dart:math';
/**
 * 通过创建一个与类同名的函数来声明构造函数(另外, 还可以像[命名构造函数]中描述的一样选择一个附加标识符)
 * 构造函数最常见的应用形式是使用构造函数生成的一个类的新实例:
 */
class Point {
  num x, y;
  
  Point(num x, num y) {
    this.x = x;
    this.y = y;
  }
}

//this指向当前实例
//注意:只有在名称冲突时才使用它。否则，Dart的代码风格需要省略this

//使用构造函数的参数为实例复制的使用非常常见, Dart具有语法上的优势, 是这种使用更容易实现
class Point2 {
  num x, y;
  Point2(num this.x, this.y);
}


//默认构造函数
/**
 * 如果不声明构造函数, 则提供默认构造函数
 * 默认鼓噪函数没有参数, 并在超类中调用无参构造函数
 */

//构造函数不是继承
/**
 * 子类不从父类继承构造函数
 * 没有声明构造函数的子类只有默认的构造函数(没有参数, 没有名称) 而不是从父类继承的构造函数
 */

//命名的构造函数
/**
 * 使用命名构造函数可以在一个类中定义多个构造函数
 * 或者让一个雷的作用对于开发者来说更清晰
 */

class Point3 {
  num x, y;
  Point3(this.x, this.y);

  //Named constructor
  Point3.origin() {
    x = 0;
    y = 0;
  }
}

/**
 * 一定要记住构造函数是不会从父类继承的, 这意味着父类的命名构造函数子类也不会继承
 * 如果你希望使用超赖种定义的命名构造函数来创造子类, 则必须在子类中实现该构造函数
 */



//调用非默认的超类构造函数
/**
 * 默认情况下, 子类中的构造函数调用父类的未命名的无参数构造函数
 * 父类的构造函数在构造函数体的开始处被调用
 * 如果类中有使用初始化列表, 初始化列表将在调用超类之前执行
 * 
 * 执行顺序如下:
 * 1.初始化列表
 * 2.超类中的无参数构造函数
 * 3.main类中的无参数构造函数
 * 
 * 如果超类没有未命名的无参数构造函数, 则必须手动调用超类中的一个构造函数
 * 在冒号(:)之后, 在构造函数体(如果有的话)之前指定超类构造函数
 */
class Person {
  String firstName;
  dynamic x, y;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

main() {
  var emp = new Employee.fromJson({});
  if (emp is Person) {
    emp.firstName = 'Bob';
  }
  (emp as Person).firstName = 'Bob2';
}
//因为父类构造函数的参数是在调用构造函数之前执行的, 所以参数可以使表达式, 比如函数调用
Map getDefaultData() => {};

class Employee2 extends Person {
  Employee2() : super.fromJson(getDefaultData());
}

//警告: 在超类的构造函数的参数中不能使用this关键字. 例如, 参数可以调用static方法但是不能调用实例方法


//初始化列表
/**
 * 除了调用超类构造函数之外, 还可以在构造函数主体运行之前初始化实例变量
 * 初始值设定项用逗号分开 
 */

class Person2 {
  num x, y;
  Person2.fromJson(Map<String, int> json)
    : x = json['x'],
      y = json['y'] {
        print('$x, $y');
  }

}

//在开发期间, 可以通过在初始化列表中使用assert来验证输入
class Person3 {
  num x, y;
  Person3.withAssert(this.x, this.y) : assert(x > 0) {
    print('$x, $y');
  }
}

// 初始化列表在设置final字段时很方便
class Point4 {
  final num x;
  final num y;
  final num distanceFromOrigin;
  
  Point4(x, y) :
    x = x,
    y = y,
    distanceFromOrigin = sqrt(x * x + y * y);
}


//重定向构造函数
/**
 * 有时, 构造函数的唯一目的是重定向到同一个类的另一个构造函数
 * 重定向构造函数的主体为空, 构造函数调用出现冒号(:)之后
 */
class Point5 {
  num x, y;
  Point5(this.x, this.y);
  Point5.alogXAxis(num x) : this(x, 0);
}


//常量构造函数
/**
 * 如果您的类生成的对象不会改变, 您可以使这些对象成为编译时常量
 * 为此, 定义一个const构造函数, 并确保所有实例变量都是final的
 */

class ImmutablePoint {
  static final ImmutablePoint origin = 
      const ImmutablePoint(0, 0);
  final num x, y;
  const ImmutablePoint(this.x, this.y);
}

//工厂构造函数
/**
 * 在实现构造函数时使用factory关键字, 该构造函数并不总是创建类的新实例
 * 例如, 工厂构造函数可以从缓存返回实例, 也可以返回子类型的实例
 */

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    if(_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger  = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

    Logger._internal(this.name);

    void log(String msg) {
      if (!mute) print(msg);
    }
}
//注意工厂函数不能访问this关键字
