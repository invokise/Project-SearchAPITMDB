import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemons/constants/api_key.dart';
import 'package:pokemons/models/account_model.dart';
import 'package:pokemons/models/movies_model.dart';
import 'package:pokemons/models/session_id.dart';
import 'package:pokemons/models/token_model.dart';

class MovieApiProvider {
  // Client client = Client();


  Future<Account> fetchAccounts(String sessionId) async {
    final response = await http.get(Uri.parse(
        "http://api.themoviedb.org/3/account?session_id=$sessionId&=api_key=${ApiKey().apiKey}"));
    if (response.statusCode == 200) {
      return Account.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
  }

  Future<SessionId> createSession(String token) async {
    final response = await http.post(
        Uri.parse(
            'http://api.themoviedb.org/3/authentication/session/new?api_key=${ApiKey().apiKey}'),
        body: jsonEncode(<String, dynamic>{
          'request_token': token,
        }));

    if (response.statusCode == 201) {

      return SessionId.fromJson(jsonDecode(response.body));

    } else {
      throw Exception('Failed');
    }
  }

  Future<Token> getToken() async {
    final response = await http.get(Uri.parse(
        "http://api.themoviedb.org/3/authentication/token/new?api_key=${ApiKey().apiKey}"));
    if (response.statusCode == 200) {
      return Token.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
  }

  Future<Movies> fetchTopRatedMovies() async {
    final response = await http.get(Uri.parse(
        "http://api.themoviedb.org/3/movie/top_rated?api_key=${ApiKey().apiKey}"));
    if (response.statusCode == 200) {
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
  }

  Future<Movies> fetchPopularMovies() async {
    final response = await http.get(Uri.parse(
        "http://api.themoviedb.org/3/movie/popular?api_key=${ApiKey().apiKey}"));
    if (response.statusCode == 200) {
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
  }

  Future<Movies> searchMovies(String keyword) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?query=$keyword&api_key=${ApiKey().apiKey}&page=[1..100]&include_adult=false'));
    if (response.statusCode == 200) {
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
  }
}
