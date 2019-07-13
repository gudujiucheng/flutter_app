import 'package:flutter/material.dart';
import 'package:flutter_app/page/fql/fql_about/fql_about_page.dart';
import 'package:flutter_app/page/weight/list_page/list_page.dart';

void main() => runApp(new MyApp()); //dart 中单行函数的写法

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Demo title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //应用主题，里面包含很多属性可控
        primaryColor: Colors.white,
      ),
      home: MyHomePage(title: '首页'),
      routes: routers,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var routeLists = routers.keys.toList();
    return Scaffold(
      //这是个脚手架，用来绘制内部的一些元素
      appBar: new AppBar(
        leading:
            new IconButton(icon: new Icon(Icons.arrow_back), onPressed: _back),
        title: new Text(widget.title),
        centerTitle: true,
        //添加个按钮
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _jumpTest),
        ],
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: new Card(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: new Text(routeLists[index]),
                ),
              ),
            );
          },
          itemCount: routers.length,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _back() {
    Navigator.pop(context);
  }

  void _jumpTest() {
    Navigator.of(context).push(
      //入栈（就是将另外一个页面加入）
      //新页面的内容在在MaterialPageRoute的builder属性中构建，builder是一个匿名函数。
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            body: new FqlAboutPage(),
            backgroundColor: Color(0xffffffff),
          );
        },
      ),
    );
  }
}



Map<String, WidgetBuilder> routers = {
  "widget/fql_about": (context) {
    return new FqlAboutPage();
  },
  "widget/list": (context) {
    return new ListDemoPage();
  }
};
