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

/**
 * 正如前面的代码所示, 您可以使用on或catch或both
 * 在需要指定异常类型时使用 当您的异常处理程序需要异常对象时, 请使用catch
 * 可以指定catch()的一个或两个参数,第一个是抛出的异常,第二个是堆栈跟踪(StackTrace对象)
 */
void main3() {
  try {

  } on Exception catch (e) {
    print('Exception details: \n $e');
  } catch (e, s) {
    print('Exception details: \n $e');
    print('Stach trace:\n $s');
  }
}

//要在捕获中处理异常, 同时允许其继续传播, 请使用rethrow关键字
void misbehave() {
  try {
    dynamic foo = true;
    print(foo++);   //Runtime error
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}');
    rethrow;    //Allow callers to see the exception
  }
}

void main() {
  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}');
  }
}

//Finally
//要确保在抛出异常时运行某些业务代码, 请使用finally子句.
//如果没有catch子句匹配异常,则在finally子句运行后传播异常

try {
  breedMoreLlamas();
} finally {
  cleanLlamaStalls();
}


//finally子句在所有匹配到的catch子句之后运行
try {
  breedMoreLlamas();
} catch (e) {
  print('Error: $e');
} finally {
  cleanLlamaStalls();
}
