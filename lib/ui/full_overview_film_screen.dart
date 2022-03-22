import 'package:flutter/material.dart';
import 'package:pokemons/constants/text_styles.dart';
import 'package:pokemons/models/movie_model.dart';

class FullOverviewFilm extends StatelessWidget {
  final Results movie;

  const FullOverviewFilm({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
            title: const Text('Full Overview'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight / 2.2,
                    width: constraints.maxWidth / 2.5,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500' +
                          movie.posterPath.toString(),
                      errorBuilder: (_, __, ___) {
                        return Image.asset(
                          'assets/background.png',
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      movie.title.toString(),
                      style: AppTextStyles.blackBold18,
                    ),
                  ),
                  Text(
                    'Date of release: ' + movie.releaseDate.toString(),
                    style: AppTextStyles.blackBold15,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Overview',
                    style: AppTextStyles.blackBold15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '    ' + movie.overview.toString(),
                      style: AppTextStyles.text15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
