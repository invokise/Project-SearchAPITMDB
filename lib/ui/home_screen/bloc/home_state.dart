part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeAllMoviesLoadedState extends HomeState {
  final Movie movie1;
  final Movie movie2;

  HomeAllMoviesLoadedState({required this.movie1, required this.movie2});
}

class HomeAllMoviesFailureState extends HomeState {
  final dynamic error;

  HomeAllMoviesFailureState(this.error);
}
