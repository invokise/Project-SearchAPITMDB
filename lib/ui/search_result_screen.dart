import 'package:flutter/material.dart';
import 'package:pokemons/constants/text_styles.dart';
import 'package:pokemons/main.dart';
import 'package:pokemons/models/movies_model.dart';
import 'package:pokemons/ui/full_overview_film.dart';

class SearchFilm extends StatelessWidget {
  const SearchFilm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Search Result'),
          backgroundColor: Colors.deepOrange[800],
        ),
        body: FutureBuilder<Movies>(
          future: repository.searchAllMovies(search.keyword),
          builder: (context, snapshot) {
            // ignore: prefer-conditional-expressions
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.totalResults! > 20
                      ? 20
                      : snapshot.data!.totalResults,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data!.results![index];
                    
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => FullOverviewFilm(
                                    movie: movie,
                                  ),
                                ),
                              );
                            },
                            child: BodyWidget(
                              pathImage: 'https://image.tmdb.org/t/p/w500' +
                                  snapshot.data!.results![index].posterPath
                                      .toString(),
                              nameFilm: snapshot.data!.results![index].title
                                  .toString(),
                              dataRelease: snapshot
                                  .data!.results![index].releaseDate
                                  .toString(),
                              description: snapshot
                                  .data!.results![index].overview
                                  .toString(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  final String pathImage;
  final String nameFilm;
  final String dataRelease;
  final String description;
  const BodyWidget(
      {Key? key,
      required this.pathImage,
      required this.nameFilm,
      required this.dataRelease,
      required this.description,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final cardConstraints = MediaQuery.of(context).size.height * 0.38;

      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: cardConstraints * 0.8,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: Image.network(
                      pathImage,
                      errorBuilder: (_, __, ___) {
                        return Container();
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: constraints.maxWidth * 0.5,
                    child: Center(
                      child: Text(
                        nameFilm,
                        style: AppTextStyles.blackBold15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(dataRelease),
                  SizedBox(
                    width: constraints.maxWidth * 0.5,
                    child: Text(
                      description,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
