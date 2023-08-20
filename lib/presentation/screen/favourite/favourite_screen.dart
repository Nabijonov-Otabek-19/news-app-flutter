import 'package:flutter/material.dart';
import 'package:news_app_bloc/theme/colors.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
      ),
      body: Center(
        child: Text(
          "No favourites",
          style: TextStyle(fontSize: 30, color: primary),
        ),
      ),
    );
  }
}
