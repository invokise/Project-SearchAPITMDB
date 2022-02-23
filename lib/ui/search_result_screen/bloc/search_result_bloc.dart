import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemons/main.dart';
import 'package:pokemons/models/movie_model.dart';

part 'search_result_event.dart';
part 'search_result_state.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  SearchResultBloc() : super(SearchResultInitial()) {
    on<SearchResultLoadedEvent>(_onSearchResultLoadedEvent);
  }

  _onSearchResultLoadedEvent(
    SearchResultLoadedEvent event,
    Emitter<SearchResultState> emit,
  ) async {
    emit(SearchResultInitial());
    try {
      final movie = await repository.searchMovie(event.keyword);
      emit(SearchResultSuccessState(movie: movie));
    } catch (error) {
      emit(SearchResultFailureState(error: error));
    }
  }
}
