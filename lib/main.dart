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
//          child: new Text(wordPair.asPascalCase),//调用驼峰格式
          child: new RandomWords(),//调用驼峰格式
        ),
      ),
    );
  }
}



// StatelessWidget 是不可变的，意味着属性不能改变，所有的值都是最终的
// StatefulWidget 在生命周期内是可以变的，实现一个StatefulWidget 至少需要两个类
//1、StatelessWidget
//2、State类 StatelessWidget本身是不变的，但是 state在weight声明周期始终存在

class RandomWords extends StatefulWidget{
  @override
  createState()=>new RandomWordsState();

}

//该类持有 RandomWords weight 的状态
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    var wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}
