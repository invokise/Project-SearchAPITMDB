import 'dart:convert';
import 'package:pokemons/models/movies_model.dart';
import 'package:pokemons/services/cache_service.dart';

import 'movies_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  CacheService cacheService = CacheService();

  Future<Movies> fetchAllPopularMovies() async {
    if (CacheService.haveNotData()) {
      final response = await moviesApiProvider.fetchPopularMovies();
      final movie = jsonEncode(response);
      cacheService.saveMovie(movie);

      return response;
    } else {
      return CacheService().getMovie();
    }
  }

  Future<Movies> fetchAllTopRatedMovies() async {
    return await moviesApiProvider.fetchTopRatedMovies();
  }

  Future<Movies> searchAllMovies(String keyword) {
    return moviesApiProvider.searchMovies(keyword);
  }
}
