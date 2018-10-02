import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieTwo extends StatefulWidget {
  @override
  _MovieTwoState createState() => _MovieTwoState();
}

class _MovieTwoState extends State<MovieTwo> with AutomaticKeepAliveClientMixin<MovieTwo>{

  var movies; 
  var _isLoading = false;

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  @override
    void initState() {
      super.initState();
      _fetchData();
    }

    _fetchData() async {
      mounted ?  setState(() {
              _isLoading = true;
            }) : print("cannt change the state");
      final res = await http.get('https://api.themoviedb.org/3/movie/now_playing?api_key=578152be1392218f6d775ceb67b4e4f6&language=en-US&page=2'); 
      if(res.statusCode == 200){
        final d = json.decode(res.body);
        
         mounted ? setState(() {
                  this.movies = d['results'];         
                  this._isLoading = false; 
        }) : print("cannt change the state");
        
        
        
      }

      
    }

  @override
  Widget build(BuildContext context) {

    

    return _isLoading ? new Center(child: CircularProgressIndicator()) :
    new Container(
      padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
      child: GridView.count(
      crossAxisCount: 3,
      children: List.generate(this.movies != null ? this.movies.length : 0, (i){
        final imageUrl = this.movies[i]['backdrop_path'];  

        return new Container(
          padding: const EdgeInsets.all(0.0),
          child: new FlatButton(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                imageUrl != null ? new Image.network("http://image.tmdb.org/t/p/h100$imageUrl") : new Image.network("http://image.tmdb.org/t/p/h100/840rbblaLc4SVxm8gF3DNdJ0YAE.jpg"),
                new Padding(padding: const EdgeInsets.only(top: 16.0),),
                new Text(this.movies[i]['title'],textAlign: TextAlign.center, style: new TextStyle(fontSize: 11.0),)
          ],
         ),
         onPressed: (){},
        )
        );
      })
    ),
    );
  }

  
}