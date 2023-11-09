part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsBottomNavState extends NewsState {}

class NewsGetBusinessLoadingState extends NewsState {}

class NewsGetBusinessSuccessState extends NewsState {}

class NewsGetBusinessErrorState extends NewsState {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportLoadingState extends NewsState {}

class NewsGetSportSuccessState extends NewsState {}

class NewsGetSportErrorState extends NewsState {
  final String error;
  NewsGetSportErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsState {}

class NewsGetScienceSuccessState extends NewsState {}

class NewsGetScienceErrorState extends NewsState {
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsState {}

class NewsGetSearchSuccessState extends NewsState {}

class NewsGetSearchErrorState extends NewsState {
  final String error;
  NewsGetSearchErrorState(this.error);
}

class NewsChangeModeState extends NewsState {}
