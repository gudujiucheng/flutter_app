void main() {
  //变量
  var name = 'zhangcan';
  var name02 = "zhangcan";
  //可以明确指明类型（单引号和双引号，都可以用来表示字符串）
  String name03 = "zhangcan";
  String name04 = 'zhangcan';
  //不指定类型
  dynamic name05 = '李四';
  Object name06 = '李四';
  print(name06);

  //被final或者const修饰的变量，变量类型可以省略。
  final name1 = "张三";
//final String name1  = "张三";

  const name2 = "李四";
//const String name2 = "李四";

  //创建一个int类型的list
  List list = [10, 7, 23];
  print(list);
  //[10, 7, 23]

  //map
  Map companys = {'first': '阿里巴巴', 'second': '腾讯', 'fifth': '百度'};
  companys[4] = 'xxxx'; //支持不同类型的key
  companys[5] = null; //支持null
  companys[6] = ""; //支持空
  print(companys);
  //{first: 阿里巴巴, second: 腾讯, fifth: 百度, x: xxxx}

  Map companys1 = new Map();
  companys1['first'] = '阿里巴巴';
  companys1['second'] = '腾讯';
  companys1['fifth'] = '百度';
  print(companys1);
  //打印结果 {first: 阿里巴巴, second: 腾讯, fifth: 百度}

  //运算符
  String expr1 = "haha";
  String expr2 = "123123";
  bool condition = false;

//  如果为空 操作符，类似三元运算符的使用方法
  //如果expr1非空，则返回其值; 否则，评估并返回expr2的值。
  String x = expr1 ?? expr2;
  print(x);

  var str = "";
  test(1);
}

void test(int str) {
  print(str);
}
//上面的函数只有一个表达式的时候，也可以这么简写
void testJx(int str) =>  print(str);

//链式调用
void testLS(){
//  querySelector('#confirm') // Get an object.
//    ..text = 'Confirm' // Use its members.
//    ..classes.add('important')
//    ..onClick.listen((e) => window.alert('Confirmed!'));

}


