import 'package:flutter/material.dart';
import 'package:news_app_bloc/domain/repository.dart';
import 'package:news_app_bloc/presentation/screen/read/read_screen.dart';
import 'package:news_app_bloc/presentation/widgets/widget_category_item.dart';
import 'package:news_app_bloc/presentation/widgets/widget_news_item.dart';
import 'package:news_app_bloc/utils/constants.dart';

import '../../../data/model/top_model.dart';
import '../../../data/source/remote/base_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TopArticle> items = [];

  final _api = Api(BaseApi().dio);
  final ScrollController _scrollControllNews = ScrollController();

  @override
  void initState() {
    loadData('general');
    super.initState();
  }

  @override
  void dispose() {
    _scrollControllNews.dispose();
    super.dispose();
  }

  void loadData(String category) async {
    items = [];
    items.addAll(await _api.topHeadlines('us', category));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (items.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
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
                          loadData(categories[index].title);
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(8),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return WidgetNewsItem(
                        item: item,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ReadScreen(item: item)));
                          // Navigate to ReadScreen
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
