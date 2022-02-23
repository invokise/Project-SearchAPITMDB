import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemons/constants/api_key.dart';
import 'package:pokemons/models/movie_model.dart';

class MovieApiProvider {
  Future<Movie> fetchTopRatedMovie() async {
    final response = await http.get(Uri.parse(
      "http://api.themoviedb.org/3/movie/top_rated?api_key=${ApiKey().apiKey}",
    ));
    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
  }

  Future<Movie> fetchPopularMovie() async {
    final response = await http.get(Uri.parse(
      "http://api.themoviedb.org/3/movie/popular?api_key=${ApiKey().apiKey}",
    ));
    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
  }

  Future<Movie> searchMovie(String keyword) async {
    final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/search/movie?query=$keyword&api_key=${ApiKey().apiKey}&page=[1..100]&include_adult=false',
    ));
    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
  }
}
