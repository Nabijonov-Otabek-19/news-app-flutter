import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/domain/repository.dart';
import 'package:news_app_bloc/presentation/screen/read/read_screen.dart';
import 'package:news_app_bloc/presentation/widgets/widget_category_item.dart';
import 'package:news_app_bloc/presentation/widgets/widget_news_item.dart';
import 'package:news_app_bloc/utils/constants.dart';

import '../../../data/source/remote/base_api.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollControllNews = ScrollController();
  final bloc = HomeBloc(Repository(BaseApi().dio));

  @override
  void initState() {
    bloc.add(LoadNewsEvent('us', 'general'));
    super.initState();
  }

  @override
  void dispose() {
    _scrollControllNews.dispose();
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
            ),
            body: SafeArea(
              child: Builder(
                builder: (context) {
                  if (state is InitState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadState) {
                    return Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(8),
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return WidgetCategoryItem(
                                model: categories[index],
                                onTap: () {
                                  bloc.add(LoadNewsEvent(
                                      'us', categories[index].title));
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Scrollbar(
                            interactive: true,
                            controller: _scrollControllNews,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.all(8),
                              itemCount: state.items.length,
                              itemBuilder: (context, index) {
                                final item = state.items[index];
                                return WidgetNewsItem(
                                  item: item,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReadScreen(item: item)));
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is ErrorState) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
