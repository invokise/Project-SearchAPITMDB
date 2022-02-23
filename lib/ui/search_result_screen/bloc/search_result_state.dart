part of 'search_result_bloc.dart';

@immutable
abstract class SearchResultState {}

class SearchResultInitial extends SearchResultState {}

class SearchResultSuccessState extends SearchResultState {
  final Movie movie;

  SearchResultSuccessState({required this.movie});
}

class SearchResultFailureState extends SearchResultState {
  final dynamic error;

  SearchResultFailureState({required this.error});
}
