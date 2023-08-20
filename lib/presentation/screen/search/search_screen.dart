import 'package:flutter/material.dart';
import 'package:news_app_bloc/presentation/widgets/widget_news_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ScrollController _scrollControllNews = ScrollController();

  @override
  void dispose() {
    _scrollControllNews.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search screen"),
      ),
      /*body: Scrollbar(
        interactive: true,
        controller: _scrollControllNews,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return WidgetNewsItem(
              item: item,
              onTap: () {},
            );
          },
        ),
      ),*/
    );
  }
}
