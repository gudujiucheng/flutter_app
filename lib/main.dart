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
//      home: new Scaffold(
//        //一个weight 提供默认导航栏和标题等
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
////          child: new Text(wordPair.asPascalCase),//调用驼峰格式
//          child: new RandomWords(), //调用驼峰格式
//        ),
//      ),

     home: new RandomWords(),


    );
  }
}

// StatelessWidget 是不可变的，意味着属性不能改变，所有的值都是最终的
// StatefulWidget 在生命周期内是可以变的，实现一个StatefulWidget 至少需要两个类
//1、StatelessWidget
//2、State类 StatelessWidget本身是不变的，但是 state在weight声明周期始终存在

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

//该类持有 RandomWords weight 的状态
class RandomWordsState extends State<RandomWords> {
  //创建一个列表，给listiew 塞数据
  final _wordList = <WordPair>[];

  //set 不允许存放重复的值 （存放被收藏的单词）
  final _saved = new Set<WordPair>();

  //字体大小样式
  final _fontSize = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
//    var wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我的列表"),
        //添加个按钮
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _createListView(),
    );
  }

  void _pushSaved() {//点击事件

    Navigator.of(context).push(//入栈（就是将另外一个页面加入）
      //新页面的内容在在MaterialPageRoute的builder属性中构建，builder是一个匿名函数。
      new MaterialPageRoute(
        builder: (context) {
          //生成文字item
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _fontSize,
                ),
              );
            },
          );
          //在填充一个分割线
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  //新增函数

  Widget _createListView() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2; //除以2 返回整型，计算减去分割线数量后的实际单词数量
          if (index >= _wordList.length) {
            //不够了在继续加单词
            _wordList.addAll(generateWordPairs().take(10));
          }
          return _buildItem(_wordList[index]);
        });
  }

  Widget _buildItem(WordPair word) {
    final alreadySaved = _saved.contains(word);
    return new ListTile(
      title: new Text(
        word.asPascalCase,
        style: _fontSize,
      ),

      trailing: new Icon(//根据是否收藏展示图标
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),

      onTap: () {//点击事件
        setState(() {
          if (alreadySaved) {
            _saved.remove(word);
          } else {
            _saved.add(word);
          }
        });
      },

    );
  }
}
