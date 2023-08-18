import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_bloc/domain/repository.dart';

import '../../../data/model/top/top_model.dart';
import '../../../data/source/remote/base_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TopArticle> items = [];

  final _api = Api(BaseApi().dio);

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    items.addAll(await _api.topHeadlines('us'));
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
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                              errorWidget: (context, url, error) => Image.asset(
                                  fit: BoxFit.cover,
                                  "assets/images/img_placeholder.jpg"),
                              placeholder: (context, url) => Image.asset(
                                  fit: BoxFit.cover,
                                  "assets/images/img_placeholder.jpg"),
                              fit: BoxFit.cover,
                              imageUrl: item.urlToImage!)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2),
                            const SizedBox(height: 8.0),
                            Text(
                              item.author,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "${item.publishedAt.day}/${item.publishedAt.month}/${item.publishedAt.year}",
                                style: const TextStyle(fontSize: 12)),
                            Text(item.source.name,
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
