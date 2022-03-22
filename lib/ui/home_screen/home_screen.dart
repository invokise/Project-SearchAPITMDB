import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/constants/text_styles.dart';
import 'package:pokemons/models/movie_model.dart';
import 'package:pokemons/ui/full_overview_film_screen.dart';
import 'package:pokemons/ui/home_screen/bloc/home_bloc.dart';
import 'package:pokemons/ui/search_result_screen/bloc/search_result_bloc.dart';
import 'package:pokemons/ui/search_result_screen/search_result_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeAllMovieLoadedEvent()),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Movies'),
            backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(scrollDirection: Axis.vertical, children: [
                  const SearchField(),
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                    if (state is HomeInitial) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is HomeAllMoviesLoadedState) {
                      return Column(children: [
                        const TableOfContent(
                          nameTypeOfFilms: 'TopRated Movies',
                        ),
                        Content(movie: state.movie1),
                        const SizedBox(height: 20),
                        const TableOfContent(nameTypeOfFilms: 'Popular Movies'),
                        Content(movie: state.movie2),
                      ]);
                    } else if (state is HomeAllMoviesFailureState) {
                      return Center(
                        child: Text(state.error.toString()),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
                ]),
              ),
            ],
          ),
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
  final Movie movie;
  const Content({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3.2,
        child: ListView.separated(
          separatorBuilder: (context, _) => const SizedBox(
            width: 15,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 100,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullOverviewFilm(
                        movie: movie.results![index],
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
                        child: CachedNetworkImage(
                          imageUrl: 'https://image.tmdb.org/t/p/w500' +
                              movie.results![index].posterPath.toString(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child:
                          Text(movie.results![index].originalTitle.toString()),
                    ),
                  ],
                ),
              ),
            );
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
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Column(
      children: [
        Image.asset(
          'assets/main.jpg',
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
                  cursorColor: const Color.fromRGBO(3, 37, 65, 1),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter film name!';
                    }

                    return null;
                  },
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintMaxLines: 2,
                    label: const Text(
                      'Найти фильм...',
                      style: TextStyle(
                        color: const Color.fromRGBO(3, 37, 65, 1),
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: const Color.fromRGBO(3, 37, 65, 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: const Color.fromRGBO(3, 37, 65, 1),
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
                      color: const Color.fromRGBO(3, 37, 65, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<SearchResultBloc>()
                              .add(SearchResultLoadedEvent(
                                keyword:
                                    textEditingController.text.toLowerCase(),
                              ));
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchResultScreen(),
                            ),
                          );
                        }
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
