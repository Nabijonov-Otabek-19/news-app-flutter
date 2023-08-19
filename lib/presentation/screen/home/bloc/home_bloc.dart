import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Repository repository;

  HomeBloc(this.repository) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      switch (event) {
        case LoadNewsEvent():
          {
            emit(state.copyWith(
                items: await repository.topHeadlines(
                    event.country, event.category)));
          }
      }
    });
  }
}