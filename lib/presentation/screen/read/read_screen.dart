import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app_bloc/data/model/top_model.dart';

class ReadScreen extends StatefulWidget {
  final TopArticle item;

  const ReadScreen({super.key, required this.item});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About News"),
        actions: [
          IconButton(
            onPressed: () {
              // Save to Hive
              print("News Item SAVED");
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
      body: Scrollable(
        controller: _scrollController,
        viewportBuilder: (BuildContext context, ViewportOffset position) {
          return Column(
            children: [
              CachedNetworkImage(
                  errorWidget: (context, url, error) => Image.asset(
                      fit: BoxFit.cover, "assets/images/img_placeholder.jpg"),
                  placeholder: (context, url) => Image.asset(
                      fit: BoxFit.cover, "assets/images/img_placeholder.jpg"),
                  fit: BoxFit.cover,
                  imageUrl: widget.item.urlToImage!),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      widget.item.title,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      widget.item.description!,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${widget.item.publishedAt.day}/${widget.item.publishedAt.month}/${widget.item.publishedAt.year}",
                            style: const TextStyle(fontSize: 16)),
                        Text(widget.item.source.name),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.item.content!,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
