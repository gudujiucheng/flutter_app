import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'bean/about_item.dart';

class FqlAboutPage extends StatefulWidget {
  @override
  createState() => new FqlAboutPageState();
}

class FqlAboutPageState extends State<FqlAboutPage> {
  //创建一个列表，给listiew 塞数据
  final _dataList = <AboutItem>[];

  //字体大小样式
  final _fontSize = const TextStyle(fontSize: 15, color: Color(0xff050c1c));

  @override
  Widget build(BuildContext context) {
    _initListData();
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios), onPressed: _back),
        title: new Text("关于分期乐"),
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
      ),
      body: _createListView(),
    );
  }

  void _back() {
    Navigator.pop(context);
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


  //新增函数

  Widget _createListView() {
    List<Widget> widgetList = <Widget>[];
    for (int i = 0; i < _dataList.length; i++) {
      AboutItem item = _dataList[i];
      widgetList.add(new ListTile(
        title: new Text(
          item.title,
          style: _fontSize,
        ),
        trailing: new Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
        onTap: () {
          //点击事件
          Fluttertoast.showToast(
              msg: "点击位置" + i.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.red,
              textColor: Colors.black,
              fontSize: 16.0);
        },
      ));
      widgetList.add(new Divider());
    }
    return new Center(
      child: new Container(
        margin: new EdgeInsets.fromLTRB(0.0, 65.0, 0.0, 24.0),
        child: Column(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: new Image.asset(
                'images/bg_fenqile_logo.png',
                fit: BoxFit.contain,
                height: 45,
                width: 120,
              ),
            ),
            new Text(
              "当前版本:v1.0.0",
              style: new TextStyle(fontSize: 13, color: Color(0xFFABADB2)),
            ),
            Expanded(
              child: Container(
                margin: new EdgeInsets.fromLTRB(0, 56, 0, 0),
                child: new ListView(
                  children: widgetList,
                ),
              ),
              flex: 1,
            ),
            new Text(
              "分期乐 版权所有\nCopyright © 2013–2019",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontSize: 13,
                  height: 1.5, //行间距
                  color: Color(0xFFABADB2)),
            ),
          ],
        ),
      ),
    );
  }
}
