import 'package:aula5/models/popular_movies.dart';
import 'package:aula5/repository/network.dart';
import 'package:aula5/ui/movie/movie_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Popular Movies')),
        body: FutureBuilder(
          future: getPopularMovies(1),
          builder: (context, AsyncSnapshot<List<PopularMovie>> snapshot) {
            if (snapshot.hasData) {
              var list = snapshot.data;
              return GridView.builder(
                  itemCount: list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 185 / 278),
                  itemBuilder: (context, position) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MoviePage(list[position]),
                        ));
                      },
                      child: MovieCard(
                        movie: list[position],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

class MovieCard extends StatelessWidget {
  final PopularMovie movie;

  const MovieCard({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: movie.id,
      child: Image.network(
        movie.getMoviePoster(),
        fit: BoxFit.cover,
      ),
    );
  }
}
