import 'package:news_app_bloc/data/model/top_model.dart';

class HomeState {
  final List<TopArticle> items;

  const HomeState({this.items = const []});

  HomeState copyWith({List<TopArticle>? items}) {
    return HomeState(items: items ?? this.items);
  }
}
