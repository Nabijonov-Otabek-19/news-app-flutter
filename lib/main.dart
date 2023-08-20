import 'package:flutter/material.dart';
import 'package:news_app_bloc/presentation/screen/favourite/favourite_screen.dart';
import 'package:news_app_bloc/presentation/screen/home/home_screen.dart';
import 'package:news_app_bloc/theme/colors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
        primaryColorDark: primaryDark,
        primaryColorLight: accent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primary,
          showSelectedLabels: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.shifting,
        ),
        appBarTheme: const AppBarTheme(
            color: Color(0xff72afff),
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 22)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final pages = [
    const HomeScreen(),
    const FavouriteScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: myNavBar(),
    );
  }

  BottomNavigationBar myNavBar() {
    return BottomNavigationBar(
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              activeIcon: const Icon(Icons.home),
              icon: const Icon(Icons.home_outlined),
              label: "Home"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              activeIcon: const Icon(Icons.favorite),
              icon: const Icon(Icons.favorite_border_outlined),
              label: "Favourite"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped);
  }
}
