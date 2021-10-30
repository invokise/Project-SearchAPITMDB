import 'package:flutter/material.dart';
import 'package:pokemons/constants/text_styles.dart';
import 'package:pokemons/models/movies_model.dart';

class FullOverviewSearchFilm extends StatelessWidget {
  final Results movie;

  const FullOverviewSearchFilm({
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
            backgroundColor: Colors.deepOrange,
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
                    child: Image.network('https://image.tmdb.org/t/p/w500' +
                        movie.posterPath.toString()),
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
