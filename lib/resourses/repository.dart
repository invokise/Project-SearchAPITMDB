import 'dart:convert';
import 'package:pokemons/models/movie_model.dart';
import 'package:pokemons/services/cache_service.dart';

import 'movie_api_provider.dart';

class Repository {
  static final movieApiProvider = MovieApiProvider();
  CacheService cacheService = CacheService();

  Future<Movie> fetchPopMovie() async {
    if (CacheService.haveNotData()) {
      final response = await movieApiProvider.fetchPopMovie();
      final movie = jsonEncode(response);
      cacheService.saveMovie(movie);

      return response;
    } else {
      return CacheService().getMovie();
    }
  }

  Future<Movie> fetchTopRatedMovie() async {
    return await movieApiProvider.fetchTopRatedMovie();
  }

  Future<Movie> searchMovie(String keyword) {
    return movieApiProvider.searchMovie(keyword);
  }
}
