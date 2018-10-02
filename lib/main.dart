import 'package:flutter/material.dart';
import 'home/home.dart';
import 'home/home_detail.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
        title: "The Movie API App",
        theme: new ThemeData.dark(),
        home : new HomeDetail(),
        debugShowCheckedModeBanner: false,
    );
  }
}