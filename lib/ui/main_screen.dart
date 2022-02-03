import 'package:flutter/material.dart';
import 'package:pokemons/constants/text_styles.dart';
import 'package:pokemons/main.dart';
import 'package:pokemons/models/movies_model.dart';
import 'package:pokemons/ui/full_overview_film.dart';
import 'package:pokemons/ui/side_bar_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const SideBarMenu(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Movies'),
          backgroundColor: Colors.deepOrange[800],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(scrollDirection: Axis.vertical, children: [
                const SearchField(),
                const TableOfContent(
                  nameTypeOfFilms: 'TopRated Movies',
                ),
                Content(future: repository.fetchAllTopRatedMovies()),
                const SizedBox(height: 20),
                const TableOfContent(
                  nameTypeOfFilms: 'Popular Movies',
                ),
                Content(
                  future: repository.fetchAllPopularMovies(),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class TableOfContent extends StatefulWidget {
  final String nameTypeOfFilms;
  const TableOfContent({
    Key? key,
    required this.nameTypeOfFilms,
  }) : super(key: key);

  @override
  State<TableOfContent> createState() => _TableOfContentState();
}

class _TableOfContentState extends State<TableOfContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            widget.nameTypeOfFilms,
            style: AppTextStyles.blackText15,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'More',
            style: AppTextStyles.greenText15,
          ),
        ),
      ],
    );
  }
}

class Content extends StatelessWidget {
  final Future<Movies> future;

  const Content({Key? key, required this.future}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3.2,
        child: FutureBuilder<Movies>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, _) => const SizedBox(
                  width: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  final movie = snapshot.data!.results![index];
                  
                  return SizedBox(
                    width: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FullOverviewFilm(
                              movie: movie,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AspectRatio(
                              aspectRatio: 0.7,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500' +
                                    movie.posterPath.toString(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Text(movie.originalTitle.toString()),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    
    return Column(
      children: [
        Image.asset(
          'assets/cinema.jpg',
          fit: BoxFit.cover,
        ),
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: SizedBox(
              height: 85,
              child: Stack(children: [
                TextFormField(
                  cursorColor: Colors.deepOrange,
                  validator: (value) =>
                      value!.isEmpty ? 'Ошибка! Пустое поле' : null,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintMaxLines: 2,
                    label: const Text(
                      'Найти фильм...',
                      style: TextStyle(
                        color: Colors.deepOrange,
                      ),
                    ),
                    prefixIcon:
                        const Icon(Icons.search, color: Colors.deepOrange),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: 60,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        search.searchFunc(textEditingController, context);
                      },
                      child: const Text(
                        'Поиск',
                        style: AppTextStyles.whiteText15,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
