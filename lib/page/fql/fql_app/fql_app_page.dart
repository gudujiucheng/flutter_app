import 'package:flutter/material.dart';

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
    );
  }
}
