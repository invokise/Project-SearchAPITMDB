import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemons/main.dart';
import 'package:pokemons/models/movie_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeAllMovieLoadedEvent>(_allMovieEvent);
  }

  _allMovieEvent(
    HomeAllMovieLoadedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeInitial());
    try {
      final popularMovie = await repository.fetchPopularMovie();
      final topRatedMovie = await repository.fetchTopRatedMovie();
      emit(HomeAllMoviesLoadedState(
        movie1: popularMovie,
        movie2: topRatedMovie,
      ));
    } catch (error) {
      emit(HomeAllMoviesFailureState(error));
    }
  }
}
