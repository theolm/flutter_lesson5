import 'package:aula5/models/configuration.dart';
import 'package:aula5/models/movie.dart';
import 'package:aula5/models/popular_movies.dart';
import 'package:http/http.dart' as http;

const String BASE_URL = 'https://api.themoviedb.org/3/';
const String TOKEN =
    'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNWY1YzM2NWZmZDI3MWQ4ZDExMDZkOTBjNmY5NjllMyIsInN1YiI6IjVlM2EwMWQzYWM4ZTZiMDAxMWM5MGNiOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YTPbJt4p8T_1iRwmQF4rndemD_lYdH7zmxhGZsxx27o';

Future<Configuration> getConfigurationAsync() async {
  var url = BASE_URL + 'configuration';
  var res = await http.get(url, headers: {
    'Authorization': TOKEN,
  });

  print(res.body);

  try {
    if(res.statusCode == 200) {
      return configurationFromJson(res.body);
    } else {
      throw Exception();
    }
  } catch (e) {
    print(e);
    throw Exception();
  }
}

Future<List<PopularMovie>> getPopularMovies(int page) async {
  var url = BASE_URL + 'movie/popular?page=$page';
  var res = await http.get(url, headers: {
    'Authorization': TOKEN,
  });

  print(res.body);

  try {
    if(res.statusCode == 200) {
      return popularMoviesFromJson(res.body).results;
    } else {
      throw Exception();
    }
  } catch (e) {
    print(e);
    throw Exception();
  }
}

Future<Movie> getMovie(int id) async {
  var url = BASE_URL + 'movie/$id';
  var res = await http.get(url, headers: {
    'Authorization': TOKEN,
  });

  print(res.body);

  try {
    if(res.statusCode == 200) {
      return movieFromJson(res.body);
    } else {
      throw Exception();
    }
  } catch (e) {
    print(e);
    throw Exception();
  }
}

