import 'package:flutter/material.dart';
import 'package:pokemons/mobx/search_mobx.dart';
import 'package:pokemons/resourses/repository.dart';
import 'package:pokemons/services/cach_service.dart';
import 'package:pokemons/ui/main_screen.dart';
import 'package:pokemons/ui/search_result_screen.dart';

final repository = Repository();
final search = Search();

Future<void> main() async {
  CachService.initPreference();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MainScreen(),
        '/second': (context) => const SearchFilm(),
      },
    );
  }
}
