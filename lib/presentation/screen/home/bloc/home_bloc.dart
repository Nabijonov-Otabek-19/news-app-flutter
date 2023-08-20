import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/top_model.dart';
import '../../../../domain/repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Repository repository;

  HomeBloc(this.repository) : super(InitState()) {
    on<HomeEvent>((event, emit) async {
      switch (event) {
        case LoadNewsEvent():
          {
            emit(InitState());
            emit(LoadState(
                items: await repository.topHeadlines(
                    event.country, event.category)));
            break;
          }

        default:
          break;
      }
    });
  }
}
