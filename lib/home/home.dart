import 'package:flutter/material.dart';
import 'package:the_movie_db_clone_one/pages/movie_one.dart';
import 'package:the_movie_db_clone_one/pages/movie_two.dart';
import 'package:the_movie_db_clone_one/pages/movie_three.dart';

class Home extends StatefulWidget {
  @override
  _Home createState(){
    return new _Home();
  }
}

class _Home extends State<Home> with SingleTickerProviderStateMixin{


  TabController _tab_controller;

  @override
    void initState() {
      super.initState();
      _tab_controller = new TabController(vsync: this, initialIndex: 1 , length: 3);
    }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        bottom: new TabBar(
        controller: _tab_controller,
        tabs: <Widget>[
          new Tab(icon: new Icon(Icons.movie)),
          new Tab(icon: new Icon(Icons.receipt)),
          new Tab(icon: new Icon(Icons.view_carousel)),
        ],
        ),
      ),
      body: new TabBarView(
        controller: _tab_controller,
        children: <Widget>[
            new MovieOne(),
            new MovieTwo(),
            new MovieThree()
        ],
      )
    );

  }
}