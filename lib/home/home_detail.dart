import 'package:flutter/material.dart';

class HomeDetail extends StatefulWidget {
  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title : new Text("Home Detail")),
      body : new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Text("HEllo"),
          new Text("HEllo"),
          new Text("HEllo")
        ],
      )
    );
  }
}