import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_app/bean/about_item.dart';

void main() => runApp(new MyApp()); //dart 中单行函数的写法

class MyApp extends StatelessWidget {
  //继承了一个weight  StatelessWidget
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '应用程序的标题', //没有看到再什么地方展示的

      theme: new ThemeData(
        //应用主题，里面包含很多属性可控
        primaryColor: Colors.white, //将应用的主题改变成红色
      ),

      home: new HomeWeight(), //这里是指定一个weight对象，用来定义应用打开时候的默认页面
    );
  }
}

// StatelessWidget 是不可变的，意味着属性不能改变，所有的值都是最终的
// StatefulWidget 在生命周期内是可以变的，实现一个StatefulWidget 至少需要两个类
//1、StatelessWidget
//2、State类 StatelessWidget本身是不变的，但是 state在weight声明周期始终存在

class HomeWeight extends StatefulWidget {
  @override
  createState() => new HomeWeightState();
}

//该类持有 RandomWords weight 的状态
class HomeWeightState extends State<HomeWeight> {
  //创建一个列表，给listiew 塞数据
  final _dataList = <AboutItem>[];

  //字体大小样式
  final _fontSize = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    _initListData();
    return new Scaffold(
      //这是个脚手架，用来绘制内部的一些元素
      appBar: new AppBar(
        leading:
            new IconButton(icon: new Icon(Icons.arrow_back), onPressed: _back),
        title: new Text("首页"),
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
        //添加个按钮
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _jumpToAbout),
        ],
      ),
    );
  }

  void _initListData() {
    if (_dataList.length > 0) {
      return;
    }
    _dataList.add(new AboutItem("分期乐介绍", "xxx"));
    _dataList.add(new AboutItem("去评分", "xxx"));
    _dataList.add(new AboutItem("用户协议", "xxx"));
    _dataList.add(new AboutItem("隐私政策", "xxx"));
  }

  void _jumpToAbout() {
    //跳转关于页面

    Navigator.of(context).push(
      //入栈（就是将另外一个页面加入）
      //新页面的内容在在MaterialPageRoute的builder属性中构建，builder是一个匿名函数。
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              leading: new IconButton(
                  icon: new Icon(Icons.arrow_back), onPressed: _back),
              title: new Text("关于分期乐"),
              backgroundColor: Color(0xffffffff),
              centerTitle: true,
            ),
            body: _createListView(),
          );
        },
      ),
    );
  }

  void _back() {
    Navigator.pop(context);
  }

  //新增函数

  Widget _createListView() {
    List<Widget> widgetList = <Widget>[];
    for (var item in _dataList) {
      widgetList.add(new ListTile(
        title: new Text(
          item.title,
          style: _fontSize,
        ),
        trailing: new Icon(
          //根据是否收藏展示图标
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
        onTap: () {
          //点击事件
          Fluttertoast.showToast(
              msg: "点击位置",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.red,
              textColor: Colors.black,
              fontSize: 16.0
          );

        },
      ));

      widgetList.add(new Divider());
    }

    return new Center(
      child: new ListView(
        children: widgetList,
      ),
    );
  }
}
