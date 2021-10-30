import 'package:pokemons/models/movies_model.dart';

import 'movies_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  Future<Movies> fetchAllPopularMovies() {
    return moviesApiProvider.fetchPopularMovies();
  }

  Future<Movies> fetchAllTopRatedMovies() {
    return moviesApiProvider.fetchTopRatedMovies();
  }

  Future<Movies> searchAllMovies(String keyword) {
    return moviesApiProvider.searchMovies(keyword);
  }
}
