part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class InitState extends HomeState {}

class LoadState extends HomeState {
  final List<TopArticle> items;

  LoadState({this.items = const []});

  LoadState copyWith({List<TopArticle>? items}) {
    return LoadState(items: items ?? this.items);
  }
}

class ErrorState extends HomeState {
  final String message;

  ErrorState({this.message = ""});
}

