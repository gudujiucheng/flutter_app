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
  sayWord("x", "哈哈哈");
  sayWord("x", "哈哈哈", "6666");
  say("x", "哈哈哈");
  //实验表明是不可以改变可变参数的顺序的
  say01("x", "哈哈哈", true);


  var list02 = [1, 2, 3];
// 把 printElement函数作为一个参数传递进来(类型要匹配)，这样居然也行，厉害了，真是万物皆对象
  list02.forEach(printElement);
}

void test(int str) {
  print(str);
}

//上面的函数只有一个表达式的时候，也可以这么简写
void testJx(int str) => print(str);
//也可以不写参数类型
void testN(str) {
  print(str);
}

//链式调用
void testLS() {
  //TODO 需要简单看下对象的写法，才能测试这个
//  querySelector('#confirm') // Get an object.
//    ..text = 'Confirm' // Use its members.
//    ..classes.add('important')
//    ..onClick.listen((e) => window.alert('Confirmed!'));
}
//[]它们标记为可选的位置参数
String sayWord(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  //x says 哈哈哈
  //x says 哈哈哈 with a 6666
  print(result);
  return result;
}

//可选位置的参数还可以设置默认值
String say(String from, String msg,
    [String device = '这里还可以设置默认值', String mood]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }
  //x says 哈哈哈 with a 这里还可以设置默认值
  print(result);
  return result;
}

String say01(String from, String msg, [device = '这里还可以设置默认值', bool mood]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }
  //是不可以改变可选参数的顺序的
  print(result);
  return result;
}


void printElement(int element) {
  print(element);
}


