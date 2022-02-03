import 'dart:convert';

import 'package:pokemons/models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachService {
  static const key = 'movie';
  static SharedPreferences? preference;

  static Future<void> initPreference() async {
    if (preference == null) {
      preference = await SharedPreferences.getInstance();
    }
    
  }

  Future<void> saveMovie(String body) async {
    if (preference!.getString(key)!.isEmpty) {
      preference!.setString(key, body);
    }
  }

  Future<Movies> getMovie() async {
    final result = preference!.getString(key) ?? '';

    return Movies.fromJson(jsonDecode(result));
  }
}
