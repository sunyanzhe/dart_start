var name = 'Bob';
//变量是一个引用. 上面名字为name的变量引用了一个内容为'Bob'的String对象
  var foo = const [];

void main() {
  int lineCount;
  assert(lineCount == null);  // true
  //没有初始化的变量自动获取默认值为null.类型为数字的变量如何没有初始化其值也是为null, 不要忘记了数字类型也是对象
  //注意: 在生产模式assert()语句会被忽略.在检查模式assert()会执行
  foo = [];

}

String name2 = "bib";
//可选类型
//在声明变量的时候,你可以选择加上具体类型
//添加类型可以更清晰的表达你的意图

final name3 = 'Bob';
//Final和Const
//如果你以后不打算修改一个变量,使用final和const.
//一个final变量只能赋值一次, 一个const变量是编译时的变量
//顶级的final变量或者类中的final变量第一次使用的时候就会初始化

const bar = 10000;
const atm = 1.01325 * bar;

//const变量为编译时常量
//如果const变量在类中,请定义为static const
//可以直接定义const和其值, 也可以定义一个const变量使用其他const变量的值来初始化其值

final bar1 = const [];
final baz1 = const [];

//const关键字不仅仅只用来定义变量,还可以用来创建不变的值,还能定义构造函数为const类型的
