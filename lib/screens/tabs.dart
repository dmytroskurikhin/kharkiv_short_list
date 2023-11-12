import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '/screens/locations.dart';
import '../models/location.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
    required this.onToggleFavorite,
    required this.favoriteLocation,
  });
  static const routeName = '/tabs';
  final void Function(Location location) onToggleFavorite;
  final List<Location> favoriteLocation;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = Locations(
      availibleLocations: dummyLocations,
      onToggleFavorite: widget.onToggleFavorite,
    );
    var activePageTitle = 'Всі локації';

    if (_selectedPageIndex == 1) {
      activePage = Locations(
        availibleLocations: widget.favoriteLocation,
        onToggleFavorite: widget.onToggleFavorite,
      );
      activePageTitle = 'Вибрані локації';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Пам\'ятки'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Вибрані'),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
