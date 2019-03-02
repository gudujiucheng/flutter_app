import 'package:flutter/material.dart';

void main() => runApp(new MyApp());//dart 中单行函数的写法

class MyApp extends StatelessWidget {//继承了一个weight  StatelessWidget
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(//一个weight 提供默认导航栏和标题等
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ),
    );
  }
}