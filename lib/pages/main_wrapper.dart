import 'package:flutter/material.dart';
import '../widgets/custom_bottom_bar.dart';
import 'home_page.dart';
import 'catalog_page.dart';
import 'favorites_page.dart';
import 'profile_page.dart';

class MainWrapper extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const MainWrapper({super.key, required this.themeNotifier});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  // Общий список избранного для Catalog и Favorites
  final ValueNotifier<List<Map<String, dynamic>>> favorites =
      ValueNotifier<List<Map<String, dynamic>>>([]);

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(),
      CatalogPage(favorites: favorites),
      FavoritesPage(favorites: favorites),
      ProfilePage(themeNotifier: widget.themeNotifier),
    ];
  }

  @override
  void dispose() {
    favorites.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}