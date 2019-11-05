//枚举类型,通常称为枚举或枚举类型, 是一种特殊类型的类, 用于表示固定术量的常量值

//使用枚举
//使用enum关键字声明一个枚举类型
enum Color {red, green, blue}

//枚举中的每个值都有一个索引getter, 他返回enum声明中值得从0开始的位置
//例如, 第一个值有索引0,第二个值有索引1
void main1() {
  assert(Color.red.index == 0);
  assert(Color.green.index == 1);
  assert(Color.blue.index == 2);
}

//要获取枚举中所有值得列表,请使用enum的values常量
void main2() {
  List<Color> colors = Color.values;
  assert(colors[2] == Color.blue);
}

//枚举类有以下限制
//1. 不能子类化 混合或实现枚举
//2. 不能显式实例化一个枚举