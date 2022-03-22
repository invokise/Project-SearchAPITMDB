import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/resourses/movie_api_provider.dart';
import 'package:pokemons/resourses/repository.dart';
import 'package:pokemons/services/cache_service.dart';
import 'package:pokemons/ui/main_screen.dart';
import 'package:pokemons/ui/search_result_screen/bloc/search_result_bloc.dart';
import 'package:pokemons/ui/search_result_screen/search_result_screen.dart';

final repository = Repository();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.initPreference();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieApiProvider().fetchPopMovie();

    return BlocProvider(
      create: (context) => SearchResultBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const MainScreen(),
          '/second': (context) => const SearchResultScreen(),
        },
      ),
    );
  }
}
