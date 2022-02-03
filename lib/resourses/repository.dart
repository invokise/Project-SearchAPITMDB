import 'dart:convert';
import 'package:pokemons/models/movies_model.dart';
import 'package:pokemons/services/cach_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'movies_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  CachService cachService = CachService();

  Future<Movies> fetchAllPopularMovies() async {
    CachService.preference = await SharedPreferences.getInstance();
    if (CachService.preference!.getString(CachService.key)!.isEmpty) {
      final response = await moviesApiProvider.fetchPopularMovies();
      final save = jsonEncode(response);
      cachService.saveMovie(save);

      return response;
    } else {
      return CachService().getMovie();
    }
  }

  Future<Movies> fetchAllTopRatedMovies() async {
    return await moviesApiProvider.fetchTopRatedMovies();
  }

  Future<Movies> searchAllMovies(String keyword) {
    return moviesApiProvider.searchMovies(keyword);
  }
}
