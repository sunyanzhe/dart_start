/**Assert(断言) */
//如果布尔条件为false, 则使用assert语句中断正常执行
//
void main() {
  var text = 'aaa';

  assert(text != null);

  num number = 99;
  assert(number < 100);

  String urlString = 'https://aaaa';

  assert(urlString.startsWith('https'));
}

//注意: Assert语句不会影响生产环境中的代码的执行, 它仅仅在测试环境起作用
//在Flutter的调试模式下可以使用assert
//默认情况下, 像(dartdevc typically)只支持开发环境的工具默认支持assert
//例如dart和dart2js通过命令行标记: --enable-asserts来支持asserts

//要将提示消息附加到断言, 请添加一个字符串作为第二个参数
void mains() {
  String urlString = 'https://aaaa';
  assert(urlString.startsWith('https'), 'URL ($urlString) should start with "https".');
}

//断言的第一个参数可以是任何解析为布尔值的表达式,
//如果表达式的值为true, 则断言成功并继续执行
//如果是false, 则断言失败, 并抛出异常(AssertionError)