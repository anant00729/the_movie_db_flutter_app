import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieThree extends StatefulWidget {
  @override
  _MovieThreeState createState() => _MovieThreeState();
}

class _MovieThreeState extends State<MovieThree> with AutomaticKeepAliveClientMixin<MovieThree>{

  var movieList;
  bool _isLoading = false;

  _fetchMovieData() async {
      mounted ? setState(() {
            _isLoading = true;
          }) : print("cannot set if not mounted");
     final res = await http.get('https://api.themoviedb.org/3/movie/now_playing?api_key=578152be1392218f6d775ceb67b4e4f6&language=en-US&page=3');
     if (res.statusCode == 200){
       final d = json.decode(res.body);
       
       // seting the state for the new List 
       mounted ? setState(() {
            movieList = d['results'];
            _isLoading = false;
          }) : print("cannot set if not mounted");
     }
  }


@override
  void initState() {
    super.initState();
    _fetchMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return this._isLoading ? new Center(child : new CircularProgressIndicator()) : 
    new Center(
      child: new SizedBox.fromSize(
        size: Size.fromHeight(550.0),
        child: new PageView.builder(
          controller : PageController(viewportFraction: 0.8),
          itemCount: this.movieList != null ? this.movieList.length : 0,
          itemBuilder: (context, i){

          final imageUrl = this.movieList[i]['poster_path'];  

            return new Padding(
               padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0),
               child: new Material(
                 elevation: 5.0,
                 borderRadius: BorderRadius.circular(8.0),
                 child: new Stack(
                   fit : StackFit.expand,
                   children: <Widget>[
                     new Container(
                       decoration: new BoxDecoration(
                         color : const Color(0xff7c94b6),
                         image : new DecorationImage(
                           image : new NetworkImage('http://image.tmdb.org/t/p/w400$imageUrl'),
                           fit : BoxFit.cover
                         ),
                         borderRadius: new BorderRadius.all(new Radius.circular(8.0))
                       ),
                     ),
                    //  new DecoratedBox(
                    //    decoration: new BoxDecoration(
                    //      borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
                    //      gradient: new LinearGradient(
                    //        begin: FractionalOffset.bottomCenter,
                    //        end : FractionalOffset.topCenter,
                    //        colors: [Color(0x000000).withOpacity(0.9),Color(0x000000).withOpacity(0.001)]
                    //      )
                    //    ),
                    //  )
                   ],
                 ),
               ),
            );
          },
        ),
      ),
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}