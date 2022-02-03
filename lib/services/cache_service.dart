import 'dart:convert';

import 'package:pokemons/models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const key = 'movie';
  static late SharedPreferences preference;

  static Future<void> initPreference() async {
    preference = await SharedPreferences.getInstance();
  }

  static bool haveNotData() {
    try {
      return preference.getString(key)!.isEmpty;
    } catch (e) {
      return true;
    }
  }

  Future<void> saveMovie(String movie) async {
    await preference.setString(key, movie);
  }

  Future<Movies> getMovie() async {
    final result = await preference.getString(key) ?? '';

    return Movies.fromJson(jsonDecode(result));
  }
}
