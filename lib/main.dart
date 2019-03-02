import 'package:flutter/material.dart';

//测试引入外部包
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp()); //dart 中单行函数的写法

class MyApp extends StatelessWidget {
  //继承了一个weight  StatelessWidget
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        //一个weight 提供默认导航栏和标题等
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new Text(wordPair.asPascalCase),//调用驼峰格式
        ),
      ),
    );
  }
}
