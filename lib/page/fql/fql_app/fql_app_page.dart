import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FqlAppPage extends StatefulWidget {
  @override
  createState() => new FqlAppPageState();
}

class FqlAppPageState extends State<FqlAppPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("应用"),
        centerTitle: true,
      ),
//   banner 控件：https://github.com/best-flutter/flutter_swiper/blob/master/README-ZH.md
      body: new Container(
        height: 200,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              "http://via.placeholder.com/350x150",
              fit: BoxFit.fill,
            );
          },
          itemCount: 3,
          pagination: new SwiperPagination(alignment: Alignment.bottomLeft),
          //指示器
//        control: new SwiperControl(),//左右跳转页面的按钮
          loop: true,
          autoplay: true,
          autoplayDisableOnInteraction: true,
          //用户拖拽的时候停止播放
          onIndexChanged: (int position) {
            //监听回调当前位置
            Fluttertoast.showToast(
              msg: "当前位置" + position.toString(),
            );
          },
          onTap: (int position) {
            Fluttertoast.showToast(
              msg: "当前点击位置" + position.toString(),
            );
          },
          duration: 300,
        ),
      ),
    );
  }
}
