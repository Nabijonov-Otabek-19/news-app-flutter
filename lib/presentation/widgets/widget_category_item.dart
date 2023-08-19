import 'package:flutter/material.dart';
import 'package:news_app_bloc/data/model/category_model.dart';

class WidgetCategoryItem extends StatelessWidget {
  final CategoryModel model;
  final Function() onTap;

  const WidgetCategoryItem({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                model.imgAsset,
                fit: BoxFit.fill,
                width: 120,
                height: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                model.title,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
