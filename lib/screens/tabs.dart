import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '/screens/locations.dart';
import '../models/location.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

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

  final List<Location> _favoriteLocations = [];
  void _toggleLocationFavoriteStatus(Location location) {
    final isExisting = _favoriteLocations.contains(location);
    if (isExisting) {
      setState(() {
        _favoriteLocations.remove(location);
      });
    } else {
      setState(() {
        _favoriteLocations.add(location);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = Locations(
      availibleLocations: dummyLocations,
      onToggleFavorite: _toggleLocationFavoriteStatus,
    );
    var activePageTitle = 'Всі локації';

    if (_selectedPageIndex == 1) {
      activePage = Locations(
        availibleLocations: _favoriteLocations,
        onToggleFavorite: _toggleLocationFavoriteStatus,
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
