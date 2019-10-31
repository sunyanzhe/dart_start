//Exception
/**
 * 你的dart代码可以抛出和捕获异常
 * 异常是指程序执行中发生的意料之外的错误. 如果没有捕获异常, 引发异常的隔离程序将被挂起, 通常隔离程序及其程序将被中止
 * 与Java相反,Dart的所有异常都是未检查的异常. 方法不声明他们可能抛出那些异常, 也不要求您捕获任何异常
 * Dart提供Exception和Error类型, 以及许多预定义的子类型, 当然你可以自己定义异常
 * 但是, Dart程序可以抛出任何非空对象不仅仅是异常和错误对象
 */

//Throw
/**
 * 这里有一个抛出或挂起异常的例子
 * throw FormatException('Expected at least 1 section');
 * 
 * 你也可以抛出任意对象
 * throw 'Out of llamas!';
 * 
 * 注意: 在正式使用中通常抛出的是实现了Error或Exception类型的对象
 * 
 * 因为抛出异常是一个表达式, 可以在 => 语句中抛出异常, 也可以在任何允许表达式的地方抛出异常
 */
void distanceTo(String other) => throw UnimplementedError();


//Catch
/**
 * 捕获异常将阻止异常传播(除非重新抛出异常). 捕获异常后 我们可以去判断并处理相应的异常
 * 如果catch子句没有指定类型, 则该子句可以处理任何类型的抛出对象
 */
void main2() {
  try {
    breeMoreLlamas();
  } on OutOfLlamsException {
    buyMoreLlamas();
  } on Exception catch (e) {
    print('Unkown exception: $e');
  } catch (e) {
    print('Something really unknow: $e');
  }
}

