import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieOne extends StatefulWidget {
  @override
  _MovieOneState createState() => _MovieOneState();
}

class _MovieOneState extends State<MovieOne> with AutomaticKeepAliveClientMixin<MovieOne>{

  var movies;

  @override
  bool get wantKeepAlive => true;

  


  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _fetchMovieData();
    }


    _fetchMovieData() async {
        final res = await http.get('https://api.themoviedb.org/3/movie/now_playing?api_key=578152be1392218f6d775ceb67b4e4f6&language=en-US&page=1');
        if (res.statusCode == 200){
          final d = json.decode(res.body);
          final m = d['results'];
          
          mounted ? setState(() {
                      this.movies = m;
                    }) : print("Cannot setState");
          
        }
    }

  @override
  Widget build(BuildContext context) {
    return this.movies != null ? new ListView.builder(
      itemCount: this.movies != null ? this.movies.length : 0,
      itemBuilder: (context, i){

        final imageUrl = this.movies[i]['backdrop_path'];  
        //new Image.network("http://image.tmdb.org/t/p/w200$imageUrl", width: 80.0, height : 60.0)
        return new Column(
          children: <Widget>[
            new Divider(height : 10.0),
            new ListTile(
              leading : new Image.network("http://image.tmdb.org/t/p/w200$imageUrl", width: 80.0, height : 60.0),
              title : new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(this.movies[i]['title'], style: new TextStyle(fontSize: 11.0),),
                  new Text(this.movies[i]['original_language'],style: new TextStyle(fontSize: 12.0),)
                ],
              )
            )
          ],

        );
      },
    ) : new Center(child : new CircularProgressIndicator());
  }

  
}