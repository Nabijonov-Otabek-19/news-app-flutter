import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_bloc/data/model/top_model.dart';

class WidgetNewsItem extends StatelessWidget {
  final TopArticle item;
  final Function() onTap;

  const WidgetNewsItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                    errorWidget: (context, url, error) => Image.asset(
                        fit: BoxFit.cover, "assets/images/img_placeholder.jpg"),
                    placeholder: (context, url) => Image.asset(
                        fit: BoxFit.cover, "assets/images/img_placeholder.jpg"),
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
                  Text(item.source.name, style: const TextStyle(fontSize: 12)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
