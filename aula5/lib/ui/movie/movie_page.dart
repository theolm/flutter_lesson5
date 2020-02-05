import 'package:aula5/models/movie.dart';
import 'package:aula5/models/popular_movies.dart';
import 'package:aula5/repository/network.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  final PopularMovie movie;

  const MoviePage(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              width: double.infinity,
              child: Hero(
                tag: movie.id,
                child: Image.network(
                  movie.getMoviePoster(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            FutureBuilder(
              future: getMovie(movie.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MovieDetail(movie: snapshot.data);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetail extends StatelessWidget {
  final Movie movie;

  const MovieDetail({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text(
            movie.title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 32),
          Text(movie.overview),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.thumb_up),
              SizedBox(width: 16),
              Text(movie.voteAverage.toString()),
              SizedBox(width: 64),
              Icon(Icons.attach_money),
              SizedBox(width: 16),
              Text(movie.budget.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
